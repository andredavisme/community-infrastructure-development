# Schema Migrations

SQL migration files applied to the Supabase project (`andredavisme's Project`, ID: `hhyhulqngdkwsxhymmcd`).

All files are prefixed with a zero-padded sequence number and applied in order.

| File | Description | Applied |
|------|-------------|--------|
| `001_cid_core_tables.sql` | Core CID schema: scenarios, communities, population, municipal finance, utility, footprint, environmental, employment, engagement, financial obligations, historical trends | 2026-06-23 |
| `002_cid_seasonal_population.sql` | Seasonal population tracking columns and supporting structures | 2026-06-23 |
| `003_cid_municipal_finance_seed.sql` | Seed data for municipal finance snapshots | 2026-06-23 |
| `004_cid_mvr_columns.sql` | MVR column expansions on finance snapshots + `cid_mvr_exemption_detail` table (homestead, veterans, BETE, current-use, government exemptions; cohort ratio proxies) | 2026-06-23 |
| `005_cid_proposed_infrastructure.sql` | Proposed infrastructure table: proposal capacity dimensions (water, land, utility, environmental, economic) + community capacity snapshot for direct comparison | 2026-06-23 |

## Naming Convention

```
{sequence}_{description}.sql
```

## Notes

- All `cid_` prefixed tables belong to this project
- RLS is enabled on all tables with public read policies (open analysis)
- Write access requires authenticated Supabase session or service role
- `is_estimate` boolean is present on every data table — always flag estimated vs. measured values
- `cid_proposed_infrastructure` is the authoritative source for infrastructure proposals;
  public display is handled by **maine-civic-tracker** (see [Cross-Repo References](#cross-repo-references) below)

## Cross-Repo References

### [maine-civic-tracker](https://github.com/andredavisme/maine-civic-tracker)

> A public accountability tracker connecting what Maine residents pay into their civic systems with what they actually get out of them — budget sources, fund allocations, outcome tracking, community evidence, and proposed infrastructure, all in one place.

- **What it uses from this schema:** `cid_proposed_infrastructure`, `cid_communities`
- **How:** Direct Supabase queries via the anon/publishable key (read-only, RLS enforced)
- **Relevant page:** [`proposals.html`](https://andredavisme.github.io/maine-civic-tracker/proposals.html) — renders approved proposals with capacity metric tiles, filterable by community and infrastructure type
- **Data flow:** Proposals are loaded directly into this repo's Supabase project. `maine-civic-tracker` reads and displays them; it does not write to `cid_*` tables.

### [civic-identity-toolkit](https://github.com/andredavisme/civic-identity-toolkit)

> Documentation and tooling for structuring civic identity, community engagement records, and public accountability workflows — the methodological foundation underlying both this repo and maine-civic-tracker.

- **Relationship:** Provides the conceptual framework and documentation standards (source citation practice, community engagement record structure, public presentation guidelines) applied across CID analysis
