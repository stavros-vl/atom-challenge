WITH 
visits AS (SELECT * FROM {{ ref('marketing_site_visits') }}
),

users AS (SELECT * FROM {{ ref('users_dim') }}
),

final AS (
    SELECT
        visits.visitor_id,
        visits.campaign_id,
        visits.visit_date,
        visits.visit_week,
        visits.visit_month,
        visits.is_paid_origin,
        users.user_id,
        users.trial_start_date,
        users.has_converted_to_customer,
        users.user_value_tier,
        COALESCE(visits.region, users.region) AS region,
        COALESCE(visits.country, users.country) AS country
    FROM visits 
    LEFT JOIN users ON visits.visitor_id = users.visitor_id
)
SELECT * FROM final