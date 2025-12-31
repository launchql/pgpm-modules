# secrets-meta

Meta-level secrets metadata module for PGPM:

- `meta_public.secret_providers` — registry of secret backends (OpenBao, k8s, etc.)
- `meta_public.secrets` — per-owner/app secret metadata (no values)
- helper functions for metadata management and job→secret metadata lookup.

Values are stored in an external provider (e.g. OpenBao KV v2); this
module stores only the routing and ownership information.

