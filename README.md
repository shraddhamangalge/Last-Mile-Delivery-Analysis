# 🚚 Last Mile Delivery Analysis

## 📌 Project Overview

The **Last Mile Delivery Analysis** project focuses on analyzing delivery operations using SQL to understand delivery performance, customer behavior, driver performance, revenue, and operational efficiency.

The project uses a relational database containing information about **customers, drivers, vehicles, deliveries, locations, and ratings**. SQL queries are used to extract meaningful insights from the data and answer important business questions.

The main goal is to help a delivery company identify operational issues, improve delivery performance, understand customer patterns, and make data-driven business decisions.

---

## 🎯 Business Objectives

The project focuses on the following key objectives:

1. **Analyze delivery performance**

   * Understand completed, cancelled, and unsuccessful deliveries.
   * Identify factors affecting delivery efficiency.

2. **Analyze driver performance**

   * Evaluate driver activity and performance.
   * Identify high-performing and low-performing drivers.

3. **Analyze customer behavior**

   * Understand customer ordering patterns.
   * Identify valuable and frequently active customers.

4. **Analyze revenue and business performance**

   * Calculate total and average revenue.
   * Analyze revenue generated across different categories.

5. **Analyze operational efficiency**

   * Examine delivery time, vehicle usage, distance, and other operational factors.
   * Identify areas where the delivery process can be improved.

---

## 🗃️ Database Structure

The project uses a relational MySQL database named:

```sql
last_mile
```

### Main Tables

| Table                  | Description                                               |
| ---------------------- | --------------------------------------------------------- |
| `customers`            | Stores customer information                               |
| `drivers`              | Stores driver details and performance-related information |
| `vehicles`             | Stores vehicle information                                |
| `locations`            | Stores pickup and delivery location details               |
| `rides` / `deliveries` | Stores delivery/ride transaction details                  |
| `ratings`              | Stores customer ratings and feedback                      |

These tables are connected using primary keys and foreign keys to maintain relationships between customers, drivers, vehicles, locations, and deliveries.

---

## 🛠️ Technologies Used

* **MySQL**
* **MySQL Workbench**
* SQL
* Relational Database Concepts

### SQL Concepts Used

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* HAVING
* JOIN
* INNER JOIN
* LEFT JOIN
* CASE statements
* Aggregate Functions
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* Views
* Date Functions
* String Functions
* Conditional Logic

---

## 🔍 Key Analysis Performed

### 1. Delivery Performance Analysis

Analyzed delivery statuses to understand:

* Total number of deliveries
* Completed deliveries
* Cancelled deliveries
* Failed/unsuccessful deliveries
* Delivery success rate
* Average delivery time
* Average delivery distance

---

### 2. Driver Performance Analysis

Analyzed driver-level performance using metrics such as:

* Number of deliveries handled
* Completed deliveries
* Driver ratings
* Revenue generated
* Average delivery performance

This helps identify the most efficient drivers and drivers who may require additional support or training.

---

### 3. Customer Behavior Analysis

Customer-level analysis was performed to identify:

* Most active customers
* Number of deliveries per customer
* Customer spending
* Average order/delivery value
* Customer ratings and feedback

This can help the company understand customer demand and improve customer retention.

---

### 4. Revenue Analysis

Revenue-related analysis includes:

* Total revenue
* Average revenue per delivery
* Revenue by vehicle type
* Revenue by location
* Revenue trends
* Highest revenue-generating segments

These insights help understand the financial performance of delivery operations.

---

### 5. Operational Analysis

Operational factors such as:

* Delivery distance
* Delivery duration
* Vehicle type
* Delivery status
* Location
* Driver performance

were analyzed to identify inefficiencies and opportunities for improvement.

---

## 📊 Sample Business Questions

Some of the important business questions addressed in this project include:

1. What is the total number of deliveries?
2. What percentage of deliveries were successfully completed?
3. Which drivers have handled the highest number of deliveries?
4. Which drivers have the highest average ratings?
5. Who are the most active customers?
6. Which vehicle type is used most frequently?
7. Which locations generate the highest number of deliveries?
8. What is the average delivery distance?
9. What is the total revenue generated?
10. Which segments generate the highest revenue?
11. What are the most common reasons for unsuccessful deliveries?
12. How can delivery efficiency be improved?

---

## 📈 Key Insights

The analysis helps identify important patterns in the delivery business, including:

* Delivery success and failure patterns.
* High-performing drivers and vehicles.
* Frequently used delivery locations.
* Customer ordering behavior.
* Revenue-generating segments.
* Operational factors affecting delivery efficiency.

These insights can be used by management to improve delivery operations and customer satisfaction.

---

## 💡 Business Recommendations

Based on the analysis, a delivery company can consider the following recommendations:

### 🚗 Optimize Vehicle Usage

Assign suitable vehicle types based on delivery distance, location, and operational requirements.

### 👨‍✈️ Improve Driver Performance

Recognize high-performing drivers and provide training or support to drivers with lower performance or ratings.

### 📍 Optimize Delivery Locations

Identify locations with high delivery demand and improve resource allocation in those areas.

### 😊 Improve Customer Experience

Monitor customer ratings and unsuccessful deliveries to identify service issues and improve customer satisfaction.

### 💰 Improve Revenue

Focus on high-revenue segments and optimize pricing, delivery routes, and resource allocation.

---

## 🧠 What I Learned

Through this project, I gained practical experience in:

* Designing and working with relational databases.
* Writing SQL queries for business analysis.
* Using different types of JOINs.
* Applying aggregate functions for KPI calculation.
* Using CTEs and subqueries for complex analysis.
* Using window functions for ranking and comparison.
* Creating analytical views.
* Handling real-world data quality issues.
* Converting business requirements into SQL queries.
* Extracting business insights from structured data.

---

## 📂 Project Structure

```text
Last-Mile-Delivery-Analysis/
│
├── last_mile.sql
├── Last_Mile_Delivery_Analysis.pptx
├── Last_Mile_Delivery_Documentation.docx
└── README.md
```

---

## ▶️ How to Run the Project

### Step 1: Install MySQL

Install **MySQL Server** and **MySQL Workbench**.

### Step 2: Create the Database

Run:

```sql
CREATE DATABASE last_mile;
USE last_mile;
```

### Step 3: Import the Dataset

Import the required CSV files into the corresponding tables.

Make sure the table structures and column names match the SQL queries.

### Step 4: Run the SQL File

Open:

```text
last_mile.sql
```

in MySQL Workbench and execute the queries.

### Step 5: Explore the Analysis

Run the queries individually to understand the results and business insights generated from the database.

---

## 📌 Project Outcome

This project demonstrates how **SQL can be used to transform delivery transaction data into meaningful business insights**.

The analysis provides a structured view of delivery operations, driver performance, customer behavior, revenue, and operational efficiency, helping businesses make better data-driven decisions.

---

## 👩‍💻 Author

**Shraddha Mangalge**

Data Analytics Enthusiast | SQL | Power BI | Excel | Python

---

## ⭐ Project Highlights

* Real-world business problem
* Relational MySQL database
* Multiple connected tables
* Business-oriented SQL questions
* Advanced SQL analysis
* Driver and customer performance analysis
* Revenue and operational analysis
* Data-driven business recommendations
