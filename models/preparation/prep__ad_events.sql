WITH 
datasource AS (
    SELECT 
     *,
     ROW_NUMBER() OVER(PARTITION BY campaign_id, ds, event_type ORDER BY ds) AS sequence_number
    FROM {{ source('ae_raw', 'ad_events')}}
),

renamed AS (
    SELECT
     CONCAT(campaign_id, '_', CAST(ds AS STRING), '_', event_type, '_', CAST(sequence_number AS STRING)) AS unique_row_id,
     campaign_id,
     ds AS _date,
     event_type
    FROM datasource
         
)
SELECT * FROM renamed
