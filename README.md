# airflow-dbt-integration
Sample repository for airflow and dbt integration (built for pycon.id 2023)

## How to start
- Clone Repository
- start airflow `docker compose up`
- start sample postgres service `docker run --name myPostgresDB  -p 5455:5432 -e POSTGRES_USER=postgresUser -e POSTGRES_PASSWORD=postgresPW -e POSTGRES_DB=postgresDB -d postgres:13`
- restore sample data using psql `psql -h localhost -U postgresUser -p 5455 -d postgresDB -f world.sql`
- Create new virtualenv `virtualenv venv`
- Install DBT dependencies `pip install -r requirements.txt`
- Configure dbt profiles in `/Users/username/.dbt/profiles.yml`
- run sample model `dbt run`