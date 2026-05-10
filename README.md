# Quick-Pay-Sid218

**Project Overview**
This repository contains a complete end-to-end data pipeline for a Fintech ecosystem. The project demonstrates the transformation of messy, multi-currency transaction logs into clean, actionable business intelligence.
The workflow covers five critical domains:
1.	Data Engineering: Cleaning and standardizing multi-currency transaction data.
2.	Financial Logic: Implementing risk scoring and high-value transaction flagging.
3.	SQL Analytics: Querying complex business questions from relational datasets.
4.	Python Automation: Building a reconciliation engine and JSON normalization script.
5.	Visualization: Creating a high-level executive dashboard for real-time monitoring.
________________________________________
🛠 Tools Used
•	Excel/Google Sheets: Data cleaning, VLOOKUP/XLOOKUP, and complex conditional formatting.
•	SQL: Data aggregation, window functions, and multi-table joins.
•	Python (Pandas): Automated data reconciliation and API response flattening.
•	Looker Studio: KPI tracking and interactive dashboarding.
________________________________________
📂** Repository Structure**
Plaintext
<repo-root>/
├── 01_data/
│   ├── raw/                 # Original, untouched source files
│   └── processed/           # Final CSV outputs from Excel, SQL, and Python
├── 02_spreadsheet/          # Spreadsheet workbook and logic documentation
├── 03_sql/                  # SQL scripts and result summaries
├── 04_python/               # Jupyter notebook and reconciliation metrics
└── 05_visualization/        # Link to the live Looker Studio dashboard
________________________________________
🚀 Module Details
Part 1: Spreadsheet Cleaning & Business Logic
•	Standardization: Normalized merchant names, regional casing, and date formats.
•	Currency Conversion: Automated USD conversion using exchange_rates.csv.
•	Flagging Logic: * high_value_flag: Region-specific thresholds (APAC > 5k, EU > 6k, US > 7k).
o	high_risk_flag: Triggered by risk scores $\ge$ 70 or chargeback status.
Part 2: SQL Business Analysis
Includes 8 core queries in analysis_queries.sql to assess:
•	Total Captured GMV by merchant.
•	Chargeback ratios and high-risk regional trends.
•	Detection of fraudulent user patterns (repeated failures/chargebacks).
Part 3: Python Reconciliation & JSON Normalization
•	Reconciliation Engine: A Pandas-based workflow to identify "Amount Mismatches" and "Status Discrepancies" between the internal Ledger and the Payment Gateway.
•	JSON Flattening: Normalizing nested API responses into a clean tabular structure (api_normalized.csv).
•	Automated Reporting: Generates a summary_metrics.json reflecting the total health of the data pipeline.
Part 4: Dashboard Visualization
A live Looker Studio dashboard providing:
•	Headline KPIs: Total GMV, Success Rate, and Amount at Risk.
•	Trend Analysis: Daily transaction performance.
•	Breakdowns: Performance by Payment Method, Region, and Merchant.
________________________________________
📖 Run Instructions
1.	Data: All processed outputs can be found in 01_data/processed/.
2.	SQL: Queries are labeled -- Q1 through -- Q8 in 03_sql/analysis_queries.sql.
3.	Python: * Navigate to 04_python/.
o	Run pip install pandas (if not installed).
o	Execute the fintech_pipeline.ipynb notebook to see the reconciliation logic and JSON flattening.
4.	Dashboard: Access the link located in 05_visualization/dashboard_link.txt.
________________________________________
Note: This project adheres to the strict folder structure and naming conventions required for Fintech data auditing.

