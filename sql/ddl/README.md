# sql/ddl/

`CREATE TABLE` scripts — either exported from dbdiagram.io or hand-authored.

## What goes here

- **taxi_oltp.sql** — Unit 7 export. The 7-table taxi OLTP schema DDL.
- **taxi_star_schema.sql** — Unit 8 export. The star-schema DDL (fact + dimensions).
- **taxi_normalized.sql** — Unit 6 output. Normalized from the flat taxi CSV.
- **passengers_bookings.sql** — Unit 5 mini project extension.

## Convention

Every DDL file should start with a reset block in reverse dependency order:

```sql
DROP TABLE IF EXISTS child_table_2  CASCADE;
DROP TABLE IF EXISTS child_table_1  CASCADE;
DROP TABLE IF EXISTS parent_table   CASCADE;
```

so you can re-run cleanly during iteration.

## Running in the DataLearn SQL Sandbox

1. Open the SQL Sandbox tab in the DataLearn LMS.
2. Paste the DDL. Execute.
3. Verify tables exist: `SELECT tablename FROM pg_tables WHERE schemaname = 'public' ORDER BY tablename;`
4. Load seed from `sql/seed/taxi_seed.sql`.
5. Run positive queries from `sql/queries/` and negative tests from `sql/tests/`.
