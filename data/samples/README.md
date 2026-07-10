# data/samples/

Sample data files. Not committed for anything large — see `.gitignore` at repo root.

## Levels of taxi data

| Level | Rows | Format | Where |
|---|---|---|---|
| Beginner | 30 | SQL INSERTs | `sql/seed/taxi_seed.sql` (already loaded via SQL Sandbox) |
| Intermediate | 10k – 100k | CSV | Generate synthetically; keep sampled versions here (max ~5MB per file) |
| Workplace | Full monthly parquet | Parquet | Download from TLC when needed; **NEVER commit** — see `.gitignore` |

## The real NYC TLC dataset

**Source:** [nyc.gov/site/tlc/about/tlc-trip-record-data.page](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

The TLC publishes monthly parquet files (~100MB each) covering all yellow taxi, green taxi, and for-hire vehicle (FHV) trips. Each row is one completed trip with pickup/dropoff timestamps + zones, distance, fare, tip, tolls, MTA tax, congestion surcharge, and payment type.

**Never commit the raw parquet files to git.** Use them locally, load them into your warehouse in Module 3+, and reference the download URL in your design notes.

## Small samples that CAN be committed

If you need a CSV committed for demo purposes (e.g. showing a bad flat feed for Unit 6), keep it under ~1MB and rename it to include `_small.csv` so `.gitignore` doesn't skip it. Example: `taxi_flat_small.csv`.
