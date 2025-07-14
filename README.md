Project Overview
Objective:
Segment customers based on behavior and demographics, and predict their next quarter spend using machine learning.

Data Modeling with dbt
Star Schema Design
Fact Table:

fct_transactions: Stores individual transactions

Dimension Tables:

dim_customers: Customer demographic and profile info

dim_products: Product name, category, and price

Modeling Layers in dbt
Staging Layer (stg_):

Cleans and renames raw source data

Tables: stg_customers, stg_products, stg_transactions

Warehouse Layer (dim_, fct_):

dim_customers: Includes customer age, country, etc.

dim_products: Includes product category and price

fct_transactions: Includes quantity, price, and transaction date

Mart Layer (mart_):

mart_customer_segments: Assigns customer segments based on:

Total spend: High / Medium / Low

Purchase frequency: Frequent / Occasional / Rare

Product diversity: Diverse / Focused

dbt Best Practices Followed
Modular SQL models

Use of schema.yml with:

Sources

Data types

Tests (not_null, unique)

Folder structure:

Copy
Edit
models/
  staging/
  warehouse/
  marts/
Predictive Analytics (Python + AI Agent)
A separate Python script was created to:

Connect to the warehouse using psycopg2

Retrieve customer segments and enrich with demographics

Train a RandomForestRegressor to predict next_quarter_spend

Save enriched predictions to customer_predictions.csv

Tableau Dashboard
Dashboard includes:

Segment distribution

Average spend by segment

Top 3 product categories per segment

Actual vs predicted spend

Predicted future revenue per category

Built using Tableau Public (link included separately).
