WITH 
datasource AS (SELECT * FROM {{ source('ae_raw', 'home_users')}}
),

renamed AS (
    SELECT
     cookie_id,
     id_user AS user_id,
     school_account_create_date,
     current_year_group,
     signup_year_group,
     dt_trial_start AS trial_start_date,
     dt_first_payment AS first_payment_date,
     cancel_date,
     product_name,
     pricing_interval,
     region,
     country
    FROM datasource
)
SELECT * FROM renamed