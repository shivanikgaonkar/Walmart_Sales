# Walmart Sales Data Analysis (SQL + Python)

This is my **SQL + Python project** on Walmart sales data.  
I built it from scratch to practice **end-to-end data handling, cleaning, database integration, and SQL business analysis**.

---

## Project Overview
- **Tools Used**: Visual Studio Code (VS Code), Python, MySQL  
- **Goal**: Create a structured workspace in VS Code, organize folders, handle datasets, and perform SQL-based business analysis.  

---

## Set Up the Environment
## 1. Tools Installed 
   - Python  
   - MySQL  
   - VS Code  

## 2. Kaggle API Setup  
   - Generated a Kaggle API token (`kaggle.json`) from Kaggle profile settings.  
   - Placed the token inside the local `.kaggle/` folder for authentication.  

## 3. Dataset Download

kaggle datasets download -d najir0123/walmart-10k-sales-datasets
Storage: Saved in /data folder for easy access


---

## 4. Install Required Libraries
Install the necessary Python libraries:


pip install pandas numpy sqlalchemy mysql-connector-python psycopg2


---
## 5. Explore the Data
Performed initial data exploration using:

python
df.info()
df.describe()
df.head()

 This helped me understand column names, datatypes, and spot missing values.

---

## 6. Data Cleaning
When I first got the Walmart sales dataset, it wasn’t fully ready for analysis.  
I went through a structured cleaning process to make it consistent and reliable:

- **Removed Duplicates** → Dropped duplicate rows to avoid double-counting sales.  
- **Handled Missing Values** → Inspected all columns; dropped rows where gaps didn’t affect analysis.  
- **Fixed Data Types** → Converted columns into correct formats (e.g., `date` → `datetime`, prices/quantities → `float` or `int`).  
- **Formatted Currency Values** → Removed `$` symbols using `.replace()` and converted fields to numeric.  
- **Final Validation** → Ensured dataset was clean and ready for feature engineering + SQL analysis.  

---

## 7. Feature Engineering
- Created a new column:  
  ```python
  total_amount = unit_price * quantity

  ---

## 8. Load Data into Databases
- Connected to **MySQL** using **SQLAlchemy**.  
- Created tables and inserted the **cleaned data**.  
- Ran **test queries** to confirm successful data loading.  

---

## 9. SQL Analysis (Business Problem Solving)
Wrote SQL queries to answer **real business questions**, including:

- **Revenue Trends** → Across branches and categories.  
- **Best-Selling Product Categories** → Identified high-performing products.  
- **Sales Performance** → By time, city, and payment method.  
- **Peak Sales Periods & Customer Behavior** → When and how customers shop.  
- **Profit Margin Analysis** → Compared profitability by category and city.  

---

## 10. Project Documentation
All work is documented and organized in this repository:

- `README.md` → Main project documentation.  
- `/sql_queries/` → SQL scripts used for analysis.  
- `/notebooks/` → Python notebooks for exploration and preprocessing.  

---

Project Structure
├── data/            # Raw + cleaned datasets
├── sql_queries/     # SQL scripts
├── notebooks/       # Jupyter notebooks
├── README.md        # Project documentation
├── requirements.txt # Required Python libraries
└── main.py          # Main ETL + analysis script
---

## Results & Insights
- **Sales Insights** → Found top categories, branches with highest sales, and preferred payment methods.  
- **Profitability** → Identified the most profitable categories & cities.  
- **Customer Behavior** → Observed trends in ratings, payment modes, and shopping hours.  

---

## Future Enhancements
- Build an **interactive dashboard** (Tableau / Power BI).  
- Add more **datasets** for deeper insights.  
- Automate the **data pipeline** for real-time ingestion and analysis.  

---

