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