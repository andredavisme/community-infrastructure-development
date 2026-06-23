# Community Infrastructure Development

A comparative analysis and documentation platform for community infrastructure development initiatives. This repository uses **real data and published research** to model, analyze, and document the environmental, economic, and community impacts of infrastructure development scenarios.

> ⚠️ **Disclaimer**: All development projects represented in this repository are **fictitious scenarios**. No actual development project is being proposed, permitted, or executed. Data and analysis are drawn from real-world sources and established benchmarks, and are structured so findings could be applied directly to any real development project of similar type.

## Public Presentation Site

**[Community Capacity & Infrastructure | Coastal Maine](https://andredavisme.github.io/community-infrastructure-development/community-presentation/index.html)**

A public-facing analysis site covering four fictitious development scenarios against York County community capacity. Pages:
- [Home](https://andredavisme.github.io/community-infrastructure-development/community-presentation/index.html)
- [Community Capacity](https://andredavisme.github.io/community-infrastructure-development/community-presentation/capacity.html)
- [Compare All Proposals](https://andredavisme.github.io/community-infrastructure-development/community-presentation/comparison.html)
- [Decision Framework](https://andredavisme.github.io/community-infrastructure-development/community-presentation/framework.html)

## Purpose

- Model and compare environmental impacts across multiple development types using real benchmarks
- Create a transparent, reproducible framework for community impact analysis
- Track how resource use, employment, and financial obligations compare across project types
- Produce community-ready documentation and presentations grounded in factual data

## Projects Tracked

| Project | Type | Status | Scenario Location | Started |
|---------|------|--------|-------------------|---------|
| Golf Course (Fictitious) | Recreation / Land Use | 🟡 Analysis in Progress | Coastal Maine (illustrative) | 2026 |
| Edge Data Center (Fictitious) | Technology / Energy | 🟡 Benchmarks Complete | Coastal Maine (illustrative) | 2026 |
| Enterprise Data Center (Fictitious) | Technology / Energy | 🟡 Benchmarks Complete | Coastal Maine (illustrative) | 2026 |
| Hyperscale Data Center (Fictitious) | Technology / Energy | 🟡 Benchmarks Complete | Coastal Maine (illustrative) | 2026 |

> All four scenarios are compared side-by-side at [`comparison.html`](https://andredavisme.github.io/community-infrastructure-development/community-presentation/comparison.html).

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
    ├── glossary.md                  # Acronyms, abbreviations, and units
    ├── methodology.md               # How data is collected and validated
    └── community-presentation/      # Public-facing GitHub Pages site
        ├── index.html               # Home — scenario overview
        ├── capacity.html            # Community capacity baseline
        ├── proposal.html            # Golf course proposal review
        ├── proposal-datacenter-edge.html
        ├── proposal-datacenter-enterprise.html
        ├── proposal-datacenter-hyperscale.html
        ├── comparison.html          # All proposals side-by-side
        ├── framework.html           # Decision-making framework
        └── style.css
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

- All findings cite published sources (USGA, GCSAA, EPA, BLS, USGS, Uptime Institute, Lawrence Berkeley National Lab, ISO-NE, etc.)
- Data entries reference Supabase record IDs for traceability
- Estimates are clearly distinguished from measured values (`is_estimate = true`)
- Community-facing materials use plain language and are maintained in `docs/community-presentation/`

---

*Maintained by [André Maurice Davis](https://andremauricedavis.com/) — [207 Analytix](https://207analytix.com)*
