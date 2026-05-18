-- ASSIGNMENT_STRDATANUM SOLUTIONS
-- Questions 1 to 10
-- Level 1 Questions 1 to 20

-- QUESTION 1
SELECT
    emp_id,
    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS proper_case_name,
    UPPER(emp_name) AS upper_name,
    LOWER(emp_name) AS lower_name,
    ROUND(base_salary + IFNULL(bonus,0),0) AS total_income,
    YEAR(joining_date) AS joining_year,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) > 7
            THEN 'Senior'
        WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) BETWEEN 4 AND 7
            THEN 'Mid'
        ELSE 'Junior'
    END AS employee_category
FROM employee_payments;

-- QUESTION 2
SELECT
    order_id,
    UPPER(customer_name) AS customer_name,
    DATEDIFF(
        IFNULL(delivery_date, CURDATE()),
        order_date
    ) AS delivery_days,
    IFNULL(delivery_date, CURDATE()) AS final_delivery_date,
    TRUNCATE(order_amount,1) AS truncated_amount,
    CASE
        WHEN delivery_date IS NULL
            THEN 'Pending'
        WHEN DATEDIFF(delivery_date, order_date) = 0
            THEN 'Same-day'
        WHEN DATEDIFF(delivery_date, order_date) > 3
            THEN 'Delayed'
        ELSE 'Normal'
    END AS delivery_status
FROM orders_delivery;

-- QUESTION 3
SELECT
    cust_id,
    CONCAT(
        UPPER(LEFT(cust_name,1)),
        LOWER(SUBSTRING(cust_name,2))
    ) AS customer_name,
    MONTHNAME(purchase_date) AS purchase_month,
    ROUND(purchase_amount,0) AS rounded_amount,
    ABS(purchase_amount) AS absolute_amount,
    CASE
        WHEN purchase_amount > 15000
            THEN 'High spender'
        WHEN purchase_amount BETWEEN 8000 AND 15000
            THEN 'Medium'
        ELSE 'Low'
    END AS spending_category
FROM customer_spending;

-- QUESTION 4
SELECT
    user_id,
    user_email,
    SUBSTRING_INDEX(user_email, '@', -1) AS email_domain,
    TIMESTAMPDIFF(MONTH, start_date, end_date) AS subscription_months,
    FORMAT(subscription_fee, 2) AS formatted_fee,
    DATEDIFF(end_date, CURDATE()) AS remaining_days,
    CASE
        WHEN end_date < CURDATE()
            THEN 'Expired'
        WHEN DATEDIFF(end_date, CURDATE()) <= 30
            THEN 'Expiring Soon'
        ELSE 'Active'
    END AS subscription_status
FROM subscriptions;

-- QUESTION 5
SELECT
    loan_id,
    UPPER(customer_name) AS customer_name,
    ROUND(
        (
            loan_amount *
            (interest_rate / 100) / 12
        ),
        2
    ) AS monthly_interest,
    TIMESTAMPDIFF(YEAR, loan_start, CURDATE()) AS years_since_loan,
    ROUND(
        (
            loan_amount *
            (interest_rate / 100) / 12
        ),
        0
    ) AS rounded_emi,
    CASE
        WHEN interest_rate > 9
            THEN 'High Risk'
        WHEN interest_rate BETWEEN 8 AND 9
            THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_category
FROM loan_details;

-- QUESTION 6
SELECT
    emp_id,
    LOWER(emp_name) AS employee_name,
    ROUND(
        (present_days * 100.0) / total_days,
        2
    ) AS attendance_percentage,
    MONTHNAME(record_date) AS month_name,
    (total_days - present_days) AS absent_days,
    CASE
        WHEN ((present_days * 100.0) / total_days) >= 90
            THEN 'Excellent'
        WHEN ((present_days * 100.0) / total_days) BETWEEN 75 AND 89
            THEN 'Average'
        ELSE 'Poor'
    END AS attendance_status
FROM attendance;

