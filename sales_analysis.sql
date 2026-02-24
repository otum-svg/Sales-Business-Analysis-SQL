-- ============================================================
--   SALES BUSINESS ANALYSIS — SQL PROJECT
--   Author  : [Your Name]
--   Tool    : MySQL
--   Dataset : Sales Data (price, quantity, region, payment)
--   Tables  : price | quantity | region | payment
-- ============================================================

/*
  TABLE SCHEMA OVERVIEW
  ─────────────────────
  price    → Order_ID, Customer_ID, Order_Date, Unit_Price
  quantity → Order_ID, Quantity, Payment_Method
  region   → Order_ID, Product_Category, Region
  payment  → Order_ID, Revenue, Profit
*/

USE project1;

-- ============================================================
-- SECTION 1 : BASIC METRICS
-- ============================================================

-- Q1. Total Number of Orders Placed
-- Business Use: Understand overall sales volume
SELECT 
    COUNT(order_id) AS total_orders 
FROM quantity;


-- Q2. Highest Priced Product by Category
-- Business Use: Identify premium products per category
SELECT 
    price.Unit_Price,
    region.Product_Category
FROM price
JOIN region ON region.order_id = price.order_id
ORDER BY price.Unit_Price DESC
LIMIT 1;


-- Q3. Total Revenue Generated
-- Business Use: Measure overall business performance
SELECT 
    ROUND(SUM(quantity.Quantity * price.Unit_Price), 2) AS total_revenue
FROM quantity
JOIN price ON price.order_id = quantity.order_id;


-- Q4. Most Common Payment Method Used
-- Business Use: Understand customer payment preferences
SELECT 
    Payment_Method,
    COUNT(*) AS method_count
FROM quantity
GROUP BY Payment_Method
ORDER BY method_count DESC;


-- ============================================================
-- SECTION 2 : PRODUCT & REGIONAL ANALYSIS
-- ============================================================

-- Q5. Top 2 Most Ordered Product Categories (with Region & Price)
-- Business Use: Find best-selling products and their market location
SELECT 
    region.Region,
    price.Unit_Price,
    region.Product_Category,
    COUNT(region.Product_Category) AS common_product
FROM region
JOIN price ON region.order_id = price.order_id
GROUP BY region.Region, price.Unit_Price, region.Product_Category
ORDER BY common_product DESC
LIMIT 2;


-- Q6. Total Quantity Sold per Product Category
-- Business Use: Track inventory demand per category
SELECT 
    region.Product_Category AS category,
    SUM(quantity.Quantity) AS total_quantity
FROM region
JOIN quantity ON quantity.Order_id = region.order_id
GROUP BY region.Product_Category
ORDER BY total_quantity DESC;


-- Q7. Orders Count by Region
-- Business Use: Compare order volumes across geographic regions
SELECT 
    Region,
    COUNT(Order_ID) AS volume_region
FROM region
GROUP BY Region
ORDER BY volume_region DESC;


-- ============================================================
-- SECTION 3 : TIME-BASED ANALYSIS
-- ============================================================

-- Q8. Daily Order Count
-- Business Use: Identify peak and slow order days
SELECT 
    Order_Date,
    COUNT(order_id) AS total_orders
FROM price
GROUP BY Order_Date
ORDER BY Order_Date ASC;


-- Q9. Monthly Sales Trend (Month-over-Month Growth)
-- Business Use: Track revenue growth across months
SELECT
    YEAR(STR_TO_DATE(Order_Date, '%m/%d/%Y'))  AS year,
    MONTH(STR_TO_DATE(Order_Date, '%m/%d/%Y')) AS month,
    ROUND(SUM(payment.Revenue), 2)             AS monthly_sales
FROM price
JOIN payment ON price.Order_ID = payment.Order_ID
GROUP BY year, month
ORDER BY year ASC, month ASC;


-- Q10. Daily Sales vs. Profit Comparison
-- Business Use: Spot days where high sales didn't mean high profit
SELECT 
    STR_TO_DATE(price.Order_Date, '%m/%d/%Y') AS date,
    ROUND(SUM(payment.Revenue), 2)            AS total_sales,
    ROUND(SUM(payment.Profit), 2)             AS total_profit
FROM price
JOIN payment ON price.Order_ID = payment.Order_ID
GROUP BY date
ORDER BY date ASC;


-- Q11. Average Profit per Order per Day
-- Business Use: Measure daily profitability efficiency
SELECT 
    DATE(STR_TO_DATE(Order_Date, '%m/%d/%Y')) AS order_date,
    ROUND(AVG(payment.Profit), 2)             AS avg_profit
FROM price
JOIN payment ON payment.Order_ID = price.Order_ID
GROUP BY order_date
ORDER BY order_date ASC;


-- ============================================================
-- SECTION 4 : ADVANCED ANALYSIS
-- ============================================================

-- Q12. Profit Distribution per Day (CASE WHEN Categorization)
-- Business Use: Classify daily orders into profit performance bands
SELECT 
    price.Order_Date,
    CASE
        WHEN payment.Profit < 0         THEN 'Loss'
        WHEN payment.Profit BETWEEN 50  AND 70  THEN 'Low'
        WHEN payment.Profit BETWEEN 71  AND 100 THEN 'Medium'
        WHEN payment.Profit BETWEEN 101 AND 200 THEN 'High'
        WHEN payment.Profit BETWEEN 201 AND 500 THEN 'Very High'
        ELSE 'Other'
    END AS profit_category,
    COUNT(price.Order_Date) AS order_count
FROM price
JOIN payment ON payment.Order_ID = price.Order_ID
GROUP BY 
    price.Order_Date,
    CASE
        WHEN payment.Profit < 0         THEN 'Loss'
        WHEN payment.Profit BETWEEN 50  AND 70  THEN 'Low'
        WHEN payment.Profit BETWEEN 71  AND 100 THEN 'Medium'
        WHEN payment.Profit BETWEEN 101 AND 200 THEN 'High'
        WHEN payment.Profit BETWEEN 201 AND 500 THEN 'Very High'
        ELSE 'Other'
    END
ORDER BY price.Order_Date, profit_category;


-- Q13. Top 5 Customers by Total Profit Generated
-- Business Use: Identify most valuable customers for retention strategy
SELECT 
    price.Customer_ID,
    ROUND(SUM(payment.Profit), 2) AS total_profit
FROM payment
JOIN price ON price.Order_ID = payment.Order_ID
GROUP BY price.Customer_ID
ORDER BY total_profit DESC
LIMIT 5;


-- ============================================================
-- END OF ANALYSIS
-- ============================================================
