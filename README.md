# Retail Revenue Leakage Analysis: End-to-End Data Analytics Project

## Executive Summary

Retail businesses often focus on increasing sales revenue, but growing revenue does not always translate into growing profits. This project investigates a retail company's declining profitability despite sustained revenue growth over three years.

Using Excel, Python, SQL Server, Power BI, and DAX, I performed an end-to-end business analysis to identify the operational factors contributing to revenue leakage and provide actionable recommendations for improving profitability.

The analysis revealed that excessive discounting, high shipping costs, underperforming product categories, and operational inefficiencies across specific regions and branches were the primary drivers of declining profit margins.

## Business Problem

A rapidly expanding retail chain experienced consistent revenue growth over a three-year period. However, despite increasing sales, overall profitability continued to decline.

Senior management suspected that revenue leakage was occurring somewhere within the business but lacked visibility into its root causes.

The objective of this project was to uncover where profits were being lost and provide data-driven recommendations to improve financial performance without sacrificing revenue growth.

## Project Objectives

This project was designed to answer key business questions that support executive decision-making:

- Which product categories consistently underperform?
- Which products generate high sales but low profits?
- Are current discount strategies reducing profitability?
- At what discount level does revenue leakage begin?
- Are shipping costs negatively affecting operating profit?
- Which shipping methods are most profitable?
- Which customer segments contribute the highest profit?
- Which regions generate high revenue but low profitability?
- Which retail branches require immediate operational attention?
- How have revenue and profitability changed over time?
- What operational inefficiencies contribute most to revenue leakage?

## Tech Stack

| Tool | Purpose |
|------|---------|
| Excel | Initial data preparation |
| Python (Pandas, NumPy, Matplotlib, Seaborn) | Data cleaning, feature engineering, exploratory data analysis |
| SQL Server | Business analysis and KPI reporting |
| Power BI | Data modeling, interactive dashboards, executive reporting |
| DAX | Business KPIs and time intelligence measures |

## Project Workflow

```
Raw Retail Data (Excel)
        │
        ▼
Data Normalization (Excel)
        │
        ▼
Data Cleaning, Feature Engineering & EDA (Python/Jupyter Notebook)
        │
        ▼
Import to SQL Server (via Notebook)
        │
        ▼
Business Analysis & KPI Queries (SQL Server)
        │
        ▼
Direct Import from SQL Server (Power BI)
        │
        ▼
Star Schema Data Modeling & DAX Measures (Power BI)
        │
        ▼
Interactive Executive Dashboard
        │
        ▼
Business Recommendations
```

## Dataset Overview

The project was built using a star schema consisting of four tables:

**Fact Sales**

Contains transactional information including:
- Sales
- Quantity
- Unit Price
- Discount
- Cost of Goods Sold (COGS)
- Shipping Cost
- Gross Profit
- Operating Profit
- Profit Margin

**Product Dimension**
- Product Name
- Category
- Sub-category

**Customer Dimension**
- Customer Name
- Customer Segment

**Store Dimension**
- Branch
- Region

This dimensional model enables efficient analytical reporting across products, customers, locations, and time.

## Exploratory Data Analysis (Python)

Python was used to clean and explore the dataset before conducting business analysis.

**Key analyses included**
- Revenue trends
- Profitability analysis
- Product performance
- Store performance
- Customer segmentation
- Shipping analysis
- Discount analysis

The EDA identified several early indicators of revenue leakage, including a strong negative relationship between discount percentage and operating profit. Transactions with discounts above approximately 15% showed a much higher likelihood of generating losses.

## SQL Business Analysis

SQL Server was used to answer business-focused questions that support operational and strategic decision-making.

**Business Questions Answered**

**Product Performance**
- Which product categories underperformed?
- Which products generated high sales but low profits?
- Which categories contributed the highest share of total sales?

**Profitability**
- Are discounts reducing profitability?
- Are shipping costs affecting operating profit?
- Which operational inefficiencies contribute to revenue leakage?

