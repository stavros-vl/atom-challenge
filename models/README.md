# Models

Folder that contains all dbt models for preparing, transforming and presenting data.

## Raw data table exploration, data quality issues and assumptions

### `ad_events`

- Contains only paid ads data.
- Event type can be uniquely identified by adding a sequence number together with all the other columns only. 
- 23 unique campaigns (campaign_ids)
- Data for the last 3 quarters of 2023 (305 days). Min date: 2023-03-02, Max date: 2023-12-31
- As expected, all campaigns have more impressions than clicks, but there are 2 that stand out with better ratio of more than 30%:
    - 20185673973: 33.93% 
    - 20185673973: 31.44%
- There doesn't appear to be any seasonality in the number of campaigns active, although they are at the lowest in December 2023 with only 4

### `landing_page_view`
- Assumption is that this table captures visits on the marketing site. A visitor (cookie_id) can have multiple visits.
- Each row appears to be a visit/page view so we have 43.608.635 views. Event-style table
    -  It appears there is a data quality issue as many users have the exact same number of page views (e.g. 393). Thus the decision is to keep only the first row for each cookie_id as the first visit for each user/cookie_id.
- 2.514.491 unique users (cookie_ids)



### `home_users`