# Customer Segmentation and Predictive Analytics

## Project Overview

**Objective:**  
Segment customers based on behavior and demographics, and predict their next quarter spend using machine learning.

---

## Data Modeling with dbt

### Star Schema Design

**Fact Table**
- `fct_transactions`: Stores individual transactions

**Dimension Tables**
- `dim_customers`: Customer demographic and profile info  
- `dim_products`: Product name, category, and price

---

### Modeling Layers in dbt

#### 1. Staging Layer (`stg_`)
- Cleans and renames raw source data
- Tables:  
  - `stg_customers`  
  - `stg_products`  
  - `stg_transactions`

#### 2. Warehouse Layer (`dim_`, `fct_`)
- `dim_customers`: Includes customer age, country, etc.  
- `dim_products`: Includes product category and price  
- `fct_transactions`: Includes quantity, price, and transaction date

#### 3. Mart Layer (`mart_`)
- `mart_customer_segments`: Assigns customer segments based on:
  - Total spend: High / Medium / Low
  - Purchase frequency: Frequent / Occasional / Rare
  - Product diversity: Diverse / Focused

---

### dbt Best Practices Followed

- Modular SQL models
- `schema.yml` usage for:
  - Sources
  - Data types
  - Tests (`not_null`, `unique`)
- Folder structure:

models/
staging/
warehouse/
marts/

yaml
Copy
Edit

---

## Predictive Analytics (Python + AI Agent)

A separate Python script was created to:
- Connect to the warehouse using `psycopg2`
- Retrieve customer segments and enrich with demographics
- Train a `RandomForestRegressor` to predict `next_quarter_spend`
- Save enriched predictions to `customer_predictions.csv`

---

## Tableau Dashboard

The dashboard includes:
- Segment distribution
- Average spend per segment
- Top 3 product categories per segment
- Actual vs predicted spend
- Predicted future revenue per category
