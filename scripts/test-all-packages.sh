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
    if command -v docker &> /dev/null && docker exec postgres psql -U postgres -c "SELECT 1;" &> /dev/null; then
        docker exec postgres dropdb -U postgres "$dbname" 2>/dev/null || true
    else
        dropdb "$dbname" 2>/dev/null || true
    fi
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
    if command -v docker &> /dev/null && docker exec postgres psql -U postgres -c "SELECT 1;" &> /dev/null; then
        docker exec postgres createdb -U postgres "$dbname" || {
            echo -e "${RED}FAILED: Could not create database $dbname for package $package_name${NC}"
            return 1
        }
    else
        createdb "$dbname" || {
            echo -e "${RED}FAILED: Could not create database $dbname for package $package_name${NC}"
            return 1
        }
    fi
    
    cd "$PROJECT_ROOT/$package_path" || {
        echo -e "${RED}FAILED: Could not change to directory $PROJECT_ROOT/$package_path${NC}"
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

usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "OPTIONS:"
    echo "  --stop-on-fail    Stop testing immediately when a package fails (default: continue testing all packages)"
    echo "  --help            Show this help message"
    echo ""
}

main() {
    local STOP_ON_FAIL=false
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --stop-on-fail)
                STOP_ON_FAIL=true
                shift
                ;;
            --help)
                usage
                exit 0
                ;;
            *)
                echo "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done
    
    echo "=== LaunchQL Package Integration Test ==="
    echo "Testing all packages with deploy/verify/revert/deploy cycle"
    if [[ "$STOP_ON_FAIL" == "true" ]]; then
        echo "Mode: Stop on first failure"
    else
        echo "Mode: Test all packages (collect all failures)"
    fi
    echo ""
    
    if ! command -v lql &> /dev/null; then
        echo -e "${RED}ERROR: lql CLI not found. Please install @launchql/cli globally.${NC}"
        echo "Run: npm install -g @launchql/cli@4.9.0"
        exit 1
    fi
    
    if command -v docker &> /dev/null && docker exec postgres psql -U postgres -c "SELECT 1;" &> /dev/null; then
        echo "Using Docker PostgreSQL container"
    elif psql -c "SELECT 1;" &> /dev/null; then
        echo "Using direct PostgreSQL connection"
    else
        echo -e "${RED}ERROR: PostgreSQL not accessible.${NC}"
        echo "For local development: docker-compose up -d"
        echo "For CI: ensure PostgreSQL service is running"
        exit 1
    fi
    
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
    cd "$PROJECT_ROOT"
    
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
            if [[ "$STOP_ON_FAIL" == "true" ]]; then
                echo ""
                echo -e "${RED}STOPPING: Test failed for package $(basename "$package") and --stop-on-fail was specified${NC}"
                echo ""
                echo "=== TEST SUMMARY (PARTIAL) ==="
                if [ ${#successful_packages[@]} -gt 0 ]; then
                    echo -e "${GREEN}Successful packages before failure (${#successful_packages[@]}):${NC}"
                    for successful_package in "${successful_packages[@]}"; do
                        echo -e "  ${GREEN}✓${NC} $successful_package"
                    done
                    echo ""
                fi
                echo -e "${RED}Failed package: $(basename "$package")${NC}"
                echo ""
                echo -e "${RED}OVERALL RESULT: FAILED (stopped on first failure)${NC}"
                exit 1
            fi
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
