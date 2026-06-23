# Golf Course Scenario — Phase Tracker

Master status table across all analysis sections. Updated as work progresses.

**Last updated:** 2026-06-23

---

## Community Context

| Phase | Task | Status | Output File(s) |
|-------|------|--------|----------------|
| CC-1 | Population data (2020 Census, all 29 municipalities) | ✅ Complete | embedded in per-capita CSV |
| CC-2 | Municipal finance — PP, Homestead, BETE totals (2022–2024) | ✅ Complete | `municipal-finance/york-county-pp-homestead-bete-2022-2024.csv` |
| CC-3 | Municipal finance — per capita normalization | ✅ Complete | `municipal-finance/york-county-per-capita-2022-2024.csv` |
| CC-4 | Municipal expense budgets (per capita expenditure) | 🔵 Next | `municipal-finance/york-county-municipal-budgets.csv` |
| CC-5 | Utility infrastructure classification (water/sewer/roads) | 🔵 Next | `municipal-finance/york-county-utility-infrastructure.csv` |
| CC-6 | Fiscal gap analysis (expense vs. tax base per capita) | ⚪ Pending CC-4, CC-5 | `municipal-finance/york-county-fiscal-gap-analysis.csv` |
| CC-7 | Nearby communities profile | ⚪ Not started | `nearby-communities/` |
| CC-8 | Trend analysis (25-year population + fiscal context) | ⚪ Not started | `trend-analysis/` |

---

## Water Use

| Phase | Task | Status | Output File(s) |
|-------|------|--------|----------------|
| WU-1 | Irrigation volume benchmarks (USGA/GCSAA standards) | ⚪ Not started | `water-use/` |
| WU-2 | Source type classification (potable/reclaimed/surface) | ⚪ Not started | `water-use/` |
| WU-3 | Coastal Maine water availability context | ⚪ Not started | `water-use/` |
| WU-4 | Per capita water demand comparison (course vs. residential) | ⚪ Not started | `water-use/` |

---

## Utility Use

| Phase | Task | Status | Output File(s) |
|-------|------|--------|----------------|
| UU-1 | Energy consumption benchmarks (clubhouse + maintenance) | ⚪ Not started | `utility-use/` |
| UU-2 | Waste generation and disposal benchmarks | ⚪ Not started | `utility-use/` |
| UU-3 | Municipal utility capacity stress model | ⚪ Not started | `utility-use/` |

---

## Physical Footprint

| Phase | Task | Status | Output File(s) |
|-------|------|--------|----------------|
| PF-1 | Land use breakdown by category (turf, native, wetland, buffer) | ⚪ Not started | `physical-footprint/` |
| PF-2 | Construction impact estimate | ⚪ Not started | `physical-footprint/` |
| PF-3 | Impervious surface and stormwater runoff area | ⚪ Not started | `physical-footprint/` |

---

## Environmental Impact

| Phase | Task | Status | Output File(s) |
|-------|------|--------|----------------|
| EI-1 | Pesticide and fertilizer application benchmarks | ⚪ Not started | `environmental-impact/` |
| EI-2 | Runoff and leaching risk model | ⚪ Not started | `environmental-impact/` |
| EI-3 | Habitat impact (acreage conversion by type) | ⚪ Not started | `environmental-impact/` |
| EI-4 | Stormwater event modeling | ⚪ Not started | `environmental-impact/` |
| EI-5 | Coastal Maine regulatory context (DEP, shoreland zoning) | ⚪ Not started | `environmental-impact/` |

---

## Employment

| Phase | Task | Status | Output File(s) |
|-------|------|--------|----------------|
| EM-1 | Jobs created by category (maintenance, pro shop, F&B, admin) | ⚪ Not started | `employment/` |
| EM-2 | Wage tiers and BLS benchmarks | ⚪ Not started | `employment/` |
| EM-3 | Local vs. outside hiring estimates | ⚪ Not started | `employment/` |
| EM-4 | Seasonal vs. year-round breakdown | ⚪ Not started | `employment/` |

---

## Financial Obligations

| Phase | Task | Status | Output File(s) |
|-------|------|--------|----------------|
| FO-1 | Assessed value model (land + improvements) | ⚪ Pending CC-6 | `financial-obligations/` |
| FO-2 | Projected tax revenue (mill rate × assessed value) | ⚪ Pending FO-1 | `financial-obligations/` |
| FO-3 | Personal property tax contribution (equipment, carts) | ⚪ Pending FO-1 | `financial-obligations/` |
| FO-4 | Impact fees and community benefit agreement benchmarks | ⚪ Not started | `financial-obligations/` |
| FO-5 | 10-year fiscal projection | ⚪ Pending FO-2, FO-3 | `financial-obligations/` |

---

## Community Engagement

| Phase | Task | Status | Output File(s) |
|-------|------|--------|----------------|
| CE-1 | Modeled public meeting Q&A scenarios | ⚪ Not started | `community-engagement/` |
| CE-2 | Common concern frameworks (water, environment, taxes, traffic) | ⚪ Not started | `community-engagement/` |

---

## Status Key

| Symbol | Meaning |
|--------|---------|
| ✅ | Complete |
| 🔵 | Next / Active |
| ⚪ | Not started / Pending dependency |
| 🟡 | In progress |
| 🔴 | Blocked |
