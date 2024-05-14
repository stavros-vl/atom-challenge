WITH
datasource AS (SELECT * FROM {{ ref('prep__landing_page_view') }}
),

base AS (
    SELECT
     *,
     ROW_NUMBER() OVER(PARTITION BY visitor_id ORDER BY visit_date) as row_num
    FROM datasource
),

final AS (
    SELECT 
     visitor_id,
     campaign_id,
     visit_date,
     DATE_TRUNC(visit_date, WEEK(MONDAY)) AS visit_week,
     DATE_TRUNC(visit_date, MONTH) AS visit_month,
     region,
     country,
     city,
     CASE WHEN campaign_id IS NOT NULL THEN TRUE
      ELSE FALSE END AS is_paid_origin
    FROM base
    WHERE row_num = 1
)

SELECT * FROM final