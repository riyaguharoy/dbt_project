# 🧱 dbt Project - Jaffle Shop

A [dbt (data build tool)](https://www.getdbt.com/) project for transforming and modeling data using SQL, built on dbt Labs' classic **Jaffle Shop** tutorial dataset. This repo follows the standard dbt project structure and is set up as a foundation for building out data models, tests, and documentation.

---

## What is dbt?

dbt lets analytics engineers transform data in the warehouse by writing SQL `SELECT` statements - dbt handles turning those into tables/views, managing dependencies between them, testing data quality, and generating documentation.

## Project structure

```
.
├── models/          # SQL models - the core transformation logic
├── seeds/           # Static CSV data loaded into the warehouse
├── snapshots/        # Type-2 slowly changing dimension snapshots
├── macros/          # Reusable Jinja/SQL macros
├── analyses/        # Ad-hoc analytical queries (not materialized)
├── tests/           # Custom data tests
├── dbt_project.yml   # Project configuration
└── .gitignore
```

## Prerequisites

- [dbt Core](https://docs.getdbt.com/docs/core/installation) installed (`pip install dbt-core dbt-<your-adapter>`, e.g. `dbt-snowflake`, `dbt-postgres`, `dbt-bigquery`)
- A configured `profiles.yml` with your data warehouse connection details (this file lives outside the repo, typically at `~/.dbt/profiles.yml`, and is **not** committed for security reasons)
- Access to a data warehouse (Snowflake, BigQuery, Postgres, etc.)

## Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/riyaguharoy/dbt_project.git
   cd dbt_project
   ```

2. Install dbt with the adapter for your warehouse:
   ```bash
   pip install dbt-core dbt-snowflake   # swap adapter as needed
   ```

3. Set up your `profiles.yml` with connection credentials for the `default` profile (matching the `profile: 'default'` setting in `dbt_project.yml`).

4. Test the connection:
   ```bash
   dbt debug
   ```

## Usage

Run the models:
```bash
dbt run
```

Run data tests:
```bash
dbt test
```

Generate and view documentation:
```bash
dbt docs generate
dbt docs serve
```

## Resources

- [dbt documentation](https://docs.getdbt.com/docs/introduction)
- [dbt Discourse](https://discourse.getdbt.com/) - commonly asked questions and answers
- [dbt Community](https://getdbt.com/community)
- [dbt blog](https://blog.getdbt.com/) - news and best practices
