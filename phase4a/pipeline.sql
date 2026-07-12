-- Phase 4A: Bucketing & Segmentation

-- 1. Create Gold/Silver/Bronze segmentation using conditional logic
SELECT 
    customer_id,
    customer_name,
    total_spend,
    CASE 
        WHEN total_spend > 10000 THEN 'Gold'
        WHEN total_spend >= 5000 AND total_spend <= 10000 THEN 'Silver'
        ELSE 'Bronze'
    END AS segment
FROM customer_spend;

-- 2. Group data by segment and count customers
WITH SegmentedCustomers AS (
    SELECT 
        customer_id,
        CASE 
            WHEN total_spend > 10000 THEN 'Gold'
            WHEN total_spend >= 5000 AND total_spend <= 10000 THEN 'Silver'
            ELSE 'Bronze'
        END AS segment
    FROM customer_spend
)
SELECT segment, COUNT(customer_id) as customer_count
FROM SegmentedCustomers
GROUP BY segment
ORDER BY customer_count DESC;

-- Note: SQL does not have a direct equivalent to MLlib Bucketizer or simple approxQuantile, 
-- but NTILE can be used for quantile-based bucketing (e.g. 3 buckets)
SELECT 
    customer_id,
    customer_name,
    total_spend,
    NTILE(3) OVER (ORDER BY total_spend) as quantile_bucket
FROM customer_spend;
