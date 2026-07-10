# notebooks/

Jupyter notebooks — analysis, EDA, prototyping. Filled in during **Module 2 (SQL Fluency)** and beyond.

## What will go here

- **module_2_sql_exploration.ipynb** — First SQL queries against the taxi warehouse from Module 2.
- **module_2_pandas_vs_sql.ipynb** — Same taxi analyses in pandas vs SQL, showing when each wins.
- **module_3_ingestion_prototypes.ipynb** — Testing ingestion patterns before hardening into dbt.
- Any EDA / interview-prep notebooks you write against the taxi data.

## Setup

Standard Python data-science stack:

```
python -m venv .venv
source .venv/bin/activate   # macOS/Linux
.venv\Scripts\activate      # Windows
pip install jupyter pandas psycopg2-binary sqlalchemy plotly
jupyter lab
```

## Connecting to your taxi database

From a notebook cell:

```python
import pandas as pd
from sqlalchemy import create_engine

engine = create_engine("postgresql+psycopg2://user:pass@host:5432/taxi")
df = pd.read_sql("SELECT * FROM taxi_trips LIMIT 100;", engine)
```

Never commit connection strings or `.env` files. See root `.gitignore`.
