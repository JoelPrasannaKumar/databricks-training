# Databricks - Week 3 (Day 4 & Day 5)

This folder contains my practice work on PySpark DataFrame Operations in Databricks.

## Topics Covered

### SELECT Operations
- Selecting single and multiple columns
- Selecting columns with conditions
- Excluding columns dynamically
- Using `select()`

### ALIAS
- Renaming columns temporarily using:
  - `alias()`

### FILTER / WHERE
- Filtering rows using:
  - `filter()`
  - `where()`
- Conditions used:
  - `>`, `<`, `>=`, `<=`
  - `&` (AND)
  - `|` (OR)
  - `startswith()`
  - `endswith()`
  - `contains()`

### WITHCOLUMNRENAMED
- Renaming DataFrame columns
- Chaining multiple renames

### WITHCOLUMN
- Creating new columns
- Updating existing columns
- Conditional columns using `when()`
- Salary calculations
- Age category classification

## Concepts Practiced

- PySpark DataFrames
- DataFrame Transformations
- Column Expressions
- Method Chaining
- Conditional Logic
- Dynamic Column Selection

## Technologies Used

- Python
- PySpark
- Databricks Notebook

## Sample Functions Used

```python
select()
filter()
where()
alias()
withColumn()
withColumnRenamed()
when()
otherwise()
startswith()
endswith()
contains()
```

## Learning Outcome

Through these exercises, I practiced:
- Writing PySpark DataFrame queries
- Transforming and filtering datasets
- Creating derived columns
- Working with DataFrame schemas
- Understanding immutable DataFrames

## Repository Structure

```text
databricks/
└── week3/
    ├── day4/
    └── day5/
```

> The outputs are available in the `assignment.ipynb` file itself.

## Author

Joel Prasanna Kumar  
B.Tech CSE (AI & DS)
