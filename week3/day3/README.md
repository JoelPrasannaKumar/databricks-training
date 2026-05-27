# Session 1 - Reading CSV Files

This notebook shows how to read CSV files in Databricks using Spark and display the data.

## What is Covered

- Reading a CSV file with `spark.read.format("csv")`
- Setting `header=True`
- Setting `inferschema=True`
- Loading data from a file path
- Displaying the DataFrame using `display()`

## Files Read

### 1. empData.csv
```python
df = spark.read.format("csv").option('header', True).option('inferschema', True).load("/Volumes/workspace/default/databricks_2027/empData.csv")
df.display()

### 2. Big Sales.csv

```python
df = spark.read.format("csv") \
    .option("header", True) \
    .option("inferschema", True) \
    .load("/Volumes/workspace/default/databricks_2027/Big Sales.csv")

df.display()
```
