# AI Session Context — community-infrastructure-development

> This file exists so that AI assistants (Perplexity, Copilot, etc.) do not need to ask repeated clarifying questions about foundational project infrastructure. **Always read this file first.**

---

## Supabase Project

| Key | Value |
|-----|-------|
| **Project ID** | `hhyhulqngdkwsxhymmcd` |
| **Project Name** | (207 Analytix / CID shared backend) |
| **Region** | `us-west-2` |
| **Organization ID** | `imdfkatmviazvwtqgzbk` |
| **Postgres Version** | 17 |
| **Status** | `ACTIVE_HEALTHY` |
| **Schema prefix** | `cid_` for infrastructure tables; `civic_` for civic tracker tables |

All structured data for this repository lives in this single Supabase project. Do not spin up or query a different project without explicit instruction.

---

## GitHub Repository

| Key | Value |
|-----|-------|
| **Owner** | `andredavisme` |
| **Repo** | `community-infrastructure-development` |
| **Default branch** | `main` |
| **GitHub Pages** | `https://andredavisme.github.io/community-infrastructure-development/` |

---

## Related Repositories

| Repo | Role |
|------|------|
| [`andredavisme/maine-civic-tracker`](https://github.com/andredavisme/maine-civic-tracker) | Public display layer; reads from same Supabase project via anon key |
| [`andredavisme/civic-identity-toolkit`](https://github.com/andredavisme/civic-identity-toolkit) | Methodological foundation and documentation standards |

---

## Key Tables (Supabase)

| Table | Purpose |
|-------|---------|
| `cid_proposed_infrastructure` | Development scenario proposals (golf, data centers, etc.) |
| `cid_municipal_finance_snapshots` | Municipal finance data used for capacity comparisons |
| `civic_communities` | Geographic anchors for all civic/MDF data |
| `civic_budget_sources` | Revenue sources by community and fiscal year |
| `civic_allocations` | Spending allocations by category and project |
| `civic_outcomes` | Measurable outcomes tied to allocations |
| `civic_evidence` | Resident-submitted and field-collected evidence |
| `road_segments` | Road condition data (MaineDOT, ODOT, MassDOT) |

Full schema files are in [`shared/schema/`](shared/schema/).

---

## Conventions

- `is_estimate = true` flags modeled/estimated values vs. measured
- All entries cite published sources (USGA, EPA, BLS, USGS, Uptime Institute, etc.)
- Supabase migrations live in `shared/schema/` and are numbered sequentially (e.g., `005_cid_proposed_infrastructure.sql`)
- Community-facing HTML is in `docs/community-presentation/` and served via GitHub Pages

---

## Perplexity Space

| Key | Value |
|-----|-------|
| **Space Name** | `community-infrastructure-development` |
| **Description** | "Let's continue work on https://github.com/andredavisme/community-infrastructure-development" |
| **Prioritized Sources** | `github.com/andredavisme/civic-identity-toolkit`, `github.com/andredavisme/maine-civic-tracker` |
| **MCP Tools Active** | GitHub (andredavisme), Supabase (andredavisme's org) |

### Space Instructions for AI Assistants

- This Space is the **primary working context** for all CID development sessions.
- Always assume continuity from prior conversations — do not ask for project IDs, repo names, or Supabase credentials that are documented here.
- The GitHub repo is `andredavisme/community-infrastructure-development` on branch `main`.
- The Supabase project is **"andredavisme's Project"**, ID `hhyhulqngdkwsxhymmcd`, region `us-west-2`.
- The two prioritized source repos (`civic-identity-toolkit`, `maine-civic-tracker`) provide methodology and the public display layer respectively — consult them for standards and schema alignment.
- When in doubt about what table, schema, or repo to use, refer to this file first before asking the user.

---

*Last updated: June 24, 2026*
