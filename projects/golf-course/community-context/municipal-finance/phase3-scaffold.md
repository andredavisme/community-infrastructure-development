# Phase 3 Scaffold — Per Capita Tax Burden vs. Municipal Expense & Utility Need

## Objective

Compare each municipality's **per capita tax base** (from Phase 2) against:
1. **Per capita municipal expenditure** — what each resident costs the town to serve
2. **Per capita utility infrastructure need** — water, sewer, roads normalized to population

This establishes the fiscal gap or surplus context before modeling a golf course's tax contribution.

---

## Data Requirements

### A. Municipal Expense Budgets (per municipality, most recent available year)

| Data Point | Source | Format |
|---|---|---|
| Total municipal appropriation / budget | Maine LD 1 budget filings or town annual reports | $ total |
| Per capita expenditure (derived) | Budget ÷ 2020 Census pop | $/resident |
| Education spending (separate from municipal ops) | Maine DOE / SAU budgets | $ total |
| Debt service | Town annual reports | $ total |

**Primary source:** Maine Municipal Association annual reports; individual town annual budgets (typically available on town websites as PDFs).

### B. Utility Infrastructure Need

| Data Point | Source |
|---|---|
| Water system type (public / private / well) | Maine DWP public water system registry |
| Sewer / septic type (public / private) | Town comp plans, Maine DEP |
| Road miles maintained | Maine DOT municipal aid records |
| Per capita road burden (road miles ÷ pop) | Derived |
| Water consumption benchmarks | USGS / Maine DWP |

### C. Golf Course Fiscal Contribution Model (Phase 4 input)

| Data Point | Needed For |
|---|---|
| Estimated assessed value of golf course (land + improvements) | Tax revenue projection |
| Applicable tax rate (mill rate) | Per town records |
| Estimated personal property on course (equipment, carts, etc.) | PP tax contribution |
| Water utility demand (irrigation volume) | Infrastructure stress estimate |
| Road impact (construction + operational traffic) | Infrastructure cost estimate |

---

## Analysis Plan

### Step 1 — Collect expense budget data
- Source per-municipality total budgets for the most recent available year (FY2023 or FY2024).
- Derive per capita expenditure for all 29 municipalities.
- Flag municipalities where per capita expense significantly exceeds per capita tax base.

### Step 2 — Utility need baseline
- Classify each municipality by water/sewer infrastructure type.
- Estimate per capita water demand and road maintenance burden.
- Map which municipalities have public utility exposure relevant to golf course scenarios.

### Step 3 — Fiscal gap analysis
- Calculate: `Fiscal Gap = Per Capita Expenditure − (PP/Capita + HS/Capita tax equivalent)`
- Identify municipalities with the greatest gap (most dependent on new taxable development).
- Identify municipalities with strong existing tax bases (less marginal benefit from new development).

### Step 4 — Golf course contribution model
- Model projected tax revenue from a 150-acre coastal Maine golf course.
- Compare to per capita gap and total budget context of the host municipality.
- Express as: % of budget offset, per-resident annual benefit, and 10-year projection.

---

## Output Files (to be created in Phase 3)

| File | Description |
|---|---|
| `york-county-municipal-budgets.csv` | Budget totals and per capita expenditure by municipality |
| `york-county-utility-infrastructure.csv` | Water/sewer/road classification and per capita need |
| `york-county-fiscal-gap-analysis.csv` | Derived fiscal gap: expense vs. tax base per capita |
| `analysis-phase3-summary.md` | Written summary of findings |

---
*Feeds into: `projects/golf-course/financial-obligations/` for the full fiscal impact model.*
