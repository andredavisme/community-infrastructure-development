# Data Dictionary

Definitions for all metrics tracked across development projects.

---

## Utility Use

- **utility_type**: Category of utility (water, electricity, gas, waste, stormwater)
- **source**: Origin of the utility supply (potable, reclaimed, grid, municipal, etc.)
- **volume**: Measured quantity consumed or generated
- **unit**: Unit of measurement (gallons, kWh, therms, tons, etc.)
- **zone**: Area or sector of the project where consumption occurred

## Physical Footprint

- **land_use_category**: Classification of land use (turf, native, wetland, hardscape, building, buffer)
- **acreage**: Area in acres
- **construction_phase**: Timing relative to construction (pre, during, post)

## Employment

- **job_category**: Type of employment (construction, maintenance, management, seasonal)
- **wage_tier**: Relative wage level (entry, mid, skilled, management)
- **local_hire**: Whether the position was filled by a local resident (boolean)
- **fte_equivalent**: Full-time equivalent value for part-time or seasonal roles

## Community Engagement

- **engagement_format**: Type of engagement (public meeting, open house, survey, newsletter)
- **attendance_count**: Number of community members present or reached
- **issues_raised**: Topics or concerns brought forward
- **resolution_status**: Whether issues have been addressed (open, in progress, resolved)

## Financial Obligations

- **obligation_type**: Category (property tax, impact fee, permit fee, community benefit agreement)
- **recipient**: Municipality or agency receiving the payment
- **amount**: Dollar value
- **frequency**: How often the obligation recurs
- **status**: Current state (projected, committed, paid)

---

## Community Context

### Population
- **population_total**: Total resident population (year-round)
- **population_seasonal**: Estimated seasonal/part-year population
- **median_age**: Median age of residents
- **household_count**: Number of occupied households
- **median_household_income**: Median annual household income (USD)
- **population_change_pct**: Percent change vs. prior census or estimate period

### Municipal Finance
- **tax_revenue_total**: Total municipal tax revenue (USD)
- **tax_revenue_business**: Revenue from commercial/business taxes (USD)
- **tax_revenue_residential**: Revenue from residential property taxes (USD)
- **budgeted_expenses_total**: Total approved municipal budget expenditures (USD)
- **expense_category**: Functional spending category (public safety, education, infrastructure, admin, etc.)
- **per_capita_tax_burden**: Total tax revenue divided by population (USD/person)
- **per_capita_expenditure**: Total budgeted expenses divided by population (USD/person)

### Community Role
- **community_role**: Relationship to the development scenario (host, nearby, regional)
- **proximity_miles**: Distance from development site in miles (for nearby/regional communities)

---

## Historical Trend Data

- **data_year**: The year the data point represents (2000–2025)
- **metric_category**: High-level grouping (population, municipal-finance, employment, utility, environmental)
- **metric_name**: Specific metric being recorded (matches definitions above)
- **value**: Numeric value for the data point
- **unit**: Unit of measurement
- **source**: Published source or agency for the data point
- **is_estimate**: Boolean — true if value is estimated rather than directly measured/reported
