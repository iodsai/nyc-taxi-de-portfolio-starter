# sql/queries/

Positive verification queries and business-question queries that show your schema *supports* the questions the business will ask.

## What goes here

- **positive_business_queries.sql** — Unit 7 deliverable. 3+ queries answering real ops questions (revenue by borough, top drivers, avg tip by rate code).
- **business_questions.sql** — Unit 6 deliverable. Business queries against the normalized taxi schema.
- **oltp_vs_olap_tip_analysis.sql** — Unit 8 deliverable. Same question against OLTP schema vs star schema — see which is simpler to write.
- Any exploratory SQL you write for interview prep or curiosity.

## Suggested question categories

Every taxi schema should be able to answer at least these:

1. **Volume** — trips per day / week / month / borough
2. **Revenue** — total revenue by pickup borough by day
3. **Distribution** — average trip distance by rate code
4. **Behavior** — average tip percentage by payment type
5. **Rankings** — top 10 pickup zones by revenue
6. **Time patterns** — trips by hour of day / weekday vs weekend
7. **Driver / vendor** — trip count by vendor, hours per driver

If your schema can't easily answer these, the design has a gap.

## Convention

Each `.sql` file starts with a comment naming the question in plain English:

```sql
-- Question: What was total revenue by pickup borough for the first week of January?
-- Business context: dispatch team wants to reallocate cabs to high-revenue boroughs
SELECT ...
```
