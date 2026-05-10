1. SELECT 
  status_cleaned, 
  COUNT(*) AS transaction_count
FROM transactions
GROUP BY status_cleaned
ORDER BY transaction_count DESC;

2.SELECT 
  merchant_name_cleaned AS merchant, 
  SUM(amount_usd) AS total_captured_gmv
FROM transactions
WHERE status_cleaned = 'Captured'
GROUP BY merchant_name_cleaned
ORDER BY total_captured_gmv DESC;

3.SELECT 
  merchant_name_cleaned AS merchant, 
  SUM(amount_usd) AS total_captured_gmv
FROM transactions
WHERE status_cleaned = 'Captured'
GROUP BY merchant_name_cleaned
ORDER BY total_captured_gmv DESC
LIMIT 10;

4.SELECT 
  transaction_date, 
  SUM(amount_usd) AS daily_gmv, 
  COUNT(transaction_id) AS successful_transaction_count
FROM transactions
WHERE status_cleaned = 'Captured'
GROUP BY transaction_date
ORDER BY transaction_date;

5.SELECT 
  merchant_name_cleaned AS merchant,
  COUNT(transaction_id) AS total_transactions,
  SUM(CASE WHEN status_cleaned = 'Chargeback' THEN 1 ELSE 0 END) AS chargeback_count,
  CAST(SUM(CASE WHEN status_cleaned = 'Chargeback' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(transaction_id) AS chargeback_ratio
FROM transactions
GROUP BY merchant_name_cleaned
HAVING chargeback_ratio > 0.01
ORDER BY chargeback_ratio DESC;

6.SELECT 
  gateway_region,
  AVG(risk_score_numeric) AS avg_risk_score,
  COUNT(transaction_id) AS transaction_count
FROM transactions
GROUP BY gateway_region
HAVING AVG(risk_score_numeric) > 50 
  AND COUNT(transaction_id) > 20;

7.SELECT 
  user_id, 
  transaction_date, 
  COUNT(transaction_id) AS failed_or_cb_count
FROM transactions
WHERE status_cleaned IN ('Failed', 'Chargeback')
GROUP BY user_id, transaction_date
HAVING COUNT(transaction_id) >= 3
ORDER BY failed_or_cb_count DESC;
8. SELECT 
    merchant_name_cleaned AS merchant,
    COUNT(transaction_id) AS chargeback_count,
    COUNT(DISTINCT user_id) AS unique_affected_users,
    SUM(amount_usd) AS total_chargeback_amount_usd
FROM transactions
WHERE status_cleaned = 'Chargeback'
GROUP BY merchant_name_cleaned
ORDER BY total_chargeback_amount_usd DESC;