-- QUESTION 7
SELECT
    product_id,
    CONCAT(
        UPPER(LEFT(product_name,1)),
        LOWER(SUBSTRING(product_name,2))
    ) AS product_name,
    ABS(mrp - selling_price) AS discount_amount,
    ROUND(
        ((mrp - selling_price) / mrp) * 100,
        2
    ) AS discount_percentage,
    DAYNAME(sale_date) AS sale_day,
    CASE
        WHEN selling_price < mrp
            THEN 'Valid Discount'
        WHEN selling_price > mrp
            THEN 'Overpriced'
        ELSE 'No Discount'
    END AS discount_status
FROM product_sales;

-- QUESTION 8
SELECT
    policy_id,
    UPPER(holder_name) AS holder_name,
    TIMESTAMPDIFF(YEAR, policy_start, policy_end) AS policy_duration_years,
    DATEDIFF(policy_end, CURDATE()) AS remaining_days,
    ROUND(premium_amount,0) AS rounded_premium,
    CASE
        WHEN policy_end < CURDATE()
            THEN 'Expired'
        WHEN TIMESTAMPDIFF(YEAR, policy_start, policy_end) >= 3
            THEN 'Long Term'
        ELSE 'Mid Term'
    END AS policy_status
FROM insurance_policies;

-- QUESTION 9
SELECT
    emp_id,
    LOWER(emp_name) AS employee_name,
    TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) AS years_since_hike,
    CASE
        WHEN rating = 5
            THEN current_salary * 1.20
        WHEN rating = 4
            THEN current_salary * 1.10
        WHEN rating = 3
            THEN current_salary * 1.05
        ELSE current_salary
    END AS incremented_salary,
    ROUND(
        CASE
            WHEN rating = 5
                THEN current_salary * 1.20
            WHEN rating = 4
                THEN current_salary * 1.10
            WHEN rating = 3
                THEN current_salary * 1.05
            ELSE current_salary
        END,
        0
    ) AS rounded_new_salary,
    CASE
        WHEN rating = 5
            THEN 'High Increment'
        WHEN rating = 4
            THEN 'Moderate'
        ELSE 'No Increment'
    END AS increment_status
FROM salary_revision;

-- QUESTION 10
SELECT
    account_id,
    customer_name,
    ABS(balance) AS absolute_balance,
    DATEDIFF(CURDATE(), last_transaction) AS days_since_transaction,
    CONCAT(
        UPPER(LEFT(branch,1)),
        LOWER(SUBSTRING(branch,2))
    ) AS branch_name,
    SIGN(balance) AS balance_sign,
    CASE
        WHEN balance < 0
            THEN 'Overdrawn'
        WHEN DATEDIFF(CURDATE(), last_transaction) > 365
            THEN 'Dormant'
        ELSE 'Active'
    END AS account_status
FROM bank_accounts;

-- LEVEL 1 QUESTION 1
SELECT
    emp_id,
    LOWER(emp_name) AS employee_name,
    ROUND(
        salary - (salary * tax_percent / 100),
        0
    ) AS net_salary,
    YEAR(last_revision) AS revision_year,
    TIMESTAMPDIFF(MONTH, last_revision, CURDATE()) AS months_since_revision,
    CASE
        WHEN tax_percent > 20
             AND TIMESTAMPDIFF(MONTH, last_revision, CURDATE()) > 24
            THEN 'Flag Tax Shock'
        WHEN tax_percent BETWEEN 15 AND 20
            THEN 'Flag Review Needed'
        ELSE 'Stable'
    END AS salary_status
FROM salary_audit;

-- LEVEL 1 QUESTION 2
SELECT
    emp_code,
    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS employee_name,
    ROUND(
        (bonus / base_salary) * 100,
        2
    ) AS bonus_percentage,
    DAYNAME(bonus_date) AS bonus_day,
    ABS(base_salary - bonus) AS salary_bonus_difference,
    CASE
        WHEN ((bonus / base_salary) * 100) > 30
             AND DAYNAME(bonus_date) IN ('Saturday', 'Sunday')
            THEN 'Suspicious'
        WHEN ((bonus / base_salary) * 100) <= 20
            THEN 'Normal'
        ELSE 'Audit'
    END AS bonus_status
