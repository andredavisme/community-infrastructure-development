-- ============================================================
-- CID: Community Infrastructure Development
-- Migration 001: Core tables
-- Applied: 2026-06-23
-- Project: andredavisme's Project (Supabase: hhyhulqngdkwsxhymmcd)
-- ============================================================

-- Development scenario registry
CREATE TABLE public.cid_scenarios (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug text UNIQUE NOT NULL,
  name text NOT NULL,
  description text,
  development_type text NOT NULL,
  is_fictitious boolean NOT NULL DEFAULT true,
  scenario_acreage numeric(10,2),
  scenario_location_description text,
  status text NOT NULL DEFAULT 'planning'
    CHECK (status IN ('planning','analysis','complete','archived')),
  started_date date,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Community registry (host + nearby + regional)
CREATE TABLE public.cid_communities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  state_code char(2) NOT NULL,
  county text,
  fips_code text,
  community_type text NOT NULL DEFAULT 'municipal'
    CHECK (community_type IN ('municipal','county','regional')),
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Link communities to scenarios with a role
CREATE TABLE public.cid_scenario_communities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scenario_id uuid NOT NULL REFERENCES public.cid_scenarios(id) ON DELETE CASCADE,
  community_id uuid NOT NULL REFERENCES public.cid_communities(id) ON DELETE CASCADE,
  role text NOT NULL CHECK (role IN ('host','nearby','regional')),
  proximity_miles numeric(6,2),
  UNIQUE (scenario_id, community_id)
);

-- Population snapshots (one row per community per year)
CREATE TABLE public.cid_population_snapshots (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  community_id uuid NOT NULL REFERENCES public.cid_communities(id) ON DELETE CASCADE,
  data_year smallint NOT NULL CHECK (data_year BETWEEN 1990 AND 2100),
  population_total integer,
  population_seasonal integer,
  household_count integer,
  median_age numeric(4,1),
  median_household_income numeric(12,2),
  population_change_pct numeric(6,2),
  is_estimate boolean NOT NULL DEFAULT false,
  source text,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (community_id, data_year)
);

-- Municipal finance snapshots (one row per community per year)
CREATE TABLE public.cid_municipal_finance_snapshots (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  community_id uuid NOT NULL REFERENCES public.cid_communities(id) ON DELETE CASCADE,
  data_year smallint NOT NULL CHECK (data_year BETWEEN 1990 AND 2100),
  fiscal_year_end text,
  tax_revenue_total numeric(15,2),
  tax_revenue_business numeric(15,2),
  tax_revenue_residential numeric(15,2),
  tax_revenue_other numeric(15,2),
  budgeted_expenses_total numeric(15,2),
  per_capita_tax_burden numeric(10,2),
  per_capita_expenditure numeric(10,2),
  is_estimate boolean NOT NULL DEFAULT false,
  source text,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (community_id, data_year)
);

-- Municipal expense breakdown (many per finance snapshot)
CREATE TABLE public.cid_expense_categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  finance_snapshot_id uuid NOT NULL REFERENCES public.cid_municipal_finance_snapshots(id) ON DELETE CASCADE,
  category text NOT NULL,
  amount numeric(15,2) NOT NULL,
  pct_of_total numeric(5,2),
  notes text
);

-- Utility use logs
CREATE TABLE public.cid_utility_logs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scenario_id uuid NOT NULL REFERENCES public.cid_scenarios(id) ON DELETE CASCADE,
  log_date date NOT NULL,
  utility_type text NOT NULL
    CHECK (utility_type IN ('water','electricity','gas','waste','stormwater','other')),
  source text,
  amount numeric(14,4) NOT NULL,
  unit text NOT NULL,
  zone text,
  phase text CHECK (phase IN ('pre-construction','construction','operations','decommission')),
  is_estimate boolean NOT NULL DEFAULT false,
  source_citation text,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Physical footprint
