# atom-challenge

Transformation project for marketing campaigns and user-level data.

> [!TIP]
> You can find the connected Looker Studio dashboard [here](https://lookerstudio.google.com/reporting/b92bd64b-aabd-4787-8f40-fb7a600810f2).

## How to run

### Prerequisites

- Install dbt (version 1.8.0 was used for this project) on your local machine. You can find installation instructions for dbt-core [here](https://docs.getdbt.com/docs/core/installation-overview).
- Configure your Google Cloud Platform (GCP) credentials and project ID. Make sure your GCP project has access to BigQuery.

### Installation

1. Clone this repository to your local machine:

```
git clone https://github.com/stavros-vl/atom-challenge.git
```
2. Navigate to the project directory

```
cd atom-challenge
```

### Running the project
1. Configure your local `profiles.yml` file with your BigQuery connection details. You can find more information on configuring a BQ local profile [here](https://docs.getdbt.com/docs/core/connect-data-platform/bigquery-setup).

2. Run dbt to execute the transformations:

```
dbt run
```

3. Run tests

```
dbt test
```

## Project structure

Folders under the `/models` directory:
- `preparation`: Lightly clean, change data types and rename before further transformation downstream. Materialized as views by default.
- `transformation`: Perform transformations inserting business logic and creating models that can be reused and referenced for various use cases. Materialized as tables by default.
- `presentation`: models that perform grouping and aggregation with the goal to either feed into BI tools or perform ad-hoc analyses.

.
└── atom-challenge/
    ├── README.md
    ├── macros
    ├── models/
    │   ├── preparation/
    │   │   ├── _schema.yml
    │   │   ├── _sources.yml
    │   │   ├── prep__ad_events.sql
    │   │   ├── prep__home_users.sql
    │   │   └── prep__landing_page_view.sql
    │   ├── transformation/
    │   │   ├── _schema.yml
    │   │   ├── ad_campaign_stats.sql
    │   │   ├── marketing_site_visits.sql
    │   │   ├── users_dim.sql
    │   │   └── visits_users_dim.sql
    │   └── presentation/
    │       ├── _schema.yml
    │       ├── marketing_campaign_performance.sql
    │       └── marketing_campaign_regions_performance.sql
    ├── seeds
    ├── tests
    └── dbt_project.yml

### Lineage

![Screenshot 2024-05-15 at 21 23 00](https://github.com/stavros-vl/atom-challenge/assets/50328447/d5906c7a-a4e1-41e4-962a-09d25c106180)
