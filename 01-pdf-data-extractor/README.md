# Automated PDF Data Extraction Pipeline
---
Automated Python solution designed to process PDF documents, extract text snippets and table counts, clean formatting anomalies, and export structured datasets to CSV format for downstream reporting and analytics.

## 🛠 Tech Stack

* **Python 3.x**

* **pdfplumber:**
PDF layout parsing and table detection.


* **pandas:** Data cleaning, normalization, and CSV export.

## 🚀 How to Run

* **Install dependencies:**
```
pip install pdfplumber pandas
```

* **Place target file:**
```
Save your PDF file as sample.pdf in the project directory.
```

* **Execute the script:**
 ```
python script.py
```

* **Output:**
```
Generates extracted_output.csv containing page indices, text excerpts, and table counts.
```
