FROM apache/airflow:latest-python3.9
COPY requirements.txt .
RUN pip install -r requirements.txt