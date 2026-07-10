# orchestration/

Workflow orchestration — Airflow DAGs, Dagster assets, or Prefect flows. Filled in during **Module 5 (Orchestration & Reliability)**.

## What will go here

- **dags/taxi_daily_ingestion.py** — Daily pull of the TLC monthly parquet, load to warehouse, run dbt models.
- **dags/taxi_quality_checks.py** — Nightly data-quality validation using dbt tests or Great Expectations.
- **dags/taxi_reprocessing.py** — Backfill flow with idempotent retries.

## What orchestration adds

- **DAGs** — declare task dependencies as a graph, not a fragile shell script
- **Retries** — automatic retry with exponential backoff when the TLC download flakes
- **Idempotency** — running a DAG twice for the same date produces the same result
- **Backfills** — replay historical dates without touching production
- **Alerting** — Slack/email when a task fails
- **Observability** — see every task run in a UI, drill into logs

## Getting ready

```bash
# Airflow
pip install apache-airflow
airflow db init
airflow webserver -p 8080

# Dagster (alternative)
pip install dagster dagster-webserver
dagster dev
```

Module 5 walks through building your first production-grade DAG on the taxi pipeline, with proper retries, sensors, and idempotency.
