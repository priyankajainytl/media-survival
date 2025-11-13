# QuickBite Express - Crisis Recovery Analysis

## CodeBasics Resume Project Challenge

**Challenge Link**: [CodeBasics Resume Project Challenge #23](https://codebasics.io/challenges/codebasics-resume-project-challenge/23)


## Project Overview

This project analyzes the crisis impact and recovery strategy for **QuickBite Express**, a Bengaluru-based food-tech startup founded in 2020. In June 2025, QuickBite faced a major crisis triggered by:

- **Viral social media incident** involving food safety violations at partner restaurants
- **Week-long delivery outage** during monsoon season
- **Aggressive competitor campaigns** capitalizing on the situation
- **Massive customer backlash** and trust issues

### Crisis Impact
- Large portion of active users disengaged
- Sharp decline in daily orders
- Customer satisfaction scores fell dramatically
- Partner restaurants shifted to competing platforms
- Customer acquisition costs rose significantly

### Analysis Focus
The analysis covers three key periods:
- **Pre-Crisis Period**: January 1, 2025 - May 31, 2025 (5 months)
- **Crisis Period**: June 1, 2025 - September 30, 2025 (4 months)
- **Recovery Phase**: Post-crisis analysis and recommendations

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

## Business Objectives & Analysis Framework

As a Data Analyst at QuickBite Express, the goal is to provide actionable insights for the leadership team across six critical areas:

### 1. Customer Segments
- Identify which customers can be recovered vs those needing new strategies
- Analyze customer behavior changes across crisis phases
- Segment high-value customers showing significant behavioral shifts

### 2. Order Patterns 
- Analyze order trends to uncover behavioral changes across phases
- Track monthly order volumes and identify decline patterns
- Understand ordering frequency changes by customer segments

### 3. Delivery Performance
- Assess delivery times, cancellations, and SLA compliance
- Pinpoint operational gaps during crisis period
- Measure impact on customer satisfaction

### 4. Campaign Opportunities
- Recommend targeted initiatives to rebuild trust and loyalty
- Identify demographics most affected by the crisis
- Develop customer acquisition and retention strategies

### 5. Restaurant Partnerships
- Predict which partnerships are most valuable for long-term retention
- Analyze restaurant performance during crisis
- Identify cuisine preferences and regional trends

### 6. Feedback & Sentiment
- Monitor real-time ratings, reviews, and sentiment
- Guide ongoing recovery efforts with customer feedback analysis
- Track satisfaction score improvements

## Dataset Description

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