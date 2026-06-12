# PySpark Transformations Practice (Topics 11–20)

## 11. join()

The `join()` transformation is used to combine rows from two DataFrames based on a related column.

### Types of Joins
- Inner Join
- Left Join
- Right Join
- Full Outer Join

### Common Use Cases
- Combining employee and department data
- Lookup operations
- Data enrichment

### Example
```python
emp_df.join(dept_df, "department", "inner")
```

---

## 12. union()

The `union()` transformation combines rows from two DataFrames having the same schema and column order.

### Key Points
- Number of columns must be the same.
- Column positions must match.
- Does not remove duplicates.

### Example
```python
emp_df.union(new_emp_df)
```

---

## 13. unionByName()

The `unionByName()` transformation combines DataFrames by matching column names instead of column positions.

### Advantages
- Safer than `union()`
- Works when column order differs
- Supports different schemas using `allowMissingColumns=True`

### Example
```python
emp_df.unionByName(new_emp_df)
```

### With Different Schemas
```python
emp_df.unionByName(
    df2,
    allowMissingColumns=True
)
```

---

## 14. limit()

The `limit()` transformation returns a specified number of rows from a DataFrame.

### Use Cases
- Previewing data
- Fetching top N records
- Sampling small datasets

### Example
```python
emp_df.limit(5)
```

---

## 15. sample()

The `sample()` transformation returns a random subset of rows.

### Parameters

| Parameter | Description |
|------------|------------|
| fraction | Percentage of data to sample |
| seed | Ensures reproducible results |

### Example
```python
emp_df.sample(fraction=0.5, seed=42)
```

### Use Cases
- Testing
- Data exploration
- Machine learning datasets

---

## 16. explode()

The `explode()` function converts each element of an array into a separate row.

### Example Input
```python
["Python", "Spark", "Azure"]
```

### Output
```python
Python
Spark
Azure
```

### Example
```python
skills_df.select(
    explode("skills")
)
```

### Use Cases
- Flattening arrays
- Processing nested data
- Data normalization

---

## 17. split()

The `split()` function divides a string into an array using a delimiter.

### Example
```python
split(col("joining_date"), "-")
```

### Output
```python
["2021", "05", "10"]
```

### Accessing Elements
```python
split(col("joining_date"), "-")[0]
```

### Use Cases
- Parsing dates
- Extracting words
- Processing structured strings

---

## 18. concat() and concat_ws()

### concat()

Combines multiple columns without a separator.

```python
concat(
    col("name"),
    col("department")
)
```

### concat_ws()

Combines multiple columns using a specified separator.

```python
concat_ws(
    "-",
    col("city"),
    col("department")
)
```

### Use Cases
- Employee labels
- Full names
- Report generation

---

## 19. cast()

The `cast()` function converts a column from one data type to another.

### Common Casts

```python
col("salary").cast("double")
col("age").cast("string")
col("joining_date").cast("date")
```

### Use Cases
- Type conversion
- Data cleaning
- Preparing data for analysis

---

## 20. alias()

The `alias()` function renames columns temporarily in query results.

### Example

```python
col("salary").alias("monthly_salary")
```

### Aggregation Example

```python
avg("salary").alias("average_salary")
```

### Join Example

```python
emp_df.alias("e")
dept_df.alias("d")
```

### Benefits
- Improves readability
- Simplifies joins
- Creates meaningful output column names

---

## Summary

| Topic | Purpose |
|---------|---------|
| join() | Combine DataFrames |
| union() | Merge rows by position |
| unionByName() | Merge rows by column names |
| limit() | Retrieve first N rows |
| sample() | Random subset of data |
| explode() | Convert arrays into rows |
| split() | Split strings into arrays |
| concat() | Combine columns |
| cast() | Change data types |
| alias() | Rename columns temporarily |
