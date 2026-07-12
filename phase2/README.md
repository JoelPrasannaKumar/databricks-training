# Phase 2: Revised Bridge Pack

## Objective
This phase focuses on bridging the gap between basic SQL-to-PySpark syntax and real-world data engineering tasks. It includes exercises on performing light data cleaning, realistic joins, and aggregations.

## Contents
- **`samples/`**: Contains the `customers.csv` and `orders.csv` datasets with deliberate imperfections for cleaning exercises.
- **`pipeline.sql`**: SQL solutions for all 7 aggregation and join exercises (e.g., total spend, city-wise revenue, identifying repeat customers).
- **`pipeline.py`**: The PySpark equivalent implementation of the SQL logic, mapping SQL joins, filters, and aggregations to DataFrame transformations.
- **`outputs/`**: Generated text results showing the processed data and query answers.

## Key Concepts Practiced
* DataFrame initialization and CSV ingestion.
* Dropping missing rows based on subset columns.
* DataFrame Joins (`inner`, `left_anti`).
* Aggregations (`groupBy`, `sum`, `avg`, `count`).
* Ordering and limits.
