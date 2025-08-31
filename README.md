# Walmart_Sales

 ##Project Overview
This is my SQL + Python project on Walmart sales data.
I built it from scratch to practice end-to-end data handling, cleaning, database integration, and SQL business analysis.

1. Set Up the Environment
Tools Used: Visual Studio Code (VS Code), Python, SQL (MySQL)
Goal: Create a structured workspace in VS Code and organize folders for smooth development & data handling.

2. Set Up Kaggle API
API Setup: I generated my Kaggle API token from my profile settings and downloaded the JSON file.
Configuration: Placed the kaggle.json file in the local .kaggle/ folder.

3.Dataset Download:
kaggle datasets download -d I used this to directly download Walmart sales datasets into my project.
Download Walmart Sales Data Source: Kaggle Walmart Sales Dataset Storage: Saved in the data/ folder for easy access. 
Dataset Link : https://www.kaggle.com/najir0123/walmart-10k-sales-datasets

4.Install Required Libraries
Installed the required Python libraries: pip install pandas numpy sqlalchemy mysql-connector-python psycopg2

5.Explore the Data
I did an initial data exploration using:
df.info() ,df.describe() ,df.head() 
This helped me understand column names, datatypes, and spot missing values.

6.Data Cleaning
When I first got the Walmart sales dataset, it wasn’t fully ready for analysis. So, I went through a structured cleaning process to make it consistent and reliable: 
Removed Duplicates - Any duplicates were dropped to avoid double-counting sales and skewing results. 
Handled Missing Values -I inspected all columns for missing data. If the missing values were minor and didn’t impact analysis, I dropped them.
Fixed Data Types - Converted columns into proper formats (e.g., dates → datetime, prices/quantities → float or int).This made calculations and SQL loading smooth. 
Formatted Currency Values -Some columns had symbols like $ in price fields. I used .replace() to strip symbols and ensure all values were numeric.
Final validation step ensured the dataset was fully ready for feature engineering and SQL analysis.

7.Feature Engineering 
Created a total_amount column → unit_price * quantity .This helped with SQL aggregation & sales insights.

8.Load Data into Databases 
Connected to MySQL using SQLAlchemy.Created tables and inserted cleaned data.Ran test queries to confirm everything loaded correctly.

9.SQL Analysis (Business Problem Solving)

Wrote queries to answer real business questions: Revenue trends across branches & categories Best-selling product categories Sales performance by time, city, and payment method Peak sales periods & customer behavior Profit margin analysis

10.Project Documentation
Documented everything in: README.md (this file) SQL scripts (/sql_queries/) Python notebooks (/notebooks/)

Project Structure
|-- data/             # Raw + cleaned datasets
|-- sql_queries/      # SQL scripts
|-- notebooks/        # Jupyter notebooks
|-- README.md         # Project documentation
|-- requirements.txt  # Required Python libraries
|-- main.py           # Main ETL + analysis script

Results & Insights
Sales Insights: Found top categories, branches with highest sales, and preferred payment methods.
Profitability: Identified the most profitable categories & cities.
Customer Behavior: Observed trends in ratings, payment modes, and shopping hours.

Future Enhancements
Build an interactive dashboard (Tableau/Power BI).
Add more datasets for deeper insights.
Automation of the data pipeline for real-time data ingestion and analysis.
