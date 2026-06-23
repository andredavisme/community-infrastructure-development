# Source Registry

> Last updated: 2026-06-23  
> Covers all data seeded to Supabase and referenced in project documents to date.

## Reliability Tiers

| Tier | Label | Meaning |
|------|-------|---------|
| A | Hard | Official government publication, audited financial report, or decennial census — directly extracted |
| B | Verified estimate | Official agency estimate (Census ACS, Maine DAFS) or municipal comp plan |
| C | Modeled | Derived from trends, ratios, or third-party analysis of official data |
| D | Pending | Referenced but not yet extracted from source document |

---

## Population & Demographics

| ID | Source Name | URL | Access Date | Data Extracted | Tier | Notes |
|----|-------------|-----|-------------|----------------|------|-------|
| POP-01 | US Census Bureau — Decennial Census 2000 | https://data.census.gov | 2026-06-23 | Population totals: York, Kittery, Wells, Ogunquit, Kennebunk, Kennebunkport, York County, Maine | A | |
| POP-02 | US Census Bureau — Decennial Census 2010 | https://data.census.gov | 2026-06-23 | Population totals: all 8 communities | A | |
| POP-03 | US Census Bureau — Decennial Census 2020 | https://data.census.gov | 2026-06-23 | Population totals + vacancy rates: all communities | A | |
| POP-04 | US Census Bureau — Population Estimates V2024 | https://www.census.gov/quickfacts/fact/table/yorkcountymaine/PST045224 | 2026-06-23 | 2024 estimates: York (~14,200), Kittery (11,064), Wells (11,731), Kennebunk (11,757), York County (220,143), Maine (1,405,012) | B | |
| POP-05 | Maine DAFS Economist — Population Growth Trends 2023–2024 | https://www1.maine.gov/dafs/economist/news/may-15-25/population-growth-trends-maine-cities-and-towns-2023-2024 | 2026-06-23 | 2024 town-level estimates; growth trends narrative | B | Published May 15, 2025 |
| POP-06 | Maine DAFS Economist — 2024 Population Estimates by Age/Sex/Race | https://www.maine.gov/dafs/economist/news/jul-09-25/2024-population-estimates-age-sex-race-and-ethnicity | 2026-06-23 | Maine median age 44.8; county variation noted | B | |
| POP-07 | citypopulation.de — Kittery, York County | https://www.citypopulation.de/en/usa/maine/admin/york/2303137270__kittery/ | 2026-06-23 | Kittery 2024 estimate: 11,064 | B | Aggregates Census Bureau data |
| POP-08 | Maine housing stakeholder data (May 2024) | https://legislature.maine.gov/testimony/resources/HED20250408Harrison133886038613376466.pdf | 2026-06-23 | Wells 2024: 11,731; Kennebunk 2024: 11,757 | B | Legislative testimony |

---

## Seasonal Population & Housing

| ID | Source Name | URL | Access Date | Data Extracted | Tier | Notes |
|----|-------------|-----|-------------|----------------|------|-------|
| SEA-01 | Ogunquit Housing Inventory (rev. July 2023) | https://www.ogunquit.gov/DocumentCenter/View/2797/Housing-Inventory-PDF | 2026-06-23 | 2,089 total housing units; 1,463 seasonal (71.6%); vacancy rate 71.6%; peak pop ~10,000 | A | Town of Ogunquit official document |
| SEA-02 | Ogunquit Comprehensive Plan — Chapter 6: Population & Demographics | https://ogunquit2030.org/chapter-6-population-and-demographics/ | 2026-06-23 | Seasonal conversion trends; 20-year growth | A | |
| SEA-03 | Kennebunk Comprehensive Plan — Chapter 9: Population & Demographics | https://www.kennebunkmaine.us/DocumentCenter/View/12699/9-Population-and-Demographics | 2026-06-23 | Summer pop +50% over year-round (~17,300); Wells quadruples; Kennebunkport triples; 13.8% seasonal housing | A | SMPDC source cited within |
| SEA-04 | SMPDC Regional Estimate (cited in Kennebunk comp plan) | Via SEA-03 | 2026-06-23 | Summer population increases by ~50% over year-round in Kennebunk area | B | Southern Maine Planning & Development Commission |
| SEA-05 | Bangor Daily News / Census 2020 — Maine vacant homes | https://fox23maine.com/news/local/maine-has-the-highest-share-of-vacant-homes-in-the-country | 2026-06-23 | Maine has highest vacant home share in US; >1/5 of all units vacant part of year; 72% of vacant are seasonal | A | Based on Census 2020 |
| SEA-06 | beautifulmainehome.com — Second homes in the Kennebunks | https://beautifulmainehome.com/blog/buying-a-second-home-in-the-kennebunks-what-to-consider | 2026-06-23 | Kennebunkport population triples in summer | C | Real estate blog; consistent with comp plan |
| SEA-07 | NearbyLens — Ogunquit demographics | https://nearbylens.com/cities/usa/me/ogunquit/ | 2026-06-23 | Year-round pop ~1,363; seasonal character confirmed | C | |
| SEA-08 | WGME — Maine second home markets | https://wgme.com/news/local/maine-has-2-of-the-fastest-growing-markets-for-second-homes-york-county-cumberland-county-old-orchard-beach | 2026-06-23 | York County + Cumberland County among fastest-growing second-home markets nationally (2023) | B | |

