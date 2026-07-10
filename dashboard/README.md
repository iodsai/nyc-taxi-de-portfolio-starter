# dashboard/

BI dashboards and visualizations. Filled in during **Module 8 (Data Serving & BI)**.

## What will go here

- **looker_studio_config.md** — Setup notes for a Looker Studio (formerly Data Studio) dashboard on top of your taxi warehouse.
- **metabase_export.json** — Exported Metabase dashboard definition.
- **streamlit_taxi_app.py** — A simple Streamlit app for exploratory taxi analysis.
- Screenshots of your dashboards for the portfolio README.

## Suggested dashboards

Build one or more of these. Each should answer a real business question in under 3 clicks:

1. **Ops Command Center** — Live-ish trip volume by borough, driver utilization, average wait time.
2. **Revenue Explorer** — Revenue by pickup borough, rate code, time of day, filterable by date range.
3. **Zone Deep Dive** — Pick a zone; see trip volume, revenue, top drop-off destinations, tip patterns.
4. **Driver Performance** — Trips per driver, avg tip pct, top-earning shifts.

## Portfolio angle

BI dashboards are the *visible* output of everything you built underneath. When a hiring manager opens your portfolio README, a screenshot of a clean dashboard tells them faster than any DBML that you can ship a full stack.

Recommended tools (all with free tiers):

- **Metabase** — free self-hosted, easiest to spin up
- **Looker Studio** — free, connects to BigQuery/Snowflake directly
- **Streamlit** — Python-native, good for custom interactive analysis
- **Preset** (Superset) — free tier available, more powerful

Module 8 walks through building your first shareable dashboard end-to-end.
