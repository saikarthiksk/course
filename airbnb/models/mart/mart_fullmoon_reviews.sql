{{ config(
    materialized = 'table',
) }}

WITH fact_review AS (

    SELECT
        *
    FROM
        {{ ref('fct_reviews') }}
),
full_moon AS (
    SELECT
        *
    FROM
        {{ ref('seed_full_moon_dates') }}
)
SELECT
    f.*,
    CASE
        WHEN fm.full_moon_date IS NULL THEN 'NOT FULL MOON'
        ELSE 'FULL MOON'
    END AS is_full_moon
FROM
    fact_review f
    LEFT JOIN full_moon fm
    ON (TO_DATE(review_date) = DATEADD(DAY, 1, fm.full_moon_date))
