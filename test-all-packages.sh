#!/bin/bash


set -e  # Exit on any error

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

dbsafename() {
    local package_path="$1"
    local package_name=$(basename "$package_path")
    echo "test_${package_name}" | sed 's/[^a-zA-Z0-9]/_/g' | tr '[:upper:]' '[:lower:]'
}

cleanup_db() {
    local dbname="$1"
    echo "  Cleaning up database: $dbname"
    docker exec postgres dropdb -U postgres "$dbname" 2>/dev/null || true
}

test_package() {
    local package_path="$1"
    local package_name=$(basename "$package_path")
    local dbname=$(dbsafename "$package_path")
    
    local lql_package_name
    case "$package_name" in
        "geotypes") lql_package_name="launchql-geo-types" ;;
        "stamps") lql_package_name="launchql-stamps" ;;
        "types") lql_package_name="launchql-types" ;;
        "uuid") lql_package_name="launchql-uuid" ;;
        "database-jobs") lql_package_name="launchql-database-jobs" ;;
        "jobs") lql_package_name="launchql-jobs" ;;
        "db_meta") lql_package_name="launchql-meta-db" ;;
        "db_meta_modules") lql_package_name="launchql-meta-db-modules" ;;
        "db_meta_test") lql_package_name="launchql-meta-db-test" ;;
        "achievements") lql_package_name="launchql-achievements" ;;
        "measurements") lql_package_name="launchql-measurements" ;;
        "default-roles") lql_package_name="launchql-default-roles" ;;
        "defaults") lql_package_name="launchql-defaults" ;;
        "encrypted-secrets-table") lql_package_name="launchql-encrypted-secrets-table" ;;
        "encrypted-secrets") lql_package_name="launchql-encrypted-secrets" ;;
        "jwt-claims") lql_package_name="launchql-jwt-claims" ;;
        "totp") lql_package_name="launchql-totp" ;;
        "base32") lql_package_name="launchql-base32" ;;
        "faker") lql_package_name="launchql-faker" ;;
        "inflection") lql_package_name="launchql-inflection" ;;
        "utils") lql_package_name="launchql-utils" ;;
        "verify") lql_package_name="launchql-verify" ;;
        *) lql_package_name="launchql-$package_name" ;;
    esac
    
    echo -e "${YELLOW}Testing package: $package_name${NC}"
    echo "  Package path: $package_path"
    echo "  Database name: $dbname"
    
    cleanup_db "$dbname"
    
    echo "  Creating database: $dbname"
    docker exec postgres createdb -U postgres "$dbname" || {
        echo -e "${RED}FAILED: Could not create database $dbname for package $package_name${NC}"
        return 1
    }
    
    cd "$SCRIPT_DIR/$package_path" || {
        echo -e "${RED}FAILED: Could not change to directory $SCRIPT_DIR/$package_path${NC}"
        cleanup_db "$dbname"
        return 1
    }
    
    echo "  Running lql deploy..."
    lql deploy --recursive --database "$dbname" --yes --package "$lql_package_name" || {
        echo -e "${RED}FAILED: lql deploy failed for package $lql_package_name${NC}"
        cleanup_db "$dbname"
        return 1
    }
    
    echo "  Running lql verify..."
    lql verify --recursive --database "$dbname" --yes --package "$lql_package_name" || {
        echo -e "${RED}FAILED: lql verify failed for package $lql_package_name${NC}"
        cleanup_db "$dbname"
        return 1
    }
    
    echo "  Running lql revert..."
    lql revert --recursive --database "$dbname" --yes --package "$lql_package_name" || {
        echo -e "${RED}FAILED: lql revert failed for package $lql_package_name${NC}"
        cleanup_db "$dbname"
        return 1
    }
    
    echo "  Running lql deploy (second time)..."
    lql deploy --recursive --database "$dbname" --yes --package "$lql_package_name" || {
        echo -e "${RED}FAILED: lql deploy (second time) failed for package $lql_package_name${NC}"
        cleanup_db "$dbname"
        return 1
    }
    
    cleanup_db "$dbname"
    
    echo -e "${GREEN}SUCCESS: Package $package_name passed all tests${NC}"
    return 0
}

main() {
    echo "=== LaunchQL Package Integration Test ==="
    echo "Testing all packages with deploy/verify/revert/deploy cycle"
    echo ""
    
    if ! command -v lql &> /dev/null; then
        echo -e "${RED}ERROR: lql CLI not found. Please install @launchql/cli globally.${NC}"
        echo "Run: npm install -g @launchql/cli@4.9.0"
        exit 1
    fi
    
    if ! command -v docker &> /dev/null; then
        echo -e "${RED}ERROR: Docker not found. Please install Docker.${NC}"
        exit 1
    fi
    
    if ! docker exec postgres psql -U postgres -c "SELECT 1;" &> /dev/null; then
        echo -e "${RED}ERROR: PostgreSQL container not running or not accessible.${NC}"
        echo "Please run: docker-compose up -d"
        exit 1
    fi
    
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cd "$SCRIPT_DIR"
    
    echo "Finding all LaunchQL packages..."
    local packages=()
    while IFS= read -r -d '' package_dir; do
        local dir_path="$(dirname "$package_dir")"
        if [[ "$dir_path" != *"/dist" ]]; then
            packages+=("$dir_path")
        fi
    done < <(find packages -name "launchql.plan" -print0 | sort -z)
    
    echo "Found ${#packages[@]} packages to test:"
    for package in "${packages[@]}"; do
        echo "  - $(basename "$package")"
    done
    echo ""
    
    local failed_packages=()
    local successful_packages=()
    
    for package in "${packages[@]}"; do
        if test_package "$package"; then
            successful_packages+=("$(basename "$package")")
        else
            failed_packages+=("$(basename "$package")")
        fi
        echo ""
    done
    
    echo "=== TEST SUMMARY ==="
    echo -e "${GREEN}Successful packages (${#successful_packages[@]}):${NC}"
    for package in "${successful_packages[@]}"; do
        echo -e "  ${GREEN}✓${NC} $package"
    done
    
    if [ ${#failed_packages[@]} -gt 0 ]; then
        echo ""
        echo -e "${RED}Failed packages (${#failed_packages[@]}):${NC}"
        for package in "${failed_packages[@]}"; do
            echo -e "  ${RED}✗${NC} $package"
        done
        echo ""
        echo -e "${RED}OVERALL RESULT: FAILED${NC}"
        exit 1
    else
        echo ""
        echo -e "${GREEN}OVERALL RESULT: ALL PACKAGES PASSED${NC}"
        exit 0
    fi
}

main "$@"
