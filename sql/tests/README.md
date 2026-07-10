# sql/tests/

Negative constraint tests — inserts that should FAIL, proving your schema rejects illegal states.

## What goes here

- **negative_constraint_tests.sql** — Unit 7 capstone deliverable. 3+ negative tests hitting each constraint category (UNIQUE, FK, composite PK).
- **anomaly_tests.sql** — Unit 6 deliverable. Demonstrates that the normalized schema prevents update, insert, and delete anomalies.

## The pattern

Every negative test states:
1. What you're trying (the illegal INSERT/UPDATE/DELETE)
2. What error you expect
3. Why that error proves the constraint works

```sql
-- Test: duplicate driver licence should FAIL
INSERT INTO drivers (full_name, license_no) VALUES ('Fake Ama', 'NYC-DL-4471');
-- Expected: ERROR: duplicate key value violates unique constraint "drivers_license_no_key"
-- Proves: UNIQUE(license_no) works.
```

## Why negative tests matter for interviews

Anyone can `CREATE TABLE`. The engineers hiring managers want to hire are the ones who prove — with SQL, not with claims — that their constraints do what they say. Negative tests are that proof.

Every schema you ship should have at least three negative tests: one for each of UNIQUE, FK, and composite/business-rule constraints.
