# Data Dictionary

This document provides general field definitions and source descriptions for data used across all projects in this repository.

> 📖 **Acronyms & Abbreviations:** For a full glossary of every acronym, abbreviation, and unit used in this repo, see [`docs/glossary.md`](./glossary.md).

> 📄 **MRS MVR Detailed Reference:** For the full field-by-field description, source credibility assessment, and downstream dependency map specific to the Maine Revenue Services Municipal Valuation Return data, see [`shared/data-sources/mrs-mvr-data-dictionary.md`](../shared/data-sources/mrs-mvr-data-dictionary.md).

---

## Primary Data Sources

| Source | Type | Credibility | Location |
|---|---|---|---|
| Maine Revenue Services (MRS) — Municipal Valuation Return (MVR) Statistical Summary | Statutory government filing | ★★★★★ | [`shared/data-sources/mrs-mvr-data-dictionary.md`](../shared/data-sources/mrs-mvr-data-dictionary.md) |
| U.S. Census Bureau — Decennial Census | Federal enumeration | ★★★★★ | `projects/*/community-context/population/` |
| U.S. Census Bureau — American Community Survey (ACS) | Survey estimate (5-yr) | ★★★★☆ | `projects/*/community-context/population/` |
| Maine Department of Administrative and Financial Services (DAFS) — County population estimates | State interpolation | ★★★★☆ | `projects/*/community-context/population/` |
| Municipal budget documents | Local government filings | ★★★★☆ | `projects/*/community-context/municipal-finance/` |
| USGA Water Resource Center | Industry research | ★★★★☆ | `projects/golf-course/water-use/` |
| Golf Course Superintendents Association of America (GCSAA) Environmental Stewardship Report | Industry survey | ★★★★☆ | `projects/golf-course/` |
| U.S. Environmental Protection Agency (EPA) — WaterSense / EJScreen | Federal program data | ★★★★★ | Environmental impact sections |

---

## Key Terms

### Certified Ratio
The MRS-calculated ratio of a municipality's total assessed value to estimated full market value. Used to convert assessed valuations to market-value equivalents. See [MRS MVR Data Dictionary](../shared/data-sources/mrs-mvr-data-dictionary.md#21-certified-ratio-) for full detail.

### Tax Commitment
The total property tax levy billed to all taxable property owners in a given year. See [MRS MVR Data Dictionary](../shared/data-sources/mrs-mvr-data-dictionary.md#22-tax-commitment-) for full detail.

### Tax Rate (Mills)
Dollars of tax per $1,000 of assessed value. Calculated as Commitment ÷ Total Valuation × 1,000. See [MRS MVR Data Dictionary](../shared/data-sources/mrs-mvr-data-dictionary.md#23-tax-rate-mills--per-1000-assessed-value) for full detail.

### Homestead Exemption
Maine’s primary residence property tax exemption. Count used as proxy for owner-occupied primary residence cohort. See [MRS MVR Data Dictionary](../shared/data-sources/mrs-mvr-data-dictionary.md#32-homestead-exemption-count--value-) for full detail.

### BETE (Business Equipment Tax Exemption)
Legally exempted business personal property under Maine law. Represents foregone municipal tax revenue. See [MRS MVR Data Dictionary](../shared/data-sources/mrs-mvr-data-dictionary.md#33-bete-business-equipment-tax-exemption-count--value-) for full detail.

### FTE (Full-Time Equivalent)
A standardized employment measure where one FTE equals 40 hours per week. Used to normalize part-time, seasonal, and contract positions against full-time headcount.

### gpd (Gallons Per Day)
Standard unit for water use and wastewater flow rates. Capacity headroom is calculated as: `community_water_capacity_gpd − community_water_current_use_gpd`.

### is\_estimate
Boolean flag present on every data table in the `cid_*` schema. Set to `true` whenever a value is derived from benchmarks, projections, or modeled estimates rather than direct measurement or official reporting. Always displayed as “est.” in public-facing views.

---

*See [`docs/glossary.md`](./glossary.md) for all acronyms and unit abbreviations.*  
*See [`docs/methodology.md`](./methodology.md) for analytical approach and assumptions.*  
*See [`shared/data-sources/`](../shared/data-sources/) for source-level documentation.*
