# NYC Taxi Data Engineering Portfolio

Your growing artifact for the IODS DataLearn **Data Engineering** course. Every unit from Section 2 onwards commits into this repo. By the end of Phase 1 you have a portfolio piece a hiring manager can navigate — schema design, DDL, tests, notebooks, dbt models, orchestration DAGs, streaming pipelines, and dashboards, all built on the same NYC Taxi domain.

## Why NYC Taxi

The NYC Taxi & Limousine Commission publishes millions of trip records — pickup / dropoff times, zones, distances, fares, payment types, vendors. It's the industry-standard data-engineering teaching set. The same domain appears in DE Zoomcamp, Databricks tutorials, dbt guides, and countless Kaggle notebooks. Your work here transfers directly to interviews and real jobs.

## How to use this starter

1. **Fork the template.** Click the green **Use this template** button at the top of this repo → **Create a new repository**. Name it `nyc-taxi-portfolio`, keep it **public** so recruiters can find it. (On a Chromebook or a locked-down laptop where you can't install Python/Postgres locally? Pick *Open in a codespace* on the same menu — full Linux VS Code environment in the browser, no local install needed. GitHub's free tier gives you ~120 core-hours/month.)
2. **Clone your new repo** locally: `git clone https://github.com/<your-user>/nyc-taxi-portfolio.git && cd nyc-taxi-portfolio`
3. **Read the folder READMEs.** Each subdirectory has a `README.md` explaining what belongs there and which course unit produces it.
4. **Fill it in as you progress.** Section 2 fills `dbml/`, `sql/ddl/`, `sql/seed/`, `sql/queries/`, `sql/tests/`, `docs/`. Later modules fill `notebooks/`, `dbt/`, `orchestration/`, `streaming/`, `dashboard/`.
5. **Commit small and often.** Each unit ends with a specific deliverable; commit it, tag it with the unit number in the message.

## Folder map — where does what go?

```
nyc-taxi-portfolio/
├── README.md                    ← you are here
├── LICENSE                      ← MIT — you're free to fork, remix, ship
├── .gitignore                   ← standard Python/SQL/data ignores
│
├── docs/                        ← Design notes, architecture, ADRs
│   └── README.md
│
├── dbml/                        ← dbdiagram.io source files
│   └── README.md                ← Unit 7 + Unit 8 fill this
│
├── sql/
│   ├── ddl/                     ← CREATE TABLE scripts (exported DDL)
│   │   └── README.md            ← Unit 7 fills this
│   ├── seed/                    ← Seed data scripts
│   │   ├── README.md
│   │   └── taxi_seed.sql        ← STARTER — the 30-row NYC taxi seed
│   ├── queries/                 ← Business-question queries
│   │   └── README.md            ← Every unit adds queries
│   └── tests/                   ← Negative constraint tests
│       └── README.md            ← Unit 6 + Unit 7 fill this
│
├── data/
│   └── samples/                 ← Small CSV samples (later: full TLC)
│       └── README.md
│
├── notebooks/                   ← Jupyter — Module 2+
│   └── README.md
│
├── dbt/                         ← dbt models — Module 3+
│   └── README.md
│
├── orchestration/               ← Airflow / Dagster DAGs — Module 5+
│   └── README.md
│
├── streaming/                   ← Kafka producers/consumers — Module 7+
│   └── README.md
│
└── dashboard/                   ← BI / Looker / Metabase — Module 8+
    └── README.md
```

## Course-unit → deliverable map (Phase 1, Section 2)

| Course unit | Deliverable | Path |
|---|---|---|
| Unit 5 · Relationship Types | Extended taxi model with M:N junctions (passengers + trip_bookings) | `dbml/`, `sql/ddl/`, `docs/passengers_bookings_note.md` |
| Unit 6 · Duplication | Normalize the flat taxi CSV | `sql/ddl/taxi_normalized.sql`, `sql/tests/anomaly_tests.sql`, `sql/queries/business_questions.sql`, `docs/normalization_note.md` |
| Unit 7 · dbdiagram Capstone | Full taxi OLTP schema + tests | `dbml/taxi_oltp.dbml`, `sql/ddl/taxi_oltp.sql`, `sql/seed/taxi_seed.sql`, `sql/queries/positive_business_queries.sql`, `sql/tests/negative_constraint_tests.sql`, `docs/taxi_oltp_design_note.md` |
| Unit 8 · OLTP to Star Schema | Kimball star schema + comparison | `dbml/taxi_star_schema.dbml`, `sql/ddl/taxi_star_schema.sql`, `sql/queries/oltp_vs_olap_tip_analysis.sql`, `docs/oltp_vs_olap_note.md` |

Later phases (Section 3, Module 2+) add data type layers, SQL fluency, ingestion, transformation, orchestration, streaming, warehousing, dashboards — each into its own folder above.

## Getting started right now

Assuming you already used **Use this template** on GitHub and cloned your new repo (see step 1–2 above):

```bash
# 1. In your cloned repo, open sql/seed/taxi_seed.sql in your editor.

# 2. Copy the entire contents into the DataLearn SQL Sandbox
#    (LMS sidebar → SQL Sandbox tab) and click Run.

# 3. Verify the 5 tables exist:
SELECT tablename FROM pg_tables WHERE schemaname = 'public' ORDER BY tablename;
-- Expected: payment_types, rate_codes, taxi_trips, taxi_zones, vendors

# 4. Verify the row counts:
SELECT COUNT(*) FROM taxi_trips;    -- 30
SELECT COUNT(*) FROM taxi_zones;    -- 8
SELECT COUNT(*) FROM vendors;       -- 3

# 5. Work through Section 2 Unit 5 onwards on datalearn.iods.ai,
#    committing each unit's deliverable to your portfolio repo as you go.
```

Not enrolled in DataLearn yet? Enroll at **[datalearn.iods.ai](https://datalearn.iods.ai)** — Data Engineering course is under the Courses catalog.

## Interview / portfolio README pattern

When you present this repo to an interviewer, they'll skim the top-level README first. That README should answer:

1. **What is this?** — "My NYC Taxi data-engineering portfolio built through the IODS DataLearn course."
2. **What does it show I can do?** — schema design, PostgreSQL DDL, dimensional modeling, dbt, orchestration, streaming, dashboards.
3. **What's the deepest artifact?** — link to your best design note, best query, or best pipeline.
4. **What would I add in production?** — three honest gaps you'd close with more time.

Rewrite this README with those four sections filled in when you're ready to send it to a hiring manager.

## The DataLearn AI Tutor

Whenever you're stuck, use the AI Tutor with prompts calibrated to what you're building:

- "Review this DBML as a senior engineer. Flag missing constraints, type mismatches, and design smells."
- "Given my current schema, generate 10 SQL puzzles at interview difficulty."
- "Mock-interview me on this dbt model — ask a senior interviewer's questions, don't answer them."

Portfolio-quality output beats worksheet answers. The tutor helps you get there faster.

---

**License / attribution:** This starter (the scaffold code, README, seed SQL, and folder READMEs) is provided by the Institute of Data Science (IODS) for DataLearn learners under the [MIT License](./LICENSE) — fork it, remix it, ship it as your own portfolio, no attribution required.

**One thing that is not MIT-licensed:** the DataLearn course units themselves (HTML lessons, sandboxes, labs, videos). Those live on **[datalearn.iods.ai](https://datalearn.iods.ai)** and are copyrighted course content. Please don't republish or re-host the lessons themselves. This starter repo is the scaffolding around your learning, not a mirror of the course.
