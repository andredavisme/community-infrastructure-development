# Schema Migrations

SQL migration files applied to the Supabase project (`andredavisme's Project`).

All files are prefixed with a zero-padded sequence number and applied in order.

| File | Description | Applied |
|------|-------------|--------|
| `001_cid_core_tables.sql` | Core CID schema: scenarios, communities, population, municipal finance, utility, footprint, environmental, employment, engagement, financial obligations, historical trends | 2026-06-23 |

## Naming Convention

```
{sequence}_{description}.sql
```

## Notes

- All `cid_` prefixed tables belong to this project
- RLS is enabled on all tables with public read policies (open analysis)
- Write access requires authenticated Supabase session
- `is_estimate` boolean is present on every data table — always flag estimated vs. measured values
