# sql/seed/

Seed-data scripts that load realistic sample rows into the taxi tables.

## What's here

- **taxi_seed.sql** — the 30-row NYC taxi seed. Runs against the base OLTP schema. Provided as your starting point.
- Add your own extended seeds as you build out passengers, bookings, shift_assignments, surcharges, etc.

## The 30-row taxi seed

Covers:
- **3 vendors** — CMT, VeriFone, Independent
- **8 taxi zones** — JFK, LGA, Midtown, Times Sq, East Village, etc.
- **5 rate codes** — Standard, JFK, Newark, Nassau/Westchester, Negotiated
- **5 payment types** — Credit, Cash, No charge, Dispute, Unknown
- **30 taxi trips** spanning 6 days (2026-01-05 through 2026-01-10)

Sanity check after running: `SELECT COUNT(*) FROM taxi_trips;` should return `30`.

## Level up later

| Level | Rows | When you'll need it |
|---|---|---|
| Beginner | 30 (this seed) | Section 2 |
| Intermediate | 10,000 – 100,000 (generate synthetically or sample from TLC) | Section 3 + Module 2 |
| Workplace | Full monthly TLC parquet (~2GB) | Module 3+ ingestion labs |

Download the real TLC data from [nyc.gov/tlc](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page). Later modules of the course will walk you through loading a real monthly file into your warehouse.
