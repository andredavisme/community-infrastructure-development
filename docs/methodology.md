# Methodology

How data is collected, validated, and documented across projects.

> 📖 **Acronyms & Abbreviations:** See [`docs/glossary.md`](./glossary.md) for definitions of all acronyms, abbreviations, and units used in this repo.

## Principles

1. **Source citation**: All data entries reference an original source (permit, report, invoice, meeting minutes, Census, municipal budget, or direct measurement).
2. **Supabase traceability**: Every record in the database is referenced by ID in corresponding documentation.
3. **Version control**: Schema changes, analysis updates, and milestone events are committed with descriptive messages.
4. **Comparative consistency**: All projects use the same templates and metrics taxonomy to enable cross-project comparison.
5. **Estimates flagged**: All estimated values are clearly distinguished from measured or reported values via the `is_estimate` boolean on every table.
6. **Multi-scale analysis**: Every impact dimension is examined at individual, aggregate (community), and fiscal scales.

## Scenario Coverage

This repository currently models four fictitious development scenarios against coastal Maine (York County) community capacity:

| Scenario | Type | Scale | Primary Benchmarks |
|---|---|---|---|
| Golf Course | Recreation / Land Use | 150 ac, 18-hole | USGA, GCSAA, EPA WaterSense |
| Edge Data Center | Technology / Energy | ~5 MW IT load | LBNL, Uptime Institute, ISO-NE |
| Enterprise Data Center | Technology / Energy | ~50 MW IT load | LBNL, Uptime Institute, ISO-NE |
| Hyperscale Data Center | Technology / Energy | ~200+ MW IT load | LBNL, Uptime Institute, ISO-NE |

All four scenarios are compared side-by-side at [`docs/community-presentation/comparison.html`](../docs/community-presentation/comparison.html).

## Benchmark Sources by Scenario Type

### Golf Course
- **GCSAA Environmental Stewardship Report 2022** — water use, chemical application rates, employment
- **USGA Water Resource Center / TERO** — irrigation benchmarks, seasonal demand profiles
- **EPA WaterSense** — water efficiency standards and comparisons
- **Maine DEP / NRPA** — shoreland zoning, wetland permit requirements
- **Maine Board of Pesticides Control** — chemical setback and wellhead protection zone rules

### Data Centers (Edge, Enterprise, Hyperscale)
- **Lawrence Berkeley National Laboratory (LBNL)** — U.S. data center electricity use reports; primary source for MW-to-MWh/yr conversion factors and PUE benchmarks
- **Uptime Institute Annual Global Data Center Survey** — PUE trends, water usage effectiveness (WUE), staffing benchmarks
- **ISO New England (ISO-NE)** — Maine grid capacity context; annual energy consumption baselines
- **EPA ENERGY STAR for Data Centers** — efficiency standards and comparison benchmarks
- **BLS Occupational Employment and Wage Statistics (OEWS)** — wage tiers for data center operations roles

## Historical Data Collection (25-Year Window)

Where available, community context data is gathered for **2000–2025** to:
- Establish pre-development baseline conditions
- Identify long-term population and fiscal trends
- Account for economic cycles affecting municipal revenue and spending
- Provide comparison points for development impact modeling

**Primary sources for historical data:**
- U.S. Census Bureau (Decennial Census: 2000, 2010, 2020; American Community Survey (ACS) 1- and 5-year estimates)
- Maine Revenue Services (MRS) annual Municipal Valuation Return (MVR) Statistical Summary Reports (2019–2024)
- Maine State Planning Office population estimates
- U.S. Bureau of Labor Statistics (BLS) Quarterly Census of Employment and Wages (QCEW)
- U.S. Environmental Protection Agency (EPA) Environmental Justice Screening Tool (EJScreen) historical layers
- U.S. Geological Survey (USGS) water use data by county and state

## Data Collection Methods

- Utility invoices and meter readings
- Municipal permit and impact fee schedules
- Employment records and payroll summaries
- Community meeting attendance sheets and recorded Q&A
- Environmental monitoring reports and agency filings
- Site surveys and Geographic Information System (GIS) boundary data
- Census and American Community Survey (ACS) downloads
- Maine municipal comprehensive plans and annual reports
- Maine Revenue Services MVR Statistical Summary Reports (2019, 2020, 2021, 2022, 2023, 2024)

## Validation

- Cross-reference reported data against permit applications and agency records where available
- Flag estimates vs. measured values in all entries (`is_estimate = true`)
- Review analysis outputs against published benchmarks (USGA, GCSAA, EPA, BLS, Census, LBNL, Uptime Institute, ISO-NE)
- For fiscal data: verify against official municipal budget documents and MRS MVR Statistical Summary Reports where accessible
