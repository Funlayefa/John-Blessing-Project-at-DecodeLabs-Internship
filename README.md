# 📊 Data Analytics Portfolio — John Blessing

> A 4-project data analytics portfolio covering data cleaning, exploratory data analysis, SQL querying, and data visualization using an E-Commerce Orders dataset (1,200 records, Jan 2023 – Jun 2025).

---

## 🗂️ Table of Contents

- [About](#about)
- [Dataset Overview](#dataset-overview)
- [Project 1 — Data Cleaning](#project-1--data-cleaning)
- [Project 2 — Exploratory Data Analysis](#project-2--exploratory-data-analysis)
- [Project 3 — SQL Data Analysis](#project-3--sql-data-analysis)
- [Project 4 — Data Visualization](#project-4--data-visualization)
- [Key Findings](#key-findings)
- [Tools & Skills](#tools--skills)
- [How to Use This Repo](#how-to-use-this-repo)
- [Author](#author)

---

## About

This portfolio was built as part of a structured data analytics learning programme. Each project builds on the previous one — starting from raw data cleaning all the way through to an interactive Power BI dashboard. The same dataset is used across all 4 projects to demonstrate an end-to-end data analysis workflow.

---

## Dataset Overview

| Attribute | Detail |
|---|---|
| **Dataset Name** | E-Commerce Orders |
| **Records** | 1,200 orders |
| **Time Period** | January 2023 – June 2025 |
| **Columns** | 14 |
| **Key Fields** | OrderID, Date, CustomerID, Product, Quantity, UnitPrice, TotalPrice, OrderStatus, PaymentMethod, CouponCode, ReferralSource |
| **Products** | Chair, Printer, Laptop, Tablet, Monitor, Desk, Phone |
| **File** | `Data_Project_2.xlsx` |

---

## Project 1 — Data Cleaning

### 🎯 Goal
Prepare the raw dataset for analysis by identifying and resolving data quality issues.

### 🔧 Key Tasks
- Removed duplicate records
- Handled missing/null values
- Standardised date formats and column naming
- Corrected data type mismatches
- Validated numeric ranges for UnitPrice and TotalPrice
- Ensured referential integrity across categorical columns

### ✅ Outcome
A fully cleaned dataset with 1,200 complete, consistent records ready for analysis.

### 🛠️ Tools Used
- Microsoft Excel / Power Query

---

## Project 2 — Exploratory Data Analysis

### 🎯 Goal
Analyse the cleaned dataset to understand patterns, trends, and distributions.

### 📊 Key Statistics

| Metric | Value |
|---|---|
| Total Orders | 1,200 |
| Total Revenue | $1,264,762 |
| Mean Order Value | $1,053.96 |
| Median Order Value | $823.50 |
| Avg Quantity per Order | 2.95 |
| Outliers Detected | 8 |

### 📈 Key Findings

**Revenue**
- Chair ($195,622) and Printer ($195,610) are the top revenue products
- Phone ($151,718) is the lowest — a $43,904 gap from the top
- Laptop has the highest average order value at $1,110.56

**Order Status**
- Only **19.2%** of orders were successfully delivered
- **41.4%** were cancelled (250) or returned (247) — critical business risk
- Chair has the highest cancellation rate at **25.3%**

**Trends**
- Revenue peaked in **June 2024 at $68,069**
- Lowest month was **April 2023 at $27,752**
- Consistent May–June spikes suggest seasonal demand patterns

**Outliers**
- 8 orders exceed the IQR upper fence of $3,333
- Range: $3,334 – $3,456 — likely bulk B2B purchases

### 🛠️ Tools Used
- Microsoft Power BI
- Python (pandas, numpy) for validation

### 📁 Files
```
project2/
├── EDA_Dashboard_JohnBlessing.xls    ← EDA dashboard
├── KeyInsights_JohnBlessing.png      ← Key insights page
├── EDA_Presentation_JohnBlessing.pptx ← Presentation slides
```

---

## Project 3 — SQL Data Analysis

### 🎯 Goal
Use SQL queries to extract insights from the dataset, validating EDA findings.

### 📋 Query Categories

| Category | Queries | Description |
|---|---|---|
| Basic SELECT | 1–2 | View dataset structure and sample rows |
| COUNT / SUM / AVG | 3–4 | Core aggregation statistics |
| GROUP BY | 5–8 | Revenue, status, payment, referral breakdowns |
| WHERE | 9–11 | Filter cancelled orders, outliers, no-coupon orders |
| WHERE + GROUP BY | 12–13 | Cancellation rates, delivered revenue by product |
| Advanced | 14–17 | CASE expressions, delivery rate, cancellation % |

### 🔑 Key SQL Results

```sql
-- Total Revenue
SELECT SUM(TotalPrice) AS Total_Revenue FROM Sheet1;
-- Result: $1,264,762

-- Delivery Rate
SELECT ROUND(100.0 * SUM(CASE WHEN OrderStatus = 'Delivered' 
  THEN 1 ELSE 0 END) / COUNT(*), 1) AS Delivery_Rate_Pct FROM Sheet1;
-- Result: 19.2%

-- Top Product by Revenue
SELECT Product, SUM(TotalPrice) AS Total_Revenue
FROM Sheet1 GROUP BY Product ORDER BY Total_Revenue DESC;
-- Result: Chair — $195,622
```

### 🛠️ Tools Used
- SQL Server / DB Browser for SQLite

### 📁 Files
```
project3/
├── Project3_SQL_JohnBlessing.sql     ← All 25 SQL queries
├── Project3_Report_JohnBlessing.docx ← Full write-up report
└── screenshots/                       ← Query result screenshots
```

---

## Project 4 — Data Visualization

### 🎯 Goal
Create visual representations of the data to communicate insights clearly using Power BI.

### 📊 Dashboard Visuals

| Visual | Type | Insight |
|---|---|---|
| KPI Strip | Cards | Revenue, Orders, Mean, Median, Outliers, Avg Qty |
| Order Count by Product | Column Chart | Printer leads (181), Phone lowest (156) |
| Revenue by Product | Bar Chart | Chair & Printer tied at ~$195.6K |
| Referral Source | Bar Chart | Instagram #1 with 259 customers |
| Monthly Revenue Trend | Line Chart | 3-year trend with 2023/2024/2025 lines |
| Unit Price Distribution | Bin Chart | Spike at $400–500 (201 orders) |
| Yearly Revenue | Column Chart | 2023: $552K → 2024: $480K → 2025: $232K* |
| Payment Method | Pie Chart | Balanced across all 5 methods |
| Coupon Code Usage | Donut Chart | 74.3% of orders used a coupon |
| Order Status Distribution | Donut Chart | 5 status categories |
| Outlier Detection | Scatter Chart | 8 outliers flagged above $3,333 |

*2025 = Jan–Jun only

### 🖼️ Dashboard Preview

![Data Analysis Dashboard](project4/dashboard_screenshot.png)

### 🛠️ Tools Used
- Microsoft Power BI Desktop
- DAX (Data Analysis Expressions)

### 🔢 Key DAX Measures Used

```dax
-- Mean Order Value
Mean Order Value = AVERAGE('Sheet1'[TotalPrice])

-- Median Order Value  
Median Order Value = MEDIAN('Sheet1'[TotalPrice])

-- Outlier Flag
Outlier Flag = 
VAR Q1 = CALCULATE(PERCENTILE.INC('Sheet1'[TotalPrice], 0.25), ALL('Sheet1'))
VAR Q3 = CALCULATE(PERCENTILE.INC('Sheet1'[TotalPrice], 0.75), ALL('Sheet1'))
VAR UpperFence = Q3 + (1.5 * (Q3 - Q1))
RETURN IF('Sheet1'[TotalPrice] > UpperFence, "Outlier", "Normal")

-- Price Bin
Price Bin = 
SWITCH(TRUE(),
    'Sheet1'[UnitPrice] <= 100,  "$0-100",
    'Sheet1'[UnitPrice] <= 200,  "$100-200",
    'Sheet1'[UnitPrice] <= 300,  "$200-300",
    'Sheet1'[UnitPrice] <= 400,  "$300-400",
    'Sheet1'[UnitPrice] <= 500,  "$400-500",
    'Sheet1'[UnitPrice] <= 600,  "$500-600",
    'Sheet1'[UnitPrice] <= 700,  "$600-700",
    "Other"
)

-- Short Month (for trend axis)
Short Month = FORMAT('Sheet1'[Date], "MMM")
```

### 📁 Files
```
project4/
├── DataAnalysisDashboard_JohnBlessing.pbix  ← Power BI file
└── dashboard_screenshot.png                  ← Dashboard preview
```

---

## Key Findings

Across all 4 projects, the following critical insights were consistently identified:

> 🚨 **Fulfilment Crisis** — Only 19.2% of orders are delivered. 41.4% cancelled or returned.

> 🪑 **Chair Problem** — Highest revenue product but worst cancellation rate (25.3%).

> 📱 **Instagram Wins** — Top acquisition channel with 259 customers (21.6%).

> 🏷️ **Discount Dependency** — 74.3% of orders relied on a coupon code.

> 📦 **B2B Opportunity** — 8 bulk outlier orders ($3,334–$3,456) suggest untapped B2B demand.

> 📈 **Seasonal Pattern** — Revenue consistently spikes May–June each year.

---

## Tools & Skills

| Tool | Used For |
|---|---|
| **Microsoft Excel** | Data cleaning, initial exploration |
| **Power Query** | Data transformation |
| **SQL Server / DB Browser** | SQL querying and aggregation |
| **Microsoft Power BI** | Dashboard and visualisation |
| **DAX** | Custom measures and calculated columns |
| **Python (pandas)** | Data validation |
| **GitHub** | Version control and portfolio hosting |

### Skills Demonstrated
`Data Cleaning` `Exploratory Data Analysis` `Descriptive Statistics` `SQL` `Data Visualization` `DAX` `Power BI` `Analytical Thinking` `Storytelling with Data`

---

## How to Use This Repo

```
📁 Repository Structure

├── README.md
├── dataset/
│   └── Data_Project_2.xlsx
├── project1/
│   └── data_cleaning_notes.md
├── project2/
│   ├── EDA_Dashboard_JohnBlessing.html
│   ├── KeyInsights_JohnBlessing.html
│   └── EDA_Presentation_JohnBlessing.pptx
├── project3/
│   ├── Project3_SQL_JohnBlessing.sql
│   ├── Project3_Report_JohnBlessing.docx
│   └── screenshots/
└── project4/
    ├── DataAnalysisDashboard_JohnBlessing.pbix
    └── dashboard_screenshot.png
```

**To explore:**
1. Clone the repo: `git clone https://github.com/johnblessing/data-analytics-portfolio`
2. Open `dataset/Data_Project_2.xlsx` to view the raw data
3. Open `.sql` file in SQL Server or DB Browser to run queries
4. Open `.pbix` file in Power BI Desktop to interact with the dashboard
5. Open `.html` files in any browser to view EDA outputs

---

## Author

**John Blessing**
Data Analyst | June 2026

[![GitHub](https://img.shields.io/badge/GitHub-johnblessing-181717?style=flat&logo=github)](https://github.com/johnblessing)

---

*This portfolio was completed as part of a structured data analytics training programme covering the full data analysis workflow from raw data to actionable insights.*