FROM bonus_monitor;

-- LEVEL 1 QUESTION 3
SELECT
    emp_id,
    UPPER(emp_name) AS employee_name,
    TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS actual_experience,
    ABS(
        declared_experience -
        TIMESTAMPDIFF(YEAR, joining_date, CURDATE())
    ) AS experience_difference,
    FLOOR(salary) AS floor_salary,
    CASE
        WHEN declared_experience >
             TIMESTAMPDIFF(YEAR, joining_date, CURDATE())
            THEN 'Overstated'
        WHEN declared_experience <
             TIMESTAMPDIFF(YEAR, joining_date, CURDATE())
            THEN 'Understated'
        ELSE 'Matched'
    END AS experience_status
FROM employee_experience;

-- LEVEL 1 QUESTION 4
SELECT
    emp_id,
    emp_name,
    RIGHT(emp_name, 2) AS last_two_characters,
    DAY(credit_date) AS credit_day,
    TRUNCATE(salary, 0) AS truncated_salary,
    MOD(TRUNCATE(salary, 0), 10) AS salary_mod,
    CASE
        WHEN MOD(TRUNCATE(salary, 0), 10) = DAY(credit_date)
            THEN 'Pattern Match'
        ELSE 'No Match'
    END AS pattern_status
FROM salary_digits;

-- LEVEL 1 QUESTION 5
SELECT
    emp_id,
    LOWER(emp_name) AS employee_name,
    DAYNAME(payment_date) AS weekday_name,
    ROUND(salary, 0) AS rounded_salary,
    MOD(ROUND(salary,0), 2) AS salary_mod,
    CASE
        WHEN MOD(ROUND(salary,0), 2) = 0
             AND DAY(payment_date) MOD 2 = 1
            THEN 'Violation'
        ELSE 'Compliant'
    END AS compliance_status
FROM payroll_control;

-- LEVEL 1 QUESTION 6
SELECT
    emp_id,
    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS employee_name,
    TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) AS years_since_hike,
    POWER(
        TIMESTAMPDIFF(YEAR, last_hike, CURDATE()),
        2
    ) AS inflation_power,
    ROUND(
        salary *
        POWER(
            1.05,
            TIMESTAMPDIFF(YEAR, last_hike, CURDATE())
        ),
        0
    ) AS salary_impact,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) > 5
            THEN 'High Inflation Risk'
        WHEN TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) BETWEEN 3 AND 5
            THEN 'Moderate'
        ELSE 'Low'
    END AS inflation_status
FROM inflation_watch;

-- LEVEL 1 QUESTION 7
SELECT
    emp_id,
    UPPER(emp_name) AS employee_name,
    YEAR(record_date) AS record_year,
    SIGN(salary) AS salary_sign,
    ABS(salary) AS absolute_salary,
    CASE
        WHEN SIGN(salary) = -1
            THEN 'Negative Error'
        WHEN SIGN(salary) = 0
            THEN 'Zero Salary'
        ELSE 'Valid'
    END AS salary_status
FROM salary_integrity;

-- LEVEL 1 QUESTION 8
SELECT
    emp_id,
    emp_name,
    LENGTH(emp_name) AS name_length,
    TIMESTAMPDIFF(YEAR, join_date, CURDATE()) AS years_of_service,
    ROUND(salary, 0) AS rounded_salary,
    CASE
        WHEN LENGTH(emp_name) >
             TIMESTAMPDIFF(YEAR, join_date, CURDATE())
            THEN 'Name Bias'
        ELSE 'Neutral'
    END AS comparison_status
FROM name_salary;

-- LEVEL 1 QUESTION 9
SELECT
    emp_id,
    emp_name,
    MONTHNAME(paid_date) AS month_name,
    CEIL(salary) AS ceil_salary,
    LAST_DAY(paid_date) AS last_day_of_month,
    CASE
        WHEN paid_date = LAST_DAY(paid_date)
            THEN 'End Month Spike'
        ELSE 'Regular'
    END AS salary_status
FROM salary_monthly;

