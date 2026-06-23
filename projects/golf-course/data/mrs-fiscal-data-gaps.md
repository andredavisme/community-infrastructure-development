# MRS Fiscal Data — Gaps & Manual Extraction Queue

> Last updated: 2026-06-23

The Maine Revenue Services Municipal Valuation Return (MVR) Statistical Summary is the authoritative source for town-by-town assessed valuation, mil rates, tax commitment totals, and exemptions.

**Source URL:** https://www.maine.gov/revenue/taxes/property-tax/municipal-services/valuation-return-statistical-summary

Annual PDFs are published there for each tax year. Manual extraction is required for the following gaps:

## Priority Extraction Queue

| Community | Years Needed | Key Fields | Status |
|-----------|-------------|------------|--------|
| York | 2020, 2021, 2022, 2023, 2024 | Total valuation, mil rate, tax commitment, homestead exemptions | ⏳ Pending |
| Ogunquit | 2019, 2020, 2021, 2022, 2023 | Total valuation, mil rate, commitment, seasonal/recreational exemptions | ⏳ Pending |
| Wells | 2019, 2020, 2021, 2022, 2023 | Total valuation, mil rate, tax commitment | ⏳ Pending |
| Kennebunk | 2019, 2020, 2021, 2022, 2023 | Total valuation, mil rate, commitment | ⏳ Pending (2025 rate known: $9.85/$1k) |
| Kennebunkport | 2019, 2020, 2021, 2022, 2023 | Total valuation, mil rate, commitment | ⏳ Pending |
| Kittery | 2019, 2020, 2021, 2022, 2023 | Total valuation, mil rate, commitment | ⏳ Pending |
| York County | 2010, 2020, 2023 | County budget total, MRS disbursements, county tax rate | Partial (2023 disbursement seeded) |

## Fields to Extract Per Community Per Year

From the MVR Statistical Summary PDF:
- **Just Value (assessed valuation)** — total and by property class (residential, commercial, industrial, open space)
- **Mil rate** (tax rate per $1,000 valuation)
- **Tax commitment** (= valuation × mil rate = total property tax billed)
- **Homestead exemption** total
- **Tree growth / farmland / open space** exemption totals (relevant to golf course open-space classification questions)
- **Assessment ratio** (% of market value)

From town annual financial reports (CAFRs):
- Total general fund revenues and expenditures
- Tax revenue as % of total revenues
- Per-capita expenditure by function (public safety, education, public works, debt service)

## What's Already Seeded (Hard Data)

| Community | Year | Total Tax Revenue | Per-Capita Burden | Source |
|-----------|------|------------------|-------------------|--------|
| York | 2010 | $33,722,497 | $2,691 | Town Annual Financial Report FY2010 |
| York | 2018 | $50,084,571 | $3,652 | Town Annual Financial Report FY2019 (comparative) |
| York | 2019 | $52,789,098 | $3,846 | Town Annual Financial Report FY2019 |
| Ogunquit | 2021 | — | $11,248 | Maine Figures / MRS 2021 sales tax analysis |
| Kennebunk | 2025 | — | rate $9.85/$1k | Kennebunk Assessor Dept |
| York County | 2023 | MRS disburse. $2,258,852 | — | York County 2023 Annual Report |

## Important Context Notes

- **Ogunquit is ranked #1 in Maine** for per-capita tax revenue ($11,248/yr-round resident) — driven almost entirely by seasonal property values, not a large year-round tax base.
- **York and Wells** experienced significant assessed valuation surges 2020–2023 due to the coastal Maine real estate boom; mil rates may have been lowered even as commitments rose.
- For the golf course analysis, key questions are:
  - What is the current assessed valuation of comparable agricultural/open-space parcels in York?
  - What is the golf course industry standard for property tax classification in Maine (farm, commercial, recreational)?
  - What would the tax commitment differential be between current use (e.g., agricultural/farm) and golf course (recreational/commercial)?
