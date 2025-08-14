# LaunchQL Extensions Refactor Plan

Goal
- Modernize all legacy workspaces into a single, organized, pnpm workspace.
- Use the new example packages as the canonical template moving forward.
- Deduplicate overlapping/duplicate packages from legacy workspaces.
- Propose a category-based layout under a single workspace root to scale cleanly.

Scope
- Repo: launchql/extensions
- Branch for this plan: refactor/extensions
- This PR is documentation-only. No moves/renames in this PR. A follow-up PR will implement the refactor.

Current Workspace Configuration
- pnpm-workspace.yaml
  - packages:
    - packages/*
- launchql.json
  - packages:
    - packages/*
    - extensions/@*/*
    - extensions/*

- Root package.json
  - private monorepo using pnpm and lerna
  - scripts: clean, build, lint via pnpm -r
  - packageManager: pnpm@10.12.2

- Lerna
  - lerna.json: version 0.2.0, npmClient: pnpm

New-style Example Packages (canonical template)
These model the TypeScript dual-build (CJS + ESM), prepare/build/copy scripts and dist layout.
- packages/my-first
  - TypeScript
  - scripts: clean, build, prepare=build, copy → cpy ../../LICENSE README.md package.json dist --flat
  - outputs: dist/, dist/esm
- packages/my-second
  - depends on @pagebond/my-first via workspace: ^
- packages/my-third
  - depends on @pagebond/my-first and @pagebond/my-second via workspace: ^

Legacy Workspaces and Packages
We currently have three legacy workspaces in source/ plus the new packages/ examples. The objective is to consolidate everything into one modernized workspace.

Workspace roots
- source/utils
  - package.json: private monorepo; workspaces: packages/*
- source/pg-utils
  - package.json: private monorepo; workspaces: packages/*
- source/internal-utils
  - package.json: private monorepo; workspaces: packages/*

Inventory by workspace (name, path)
Note: The following list is derived from the repository tree. Some entries are verified by package.json content; others are inferred from directory names. During migration we will re-open each package.json to finalize names/versions.

A) source/utils/packages
- @launchql/ext-defaults — source/utils/packages/defaults
- @launchql/ext-types — source/utils/packages/types
- @launchql/utils — source/utils/packages/utils
- @launchql/ext-uuid — source/utils/packages/uuid
- @launchql/ext-verify — source/utils/packages/verify
- @launchql/ext-jobs — source/utils/packages/jobs
- @launchql/ext-jwt-claims — source/utils/packages/jwt-claims
- base32 — source/utils/packages/base32
- inflection — source/utils/packages/inflection
- @launchql/ext-default-roles — source/utils/packages/default-roles
- achievements — source/utils/packages/achievements
- geotypes — source/utils/packages/geotypes
- measurements — source/utils/packages/measurements
- jobs-simple — source/utils/packages/jobs-simple
- faker — source/utils/packages/faker
- stamps — source/utils/packages/stamps
- totp — source/utils/packages/totp
- types — source/utils/packages/types (dup name with ext-types pattern already captured above)

B) source/pg-utils/packages
- defaults — source/pg-utils/packages/defaults
- default-roles — source/pg-utils/packages/default-roles
- measurements — source/pg-utils/packages/measurements
- types — source/pg-utils/packages/types
- utils — source/pg-utils/packages/utils
- jobs — source/pg-utils/packages/jobs
- verify — source/pg-utils/packages/verify

C) source/internal-utils/packages
- db_meta — source/internal-utils/packages/db_meta
- db_meta_modules — source/internal-utils/packages/db_meta_modules
- db_meta_test — source/internal-utils/packages/db_meta_test
- encrypted-secrets — source/internal-utils/packages/encrypted-secrets
- encrypted-secrets-table — source/internal-utils/packages/encrypted-secrets-table

D) source/internal-utils/extensions/@launchql/*
These overlap with some of the utils/ and pg-utils/ package names (scoped).
- @launchql/ext-default-roles — source/internal-utils/extensions/@launchql/ext-default-roles
- @launchql/ext-jobs — source/internal-utils/extensions/@launchql/ext-jobs
- @launchql/ext-jwt-claims — source/internal-utils/extensions/@launchql/ext-jwt-claims
- @launchql/ext-types — source/internal-utils/extensions/@launchql/ext-types
- @launchql/ext-stamps — source/internal-utils/extensions/@launchql/ext-stamps
- @launchql/inflection — source/internal-utils/extensions/@launchql/inflection

E) New example workspace (packages/)
- @pagebond/my-first — packages/my-first
- @pagebond/my-second — packages/my-second
- @pagebond/my-third — packages/my-third

Duplicate/Overlap Analysis (by logical package name)
Observed duplicates across legacy workspaces:
- default-roles/ext-default-roles:
  - source/utils/packages/default-roles (@launchql/ext-default-roles)
  - source/internal-utils/extensions/@launchql/ext-default-roles
  - source/pg-utils/packages/default-roles
- types/ext-types:
  - source/utils/packages/types (@launchql/ext-types)
  - source/internal-utils/extensions/@launchql/ext-types
  - source/pg-utils/packages/types
- jobs/ext-jobs:
  - source/utils/packages/jobs (@launchql/ext-jobs)
  - source/internal-utils/extensions/@launchql/ext-jobs
  - source/pg-utils/packages/jobs
- jwt-claims/ext-jwt-claims:
  - source/utils/packages/jwt-claims (@launchql/ext-jwt-claims)
  - source/internal-utils/extensions/@launchql/ext-jwt-claims
- verify/ext-verify:
  - source/utils/packages/verify (@launchql/ext-verify)
  - source/pg-utils/packages/verify
- defaults/ext-defaults:
  - source/utils/packages/defaults (@launchql/ext-defaults)
  - source/pg-utils/packages/defaults
- utils/@launchql/utils:
  - source/utils/packages/utils (@launchql/utils)
  - source/pg-utils/packages/utils
- measurements:
  - source/utils/packages/measurements
  - source/pg-utils/packages/measurements
- stamps/ext-stamps:
  - source/utils/packages/stamps
  - source/internal-utils/extensions/@launchql/ext-stamps
- inflection:
  - source/utils/packages/inflection
  - source/internal-utils/extensions/@launchql/inflection

Non-overlapping/internal packages to retain
- db_meta, db_meta_modules, db_meta_test
- encrypted-secrets, encrypted-secrets-table
- base32, uuid, achievements, geotypes, jobs-simple, faker, totp
- Possibly others discovered during final pass

Modernization Targets (template)
We will standardize all packages to:
- TypeScript with dual CJS+ESM output
- Scripts: clean, build (tsc; tsc -p tsconfig.esm.json), prepare=build, copy (cpy to dist)
- publishConfig: { access: "public", directory: "dist" } for public extensions
- Internal workspace dependencies via workspace:^
- Consistent repository/homepage/bugs metadata pointing to this repo
- Tests via jest where present, lint via eslint

Proposed Single Workspace Layout (category-based)
We recommend consolidating everything under packages/ with domain categories to scale cleanly:
- packages/security/*
  - ext-jwt-claims, ext-verify, encrypted-secrets, encrypted-secrets-table, default-roles
- packages/jobs/*
  - ext-jobs, jobs-simple
- packages/data-types/*
  - ext-types, ext-uuid, base32, inflection, stamps
- packages/metrics/*
  - measurements, achievements
- packages/geo/*
  - geotypes
- packages/utils/*
  - utils, defaults, faker, totp
- packages/meta/*
  - db_meta, db_meta_modules, db_meta_test

Rationale
- Keeps a single workspace root under packages/
- Categories allow discoverability and team ownership lines without adding additional roots
- Aligns with pnpm workspaces and the new example package topology
- Preserves future scalability if categories need to be split further (we can add deeper globs without creating new top-level workspaces)

Workspace Configuration Changes (in follow-up PR)
Do NOT change in this plan PR; included here for clarity.

Update pnpm-workspace.yaml from:
  packages:
    - "packages/*"

To:
  packages:
    - "packages/*"
    - "packages/security/*"
    - "packages/jobs/*"
    - "packages/data-types/*"
    - "packages/metrics/*"
    - "packages/geo/*"
    - "packages/utils/*"
    - "packages/meta/*"

Update launchql.json from:
  {
    "packages": [
      "packages/*",
      "extensions/@*/*",
      "extensions/*"
    ]
  }

