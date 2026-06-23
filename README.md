# Community Infrastructure Development

A comparative analysis and documentation platform for community infrastructure development initiatives. This repository uses **real data and published research** to model, analyze, and document the environmental, economic, and community impacts of infrastructure development scenarios.

> ⚠️ **Disclaimer**: All development projects represented in this repository are **fictitious scenarios**. No actual development project is being proposed, permitted, or executed. Data and analysis are drawn from real-world sources and established benchmarks, and are structured so findings could be applied directly to any real development project of similar type.

## Purpose

- Model and compare environmental impacts across multiple development types using real benchmarks
- Create a transparent, reproducible framework for community impact analysis
- Track how resource use, employment, and financial obligations compare across project types
- Produce community-ready documentation and presentations grounded in factual data

## Projects Tracked

| Project | Type | Status | Scenario Location | Started |
|---------|------|--------|-------------------|---------|
| Golf Course (Fictitious) | Recreation / Land Use | 🟡 Analysis in Progress | Coastal Maine (illustrative) | 2026 |

> Additional fictitious project scenarios will be added as analysis expands.

## Repository Structure

```
community-infrastructure-development/
├── README.md                        # This file
├── projects/
│   └── golf-course/                 # Golf course scenario analysis
│       ├── README.md                # Scenario overview
│       ├── water-use/               # Water use data, analysis, reports
│       ├── utility-use/             # Energy, waste, and utility consumption
│       ├── physical-footprint/      # Land use, acreage, construction impact
│       ├── environmental-impact/    # Pesticides, runoff, habitat, stormwater
│       ├── employment/              # Jobs created, wages, local hiring
│       ├── community-engagement/    # Meeting notes, Q&A, feedback records
│       ├── financial-obligations/   # Taxes, fees, municipal contributions
│       └── milestones/              # Progress log and decisions
├── shared/
│   ├── schema/                      # Supabase database schema definitions
│   ├── analysis/                    # Cross-project comparative analysis
│   └── templates/                   # Reusable reporting and data templates
└── docs/
    ├── data-dictionary.md           # Definitions for all tracked metrics
    ├── methodology.md               # How data is collected and validated
    └── community-presentation/      # Public-facing materials
```

## Data Backend

All structured data is stored in **Supabase** (PostgreSQL). This repository documents schema, migrations, and analysis outputs. See [`shared/schema/`](shared/schema/) for all migration files.

## Related Projects

### [maine-civic-tracker](https://github.com/andredavisme/maine-civic-tracker)

> A public accountability tracker connecting what Maine residents pay into their civic systems with what they actually get out of them — budget sources, fund allocations, outcome tracking, community evidence, and proposed infrastructure, all in one place.

This repository is the **data and analysis layer**. `maine-civic-tracker` is the **public display layer**.

- Proposed infrastructure records (`cid_proposed_infrastructure`) are created and managed here
- `maine-civic-tracker` reads approved proposals via the Supabase anon key and renders them at [`proposals.html`](https://andredavisme.github.io/maine-civic-tracker/proposals.html)
- Community capacity benchmarks (water, utility, environmental tolerance) stored here feed the comparison view in the tracker
- Budget sources, allocations, and outcomes in `maine-civic-tracker` use the `civic_*` schema (separate) but are conceptually downstream of the same municipal finance data tracked here in `cid_municipal_finance_snapshots`

### [civic-identity-toolkit](https://github.com/andredavisme/civic-identity-toolkit)

> Documentation and tooling for structuring civic identity, community engagement records, and public accountability workflows.

- Provides the methodological foundation and documentation standards applied across both this repo and `maine-civic-tracker`
- Source citation practices, community engagement record structure, and public presentation guidelines originate here

## Environmental Metrics Tracked

- **Water Use**: Volume, source type (potable / reclaimed / surface), zone, date
- **Utility Use**: Electricity, gas, waste generation and disposal
- **Chemical Use**: Pesticide and fertilizer applications, rates, and buffers
- **Stormwater & Runoff**: Events, volumes, containment measures
- **Habitat**: Acreage by type (turf, native, wetland, buffer zones)
- **Employment**: Jobs created, wage tiers, local vs. outside hiring
- **Community Engagement**: Meeting attendance, issues raised, resolutions
- **Financial Obligations**: Taxes, fees, impact payments, community benefit agreements
- **Proposed Infrastructure**: Capacity demand vs. community utility, water, and environmental tolerance — see [`shared/schema/005_cid_proposed_infrastructure.sql`](shared/schema/005_cid_proposed_infrastructure.sql)

## Documentation Standards

- All findings cite published sources (USGA, GCSAA, EPA, BLS, USGS, etc.)
- Data entries reference Supabase record IDs for traceability
- Estimates are clearly distinguished from measured values
- Community-facing materials use plain language and are maintained in `docs/community-presentation/`

---

*Maintained by [André Maurice Davis](https://andremauricedavis.com/) — [207 Analytix](https://207analytix.com)*
