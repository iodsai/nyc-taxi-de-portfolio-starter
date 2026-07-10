# dbml/

dbdiagram.io source files. Every schema you design in DBML lives here alongside the DDL it exports to.

## What goes here

- **taxi_oltp.dbml** — Unit 7 capstone. The full 7-table taxi OLTP model (vendors, taxi_zones, rate_codes, payment_types, drivers, taxi_trips, trip_fares).
- **taxi_star_schema.dbml** — Unit 8 capstone. Same taxi data as a Kimball star schema (fact_taxi_trips + dim_* tables).
- Any working diagrams you sketched for Section 2 units 5 and 6.

## Working with DBML

1. Open [dbdiagram.io](https://dbdiagram.io) in a browser tab.
2. Paste your DBML into the left pane; the right pane renders the ER diagram live.
3. When happy, click **Export → Export to PostgreSQL** and save the `.sql` to `sql/ddl/`.
4. Screenshot the rendered diagram and drop it in `docs/` if you want a portfolio image.

## Read DBML operators aloud

- `Ref: taxi_trips.vendor_id > vendors.vendor_id` → "Many trips point to one vendor" (1:N)
- `Ref: trip_fares.trip_id - taxi_trips.trip_id` → "Each fare points to exactly one trip" (1:1)
- M:N → always a junction table with composite PK

Never hand-edit the exported DDL and expect to re-generate. DBML is source of truth; SQL is generated output.
