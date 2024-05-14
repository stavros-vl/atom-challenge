WITH 
paid_campaigns AS (
    SELECT * FROM {{ ref('visits_users_dim')}} 
    WHERE is_paid_origin = TRUE
),
campaign_performance AS (
    SELECT
     campaign_id,
     COUNT(visitor_id) AS total_visits,
     COUNT(user_id) AS total_paid_signups,
     COUNT(CASE WHEN has_converted_to_customer = TRUE THEN user_id END) AS total_paid_customers,
     ROUND(COUNT(user_id) / COUNT(visitor_id) * 100.0, 2) AS visit_to_signup_conversion_rate
    FROM paid_campaigns
    GROUP BY 1
    ORDER BY 2 DESC
)
SELECT * FROM campaign_performance