# Glossary of Acronyms & Abbreviations

Quick reference for every acronym and abbreviation used across this repository, its schema, documentation, and seed data. Entries are grouped by domain.

---

## Regulatory & Government Agencies

| Acronym | Full Name | Context |
|---|---|---|
| **BEA** | U.S. Bureau of Economic Analysis | Regional economic data |
| **BLS** | U.S. Bureau of Labor Statistics | Employment and wage benchmarks |
| **CMP** | Central Maine Power | Maine's primary electric utility (grid connection for coastal York County) |
| **DACF** | Maine Department of Agriculture, Conservation and Forestry | Land use and forestry data |
| **DAFS** | Maine Department of Administrative and Financial Services | County population estimates |
| **DEP** | Maine Department of Environmental Protection | Shoreland zoning, wetland permits, NRPA |
| **EPA** | U.S. Environmental Protection Agency | Environmental benchmarks, EJScreen, WaterSense |
| **MRS** | Maine Revenue Services | Property tax data; issues MVR Statistical Summary |
| **USDA** | U.S. Department of Agriculture | Soil and land classification data |
| **USGS** | U.S. Geological Survey | Water use data by county and state |

---

## Industry & Research Organizations

| Acronym | Full Name | Context |
|---|---|---|
| **ACS** | American Community Survey | U.S. Census Bureau annual survey; 1-yr and 5-yr estimates |
| **GCSAA** | Golf Course Superintendents Association of America | Golf course water, chemical, employment benchmarks |
| **USGA** | United States Golf Association | Water Resource Center; irrigation benchmarks |

---

## Maine-Specific Programs & Documents

| Acronym | Full Name | Context |
|---|---|---|
| **BETE** | Business Equipment Tax Exemption | Maine property tax exemption for qualifying business equipment; foregone municipal revenue |
| **KKWD** | Kennebunk, Kennebunkport and Wells Water District | Regional water utility serving York County coastal communities |
| **MVR** | Municipal Valuation Return | Annual MRS statutory filing; primary source for assessed valuation, exemptions, and mil rate data |
| **NRPA** | Natural Resources Protection Act | Maine DEP law requiring permits for work within 250 ft of protected natural resources (wetlands, rivers, coastal areas) |

---

## Database & Technical

| Acronym | Full Name | Context |
|---|---|---|
| **ACS** | *(see above)* | Also used as table/column source tag |
| **CID** | Community Infrastructure Development | This repository's table prefix (`cid_*`) and project namespace |
| **FTE** | Full-Time Equivalent | Standardized employment count: one FTE = 40 hrs/week |
| **GIS** | Geographic Information System | Spatial boundary and mapping data |
| **RLS** | Row Level Security | Supabase/PostgreSQL access control layer; all `cid_*` tables use public-read RLS |
| **UUID** | Universally Unique Identifier | Primary key format used on all `cid_*` tables |

---

## Units & Measurements

| Abbreviation | Meaning | Used in |
|---|---|---|
| **ac** | acres | Physical footprint, land use |
| **gpd** | gallons per day | Water use, wastewater capacity |
| **kWh/yr** | kilowatt-hours per year | Annual electricity consumption |
| **lbs a.i.** | pounds of active ingredient | Pesticide application rate |
| **lbs N** | pounds of nitrogen | Fertilizer application rate |
| **mil rate** | mills per $1,000 assessed value | Property tax rate; 1 mill = $1 per $1,000 |
| **sq ft** | square feet | Turf area measurement in chemical application rates |

---

## Analysis Scale Abbreviations

| Abbreviation | Meaning |
|---|---|
| **Agg.** | Aggregate (community-level totals) |
| **Est.** | Estimate (as opposed to a measured or reported value; flagged via `is_estimate = true` in database) |
| **FY** | Fiscal Year |
| **YoY** | Year-over-Year (percentage change between consecutive years) |

---

*See [`docs/data-dictionary.md`](./data-dictionary.md) for field-level definitions.*  
*See [`docs/methodology.md`](./methodology.md) for data collection and validation standards.*  
*See [`shared/schema/`](../shared/schema/) for full database schema.*
