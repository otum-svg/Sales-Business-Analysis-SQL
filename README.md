# 🛒 Sales Business Analysis — SQL Project

![SQL](https://img.shields.io/badge/SQL-MySQL-blue?style=flat&logo=mysql)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Queries](https://img.shields.io/badge/Queries-13-orange)
![Tables](https://img.shields.io/badge/Tables-4-purple)
![Records](https://img.shields.io/badge/Records-10000-red)

## 📌 Project Overview

This project performs an end-to-end **Sales Data Analysis** using **MySQL**. It covers business KPIs like revenue, profit, regional performance, customer segmentation, and time-based trends — the kind of insights that help organizations make data-driven decisions.

> 💡 **Goal:** Extract actionable business insights from raw sales transactional data using structured SQL queries across 4 relational tables with **10,000 records**.

---

## 🗃️ Database Schema

| Table      | Columns                                                              |
|------------|----------------------------------------------------------------------|
| `price`    | Order_ID, Customer_ID, Order_Date, Unit_Price                        |
| `quantity` | Order_ID, Quantity, Payment_Method                                   |
| `region`   | Order_ID, Region, Product_Category, Customer_Segment                 |
| `payment`  | Order_ID, Discount_Rate, Revenue, Cost, Profit                       |

---

## 🔍 Queries & Business Questions

### 📊 Section 1 — Basic Metrics
| # | Business Question |
|---|-------------------|
| Q1 | Total number of orders placed |
| Q2 | Highest priced product by category |
| Q3 | Total revenue generated |
| Q4 | Most common payment method used |

### 🗺️ Section 2 — Product & Regional Analysis
| # | Business Question |
|---|-------------------|
| Q5 | Top 2 most ordered product categories (with region & price) |
| Q6 | Total quantity sold per product category |
| Q7 | Order volume comparison across regions |

### 📅 Section 3 — Time-Based Analysis
| # | Business Question |
|---|-------------------|
| Q8  | Daily order count |
| Q9  | Monthly sales trend (month-over-month) |
| Q10 | Average profit per order per day |
| Q11 | Daily sales vs. profit comparison |

### 🧠 Section 4 — Advanced Analysis
| # | Business Question |
|---|-------------------|
| Q12 | Profit distribution per day using `CASE WHEN` |
| Q13 | Top 5 customers by total profit generated |
| Q14 | Daily Sales vs. Profit Comparison |

---

## 📸 Query Results

> All query output screenshots are available in the [`screenshots/`](screenshots/) folder.

---

## 🛠️ SQL Concepts Used

- `JOINs` — INNER JOIN across multiple tables
- `GROUP BY` & `ORDER BY`
- `Aggregate Functions` — SUM, COUNT, AVG, ROUND
- `CASE WHEN` — Conditional profit banding
- `Date Functions` — STR_TO_DATE, YEAR, MONTH, DATE
- `LIMIT` — Top-N analysis

---

## 💼 Key Business Insights

| Insight | Value |
|---------|-------|
| 💰 Total Revenue | **₹1.40 Crore** across 10,000 orders |
| 🏷️ Highest Priced Product | **Clothing at ₹499.94** |
| 💳 Most Used Payment Method | **Debit Card (2,074 uses)** |
| 🌍 Top Region by Orders | **North (2,548 orders)** |
| 📦 Best Selling Category | **Sports (11,135 units)** |
| 📅 Peak Revenue Month | **January (₹10.3 Lakh)** |
| 👑 Most Valuable Customer | **CUST7848 (₹1,836 profit)** |
| 📈 Avg Daily Profit Margin | **~33-35%** |

---

## 📁 Project Structure

```
sales-sql-business-analysis/
│
├── screenshots/           # Query result screenshots
├── sales_analysis.sql     # All 13 SQL queries
└── README.md              # Project documentation
```

---

## ▶️ How to Run

1. Open **MySQL Workbench**
2. Run: `CREATE DATABASE project1;` then `USE project1;`
3. Import your data tables
4. Open `sales_analysis.sql` and run queries

---

## 👤 Author

**TARUN PRAJAPAT**  
Aspiring Data / Business Analyst  
📧 [tarunprajapat256@gmail.com]  

🔗 [LinkedIn Profile URL : https://www.linkedin.com/in/tarun-prajapat-482b22369/ ]

🐙 [GitHub Profile URL : (https://github.com/otum-svg) ]

---

⭐ If you found this project useful, please star the repository!
