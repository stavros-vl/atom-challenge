WITH base AS (
   SELECT
      region,
      COUNT(user_id) AS signups,
      ROUND(COUNT(CASE WHEN has_converted_to_customer = true THEN user_id END) / COUNT(user_id) * 100,2) AS conversion_rate
   from {{ ref ('users_dim') }}
   WHERE region IS NOT NULL
   GROUP BY 1
   HAVING signups > 50 -- keeping only the rows with more than 50 signups to facilitate analysis
),

all_signups AS (
   SELECT
    *,
    SUM(signups) OVER() AS total_signups
   FROM base
)
SELECT 
 region,
 signups,
 conversion_rate,
 ROUND(signups / total_signups * 100, 1) AS prct_of_total
FROM all_signups
ORDER BY 4 DESC