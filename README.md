# Crisis Impact Analysis - Food Delivery Platform

## Project Overview

This project analyzes the impact of a crisis period (June-September 2025) on a food delivery platform's operations compared to the pre-crisis period (January-May 2025). The analysis focuses on key business metrics including order patterns, cancellation rates, delivery performance, customer ratings, and customer lifetime value.

## Dataset Description

### Data Structure
The project uses a star schema with dimension and fact tables:

**Dimension Tables:**
- `dim_customer.csv` - Customer information (107,777 records)
- `dim_restaurant.csv` - Restaurant details
- `dim_delivery_partner_.csv` - Delivery partner information  
- `dim_menu_item.csv` - Menu item catalog

**Fact Tables:**
- `fact_orders.csv` - Order transactions (149,167 records)
- `fact_order_items.csv` / `fact_order_items_clean.csv` - Individual order line items
- `fact_delivery_performance.csv` - Delivery timing and SLA metrics
- `fact_ratings.csv` / `fact_ratings_clean.csv` - Customer review data

### Time Periods Analyzed
- **Pre-Crisis Period**: January 1, 2025 - May 31, 2025 (5 months)
- **Crisis Period**: June 1, 2025 - September 30, 2025 (4 months)

## Technology Stack

- **Database**: PostgreSQL 15
- **Analytics Dashboard**: Metabase (localhost:3000)
- **Data Processing**: SQL queries and views

## Setup Instructions

### 1. Database Setup

Start PostgreSQL service:
```bash
brew services start postgresql@15
```

Connect to PostgreSQL:
```bash
psql -h localhost -p 5433 -U postgres
```

Create and connect to database:
```sql
CREATE DATABASE media_survival;
\c media_survival;
```

### 2. Table Creation and Data Loading

Create dimension tables and load data:
```sql
CREATE TABLE dim_customer (
    customer_id VARCHAR(20) PRIMARY KEY,
    signup_date VARCHAR(20),
    city VARCHAR(50),
    acquisition_channel VARCHAR(20)
);

-- Load data
\copy dim_customer FROM '/path/to/dim_customer.csv' WITH (FORMAT csv, HEADER true);
```

### 3. Metabase Dashboard

Start Metabase:
```bash
sh metabase-start.sh
```

Access dashboard at: http://localhost:3000

Stop Metabase:
```bash
sh metabase-stop.sh
```

## Key Analysis Queries

### 1. Monthly Order Trends
```sql
CREATE VIEW month_order AS (
    SELECT
        CASE
            WHEN order_timestamp BETWEEN '2025-01-01' AND '2025-06-01' THEN '1. Pre-Crisis (Jan–May 2025)'
            WHEN order_timestamp BETWEEN '2025-06-01' AND '2025-10-01' THEN '2. Crisis (Jun–Sep 2025)'
        END AS period,
        COUNT(*) AS total_orders
    FROM fact_orders
    WHERE order_timestamp BETWEEN '2025-01-01' AND '2025-09-30'
    GROUP BY period
    ORDER BY period
);
```

### 2. Cancellation Analysis by City
Compares cancellation rates across cities between pre-crisis and crisis periods.

### 3. Delivery Performance & SLA Compliance
Analyzes on-time delivery performance and SLA compliance rates.

### 4. Rating Fluctuations
Tracks monthly rating changes to identify periods of service quality decline.

### 5. Customer Lifetime Value Decline
Identifies high-value customers showing significant behavioral changes during the crisis.

## Key Findings

The analysis reveals several critical impacts during the crisis period:

1. **Order Volume**: Significant changes in order patterns
2. **Cancellation Rates**: Increased cancellations across different cities
3. **Delivery Performance**: SLA compliance and delivery time impacts
4. **Customer Satisfaction**: Rating fluctuations indicating service quality issues
5. **Customer Retention**: High-value customer behavior changes

## Data Schema

### Customer Dimension
- `customer_id`: Unique customer identifier
- `signup_date`: Customer registration date
- `city`: Customer location
- `acquisition_channel`: How customer was acquired (Organic, Paid, Referral)

### Orders Fact Table
- `order_id`: Unique order identifier
- `customer_id`: Foreign key to customer dimension
- `restaurant_id`: Foreign key to restaurant dimension
- `delivery_partner_id`: Foreign key to delivery partner dimension
- `order_timestamp`: Order placement time
- `subtotal_amount`: Order subtotal
- `discount_amount`: Applied discounts
- `delivery_fee`: Delivery charges
- `total_amount`: Final order amount
- `is_cod`: Cash on delivery flag
- `is_cancelled`: Order cancellation status

## Usage

1. Run the setup scripts to initialize the database and load data
2. Execute the analysis queries to generate insights
3. Use Metabase for interactive dashboard visualization
4. Refer to `notes.txt` for detailed SQL queries and analysis logic

## Files Structure

```
├── README.md                      # This file
├── notes.txt                      # Detailed SQL queries and setup notes
├── metabase-start.sh             # Metabase startup script
├── metabase-stop.sh              # Metabase shutdown script
├── dim_customer.csv              # Customer dimension data
├── dim_restaurant.csv            # Restaurant dimension data
├── dim_delivery_partner_.csv     # Delivery partner dimension data
├── dim_menu_item.csv             # Menu item dimension data
├── fact_orders.csv               # Order transactions
├── fact_order_items.csv          # Order line items
├── fact_delivery_performance.csv # Delivery metrics
├── fact_ratings.csv              # Customer ratings
└── Analysis/                     # Additional analysis outputs
```

## Contributing

When adding new analysis queries:
1. Document the business question being answered
2. Include the SQL query with proper formatting
3. Add expected output format and interpretation
4. Update this README with new findings

## Support

For questions about the analysis or data structure, refer to the comprehensive notes in `notes.txt` which contains all SQL queries and detailed implementation steps.