-- ============================================================
-- CID Migration 002: Seasonal population granularity
-- Applied: 2026-06-23
-- ============================================================

ALTER TABLE public.cid_population_snapshots
  ADD COLUMN IF NOT EXISTS housing_units_total integer,
  ADD COLUMN IF NOT EXISTS housing_units_occupied integer,
  ADD COLUMN IF NOT EXISTS housing_units_seasonal integer,
  ADD COLUMN IF NOT EXISTS housing_units_seasonal_pct numeric(5,2),
  ADD COLUMN IF NOT EXISTS housing_vacancy_rate_pct numeric(5,2),
  ADD COLUMN IF NOT EXISTS population_peak_seasonal integer,
  ADD COLUMN IF NOT EXISTS population_peak_multiplier numeric(4,2),
  ADD COLUMN IF NOT EXISTS peak_season_months text;

CREATE TABLE public.cid_seasonal_profiles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  community_id uuid NOT NULL REFERENCES public.cid_communities(id) ON DELETE CASCADE,
  data_year smallint NOT NULL CHECK (data_year BETWEEN 1990 AND 2100),
  season text NOT NULL CHECK (season IN ('peak','shoulder','off-peak','annual')),
  season_months text,
  population_estimate integer,
  population_source text,
  occupied_housing_units integer,
  hotel_motel_capacity integer,
  short_term_rental_units integer,
  visitor_count_estimate integer,
  economic_activity_index numeric(5,2),
  is_estimate boolean NOT NULL DEFAULT true,
  source text,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (community_id, data_year, season)
);

CREATE TABLE public.cid_seasonal_operations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scenario_id uuid NOT NULL REFERENCES public.cid_scenarios(id) ON DELETE CASCADE,
  data_year smallint,
  season text NOT NULL CHECK (season IN ('peak','shoulder','off-peak')),
  season_months text,
  operational_status text NOT NULL
    CHECK (operational_status IN ('full','reduced','minimal','closed')),
  water_use_pct_of_peak numeric(5,2),
  electricity_use_pct_of_peak numeric(5,2),
  staffing_pct_of_peak numeric(5,2),
  visitor_volume_pct_of_peak numeric(5,2),
  revenue_pct_of_annual numeric(5,2),
  is_estimate boolean NOT NULL DEFAULT true,
  source text,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (scenario_id, data_year, season)
);

CREATE INDEX ON public.cid_seasonal_profiles (community_id, data_year, season);
CREATE INDEX ON public.cid_seasonal_operations (scenario_id, season);

ALTER TABLE public.cid_seasonal_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_seasonal_operations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public read" ON public.cid_seasonal_profiles FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_seasonal_operations FOR SELECT USING (true);
