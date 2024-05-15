WITH 
paid_campaigns AS (
    SELECT * FROM {{ ref('visits_users_dim')}} 
    WHERE is_paid_origin = TRUE
),
campaign_performance AS (
    SELECT
     campaign_id,
     visit_month,
     country,
     region,
     user_value_tier,
     COUNT(visitor_id) AS total_visits,
     COUNT(user_id) AS total_paid_signups,
     COUNT(CASE WHEN has_converted_to_customer = TRUE THEN user_id END) AS total_paid_customers
    FROM paid_campaigns
    GROUP BY 1,2,3,4,5
    ORDER BY 2
)
SELECT * FROM campaign_performance