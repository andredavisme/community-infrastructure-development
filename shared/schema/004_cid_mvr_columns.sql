-- ============================================================
-- CID Migration 004: MVR column expansions + exemption detail table
-- Applied: 2026-06-23
-- Source: Maine MRS Municipal Valuation Return Statistical Summary PDFs 2019-2024
-- Adds: full MVR fields to finance snapshots + dedicated exemption detail table
-- ============================================================

-- ----------------------------------------------------------------
-- 1. Expand cid_municipal_finance_snapshots with MVR fields
-- ----------------------------------------------------------------
ALTER TABLE public.cid_municipal_finance_snapshots
  ADD COLUMN IF NOT EXISTS certified_ratio            numeric(6,4),
  ADD COLUMN IF NOT EXISTS total_taxable_valuation    numeric(18,2),
  ADD COLUMN IF NOT EXISTS land_valuation             numeric(18,2),
  ADD COLUMN IF NOT EXISTS building_valuation         numeric(18,2),
  ADD COLUMN IF NOT EXISTS personal_property_total    numeric(18,2),
  ADD COLUMN IF NOT EXISTS tax_rate_per_thousand      numeric(8,4),
  ADD COLUMN IF NOT EXISTS tax_commitment             numeric(18,2),
  ADD COLUMN IF NOT EXISTS homestead_exemption_count  integer,
  ADD COLUMN IF NOT EXISTS homestead_exemption_value  numeric(18,2),
  ADD COLUMN IF NOT EXISTS bete_count                 integer,
  ADD COLUMN IF NOT EXISTS bete_value                 numeric(18,2),
  ADD COLUMN IF NOT EXISTS govt_us_exempt_value       numeric(18,2),
  ADD COLUMN IF NOT EXISTS govt_state_exempt_value    numeric(18,2),
  ADD COLUMN IF NOT EXISTS muni_corp_exempt_value     numeric(18,2),
  ADD COLUMN IF NOT EXISTS mvr_source_code            text,
  ADD COLUMN IF NOT EXISTS mvr_page_reference         text;

COMMENT ON COLUMN public.cid_municipal_finance_snapshots.certified_ratio IS
  'MRS certified assessment ratio (assessed value / market value). E.g. 1.00 = 100%.';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.total_taxable_valuation IS
  'Total taxable assessed valuation before exemptions, as reported on MVR Section 1.';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.land_valuation IS
  'Land component of total taxable valuation (MVR Section 1).';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.building_valuation IS
  'Building/improvement component of total taxable valuation (MVR Section 1).';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.personal_property_total IS
  'Personal property valuation total (MVR Section 2: machinery + business equipment + other).';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.tax_rate_per_thousand IS
  'Mil rate — dollars of tax per $1,000 of assessed valuation.';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.tax_commitment IS
  'Total tax commitment (levy) for the year. Equals tax_rate * total_taxable_valuation / 1000.';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.homestead_exemption_count IS
  'Number of homestead exemptions claimed. Proxy for year-round owner-occupied parcels (homeowner cohort).';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.homestead_exemption_value IS
  'Total value of homestead exemptions granted (MVR Section 2).';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.bete_count IS
  'Number of Business Equipment Tax Exemption (BETE) accounts.';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.bete_value IS
  'Total value of BETE exemptions granted (MVR Section 2).';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.govt_us_exempt_value IS
  'US government property exemption value (MVR Section 8).';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.govt_state_exempt_value IS
  'State of Maine property exemption value (MVR Section 8).';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.muni_corp_exempt_value IS
  'Municipal and corporate exemption value (MVR Section 8) — includes non-profits, churches, schools.';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.mvr_source_code IS
  'Source registry code linking to sources/source-registry.md (e.g. FIN-06-2021).';
COMMENT ON COLUMN public.cid_municipal_finance_snapshots.mvr_page_reference IS
  'PDF page/section reference for traceability (e.g. Section 1 p.14, Section 2 p.18).';

-- ----------------------------------------------------------------
-- 2. Create cid_mvr_exemption_detail — full per-community exemption breakdown
--    One row per community per year per exemption category
--    Enables cohort analysis: homeowner vs. seasonal vs. commercial
-- ----------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.cid_mvr_exemption_detail (
  id                    uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  community_id          uuid NOT NULL REFERENCES public.cid_communities(id) ON DELETE CASCADE,
  data_year             smallint NOT NULL CHECK (data_year BETWEEN 1990 AND 2100),

  -- Homestead (owner-occupied year-round residents)
  homestead_count       integer,
  homestead_value       numeric(18,2),

  -- Veterans exemptions (another owner-occupied signal)
  veterans_count        integer,
  veterans_value        numeric(18,2),

  -- BETE — Business Equipment Tax Exemption
  bete_count            integer,
  bete_value            numeric(18,2),

  -- Current use programs (land use classification)
  tree_growth_value     numeric(18,2),
  farmland_value        numeric(18,2),
  open_space_value      numeric(18,2),
  working_waterfront_value numeric(18,2),

  -- Government exemptions
  us_govt_value         numeric(18,2),
  state_maine_value     numeric(18,2),
  muni_corp_value       numeric(18,2),   -- municipalities, non-profits, churches, schools

  -- Derived cohort ratios (populated after full parcel data available)
  homestead_pct_of_residential  numeric(6,4),   -- homestead count / est residential parcels
  seasonal_vacancy_proxy        numeric(6,4),   -- 1 - (homestead_count / housing_units) where known

  -- Metadata
  is_estimate           boolean NOT NULL DEFAULT false,
  mvr_source_code       text,
  mvr_page_reference    text,
  notes                 text,
  created_at            timestamptz NOT NULL DEFAULT now(),

  UNIQUE (community_id, data_year)
);

COMMENT ON TABLE public.cid_mvr_exemption_detail IS
  'Full exemption breakdown per community per year from MRS MVR Statistical Summary PDFs.
   Homestead count is the primary cohort signal: year-round owner-occupants vs. seasonal/rental properties.
   seasonal_vacancy_proxy approximates non-resident ownership share when housing unit data is available.';

COMMENT ON COLUMN public.cid_mvr_exemption_detail.homestead_count IS
  'Number of Maine Homestead Property Tax Exemptions claimed. Each claim = one year-round owner-occupied parcel. Strong proxy for permanent resident homeowner cohort.';
COMMENT ON COLUMN public.cid_mvr_exemption_detail.homestead_pct_of_residential IS
  'Homestead claims as a share of estimated total residential parcels. Low % = high seasonal/rental share.';
COMMENT ON COLUMN public.cid_mvr_exemption_detail.seasonal_vacancy_proxy IS
  'Estimated non-resident ownership share: 1 - (homestead_count / total_housing_units). Requires ACS housing unit data join.';

-- Indexes
CREATE INDEX IF NOT EXISTS idx_cid_mvr_exemption_community_year
  ON public.cid_mvr_exemption_detail (community_id, data_year);

-- RLS
ALTER TABLE public.cid_mvr_exemption_detail ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public read" ON public.cid_mvr_exemption_detail FOR SELECT USING (true);
