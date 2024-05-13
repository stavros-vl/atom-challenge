WITH
datasource AS (SELECT * FROM {{ ref('prep__ad_events') }}
),

base AS (
    SELECT
     campaign_id,
     event_date,
     COUNT(CASE WHEN event_type = 'impression' THEN campaign_id END) AS impressions_num,
     COUNT(CASE WHEN event_type = 'click' THEN campaign_id END) AS clicks_num
    FROM datasource
    GROUP BY 1, 2
)
SELECT * FROM base