CREATE TABLE public.cid_physical_footprint (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scenario_id uuid NOT NULL REFERENCES public.cid_scenarios(id) ON DELETE CASCADE,
  survey_date date,
  land_use_category text NOT NULL
    CHECK (land_use_category IN ('turf','native','wetland','hardscape','building','buffer','parking','other')),
  acreage numeric(10,3) NOT NULL,
  construction_phase text CHECK (construction_phase IN ('pre','during','post')),
  gps_boundary_reference text,
  is_estimate boolean NOT NULL DEFAULT false,
  source_citation text,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Environmental impact logs
CREATE TABLE public.cid_environmental_logs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scenario_id uuid NOT NULL REFERENCES public.cid_scenarios(id) ON DELETE CASCADE,
  log_date date NOT NULL,
  impact_category text NOT NULL
    CHECK (impact_category IN ('pesticide','fertilizer','runoff','habitat','stormwater','erosion','other')),
  description text NOT NULL,
  amount numeric(14,4),
  unit text,
  mitigation_measure text,
  is_estimate boolean NOT NULL DEFAULT false,
  source_citation text,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Employment records
CREATE TABLE public.cid_employment_records (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scenario_id uuid NOT NULL REFERENCES public.cid_scenarios(id) ON DELETE CASCADE,
  report_period_start date NOT NULL,
  report_period_end date NOT NULL,
  job_category text NOT NULL
    CHECK (job_category IN ('construction','maintenance','management','food-beverage','retail','seasonal','administrative','other')),
  position_title text,
  job_count integer NOT NULL DEFAULT 0,
  employment_type text CHECK (employment_type IN ('full-time','part-time','seasonal','contract')),
  wage_tier text CHECK (wage_tier IN ('entry','mid','skilled','management')),
  annual_wage_estimate numeric(10,2),
  local_hire boolean,
  fte_equivalent numeric(6,2),
  is_estimate boolean NOT NULL DEFAULT false,
  source_citation text,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Community engagement
CREATE TABLE public.cid_community_engagement (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scenario_id uuid NOT NULL REFERENCES public.cid_scenarios(id) ON DELETE CASCADE,
  engagement_date date NOT NULL,
  format text NOT NULL
    CHECK (format IN ('public-meeting','open-house','survey','newsletter','online','other')),
  attendance_count integer,
  issues_raised text[],
  commitments_made text[],
  follow_up_required boolean DEFAULT false,
  resolution_status text DEFAULT 'open'
    CHECK (resolution_status IN ('open','in-progress','resolved')),
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Financial obligations
CREATE TABLE public.cid_financial_obligations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  scenario_id uuid NOT NULL REFERENCES public.cid_scenarios(id) ON DELETE CASCADE,
  community_id uuid REFERENCES public.cid_communities(id),
  obligation_date date,
  obligation_type text NOT NULL
    CHECK (obligation_type IN ('property-tax','impact-fee','permit-fee','community-benefit','water-rights-fee','other')),
  recipient_name text,
  amount numeric(14,2) NOT NULL,
  frequency text NOT NULL
    CHECK (frequency IN ('one-time','annual','monthly','quarterly','other')),
  status text NOT NULL DEFAULT 'projected'
    CHECK (status IN ('projected','committed','paid')),
  is_estimate boolean NOT NULL DEFAULT false,
  source_citation text,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Historical trend data (generic time series)
CREATE TABLE public.cid_historical_trends (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  community_id uuid REFERENCES public.cid_communities(id),
  scenario_id uuid REFERENCES public.cid_scenarios(id),
  data_year smallint NOT NULL CHECK (data_year BETWEEN 1990 AND 2100),
  metric_category text NOT NULL
    CHECK (metric_category IN ('population','municipal-finance','employment','utility','environmental','economic')),
  metric_name text NOT NULL,
  value numeric(18,4) NOT NULL,
  unit text,
  is_estimate boolean NOT NULL DEFAULT false,
  source text,
  notes text,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- Indexes
CREATE INDEX ON public.cid_population_snapshots (community_id, data_year);
CREATE INDEX ON public.cid_municipal_finance_snapshots (community_id, data_year);
CREATE INDEX ON public.cid_utility_logs (scenario_id, log_date, utility_type);
CREATE INDEX ON public.cid_physical_footprint (scenario_id, land_use_category);
CREATE INDEX ON public.cid_environmental_logs (scenario_id, log_date, impact_category);
CREATE INDEX ON public.cid_employment_records (scenario_id, job_category);
CREATE INDEX ON public.cid_financial_obligations (scenario_id, obligation_type, status);
CREATE INDEX ON public.cid_historical_trends (community_id, data_year, metric_category);
CREATE INDEX ON public.cid_historical_trends (scenario_id, data_year, metric_category);

-- RLS: enabled on all tables, public read
ALTER TABLE public.cid_scenarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_communities ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_scenario_communities ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_population_snapshots ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_municipal_finance_snapshots ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_expense_categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_utility_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_physical_footprint ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_environmental_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_employment_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_community_engagement ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_financial_obligations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cid_historical_trends ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public read" ON public.cid_scenarios FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_communities FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_scenario_communities FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_population_snapshots FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_municipal_finance_snapshots FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_expense_categories FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_utility_logs FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_physical_footprint FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_environmental_logs FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_employment_records FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_community_engagement FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_financial_obligations FOR SELECT USING (true);
CREATE POLICY "public read" ON public.cid_historical_trends FOR SELECT USING (true);
