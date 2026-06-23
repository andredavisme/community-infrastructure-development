-- ============================================================
-- CID Migration 005: Proposed Infrastructure
-- Applied: 2026-06-23
-- Project: andredavisme's Project (Supabase: hhyhulqngdkwsxhymmcd)
--
-- Links proposed development scenarios to communities and stores
-- capacity comparison dimensions (utility, water, environmental,
-- tolerance) inline so a single query can benchmark a proposal
-- against a community's rated/current utility, water, and
-- environmental tolerance capacity.
--
-- Public display layer: maine-civic-tracker
--   https://github.com/andredavisme/maine-civic-tracker
--   proposals.html queries this table directly via Supabase anon key.
-- ============================================================

CREATE TABLE public.cid_proposed_infrastructure (
  id                              uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Scenario link (optional — proposal may predate a full scenario record)
  scenario_id                     uuid REFERENCES public.cid_scenarios(id) ON DELETE SET NULL,

  -- Host community being compared against
  community_id                    uuid NOT NULL REFERENCES public.cid_communities(id) ON DELETE CASCADE,

  -- Identity
  project_name                    text NOT NULL,
  infrastructure_type             text NOT NULL
    CHECK (infrastructure_type IN (
      'golf_course','housing_development','commercial_retail','industrial',
      'renewable_energy','road_highway','water_wastewater','school_civic',
      'recreation','mixed_use','other'
    )),
  location_label                  text,
  description                     text,
  status                          text NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending','approved','rejected')),

  -- PROPOSAL CAPACITY DIMENSIONS -----------------------------------
  -- Water
  estimated_water_use_gpd         numeric(14,2),
  water_source_type               text,   -- 'municipal','well','reclaimed','surface'
  estimated_wastewater_gpd        numeric(14,2),

  -- Land
  estimated_land_acres            numeric(10,3),
  land_use_type                   text
    CHECK (land_use_type IN ('turf','native','wetland','hardscape','building','buffer','mixed','other')),

  -- Utility / Environmental
  estimated_utility_kwh_year      numeric(14,2),
  chemical_use_yn                 boolean DEFAULT false,
  chemical_notes                  text,

  -- Economic
  estimated_jobs_created          integer,
  estimated_annual_tax_revenue    numeric(14,2),
  estimated_construction_cost     numeric(14,2),

  -- COMMUNITY CAPACITY SNAPSHOT (at time of proposal) -------------
  -- Water capacity
  community_water_capacity_gpd    numeric(14,2),   -- rated/permitted daily capacity
  community_water_current_use_gpd numeric(14,2),   -- current avg daily demand
  community_water_headroom_gpd    numeric(14,2),   -- capacity minus current use (pre-computed)

  -- Utility capacity
  community_utility_capacity_kwh_year    numeric(14,2),
  community_utility_current_use_kwh_year numeric(14,2),

  -- Environmental / tolerance
  community_tolerance_notes              text,   -- wetland adjacency, DEP status, etc.
  community_chemical_sensitivity         text,   -- 'wellhead protection zone','none','unknown'
  community_wastewater_capacity_gpd      numeric(14,2),
  community_wastewater_current_gpd       numeric(14,2),

  -- METADATA -------------------------------------------------------
  is_estimate                     boolean NOT NULL DEFAULT true,
  source_url                      text,
  source_citation                 text,
  reviewer_notes                  text,
  notes                           text,
  created_at                      timestamptz NOT NULL DEFAULT now(),
  updated_at                      timestamptz NOT NULL DEFAULT now()
);

COMMENT ON TABLE public.cid_proposed_infrastructure IS
  'Proposed infrastructure projects linked to CID communities. Stores both proposal
   capacity dimensions (water, land, utility, environmental, economic) and a snapshot
   of the host community capacity at time of submission. Enables direct comparison of
   proposal demand against community utility, environmental, and tolerance capacity.
   Public read; write requires service role.
   Public display: maine-civic-tracker proposals.html
   https://github.com/andredavisme/maine-civic-tracker';

COMMENT ON COLUMN public.cid_proposed_infrastructure.community_water_headroom_gpd IS
  'Pre-computed headroom = community_water_capacity_gpd - community_water_current_use_gpd.
   Can be re-derived on query but stored for fast display comparisons.';

COMMENT ON COLUMN public.cid_proposed_infrastructure.community_tolerance_notes IS
  'Qualitative capacity signal: wetland adjacency, DEP permit status, prior violations,
   wellhead protection zone designations, or other environmental tolerance constraints.';

COMMENT ON COLUMN public.cid_proposed_infrastructure.scenario_id IS
  'Optional link to cid_scenarios. A proposal may exist before a full scenario analysis
   record is created. When linked, the proposal can be enriched with data from
   cid_utility_logs, cid_physical_footprint, and cid_environmental_logs for that scenario.';

-- Indexes
CREATE INDEX ON public.cid_proposed_infrastructure (community_id, status);
CREATE INDEX ON public.cid_proposed_infrastructure (scenario_id) WHERE scenario_id IS NOT NULL;
CREATE INDEX ON public.cid_proposed_infrastructure (infrastructure_type, status);

-- RLS
ALTER TABLE public.cid_proposed_infrastructure ENABLE ROW LEVEL SECURITY;
CREATE POLICY "public read" ON public.cid_proposed_infrastructure FOR SELECT USING (true);
CREATE POLICY "service role write" ON public.cid_proposed_infrastructure
  FOR ALL USING (auth.role() = 'service_role');
