from datetime import datetime
from airflow import DAG
from airflow.operators.bash_operator import BashOperator

dag = DAG(
    "dbt_dag_basic",
    start_date=datetime(2020, 12, 23),
    description="A sample Airflow DAG to invoke dbt runs using a BashOperator",
    schedule_interval=None,
    catchup=False,
    default_args={
        "env": {
            "DBT_USER": "{{ conn.postgres.login }}",
            "DBT_ENV_SECRET_PASSWORD": "{{ conn.postgres.password }}",
            "DBT_HOST": "{{ conn.postgres.host }}",
            "DBT_SCHEMA": "{{ conn.postgres.schema }}",
            "DBT_PORT": "{{ conn.postgres.port }}",
        }
    },
)