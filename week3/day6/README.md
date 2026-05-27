# Employee Data Transformations with PySpark

This Databricks notebook demonstrates essential PySpark DataFrame operations including schema creation, column transformations, type casting, sorting, and filtering using an employee dataset.
> The outputs are available in the `assignment.ipynb` file itself.
## Table of Contents
* [Dataset Overview](#dataset-overview)
* [Key Operations & Features](#key-operations--features)
  * [1. Feature Engineering & Column Transformations](#1-feature-engineering--column-transformations)
  * [2. Type Casting](#2-type-casting)
  * [3. Sorting and Ordering](#3-sorting-and-ordering)
  * [4. Filtering and Data Limiting](#4-filtering-and-data-limiting)
* [How to Run](#how-to-run)

---

## Dataset Overview

The notebook initializes a mock dataset containing **50 employee records** with the following schema fields:
* `emp_id` (Long): Unique identifier for the employee.
* `emp_name` (String): First name of the employee.
* `age` (Long): Age of the employee.
* `city` (String): Location/City of the employee.
* `designation` (String): Job title.
* `salary` (Long): Current annual salary.
* `joining_date` (String/Date): Date of joining.
* `department` (String): Assigned organizational department.

---

## Key Operations & Features

### 1. Feature Engineering & Column Transformations
The notebook leverages `df.withColumn()` alongside PySpark functions (`when`, `concat_ws`, `substring`, `year`) to generate new insights:
* **Location Concatenation:** Merges `city` and `department` (e.g., `Hyderabad-IT`).
* **Salary Adjustments:** Calculates a 15% salary increment (`salary * 1.15`) as well as a 5% deduction (`salary * 0.95`).
* **Conditional Flagging (`when / otherwise`):** * Classifies experience status as `'experienced'` if joined before 2022, else `'fresher'`.
  * Creates a high-salary flag (`is_high_salary`) for records where the salary exceeds 70,000.
* **String & Date Manipulations:** Extracts the length of employee names and pulls the first 3 characters of the department names to generate department codes.

### 2. Type Casting
Demonstrates how to safely alter DataFrame schemas using `col().cast()` for individual and multiple columns simultaneously:
* Casting numeric fields to `String`, `Float`, `Double`, and `Integer`.
* Properly formatting date strings into native `date` objects.

### 3. Sorting and Ordering
Shows variations of ordering records using single or multiple features:
* Sorting salaries and ages in descending (`desc()`) order.
* Combining multi-column sorts (e.g., sorting alphabetically by `city` ascending, and then by `salary` descending).

### 4. Filtering and Data Limiting
Implements basic data reduction methods:
* Filtering down rows to specific subsets (e.g., only `IT` department employees or employees over 30 years old).
* Using `.limit(n)` to cap outputs for quick inspection or top-N analysis (like extracting the top 5 highest-paid employees).

---

## How to Run

1. Attach this notebook to any active **Databricks Spark Cluster** (Serverless or standard pool clusters).
2. Ensure `pyspark.sql.functions` are imported via:
   ```python
   from pyspark.sql.functions import *