-- LEVEL 1 QUESTION 10
SELECT
    emp_id,
    emp_name,
    LEFT(emp_name, 1) AS first_character,
    TRUNCATE(salary, 0) AS truncated_salary,
    (
        FLOOR(TRUNCATE(salary,0) / 10000) +
        FLOOR((TRUNCATE(salary,0) % 10000) / 1000) +
        FLOOR((TRUNCATE(salary,0) % 1000) / 100) +
        FLOOR((TRUNCATE(salary,0) % 100) / 10) +
        (TRUNCATE(salary,0) % 10)
    ) AS digit_sum,
    DAY(audit_date) AS audit_day,
    CASE
        WHEN (
            FLOOR(TRUNCATE(salary,0) / 10000) +
            FLOOR((TRUNCATE(salary,0) % 10000) / 1000) +
            FLOOR((TRUNCATE(salary,0) % 1000) / 100) +
            FLOOR((TRUNCATE(salary,0) % 100) / 10) +
            (TRUNCATE(salary,0) % 10)
        ) > DAY(audit_date)
            THEN 'Digit Alert'
        ELSE 'Normal'
    END AS audit_status
FROM digit_audit;

-- LEVEL 1 QUESTION 11
SELECT
    emp_id,
    emp_name,
    LEFT(bank_code, 4) AS bank_prefix,
    DAYNAME(credit_date) AS weekday_name,
    ROUND(salary, 0) AS rounded_salary,
    MOD(ROUND(salary,0), 5) AS salary_mod,
    CASE
        WHEN DAYNAME(credit_date) IN ('Saturday', 'Sunday')
             AND MOD(ROUND(salary,0), 5) = 0
            THEN 'Weekend Fraud'
        WHEN LEFT(bank_code,4) = 'HDFC'
            THEN 'Bank Review'
        ELSE 'Normal'
    END AS fraud_status
FROM salary_credit_audit;

-- LEVEL 1 QUESTION 12
SELECT
    emp_id,
    LOWER(emp_name) AS employee_name,
    HOUR(credit_ts) AS credit_hour,
    FLOOR(salary) AS floor_salary,
    ABS(
        FLOOR(salary) - HOUR(credit_ts)
    ) AS salary_hour_difference,
    CASE
        WHEN HOUR(credit_ts) BETWEEN 0 AND 3
            THEN 'Midnight Drift'
        WHEN HOUR(credit_ts) > 18
            THEN 'After Hours'
        ELSE 'Business Hours'
    END AS credit_status
FROM salary_time_drift;

-- LEVEL 1 QUESTION 13
SELECT
    emp_id,
    emp_name,
    TRUNCATE(salary, 2) AS truncated_salary,
    ABS(
        ROUND(salary, 2) -
        TRUNCATE(salary, 2)
    ) AS precision_difference,
    DAYNAME(record_date) AS day_name,
    LENGTH(emp_name) AS name_length,
    CASE
        WHEN ABS(
                ROUND(salary, 2) -
                TRUNCATE(salary, 2)
             ) > 0.01
            THEN 'Precision Loss'
        ELSE 'Safe'
    END AS precision_status
FROM salary_precision;

-- LEVEL 1 QUESTION 14
SELECT
    emp_id,
    UPPER(emp_name) AS employee_name,
    TIMESTAMPDIFF(YEAR, last_hike, CURDATE()) AS years_since_hike,
    POWER(
        growth_rate,
        TIMESTAMPDIFF(YEAR, last_hike, CURDATE())
    ) AS growth_power,
    ROUND(
        base_salary *
        POWER(
            growth_rate,
            TIMESTAMPDIFF(YEAR, last_hike, CURDATE())
        ),
        0
    ) AS projected_salary,
    CASE
        WHEN ROUND(
                base_salary *
                POWER(
                    growth_rate,
                    TIMESTAMPDIFF(YEAR, last_hike, CURDATE())
                ),
                0
             ) > 150000
            THEN 'Explosive Growth'
        WHEN ROUND(
                base_salary *
                POWER(
                    growth_rate,
                    TIMESTAMPDIFF(YEAR, last_hike, CURDATE())
                ),
                0
             ) BETWEEN 100000 AND 150000
            THEN 'Controlled'
        ELSE 'Stagnant'
    END AS growth_status
