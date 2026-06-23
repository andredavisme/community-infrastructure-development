-- ============================================================
-- CID Seed 003: Municipal Finance Snapshots
-- Applied: 2026-06-23
-- Sources:
--   Town of York Annual Financial Reports FY2010, FY2018, FY2019 (yorkmaine.org)
--   Kennebunk Assessor Dept (kennebunkmaine.us/125/Assessing)
--   Maine Figures / MRS 2021 per-capita sales tax analysis
--   York County 2023 Annual Report (yorkcountymaine.gov)
--   MRS Municipal Valuation Return Statistical Summary PDFs (manual extraction pending)
-- ============================================================

-- YORK (host community) — hard actuals FY2010, FY2018, FY2019; estimates FY2020, FY2023
INSERT INTO public.cid_municipal_finance_snapshots
  (community_id, data_year, fiscal_year_end, tax_revenue_total, tax_revenue_residential,
   per_capita_tax_burden, is_estimate, source, notes)
SELECT c.id, v.yr, v.fy_end::text, v.total, v.residential, v.per_cap, v.is_est, v.src, v.note
FROM public.cid_communities c
CROSS JOIN (VALUES
  (2010,'June 30',33722497,31200000,2691.0,false,
   'Town of York Annual Financial Report FY2010 (yorkmaine.org/ArchiveCenter)',
   'Tax commitment $33.7M. Mil rate 8.26. Residential est 92.5%.'),
  (2018,'June 30',50084571,46328000,3652.0,false,
   'Town of York Annual Financial Report FY2019 comparative (yorkmaine.org/Archive)',
   'FY2018 comparative year. Per capita ~ACS 13,712.'),
  (2019,'June 30',52789098,48830000,3846.0,false,
   'Town of York Annual Financial Report FY2019 (yorkmaine.org/Archive/Item/269)',
   'Taxes $52.8M = 86.54% total revenues $61M.'),
  (2020,'June 30',55400000,51245000,4036.0,true,
   'Estimated from FY2019 actuals + trend; MRS 2020 MVR PDF pending',
   'Estimate. Verify: maine.gov/revenue/taxes/property-tax/municipal-services/valuation-return-statistical-summary'),
  (2023,'June 30',68000000,62900000,4944.0,true,
   'Estimated from trend; MRS 2023 MVR PDF pending',
   'Strong valuation growth 2021-2023. Pending MRS PDF verification.')
) AS v(yr,fy_end,total,residential,per_cap,is_est,src,note)
WHERE c.name = 'York';

-- KENNEBUNK
INSERT INTO public.cid_municipal_finance_snapshots
  (community_id, data_year, fiscal_year_end, per_capita_tax_burden, is_estimate, source, notes)
SELECT c.id, v.yr, v.fy_end, v.per_cap, v.is_est, v.src, v.note
FROM public.cid_communities c
CROSS JOIN (VALUES
  (2020,'June 30',7200.0,true,'Kennebunk Assessor historical rates; ACS population denominator',
   'Estimate based on rate history.'),
  (2025,'June 30',9850.0,true,'Kennebunk Assessor: $9.85/$1,000 (2025) kennebunkmaine.us/125/Assessing',
   'Current rate; total commitment requires full MVR valuation data.')
) AS v(yr,fy_end,per_cap,is_est,src,note)
WHERE c.name = 'Kennebunk';

-- OGUNQUIT — ranked #1 per-capita tax generator in Maine (2021)
INSERT INTO public.cid_municipal_finance_snapshots
  (community_id, data_year, fiscal_year_end, per_capita_tax_burden, is_estimate, source, notes)
SELECT c.id, 2021, 'June 30', 11248.38, true,
  'Maine Figures analysis of MRS 2021 sales tax data (kylescotshank.substack.com)',
  'Ranked #1 in Maine for est. tax revenue per capita ($11,248). Year-round pop ~1,207.'
FROM public.cid_communities c WHERE c.name = 'Ogunquit';

-- YORK COUNTY — MRS disbursement (not property tax)
INSERT INTO public.cid_municipal_finance_snapshots
  (community_id, data_year, fiscal_year_end, tax_revenue_other, is_estimate, source, notes)
SELECT c.id, 2023, 'December 31', 2258852, false,
  'York County 2023 Annual Report (yorkcountymaine.gov)',
  'MRS disbursement to county: $2,258,852. Excludes town-level property taxes.'
FROM public.cid_communities c WHERE c.name = 'York County';
