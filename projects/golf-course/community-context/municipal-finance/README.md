# Municipal Finance — York County, ME

This section documents York County municipal property tax data drawn from Maine Revenue Services Municipal Valuation Return (MVR) Statistical Summary Reports. Analysis covers all 29 municipalities, years 2022–2024.

## Analysis Phases

| Phase | Focus | Status |
|-------|-------|--------|
| 1 | Personal Property, Homestead Exemptions, BETE Exemptions (2022–2024) | ✅ Complete |
| 2 | Per Capita normalization (PP, Homestead, BETE per resident) | ✅ Complete |
| 3 | Per Capita Tax Burden vs. Municipal Expense Budgets & Utility Need | 🔵 Next |
| 4 | Golf Course Fiscal Impact — projected tax contribution vs. community need | ⬜ Pending Phase 3 |

## Files in This Directory

| File | Description |
|------|-------------|
| `york-county-pp-homestead-bete-2022-2024.csv` | Raw per-municipality totals: personal property, homestead, BETE (2022–2024) |
| `york-county-per-capita-2022-2024.csv` | Derived per capita metrics (PP, Homestead, BETE per resident, 2020 Census base) |
| `analysis-phase1-summary.md` | Written summary of Phase 1 findings |
| `analysis-phase2-per-capita.md` | Written summary of Phase 2 per capita findings |
| `phase3-scaffold.md` | Framework and data requirements for Phase 3 expense/utility need comparison |

## Data Sources

- Maine Revenue Services MVR Statistical Summary Reports (2022, 2023, 2024)
- U.S. Census Bureau 2020 Decennial Census (population by municipality)
- Maine municipal expense budgets (Phase 3 — to be sourced from LD 1 budget filings and town annual reports)

---
*Part of the [Community Infrastructure Development](https://github.com/andredavisme/community-infrastructure-development) analysis framework.*
