# Executive Safety & Operations Dashboard (Power BI)
---
Interactive Power BI analytics solution designed for cross-departmental incident tracking, high-risk zone heatmaps, and proactive safety KPI monitoring across operational sites.

# 🛠 Tech Stack & Tools
* **Power BI Desktop:** Interactive dashboard design and report delivery.

* **DAX (Data Analysis Expressions):** Time-intelligence functions, safety rate ratios, and dynamic KPI logic.

* **Data Modeling:** Star schema architecture (Fact_Incidents, Fact_WorkHours, Dim_Location, Dim_Date).

* **SQL / PostgreSQL:** Source data extraction and pre-aggregation.

# 📊 Key Metrics & DAX Logic
* **Lost Time Injury Frequency Rate (LTIFR):** Normalizes lost-time injuries per 1,000,000 worked hours.

* **High-Risk Rate (%):** Proportion of critical or high-severity incidents requiring immediate mitigation.

* **Days Since Last Incident:** Real-time tracking counter for operational safety streaks.

# 📂 Repository Contents
* **measures_and_model.dax:** Core DAX formulas used for KPI calculations.
