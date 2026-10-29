\# E-Commerce Analytics Warehouse



\## Project Overview



This project builds an analytical data warehouse using the Brazilian E-Commerce Public Dataset by Olist.



The objective is to transform raw e-commerce data into structured analytical insights using SQL and DuckDB. The project focuses on understanding sales performance, customer purchasing behaviour, product category performance, and delivery efficiency.



The warehouse is designed to demonstrate practical data analytics and data engineering skills, including data ingestion, SQL transformations, analytical queries, and business intelligence reporting.



\## Business Objectives



The project aims to answer the following business questions:



\- How does order volume and revenue change over time?

\- Which product categories generate the highest revenue?

\- What are the purchasing patterns of individual customers?

\- How efficiently are customer orders delivered?

\- What is the relationship between estimated and actual delivery times?

\- Which operational areas could benefit from improvement?



\## Dataset



The project uses the Brazilian E-Commerce Public Dataset by Olist.



The dataset contains information about:



\- Customers

\- Orders

\- Order items

\- Payments

\- Reviews

\- Products

\- Sellers

\- Geolocation

\- Product category translations



The raw CSV files are stored locally in the `data/` directory and are excluded from Git version control.



\## Technology Stack



| Technology | Purpose |

|---|---|

| Python | Data ingestion and automation |

| SQL | Data transformation and business analysis |

| DuckDB | Analytical database |

| Git | Version control |

| GitHub | Project documentation and portfolio |

| Tableau / Power BI | Planned business intelligence dashboard |



\## Project Structure



```text

ecommerce-analytics-warehouse/

│

├── dashboard/

├── data/

├── dbt\_project/

├── documentation/

├── scripts/

│   └── load\_data.py

├── sql/

│   ├── 01\_order\_status\_summary.sql

│   ├── 02\_top\_product\_categories.sql

│   ├── 03\_monthly\_revenue\_trend.sql

│   ├── 04\_customer\_purchase\_analysis.sql

│   └── 05\_delivery\_performance.sql

│

├── .gitignore

├── README.md

└── ecommerce.duckdb

```



\## SQL Analysis



\### 1. Order Status Summary



Analyses order volumes and revenue across different order statuses.



\### 2. Top Product Categories



Identifies the highest-performing product categories based on delivered orders, product revenue, and freight charges.



\### 3. Monthly Revenue Trend



Evaluates monthly revenue and order volume to identify changes in sales performance over time.



\### 4. Customer Purchase Analysis



Analyses customer purchasing behaviour, including delivered order counts, total product revenue, and average order value.



\### 5. Delivery Performance



Evaluates delivery performance by comparing actual delivery times against estimated delivery dates.



\## Data Architecture



The project follows a simple analytical warehouse workflow:



```text

Raw CSV Files

&#x20;    |

&#x20;    v

Python Data Ingestion

&#x20;    |

&#x20;    v

DuckDB Raw Tables

&#x20;    |

&#x20;    v

SQL Analytical Transformations

&#x20;    |

&#x20;    v

Business Analysis

&#x20;    |

&#x20;    v

Dashboard and Reporting

```



\## Key Skills Demonstrated



\- SQL joins and aggregations

\- Analytical data modelling concepts

\- Data ingestion using Python

\- DuckDB database management

\- Business KPI development

\- Revenue and sales analysis

\- Customer purchasing analysis

\- Delivery performance analysis

\- Git and GitHub version control



\## Project Status



The raw data ingestion and initial SQL analysis have been completed.



Further development includes:



\- Improving data quality checks

\- Building a structured analytical data model

\- Developing reusable transformations

\- Creating interactive dashboards

\- Documenting business insights and recommendations



\## Author



Akshay Kedare



MSc Data Analytics



Berlin, Germany