**Customer Analysis**
- Which customer segments contribute the highest profit?

**Regional Analysis**
- Which regions generate the highest revenue but the lowest profit?
- Which retail branches require immediate operational attention?

**Trend Analysis**
- What is the year-over-year sales performance?
- What is the year-over-year profit growth?

## Power BI Dashboard

The cleaned dataset was modeled into a star schema within Power BI.

The dashboard includes interactive visualizations for:
- Revenue Performance
- Operating Profit
- Profit Margin
- Product Category Performance
- Customer Segment Analysis
- Store Performance
- Regional Profitability
- Shipping Cost Analysis
- Discount Impact
- Year-over-Year Growth

## DAX Measures

Examples of business KPIs developed include:
- Total Revenue
- Total Operating Profit
- Gross Profit
- Profit Margin %
- Revenue Growth %
- YoY Revenue Growth %
- YoY Profit Growth %
- Total Orders
- Average Order Value
- Total Discounts
- Shipping Cost
- Profit by Category
- Revenue by Region


## Key Business Insights

**Revenue continued to grow while profitability declined**

The business achieved sustained revenue growth over three years, confirming that declining profits were driven by operational inefficiencies rather than falling demand.

**Discounts above 15% significantly reduced profitability**

Higher discount bands consistently generated lower operating profit, making aggressive discounting one of the largest contributors to revenue leakage. Electronics products received particularly high discounts while still delivering poor profitability.

**High shipping costs actively destroyed profit**

Orders with shipping costs above ₦15,000 produced negative operating profit despite generating substantial revenue. This indicates that logistics costs are eroding margins on otherwise successful sales.

**Consumer customers generated the highest profit**

The Consumer segment proved to be the most valuable customer group, contributing the greatest share of operating profit.

**Certain regions generated high revenue but low profit**

The North and South regions contributed a significant share of total revenue but delivered disproportionately low profitability, highlighting operational inefficiencies requiring management attention.

**Specific branches require immediate intervention**

The Ikeja and Aba branches recorded the weakest operating performance and should be prioritized for operational review.

## Business Recommendations

Based on the analysis, the following recommendations were proposed:

- Limit discounts to a maximum of 15%.
- Reduce discounting specifically within the Electronics category.
- Prioritize Second Class and Standard Class shipping methods where operationally feasible.
- Review shipping policies for high-cost deliveries.
- Improve operational performance in the North and South regions.
- Conduct operational reviews for the Ikeja and Aba branches.
- Increase focus on low-profit product categories.
- Monitor profitability alongside revenue when evaluating business performance.

## Repository Structure

```
retail-revenue-leakage-analysis/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   └── Retail_Revenue_Leakage_Analysis.ipynb
│
├── sql/
│   └── SQL_Retail_Project.sql
│
├── powerbi/
│   └── PowerBI_Retail_Dashboard.pbix
│
├── reports/
│   ├── Technical_Report.pdf
│   └── Presentation.pptx
│
├── dashboard_images/
│
└── README.md
```

## Skills Demonstrated

- Data Cleaning
- Data Wrangling
- Exploratory Data Analysis (EDA)
- SQL Query Development
- Data Modeling (Star Schema)
- DAX
- Business Intelligence
- Dashboard Development
- KPI Design
- Revenue Leakage Analysis
- Profitability Analysis
- Business Storytelling
- Executive Reporting
- Data Visualization

## Dashboard Preview

<img width="782" height="428" alt="image" src="https://github.com/user-attachments/assets/22cd5103-2c61-4e38-8189-da0b23d8c431" />

## Author

**Martins Nduka**
`Email : ndukamartins2019@gmail.com`

Data Analyst & Data Scientist with experience delivering end-to-end analytics solutions using Python, SQL, and Power BI. Passionate about transforming complex business data into actionable insights that drive strategic decision-making.
