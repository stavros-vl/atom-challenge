WITH 
datasource AS (SELECT * FROM {{ source('ae_raw', 'landing_page_view')}}
),

renamed AS (
    SELECT
     CONCAT(
        cookie_id, '_', COALESCE(CAST(campaign_id AS STRING), 'NA'), '_', ds
     ) as unique_row_id,
     cookie_id,
     campaign_id,
     ds AS visit_date,
     region,
     country,
     city
    FROM datasource

)
SELECT * FROM renamed
