# Transaction Data Processing Workbook

This repository contains a comprehensive dataset and processing logic for retail transaction monitoring. The workbook is designed to demonstrate data cleaning, currency normalization, and risk assessment workflows.

## 📂 Workbook Structure

The spreadsheet is organized into four primary sheets, each representing a stage in the data lifecycle:

### 1. `transactions_raw`
The entry point for all transaction data. This sheet contains the raw, unformatted logs as received from the payment gateways.
* **Key Columns:** `transaction_id`, `merchant_name` (unstandardized), `raw_amount`, `currency`, `status` (mixed casing/codes), `risk_score` (contains string prefixes like 'score:' or 'risk-').
* **Purpose:** Serves as the immutable source of truth before any transformations.

### 2. `Cleaned_Transactions`
The core analytical sheet where data transformation occurs. This sheet uses logic to standardize raw inputs for reporting.
* **Standardization:** Normalizes merchant names (e.g., "alpha mart" → "Alpha Mart") and transaction statuses.
* **Currency Conversion:** Uses lookup logic to convert various currencies (INR, EUR, etc.) into a base currency (USD) for aggregate analysis.
* **Risk Metrics:** Strips non-numeric characters from risk scores to provide a clean integer for filtering.
* **Flags:** Includes `high_value_flag` and `high_value_risk` flags to highlight transactions exceeding specific thresholds.

### 3. `Sheet2` (Exchange Rates)
A reference table providing daily exchange rates.
* **Data Points:** `rate_date`, `currency`, and `usd_rate`.
* **Logic:** This sheet is used by `Cleaned_Transactions` to perform VLOOKUP/Index-Match operations based on the transaction date and currency type.

### 4. `Sheet3` (Merchant Master Data)
A dimension table containing metadata for all participating merchants.
* **Attributes:** `merchant_id`, `account_manager`, `merchant_category` (e.g., Grocery, Electronics), and `default_region`.
* **Summary Data:** Includes `amount_usd` as a rollup of total processed volume per merchant.

## 🛠 Data Processing Logic

### Risk Scoring
The workbook processes risk scores by extracting numerical values from mixed-string formats. A risk score > 70 is generally flagged for manual review within the system logic.

### High-Value Detection
- **High Value Flag:** Triggered when a transaction amount (converted to USD) exceeds a predefined internal threshold.
- **High Value Risk:** A compound flag triggered when a transaction is both "High Value" and has a "Risk Score" above the moderate threshold.

## 📊 Summary Statistics (Sample Data)
- **Primary Regions:** APAC, EU, US.
- **Top Merchants:** Alpha Mart, Beta Stores, City Pharma.
- **Payment Methods:** UPI, Card, NetBanking, Wallet.

---
*Note: This workbook is intended for data engineering and financial analysis demonstrations.*
