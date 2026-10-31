
from pathlib import Path
import csv
import duckdb

# Locate the project directory
ROOT = Path(__file__).resolve().parent.parent
DB_PATH = ROOT / "ecommerce.duckdb"
SQL_DIR = ROOT / "sql"
OUTPUT_DIR = ROOT / "outputs"

# Create the outputs folder if it does not exist
OUTPUT_DIR.mkdir(exist_ok=True)

# Connect to the DuckDB database
con = duckdb.connect(str(DB_PATH))

# SQL files and their corresponding CSV output names
queries = {
    "01_order_status_summary.sql": "order_status_summary.csv",
    "02_top_product_categories.sql": "top_product_categories.csv",
    "03_monthly_revenue_trend.sql": "monthly_revenue_trend.csv",
    "04_customer_purchase_analysis.sql": "customer_purchase_analysis.csv",
    "05_delivery_performance.sql": "delivery_performance.csv",
}

for sql_file, csv_file in queries.items():
    sql_path = SQL_DIR / sql_file
    output_path = OUTPUT_DIR / csv_file

    print(f"Exporting {sql_file}...")

    # Read and execute the SQL query
    query = sql_path.read_text(encoding="utf-8")
    result = con.execute(query)

    # Get column names and query results
    column_names = [column[0] for column in result.description]
    rows = result.fetchall()

    # Write the results to CSV
    with output_path.open("w", newline="", encoding="utf-8-sig") as file:
        writer = csv.writer(file)
        writer.writerow(column_names)
        writer.writerows(rows)

    print(f"Saved: {output_path}")

con.close()

print("\nAll five SQL results were exported successfully!")
