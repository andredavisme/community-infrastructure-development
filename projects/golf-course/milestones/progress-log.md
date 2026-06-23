# Golf Course Scenario — Progress Log

Dated record of completed work, decisions made, and next steps. Most recent entry at top.

---

## 2026-06-23

**Session:** Municipal Finance Analysis — Phases 1 & 2 complete

### Completed
- Sourced Maine Revenue Services MVR Statistical Summary Reports for 2022, 2023, and 2024
- Extracted all 29 York County municipalities for three metrics: Personal Property, Homestead Exemptions, BETE Exemptions
- Built full 3-year dataset with county totals and per-municipality breakdowns
- Derived per capita metrics (PP, Homestead, BETE per resident) using 2020 Census population base
- Committed raw data CSVs, written summaries, and Phase 3 scaffold to repo
- Created this progress log and phase tracker

### Key Findings to Date
- York County total personal property grew 16.4% (2022–2024): $587.4M → $683.9M
- BETE accounts grew 14.9%; total BETE value up 17.1%
- North Berwick carries the highest BETE per capita ($49,466) driven by Pratt & Whitney
- Hollis leads personal property per capita ($15,737) despite small population (~4,745)
- Homestead per capita is uniform across the county ($3,500–$7,000 range)
- Waterboro BETE jumped $21.5M → $45.8M in a single year (2023→2024) — flagged for follow-up
- Eliot PP tripled over 3 years ($7.5M → $23.0M) — flagged for follow-up

### Decisions Made
- Using 2020 Census as the population denominator for per capita calculations (most recent decennial; consistent across all municipalities)
- Analysis scoped to all 29 York County municipalities (full county context, not just host community)
- Phase structure confirmed: PP/HS/BETE totals → per capita → expense budget comparison → utility need → golf course fiscal model

### Next Steps
- **Phase 3:** Collect municipal expense budgets (FY2023 or FY2024) from Maine LD 1 filings / town annual reports
- **Phase 3:** Classify utility infrastructure (water, sewer, roads) per municipality
- **Phase 3:** Derive fiscal gap = per capita expenditure − per capita tax base
- Begin sourcing data for other analysis sections (water use, environmental impact, employment)

---

## 2026 — Project Initiated

**Session:** Repository setup and scenario framing

### Completed
- Created `community-infrastructure-development` repo
- Defined fictitious 18-hole, 150-acre coastal Maine golf course scenario
- Established directory structure across all analysis sections
- Wrote repo README and golf-course scenario README
- Defined analysis scales: individual, aggregate (host), aggregate (regional), fiscal, trend

---
