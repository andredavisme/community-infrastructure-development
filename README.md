# Community Infrastructure Development

A comparative analysis and documentation platform for community infrastructure development initiatives. This repository tracks environmental impact, water use, community engagement, and project progress across multiple development projects — enabling data-driven comparison as ideas grow.

## Purpose

Infrastructure development affects communities in complex ways. This project exists to:

- Document and compare environmental impacts across multiple development types
- Create transparency around resource use (water, land, energy)
- Track community engagement and feedback over time
- Build an evidence base for responsible development decisions

## Projects Tracked

| Project | Type | Status | Location | Started |
|---------|------|--------|----------|---------|
| Golf Course Development | Recreation / Land Use | 🟡 Planning | York Harbor, ME | 2026 |

> Additional projects will be added as analysis expands.

## Repository Structure

```
community-infrastructure-development/
├── README.md                        # This file
├── projects/
│   └── golf-course/                 # Golf course development initiative
│       ├── README.md                # Project overview
│       ├── water-use/               # Water use data, analysis, reports
│       ├── environmental-impact/    # Pesticides, runoff, habitat, stormwater
│       ├── community-engagement/    # Meeting notes, Q&A, feedback records
│       └── milestones/              # Progress tracking and decisions log
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

All structured data is stored in **Supabase** (PostgreSQL). This repository documents schema, migrations, and analysis outputs. Raw data is accessible via the project's Supabase instance.

## Environmental Metrics Tracked

- **Water Use**: Volume, source type (potable / reclaimed / surface), zone, date
- **Chemical Use**: Pesticide and fertilizer applications, rates, and buffers
- **Stormwater & Runoff**: Events, volumes, containment measures
- **Habitat**: Acreage by type (turf, native, wetland, buffer zones)
- **Community Engagement**: Meeting attendance, issues raised, resolutions

## Contributing & Documentation Standards

- All findings are documented with sources
- Data entries reference Supabase record IDs for traceability
- Session notes and analysis updates are committed with descriptive messages
- Community-facing materials are maintained in `docs/community-presentation/`

---

*Maintained by [André Maurice Davis](https://andremauricedavis.com/) — 207 Analytix*
