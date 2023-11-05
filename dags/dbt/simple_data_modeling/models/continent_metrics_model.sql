{{ config(materialized='table') }}

WITH country_data AS (
    SELECT
        continent,
        code,
        surfacearea
    FROM {{ source('public', 'country') }}
),

final AS (
    SELECT
        continent,
        COUNT(code) AS country_count,
        SUM(surfacearea) AS total_area
    FROM country_data
    GROUP BY continent
)

SELECT *
FROM final