---

## Municipal Finance & Tax Data

| ID | Source Name | URL | Access Date | Data Extracted | Tier | Notes |
|----|-------------|-----|-------------|----------------|------|-------|
| FIN-01 | Town of York Annual Financial Report FY2010 | https://www.yorkmaine.org/ArchiveCenter/ViewFile/Item/102 | 2026-06-23 | Tax commitment $33,722,497; mil rate 8.26 | A | |
| FIN-02 | Town of York Annual Financial Report FY2019 | https://www.yorkmaine.org/Archive/ViewFile/Item/269 | 2026-06-23 | Tax revenue $52,789,098 = 86.54% of total revenues $61M; FY2018 comparative $50,084,571 | A | |
| FIN-03 | Kennebunk Assessor Department — Tax Rate History | https://www.kennebunkmaine.us/125/Assessing | 2026-06-23 | 2025 tax rate $9.85/$1,000 valuation; assessment ratio 100% | A | |
| FIN-04 | Maine Figures — Per-Capita Tax Revenue Analysis 2021 | https://kylescotshank.substack.com/p/vol-1-which-towns-in-maine-are-generating | 2026-06-23 | Ogunquit #1 in Maine: $11,248.38/capita (pop ~1,207); analysis of MRS sales tax data | B | Third-party analysis of MRS data |
| FIN-05 | York County 2023 Annual Report | https://www.yorkcountymaine.gov/_files/ugd/4237e6_b8a6a502c5d3479ba0d5d2d1128e0f37.pdf | 2026-06-23 | MRS disbursement to York County: $2,258,852; $97,356 to Registry of Deeds Preservation | A | |
| FIN-06 | MRS Municipal Valuation Return Statistical Summary (all years) | https://www.maine.gov/revenue/taxes/property-tax/municipal-services/valuation-return-statistical-summary | 2026-06-23 | URL confirmed; PDFs not yet extracted | D | **Priority extraction target** — see download-queue.md |
| FIN-07 | Maine Office of the State Controller — Revenue Reports | https://www.maine.gov/osc/financial-reporting/revenue-reports | 2026-06-23 | URL confirmed; not yet extracted | D | Monthly General Fund revenue reports |

---

## Golf Course Industry Benchmarks

| ID | Source Name | URL | Access Date | Data Extracted | Tier | Notes |
|----|-------------|-----|-------------|----------------|------|-------|
| IND-01 | GCSAA Environmental Profile | https://www.gcsaa.org | Referenced | Seasonal water use benchmarks; staffing ratios | B | Manual extraction pending |
| IND-02 | USGA Water Resource Center | https://www.usga.org/content/usga/home-page/articles/2015/06/water-use-survey.html | Referenced | Water use per 18-hole course by region/season | B | Manual extraction pending |
| IND-03 | EPA — Golf Course Environmental Management | https://www.epa.gov | Referenced | Pesticide and runoff benchmarks | B | Manual extraction pending |
| IND-04 | BLS — Golf Course Employment (NAICS 713910) | https://www.bls.gov/oes/current/naics4_713910.htm | Referenced | Employment wages, FTE ratios | B | Manual extraction pending |

---

## Source Gaps Summary

- **D-tier (pending):** FIN-06 (MRS PDFs), FIN-07 (State Controller), IND-01 through IND-04
- **Highest priority:** FIN-06 — needed to confirm all estimated finance snapshots and add mil rates + assessed valuation totals
- **Second priority:** IND-01 + IND-02 — needed for water use and environmental impact sections
