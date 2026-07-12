from pyspark.sql import SparkSession
from pyspark.sql.functions import col, when, percent_rank, count
from pyspark.sql.window import Window
from pyspark.ml.feature import Bucketizer

# Initialize SparkSession
spark = SparkSession.builder \
    .appName("Phase4A_Bucketing") \
    .master("local[*]") \
    .getOrCreate()
spark.sparkContext.setLogLevel("ERROR")

# Load Data
df = spark.read.option("header", "true").csv("./samples/customer_spend.csv", inferSchema=True)

print("--- Original Data ---")
df.show()

# 1. Create Gold/Silver/Bronze segmentation using conditional logic
print("--- 1. Conditional Logic Segmentation ---")
df_cond = df.withColumn(
    "segment",
    when(df.total_spend > 10000, "Gold")
    .when((df.total_spend >= 5000) & (df.total_spend <= 10000), "Silver")
    .otherwise("Bronze")
)
df_cond.show()

# 2. Group data by segment and count customers
print("--- 2. Segment Counts ---")
segment_counts = df_cond.groupBy("segment").agg(count("customer_id").alias("customer_count"))
segment_counts.show()

# MLlib Bucketizer
print("--- 3a. MLlib Bucketizer ---")
splits = [-float("inf"), 5000, 10000, float("inf")]
bucketizer = Bucketizer(splits=splits, inputCol="total_spend", outputCol="bucket")
df_bucket = bucketizer.transform(df)
df_bucket.show()

# 3b. Quantile-based Segmentation
print("--- 3b. Quantile-based Segmentation ---")
quantiles = df.approxQuantile("total_spend", [0.33, 0.66], 0)
print(f"Calculated Quantiles: {quantiles}")

df_quant = df.withColumn(
    "quantile_segment",
    when(df.total_spend <= quantiles[0], "Low")
    .when((df.total_spend > quantiles[0]) & (df.total_spend <= quantiles[1]), "Medium")
    .otherwise("High")
)
df_quant.show()

# 4. Window-based Ranking (Percentile Rank)
print("--- 4. Window-based Ranking ---")
window = Window.orderBy("total_spend")
df_rank = df.withColumn("rank_pct", percent_rank().over(window))
df_rank.show()

spark.stop()
