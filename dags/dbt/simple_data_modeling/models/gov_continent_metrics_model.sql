{{ config(materialized='table') }}

WITH country_data AS (
    SELECT
        governmentform,
        continent,
        code,
        surfacearea,
        population
    FROM {{ source('public', 'country') }}
),

final AS (
    SELECT
        governmentform,
        continent,
        COUNT(code) AS country_count,
        SUM(surfacearea) AS total_area,
        SUM(population) AS total_population
    FROM country_data
    GROUP BY governmentform, continent
)

SELECT *
FROM final