FROM salary_growth;

-- LEVEL 1 QUESTION 15
SELECT
    emp_id,
    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS employee_name,
    TRUNCATE(salary, 0) AS salary_without_decimal,
    REVERSE(TRUNCATE(salary,0)) AS reversed_salary,
    DAYNAME(processed_date) AS weekday_name,
    CASE
        WHEN TRUNCATE(salary,0) =
             REVERSE(TRUNCATE(salary,0))
            THEN 'Symmetric Pay'
        ELSE 'Asymmetric'
    END AS symmetry_status
FROM salary_symmetry;

-- LEVEL 1 QUESTION 16
SELECT
    emp_id,
    emp_name,
    YEAR(credit_date) AS credit_year,
    CASE
        WHEN (
                YEAR(credit_date) % 4 = 0
                AND YEAR(credit_date) % 100 != 0
             )
             OR YEAR(credit_date) % 400 = 0
            THEN 'Leap Year'
        ELSE 'Non-Leap Year'
    END AS leap_year_check,
    CEIL(salary) AS ceil_salary,
    DAYOFYEAR(credit_date) AS day_of_year,
    CASE
        WHEN MONTH(credit_date) = 2
             AND DAY(credit_date) = 29
            THEN 'Leap Credit'
        ELSE 'Non-Leap Credit'
    END AS credit_status
FROM leap_salary;

-- LEVEL 1 QUESTION 17
SELECT
    emp_id,
    LOWER(emp_name) AS employee_name,
    CASE
        WHEN MONTH(credit_date) >= 4
            THEN CONCAT(
                    YEAR(credit_date),
                    '-',
                    YEAR(credit_date) + 1
                 )
        ELSE CONCAT(
                YEAR(credit_date) - 1,
                '-',
                YEAR(credit_date)
             )
    END AS fiscal_year,
    MONTHNAME(credit_date) AS month_name,
    FORMAT(salary, 2) AS formatted_salary,
    CASE
        WHEN MONTH(credit_date) = 3
            THEN 'Year End Credit'
        WHEN MONTH(credit_date) = 4
            THEN 'Year Start Credit'
        ELSE 'Mid Year'
    END AS fiscal_status
FROM fiscal_salary;

-- LEVEL 1 QUESTION 18
SELECT
    emp_id,
    emp_name,
    RAND() AS random_value,
    ROUND(salary, 0) AS rounded_salary,
    DAYNAME(record_date) AS day_name,
    LEFT(emp_name, 1) AS first_character,
    CASE
        WHEN RAND() > 0.7
            THEN 'Sampled'
        ELSE 'Skipped'
    END AS sampling_status
FROM salary_sampling;

-- LEVEL 1 QUESTION 19
SELECT
    emp_id,
    emp_name,
    ASCII(LEFT(emp_name,1)) AS ascii_value,
    TIMESTAMPDIFF(YEAR, join_date, CURDATE()) AS years_of_joining,
    FLOOR(salary) AS floor_salary,
    CASE
        WHEN ASCII(LEFT(emp_name,1)) >
             TIMESTAMPDIFF(YEAR, join_date, CURDATE())
            THEN 'Name Dominates'
        ELSE 'Experience Dominates'
    END AS comparison_status
FROM salary_ascii;

-- LEVEL 1 QUESTION 20
SELECT
    emp_id,
    UPPER(emp_name) AS employee_name,
    DAY(credit_date) AS credit_day,
    MONTH(credit_date) AS credit_month,
    RIGHT(TRUNCATE(salary,0), 2) AS last_two_salary_digits,
    ABS(
        DAY(credit_date) - MONTH(credit_date)
    ) AS day_month_difference,
    CASE
        WHEN DAY(credit_date) = MONTH(credit_date)
             OR RIGHT(TRUNCATE(salary,0),2) =
                LPAD(MONTH(credit_date),2,'0')
            THEN 'Calendar Match'
        ELSE 'Calendar Drift'
    END AS calendar_status
FROM salary_calendar;
