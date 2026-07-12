from pyspark.sql import SparkSession
from pyspark.sql.functions import sum, count, col, when
import os

# Initialize SparkSession
spark = SparkSession.builder \
    .appName("Phase4_Mini_Project") \
    .master("local[*]") \
    .getOrCreate()
spark.sparkContext.setLogLevel("ERROR")

# Load Data
customers = spark.read.option("header", "true").csv("./samples/customers.csv", inferSchema=True)
orders = spark.read.option("header", "true").csv("./samples/orders.csv", inferSchema=True)

print("--- Original Data ---")
customers.show()
orders.show()

# --- Data Cleaning ---
print("--- Cleaning Data ---")
# Remove rows with null keys
customers_clean = customers.dropna(subset=["customer_id"])
orders_clean = orders.dropna(subset=["customer_id"])

# Remove duplicate rows
customers_clean = customers_clean.dropDuplicates()
orders_clean = orders_clean.dropDuplicates()

# Filter invalid values (negative amounts)
orders_clean = orders_clean.filter(col("amount") >= 0)

# Check column types
customers_clean.printSchema()
orders_clean.printSchema()

# --- Tasks ---
print("\n--- Task 1: Daily Sales ---")
daily_sales = orders_clean.groupBy("date").agg(sum("amount").alias("total_sales")).orderBy("date")
daily_sales.show()

print("\n--- Task 2: City-wise Revenue ---")
joined_df = customers_clean.join(orders_clean, "customer_id", "inner")
city_revenue = joined_df.groupBy("city").agg(sum("amount").alias("total_revenue")).orderBy(col("total_revenue").desc())
city_revenue.show()

print("\n--- Task 3: Top 5 Customers ---")
customer_spend = joined_df.groupBy("customer_id", "customer_name").agg(sum("amount").alias("total_spend"))
top_5_customers = customer_spend.orderBy(col("total_spend").desc()).limit(5)
top_5_customers.select("customer_name", "total_spend").show()

print("\n--- Task 4: Repeat Customers (>1 order) ---")
repeat_customers = orders_clean.groupBy("customer_id").agg(count("order_id").alias("order_count")).filter(col("order_count") > 1)
repeat_customers.show()

print("\n--- Task 5: Customer Segmentation ---")
customer_segmentation = customer_spend.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when((col("total_spend") >= 5000) & (col("total_spend") <= 10000), "Silver")
    .otherwise("Bronze")
)
customer_segmentation.select("customer_name", "total_spend", "segment").orderBy(col("total_spend").desc()).show()

print("\n--- Task 6: Final Reporting Table ---")
final_stats = joined_df.groupBy("customer_id", "customer_name", "city").agg(
    sum("amount").alias("total_spend"),
    count("order_id").alias("order_count")
)
final_df = final_stats.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when((col("total_spend") >= 5000) & (col("total_spend") <= 10000), "Silver")
    .otherwise("Bronze")
).select("customer_name", "city", "total_spend", "order_count", "segment").orderBy(col("total_spend").desc())
final_df.show()

print("\n--- Task 7: Save Output ---")
os.makedirs("outputs/report", exist_ok=True)
try:
    final_df.coalesce(1).write.mode('overwrite').csv("outputs/report", header=True)
    print("Report saved successfully to outputs/report")
except Exception as e:
    print(f"Error saving report: {e}")

spark.stop()
