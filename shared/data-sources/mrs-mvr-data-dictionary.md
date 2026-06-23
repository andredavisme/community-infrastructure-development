# MRS MVR Data Points — Detailed Description, Importance, Source Credibility & Downstream Dependencies

**Project:** Community Infrastructure Development — Golf Course Scenario (Fictitious)
**Repository:** https://github.com/andredavisme/community-infrastructure-development
**Source Series:** Maine Revenue Services (MRS) Municipal Valuation Return (MVR) Statistical Summary Reports
**Years Covered:** 2019–2024
**Municipalities:** Kennebunk, Kennebunkport, Kittery, Ogunquit, Wells, York (York County, ME)
**Last Updated:** June 23, 2026

> 📄 This is the **canonical file**. The version at [`docs/data-dictionary.md`](../../docs/data-dictionary.md) contains the general project data dictionary; this file is the MRS MVR-specific detailed reference. Both cross-link to each other.

---

## 1. Source Overview & Credibility

| Attribute | Detail |
|---|---|
| **Publisher** | Maine Revenue Services (MRS), Property Tax Division |
| **Program** | Municipal Valuation Return (MVR) — annual statutory filing |
| **Legal Authority** | 36 M.R.S.A. §§ 305, 643, 644 — municipalities are required by law to file |
| **Publication Lag** | Typically 10–14 months after tax commitment year |
| **Format** | Official PDF statistical summary; no paywall; publicly accessible |
| **Revision Policy** | Published values are final; rare corrections noted in subsequent editions |
| **Credibility Rating** | ★★★★★ — Primary government source, statutory filing, no intermediary |

The MVR is Maine's most authoritative source for municipal property tax data. Because filing is legally required and values feed into state municipal revenue sharing and education funding formulas, municipalities have strong institutional incentives for accuracy. This is not a survey or estimate — it is the official administrative record of each municipality's tax commitment.

---

## 2. Section 1 Data Points

### 2.1 Certified Ratio (%)

**What it is:**
The ratio of a municipality's total assessed value to its estimated full market value, as determined by the MRS Property Tax Division using sales ratio studies (comparing actual sale prices to assessed values for arm's-length transactions).

**Range in dataset:** 74% (Kennebunk 2024) to 100% (multiple municipalities, multiple years)

**Why it matters:**
- A certified ratio below 100% means the municipality is assessing property below market value — a common and legal practice in Maine
- It is the essential deflator/inflator for converting assessed valuation to implied market valuation
- Maine law requires municipalities to maintain a certified ratio of at least 70% to be eligible for full state aid (revenue sharing, school subsidy). Ratios below 70% trigger state penalties
- **Trend signal:** A declining certified ratio over consecutive years signals that assessed values are falling further behind a rising real estate market — a leading indicator that a revaluation is imminent

**Downstream dependency:**
- **Implied Market Valuation** = Total Municipal Valuation ÷ (Certified Ratio / 100)
- Per-capita market wealth calculations
- Comparison of real property wealth across municipalities on a consistent basis
- Assessment equity analysis (are Kennebunk property owners paying on more or less of true value than York residents?)

---

### 2.2 Tax Commitment ($)

**What it is:**
The total dollar amount of property taxes committed (assessed and billed) to all taxable property owners in the municipality for the tax year. This is the municipality's total property tax levy.

**Range in dataset:** $11.7M (Ogunquit 2019) to $64.5M (York 2024)

**Why it matters:**
- This is the direct measure of the property tax burden placed on the community in a given year
- It is the numerator of the effective tax rate calculation
- Paired with population, it yields per-capita tax burden — a key metric for comparing fiscal pressure across communities
- Growth in commitment reflects either rising valuations, rising spending (approved appropriations), or both
- For a new development scenario, the question is: how much does the development expand or contract the commitment on existing residents?

**Downstream dependency:**
- Per-capita tax commitment = Commitment ÷ Population
- Municipal fiscal capacity analysis
- Scenario modeling: a new development adds taxable valuation → commitment redistributed → existing taxpayer share changes
- Budget sufficiency analysis: does the commitment cover budgeted expenses?

---

### 2.3 Tax Rate (mills / per $1,000 assessed value)

**What it is:**
The municipal tax rate, expressed as dollars per $1,000 of assessed value (mills). Calculated as: Tax Commitment ÷ Total Municipal Valuation × 1,000.

**Range in dataset:** 5.96 mills (Wells 2023) to 17.40 mills (Kittery 2019)

**Why it matters:**
- The tax rate is the direct cost signal faced by property owners and prospective developers
- A low mill rate with high valuations reflects a wealthy, asset-rich community with manageable per-dollar fiscal demands
- A high mill rate against a low certified ratio means assessed values are lagging market, making the rate artificially high relative to true market burden
- Mill rate trends are the most politically visible metric — municipal budgets are often debated in terms of mill rate impact
- For a development scenario, the key question is: does this development reduce the mill rate for existing residents by expanding the tax base?

**Downstream dependency:**
- Annual tax bill = Assessed Value × Tax Rate
- Effective tax rate on market value = Tax Rate × (Certified Ratio / 100)
- Development impact model: new development assessed value × tax rate = new annual tax revenue
- Sensitivity analysis: how many dollars of new development are needed to offset a 0.5 mill rate reduction?

---

### 2.4 Total Municipal Valuation ($)

**What it is:**
The total assessed value of all taxable real and personal property within the municipality, as reported on the MVR. This is the denominator used to calculate the tax rate.

**Range in dataset:** $1.46B (Ogunquit 2019) to $7.68B (York 2024)

