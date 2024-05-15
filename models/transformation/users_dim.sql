WITH
base AS (SELECT * FROM {{ ref('prep__home_users') }} 
),

transformed AS (
  SELECT
    user_id,
    cookie_id AS visitor_id,
    trial_start_date,
    DATE_TRUNC(trial_start_date, WEEK(MONDAY)) AS trial_start_week,
    DATE_TRUNC(trial_start_date, MONTH) AS trial_start_month,
    CASE WHEN school_account_create_date IS NOT NULL THEN TRUE
      ELSE FALSE END AS is_school_account,
    CASE WHEN first_payment_date IS NOT NULL THEN TRUE
      ELSE FALSE END AS has_converted_to_customer,
    product_name,
    CASE WHEN product_name = 'English, Maths and Science' THEN 'Low'
          WHEN product_name = 'Exam Preparation' THEN 'Mid'
          WHEN product_name = 'Exam Preparation Plus' THEN 'High'
      ELSE 'Other' END AS user_value_tier,
      region,
      country
  FROM base
)
SELECT * FROM transformed