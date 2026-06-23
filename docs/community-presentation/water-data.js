/**
 * water-data.js
 * Fetches live water capacity and utility log data from Supabase
 * and powers the capacity bars + monthly chart in the presentation.
 *
 * Tables used:
 *   public.cid_community_water_capacity  — KKWD rated/avg/peak capacity
 *   public.cid_utility_logs              — monthly water use by zone
 *
 * Public read is enabled via RLS policy on both tables.
 */

const SUPABASE_URL  = 'https://hhyhulqngdkwsxhymmcd.supabase.co';
const SUPABASE_ANON = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhoeWh1bHFuZ2Rrd3N4aHltbWNkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA2MTM0OTYsImV4cCI6MjA2NjE4OTQ5Nn0.xMbGQJgjFQq9Y3SDSA0cHhfQ6L2XN1t5Ct6XA6kJRCk';
const SCENARIO_ID   = '7b244e5f-7140-4de9-9959-4a8ac8924618';

async function supabaseFetch(path) {
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${path}`, {
    headers: {
      'apikey': SUPABASE_ANON,
      'Authorization': `Bearer ${SUPABASE_ANON}`,
      'Accept': 'application/json'
    }
  });
  if (!res.ok) throw new Error(`Supabase fetch failed: ${res.status} ${res.statusText}`);
  return res.json();
}

/**
 * Load KKWD water capacity for Kennebunkport.
 * Returns { rated_capacity_gpd, annual_avg_demand_gpd, peak_season_demand_gpd,
 *           peak_season_months, wastewater_capacity_gpd, wastewater_current_gpd,
 *           is_estimate, utility_name, utility_abbreviation }
 */
export async function loadWaterCapacity() {
  const rows = await supabaseFetch(
    `cid_community_water_capacity?utility_abbreviation=eq.KKWD&select=*&limit=1`
  );
  return rows[0] ?? null;
}

/**
 * Load monthly water use logs for the golf course scenario.
 * Returns array sorted by log_date with fields:
 *   { log_date, zone, amount, unit, notes }
 */
export async function loadMonthlyWaterLogs() {
  const rows = await supabaseFetch(
    `cid_utility_logs?scenario_id=eq.${SCENARIO_ID}&utility_type=eq.water&select=log_date,zone,amount,unit,notes&order=log_date.asc`
  );
  return rows;
}

/**
 * Aggregate monthly logs into per-month totals (irrigation + facility combined).
 * Returns array of { month: 'Jan', irrigation: N, facility: N, total: N } (gpd, not gal/mo)
 */
export async function loadMonthlyTotalsGPD() {
  const rows = await loadMonthlyWaterLogs();
  const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  const daysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31];

  const agg = {};
  for (const row of rows) {
    const d    = new Date(row.log_date);
    const mIdx = d.getUTCMonth();
    const mon  = months[mIdx];
    const gpd  = Number(row.amount) / daysInMonth[mIdx];
    if (!agg[mon]) agg[mon] = { month: mon, monthIdx: mIdx, irrigation: 0, facility: 0 };
    if (row.zone === 'course_irrigation') agg[mon].irrigation += gpd;
    else                                  agg[mon].facility   += gpd;
  }

  // Fill months with no irrigation data (Nov-Apr) from facility only
  for (let i = 0; i < 12; i++) {
    const mon = months[i];
    if (!agg[mon]) agg[mon] = { month: mon, monthIdx: i, irrigation: 0, facility: 18000 };
  }

  return Object.values(agg).sort((a,b) => a.monthIdx - b.monthIdx)
    .map(r => ({ ...r, total: Math.round(r.irrigation + r.facility) }));
}
