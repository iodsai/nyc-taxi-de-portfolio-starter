# dbt/

dbt (data build tool) project — models, tests, sources, macros. Filled in during **Module 3 (Transformation Layer)**.

## What will go here

Standard dbt project structure:

```
dbt/
├── dbt_project.yml
├── profiles.yml (NOT committed — see .gitignore)
├── models/
│   ├── staging/
│   │   ├── stg_taxi_trips.sql
│   │   ├── stg_taxi_zones.sql
│   │   └── ...
│   ├── intermediate/
│   │   └── int_trip_enrichment.sql
│   └── marts/
│       ├── core/
│       │   ├── fct_taxi_trips.sql
│       │   └── dim_zones.sql
│       └── reporting/
│           └── daily_revenue_by_borough.sql
├── tests/
│   └── (schema tests: unique, not_null, relationships, accepted_values)
└── macros/
```

## What dbt gives you (preview)

- **Model dependency graph** — write SQL SELECTs; dbt figures out execution order
- **Data tests** — `unique`, `not_null`, `relationships`, `accepted_values` as YAML declarations
- **Incremental models** — process only new taxi trips daily, not the full history
- **Snapshots** — automated SCD Type 2 for dimensions like `dim_zone` (from Unit 8)
- **Documentation** — auto-generated docs site of your entire warehouse

## Getting ready

```bash
python -m venv .venv
source .venv/bin/activate
pip install dbt-postgres    # or dbt-snowflake / dbt-bigquery depending on warehouse
dbt init nyc_taxi           # scaffolds a new project
```

Module 3 walks through building the taxi warehouse dbt project from scratch, then adding tests and documentation.