To:
  {
    "packages": [
      "packages/*",
      "packages/security/*",
      "packages/jobs/*",
      "packages/data-types/*",
      "packages/metrics/*",
      "packages/geo/*",
      "packages/utils/*",
      "packages/meta/*"
    ]
  }

Note: Since the target is to keep a single organized workspace, we will not maintain a parallel extensions/ root. All packages move into packages/<category>/*.

Duplicate Resolution Strategy
- Prefer scoped @launchql/ext-* naming for extensions.
- Choose canonical implementation based on:
  - Recency and version field (when available)
  - TS-based implementation with dual ESM+CJS output preferred
  - Richer tests and active dependencies favored
- Normalize to new template:
  - scripts: clean, build, prepare, copy
  - publishConfig for public packages
  - repository/homepage/bugs → this repo
  - dependencies among internal packages → workspace:^

Migration Plan (Phases)
Phase 1: Prepare
- For each logical package, pick canonical source (utils vs pg-utils vs internal-utils extensions).
- Decide the category folder destination under packages/<category>/<package>.
- Draft a per-package move map (path → new path). Include renames only if needed to standardize @launchql/ext-*.

Phase 2: Move and Modernize
- Create new package folders under packages/<category>/<name>.
- Copy over src/, tsconfig.json, tsconfig.esm.json (create missing ones based on template).
- Update package.json to the canonical template; adjust dependencies to workspace:^; normalize metadata.
- Add/adjust tests and lint configs if present.
- Ensure LICENSE/README/package.json copy step aligns with new relative paths (cpy ../../LICENSE ... is valid for packages/<category>/*).

Phase 3: Workspace Update and Build
- Update pnpm-workspace.yaml and launchql.json as specified above.
- pnpm install
- pnpm -r build
- pnpm -r lint
- pnpm -r test (if tests exist)

Phase 4: Clean-up
- Verify no packages remain in source/* workspaces.
- Remove source/internal-utils, source/pg-utils, source/utils after successful builds.
- Search and fix any references to legacy paths/imports.
- Ensure package name uniqueness across monorepo.

Verification Checklist
- All packages build successfully with dual CJS+ESM outputs.
- All inter-package dependencies use workspace:^ and resolve.
- Lint passes for all packages.
- Tests (if present) pass.
- No duplicate package names remain.
- pnpm-workspace.yaml and launchql.json only reference the single workspace under packages/.

Open Questions / Assumptions
- Category naming: Proposed categories are security, jobs, data-types, metrics, geo, utils, meta. We can adjust names based on team preference.
- Publication scope: Which packages should remain public vs private? This plan assumes extensions remain public unless otherwise specified.
- Some legacy directories may contain JS-only implementations; we’ll minimally scaffold TS configs to align outputs. If deeper TS refactors are preferred, we can schedule a separate follow-up.

Next Steps
- Merge this plan PR after review.
- Implement the migration in a follow-up PR according to this plan.
- Optionally, add a docs page explaining extension categories and conventions so future packages follow the template from the start.
