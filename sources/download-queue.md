# Source Document Download Queue

> Last updated: 2026-06-23  
> Documents that should be downloaded and committed to `sources/downloaded/` for offline reference and auditability.

## Priority 1 — Municipal Finance (MRS)

| Document | URL | Target Path | Status |
|----------|-----|-------------|--------|
| MRS MVR Statistical Summary 2019 | https://www.maine.gov/revenue/taxes/property-tax/municipal-services/valuation-return-statistical-summary | `sources/downloaded/finance/mrs-mvr-2019.pdf` | ⬜ Not downloaded |
| MRS MVR Statistical Summary 2020 | same page — select year 2020 | `sources/downloaded/finance/mrs-mvr-2020.pdf` | ⬜ Not downloaded |
| MRS MVR Statistical Summary 2021 | same page — select year 2021 | `sources/downloaded/finance/mrs-mvr-2021.pdf` | ⬜ Not downloaded |
| MRS MVR Statistical Summary 2022 | same page — select year 2022 | `sources/downloaded/finance/mrs-mvr-2022.pdf` | ⬜ Not downloaded |
| MRS MVR Statistical Summary 2023 | same page — select year 2023 | `sources/downloaded/finance/mrs-mvr-2023.pdf` | ⬜ Not downloaded |
| MRS MVR Statistical Summary 2024 | same page — select year 2024 | `sources/downloaded/finance/mrs-mvr-2024.pdf` | ⬜ Not downloaded |

**Extraction targets per PDF (for York, Ogunquit, Wells, Kennebunk, Kennebunkport, Kittery):**
- Just Value (assessed valuation)
- Mil rate
- Tax commitment
- Homestead exemption total
- Tree growth / open space / farmland exemption totals
- Assessment ratio

---

## Priority 2 — Town Annual Financial Reports (CAFRs)

| Document | URL | Target Path | Status |
|----------|-----|-------------|--------|
| Town of York CAFR FY2021 | https://www.yorkmaine.org/ArchiveCenter | `sources/downloaded/finance/york-cafr-fy2021.pdf` | ⬜ Not downloaded |
| Town of York CAFR FY2022 | https://www.yorkmaine.org/ArchiveCenter | `sources/downloaded/finance/york-cafr-fy2022.pdf` | ⬜ Not downloaded |
| Town of York CAFR FY2023 | https://www.yorkmaine.org/ArchiveCenter | `sources/downloaded/finance/york-cafr-fy2023.pdf` | ⬜ Not downloaded |
| Town of York CAFR FY2024 | https://www.yorkmaine.org/ArchiveCenter | `sources/downloaded/finance/york-cafr-fy2024.pdf` | ⬜ Not downloaded |
| Wells Annual Report FY2022 | https://www.wellstown.org | `sources/downloaded/finance/wells-annual-report-fy2022.pdf` | ⬜ Not downloaded |
| Ogunquit Annual Report FY2022 | https://www.ogunquit.gov | `sources/downloaded/finance/ogunquit-annual-report-fy2022.pdf` | ⬜ Not downloaded |
| Kennebunk Annual Report FY2022 | https://www.kennebunkmaine.us | `sources/downloaded/finance/kennebunk-annual-report-fy2022.pdf` | ⬜ Not downloaded |

---

## Priority 3 — Comprehensive Plans

| Document | URL | Target Path | Status |
|----------|-----|-------------|--------|
| Ogunquit Housing Inventory (rev. July 2023) | https://www.ogunquit.gov/DocumentCenter/View/2797/Housing-Inventory-PDF | `sources/downloaded/comp-plans/ogunquit-housing-inventory-2023.pdf` | ⬜ Not downloaded |
| Kennebunk Comprehensive Plan Ch. 9 | https://www.kennebunkmaine.us/DocumentCenter/View/12699/9-Population-and-Demographics | `sources/downloaded/comp-plans/kennebunk-comp-plan-ch9-population.pdf` | ⬜ Not downloaded |
| Kennebunk Comprehensive Plan Ch. A | https://kennebunkmaine.us/DocumentCenter/View/8685/A-Population- | `sources/downloaded/comp-plans/kennebunk-comp-plan-chA-population.pdf` | ⬜ Not downloaded |
| York County 2023 Annual Report | https://www.yorkcountymaine.gov/_files/ugd/4237e6_b8a6a502c5d3479ba0d5d2d1128e0f37.pdf | `sources/downloaded/finance/york-county-annual-report-2023.pdf` | ⬜ Not downloaded |

---

## Priority 4 — Golf Course Industry Benchmarks

| Document | URL | Target Path | Status |
|----------|-----|-------------|--------|
| GCSAA Environmental Profile (latest) | https://www.gcsaa.org | `sources/downloaded/industry/gcsaa-environmental-profile.pdf` | ⬜ Not downloaded |
| USGA Water Use Survey | https://www.usga.org/content/usga/home-page/articles/2015/06/water-use-survey.html | `sources/downloaded/industry/usga-water-use-survey.pdf` | ⬜ Not downloaded |
| EPA Golf Course Environmental Mgmt | https://www.epa.gov | `sources/downloaded/industry/epa-golf-course-env-mgmt.pdf` | ⬜ Not downloaded |
| BLS OES NAICS 713910 (Golf Courses) | https://www.bls.gov/oes/current/naics4_713910.htm | `sources/downloaded/industry/bls-oes-golf-courses-713910.pdf` | ⬜ Not downloaded |

---

## How to Commit Downloaded Files

```bash
# After downloading a PDF manually:
git add sources/downloaded/finance/mrs-mvr-2023.pdf
git commit -m "Add MRS MVR 2023 PDF source document"
git push
```

Once committed, update the corresponding row in `source-registry.md`:
- Change tier from `D` to `A`
- Add the `download_url` to the local path
- Note the exact pages/tables extracted
