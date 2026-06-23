# Data Dictionary

This document provides general field definitions and source descriptions for data used across all projects in this repository.

> 📄 **MRS MVR Detailed Reference:** For the full field-by-field description, source credibility assessment, and downstream dependency map specific to the Maine Revenue Services Municipal Valuation Return data, see [`shared/data-sources/mrs-mvr-data-dictionary.md`](../shared/data-sources/mrs-mvr-data-dictionary.md).

---

## Primary Data Sources

| Source | Type | Credibility | Location |
|---|---|---|---|
| Maine Revenue Services — MVR Statistical Summary | Statutory government filing | ★★★★★ | [`shared/data-sources/mrs-mvr-data-dictionary.md`](../shared/data-sources/mrs-mvr-data-dictionary.md) |
| U.S. Census Bureau — Decennial Census | Federal enumeration | ★★★★★ | `projects/*/community-context/population/` |
| U.S. Census Bureau — American Community Survey (ACS) | Survey estimate (5-yr) | ★★★★☆ | `projects/*/community-context/population/` |
| Maine DAFS — County population estimates | State interpolation | ★★★★☆ | `projects/*/community-context/population/` |
| Municipal budget documents | Local government filings | ★★★★☆ | `projects/*/community-context/municipal-finance/` |

---

## Key Terms

### Certified Ratio
The MRS-calculated ratio of a municipality's total assessed value to estimated full market value. Used to convert assessed valuations to market-value equivalents. See [MRS MVR Data Dictionary](../shared/data-sources/mrs-mvr-data-dictionary.md#21-certified-ratio-) for full detail.

### Tax Commitment
The total property tax levy billed to all taxable property owners in a given year. See [MRS MVR Data Dictionary](../shared/data-sources/mrs-mvr-data-dictionary.md#22-tax-commitment-) for full detail.

### Tax Rate (Mills)
Dollars of tax per $1,000 of assessed value. Calculated as Commitment ÷ Total Valuation × 1,000. See [MRS MVR Data Dictionary](../shared/data-sources/mrs-mvr-data-dictionary.md#23-tax-rate-mills--per-1000-assessed-value) for full detail.

### Homestead Exemption
Maine's primary residence property tax exemption. Count used as proxy for owner-occupied primary residence cohort. See [MRS MVR Data Dictionary](../shared/data-sources/mrs-mvr-data-dictionary.md#32-homestead-exemption-count--value-) for full detail.

### BETE
Business Equipment Tax Exemption — legally exempted business personal property. Represents foregone municipal tax revenue. See [MRS MVR Data Dictionary](../shared/data-sources/mrs-mvr-data-dictionary.md#33-bete-business-equipment-tax-exemption-count--value-) for full detail.

---

*See [`docs/methodology.md`](./methodology.md) for analytical approach and assumptions.*
*See [`shared/data-sources/`](../shared/data-sources/) for source-level documentation.*
