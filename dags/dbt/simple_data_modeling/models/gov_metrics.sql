{{ config(materialized='table') }}

WITH country_data AS (
    SELECT
        governmentform,
        continent,
        country_count,
        total_area,
        total_population
    FROM {{ ref('gov_continent_metrics_model') }}
),

final AS (
    SELECT
        governmentform,
        COUNT(DISTINCT continent) AS ctd_continent,
        SUM(total_population) AS total_population
    FROM country_data
    GROUP BY governmentform
)

SELECT *
FROM final