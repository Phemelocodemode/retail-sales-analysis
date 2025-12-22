# Retail Sales Data Analysis – VistaCart

## 📌 Project Overview

This project presents an end-to-end retail sales analysis for a fictional company, **VistaCart**, using SQL, Excel, and Power BI. The objective was to transform raw transactional data into meaningful business insights that support decision-making around sales performance, product strategy, and outlet optimization.

The analysis focuses on understanding sales trends, identifying top-performing products and outlets, and uncovering operational factors that influence revenue and customer satisfaction.

---

## 🎯 Business Objectives

Key objectives of this analysis include:

- Evaluating overall sales performance using key metrics
- Identifying top-performing outlets and product categories
- Analyzing sales variation by outlet type, size, and location
- Understanding the relationship between item visibility, ratings, and sales
- Providing insights to support inventory planning and outlet strategy

---

## 🗂️ Data Description

The dataset represents retail sales transactions and includes the following attributes:

- Item details (type, fat content, visibility, weight)
- Outlet characteristics (type, size, location, establishment year)
- Sales values and customer ratings

The raw dataset was cleaned and transformed into an analysis-ready table using SQL.

---

## 🧹 Data Cleaning & Preparation

Data preparation was performed entirely in SQL and included:

- Handling missing values (e.g. item weight)
- Removing duplicate records
- Standardizing categorical variables (e.g. item fat content)
- Trimming inconsistent text values
- Validating data integrity before analysis

All data cleaning logic is documented in:

```

/sql/01_data_cleaning.sql

```

---

## 📊 Exploratory Data Analysis

Exploratory analysis was conducted to understand dataset structure and performance drivers, including:

- Total sales, average sales, and number of items
- Distribution of sales across outlet types, sizes, and locations
- Product category performance
- Item visibility and rating patterns

Relevant queries are documented in:

```

/sql/02_exploratory_analysis.sql

```

---

## 📈 Business Analysis & Key Insights

The project answers several business questions, such as:

- Which outlets generate the highest total sales?
- What are the top-selling product categories by revenue?
- How does sales performance vary by outlet type and size?
- Is there a relationship between item visibility and sales?
- How do customer ratings differ across outlet types?

Key insights include:

- Medium and large outlets contribute a significant share of total revenue
- Certain product categories consistently outperform others
- Item visibility shows a measurable relationship with average sales
- Outlet location type influences both sales and ratings

All business queries are documented in:

```

/sql/03_business_questions.sql

```

---

## 📊 Dashboard & Visualization

An interactive Power BI dashboard was created to communicate insights effectively. The dashboard highlights:

- Key KPIs (Total Sales, Average Sales, Item Count, Average Rating)
- Sales by outlet type, size, and location
- Top-performing items and outlets
- Product category and rating insights

Dashboard file and screenshots can be found in:

```

/dashboards/

```

---

## 🛠️ Tools & Technologies

- **SQL** – Data cleaning, exploration, and analysis
- **Excel** – Data inspection and validation
- **Power BI** – Dashboarding and visualization

---

## ⚠️ Assumptions & Limitations

- The dataset represents simulated retail operations
- Analysis is based on historical transactional data
- Findings are descriptive and do not include predictive modeling

Further details are documented in:

```

/notes/assumptions_and_limitations.md

```

---

## 👤 Author

**Phemelo Sebopelo**  
BSc Information Technology Graduate  
Data Analytics | SQL | Power BI | Excel
