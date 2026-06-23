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
| **ISO-NE** | ISO New England | Regional grid operator; electricity generation and demand data for Maine |
| **MRS** | Maine Revenue Services | Property tax data; issues MVR Statistical Summary |
| **USDA** | U.S. Department of Agriculture | Soil and land classification data |
| **USGS** | U.S. Geological Survey | Water use data by county and state |

---

## Industry & Research Organizations

| Acronym | Full Name | Context |
|---|---|---|
| **ACS** | American Community Survey | U.S. Census Bureau annual survey; 1-yr and 5-yr estimates |
| **GCSAA** | Golf Course Superintendents Association of America | Golf course water, chemical, employment benchmarks |
| **LBNL** | Lawrence Berkeley National Laboratory | Data center energy use research; primary source for U.S. data center electricity benchmarks |
| **Uptime Institute** | Uptime Institute | Data center reliability and PUE benchmarking organization |
| **USGA** | United States Golf Association | Water Resource Center; irrigation benchmarks |

---

## Maine-Specific Programs & Documents

| Acronym | Full Name | Context |
|---|---|---|
| **BETE** | Business Equipment Tax Exemption | Maine property tax exemption for qualifying business equipment; foregone municipal revenue |
| **BETR** | Business Equipment Tax Reimbursement | Maine state reimbursement program for certain business equipment taxes; effectively shifts tax burden from municipality to state, reducing net local fiscal benefit |
| **KKWD** | Kennebunk, Kennebunkport and Wells Water District | Regional water utility serving York County coastal communities |
| **MVR** | Municipal Valuation Return | Annual MRS statutory filing; primary source for assessed valuation, exemptions, and mil rate data |
| **NRPA** | Natural Resources Protection Act | Maine DEP law requiring permits for work within 250 ft of protected natural resources (wetlands, rivers, coastal areas) |
| **TIF** | Tax Increment Financing | Municipal financing tool that diverts new property tax revenue from a development back to the developer for a fixed term; reduces net municipal tax benefit during TIF period |

---

## Data Center–Specific Terms

| Term / Acronym | Full Name / Definition | Context |
|---|---|---|
| **CBA** | Community Benefit Agreement | A legally binding contract between a developer and a community specifying local hiring, public access, tax contributions, or other community obligations in exchange for approvals |
| **Colocation DC** | Colocation Data Center | A facility that leases space, power, and cooling to multiple tenants rather than operating for a single owner's workloads |
| **DC** | Data Center | A facility housing computing servers, networking equipment, and cooling infrastructure to process, store, or transmit data |
| **Edge DC** | Edge Data Center | A small-footprint facility (~1–15 MW) sited close to end users to reduce network latency; lower water and land use than enterprise or hyperscale |
| **Enterprise DC** | Enterprise Data Center | A mid-scale facility (~20–100 MW) serving a single organization's workloads; significant grid and cooling demands |
| **Hyperscale DC** | Hyperscale Data Center | A large-scale cloud facility (100+ MW, often 200–500 MW+); very high water, power, and land demands; operated by major cloud providers (AWS, Azure, Google, etc.) |
| **MW** | Megawatt | Unit of electrical power; used to describe a data center's IT load capacity (e.g., a 50 MW facility) |
| **MWh** | Megawatt-hour | Unit of electrical energy; 1 MWh = 1 MW sustained for 1 hour. Annual energy use is expressed in MWh/yr |
| **PUE** | Power Usage Effectiveness | Ratio of total facility power to IT equipment power. PUE of 1.0 is perfect efficiency; industry average ~1.5; hyperscale facilities often achieve ~1.2–1.3 |
| **WUE** | Water Usage Effectiveness | Liters of water consumed per kWh of IT equipment energy. Used to compare cooling efficiency across data center types |

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
| **dB** | decibels | Noise impact measurement |
| **gpd** | gallons per day | Water use, wastewater capacity |
| **kWh/yr** | kilowatt-hours per year | Annual electricity consumption |
| **lbs a.i.** | pounds of active ingredient | Pesticide application rate |
| **lbs N** | pounds of nitrogen | Fertilizer application rate |
| **mil rate** | mills per $1,000 assessed value | Property tax rate; 1 mill = $1 per $1,000 |
| **MW** | megawatt | Data center IT load capacity |
| **MWh/yr** | megawatt-hours per year | Annual data center electricity consumption |
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
