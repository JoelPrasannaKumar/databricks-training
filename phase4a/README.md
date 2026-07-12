# Phase 4A: Bucketing & Segmentation in PySpark

## Objective
Understand how continuous data is converted into categories (bucketing/segmentation) and learn multiple ways to implement it using PySpark functions. 

## Contents
- **`samples/`**: Contains `customer_spend.csv`, a continuous dataset designed specifically for testing threshold-based bucketing.
- **`pipeline.sql`**: Demonstrates the traditional SQL `CASE` statement to divide data into discrete buckets and uses `NTILE` for quantile approximations.
- **`pipeline.py`**: A comprehensive PySpark script comparing the implementation of 4 distinct bucketing methods.
- **`outputs/`**: Output tables showcasing the categorized segments, bucket boundaries, and calculated quantiles.

## Key Methods Practiced
1. **Conditional Logic:** Using PySpark's `when()` and `otherwise()` functions for business-driven categorization.
2. **MLlib Bucketizer:** Defining hard cutoff arrays and transforming continuous columns using Spark MLlib.
3. **Quantile-based Segmentation:** Using `approxQuantile` to dynamically calculate distribution thresholds for bucketing.
4. **Window-based Ranking:** Leveraging `Window.orderBy()` and `percent_rank()` for relative positioning.