**Why it matters:**
- This is the tax base — the foundation of municipal fiscal capacity
- Growth in this figure (without equivalent growth in commitment) produces mill rate reductions, directly benefiting existing taxpayers
- Paired with the certified ratio, it allows reconstruction of estimated full market value of all real property
- For coastal Maine communities, this figure has grown dramatically (40–100%) from 2019 to 2024, driven by the post-pandemic real estate boom, making historical trend analysis essential
- A new development adds to this figure — the scale of the addition relative to the existing base determines the fiscal impact

**Note on composition:** Section 1 total valuation includes both real property (land + buildings) and personal property (business equipment). Section 2 data (separately captured) separates these and adds exemption data, enabling cohort-level analysis.

**Downstream dependency:**
- Implied market valuation = Total Valuation ÷ Certified Ratio
- Mill rate calculation
- Development impact: new project valuation as % of existing tax base = fiscal materiality
- Equity analysis: per-capita valuation → community wealth benchmarking

---

## 3. Section 2 Data Points (Exemptions)

### 3.1 Total Personal Property Valuation ($)

**What it is:**
The assessed value of business personal property (machinery, equipment, furniture, inventory subject to tax) within the municipality.

**Why it matters:**
- Separating personal property from real property gives a cleaner picture of residential vs. commercial/industrial fiscal contribution
- In resort communities (Ogunquit, Kennebunkport), personal property is modest relative to real estate — confirming that the tax base is overwhelmingly residential/hospitality-driven
- A golf course would add significant personal property (equipment, vehicles, furnishings) — this line is the benchmark

**Downstream dependency:**
- Real property valuation = Total Valuation − Personal Property
- Commercial tax base share analysis
- Development personal property contribution estimate

---

### 3.2 Homestead Exemption Count & Value ($)

**What it is:**
The number of Maine Resident Homestead Exemptions claimed, and their aggregate value. Each primary Maine resident homeowner receives an exemption on the first $25,000 of assessed value.

**Why it matters:**
- **Homestead count is a direct proxy for owner-occupied primary residences** — the most reliable way to distinguish homeowner vs. renter cohorts from property tax data alone
- High homestead counts relative to total parcels → owner-occupied community
- Low homestead counts → high seasonal/non-resident ownership or rental-dominated housing stock
- This distinction is critical for understanding who bears the municipal tax burden and how a new development affects existing residents vs. absentee owners

**Downstream dependency:**
- Homeowner cohort size estimation
- Seasonal residency ratio = (Total Housing Units − Homestead Count) ÷ Total Housing Units
- Per-homeowner vs. per-renter tax burden allocation
- Community impact equity analysis

---

### 3.3 BETE (Business Equipment Tax Exemption) Count & Value ($)

**What it is:**
The number of businesses receiving the Maine Business Equipment Tax Exemption and the aggregate value of exempted equipment.

**Why it matters:**
- BETE represents property that is on the books but deliberately removed from the tax roll as a state economic development incentive
- High BETE values indicate industrial/manufacturing presence; resort communities show very low BETE
- This is foregone tax revenue — understanding it is necessary for accurate fiscal modeling
- A golf course would likely qualify for some BETE on equipment — this establishes the baseline for what peer communities already forgo

**Downstream dependency:**
- True effective tax base = Total Valuation + BETE value (gross capacity vs. net commitment)
- Foregone revenue calculation
- Development BETE eligibility scenario modeling

---

## 4. Cross-Cutting Analytical Dependencies

```
MRS MVR Data
│
├── Certified Ratio ──────────────────────────────────────────────►  Implied Market Valuation
│                                                                       │
├── Tax Commitment + Population ───────────────────────────────────►  Per-Capita Tax Burden
│                                                                       │
├── Tax Rate + New Development Valuation ──────────────────────────►  New Annual Tax Revenue
│                                                                       │
├── Total Valuation + Homestead Count + BETE ──────────────────────►  Tax Base Composition
│         │                                                             │
│         └── Section 2 Exemption Data ────────────────────────────►  Cohort Analysis
│                                                                       │
└── Historical Trend (2019–2024) ─────────────────────────────────►  25-Year Projection Model
                                                                        │
                                                                        ▼
                                                          Golf Course Fiscal Impact Model
                                                          ├── Does it reduce the mill rate?
                                                          ├── By how much per household?
                                                          ├── How does it compare to existing BETE/exemptions?
                                                          └── Is the community owner- or renter-bearing?
```

---

## 5. Known Limitations

| Limitation | Impact | Mitigation |
|---|---|---|
| Publication lag (10–14 months) | 2024 data reflects FY2024 commitment, not 2026 market | Use certified ratio trends to project forward |
| Certified ratio is point-in-time | Between revaluations, divergence from market grows | Monitor ratio trend; flag municipalities with ratio < 80% |
| Total valuation includes personal property | Slightly overstates real estate base in industrial towns | Subtract personal property (Section 2) for pure real estate analysis |
| Homestead count ≠ exact owner count | Some owners claim exemptions in other jurisdictions | Cross-reference with Census owner-occupancy rates |
| No parcel-level data | Cannot identify individual high-value properties distorting averages | Use Section 3 (land use classification) when available |
| 2022 Section 2 not yet extracted | 2022 exemption rows pending in Supabase | Target 2022-statistical-summary.pdf Section 2 York County pages |

---

*Document version: 1.0 — generated June 23, 2026*
*Source files: 2019–2024 MRS MVR Statistical Summary PDFs (Maine Revenue Services, Property Tax Division)*
