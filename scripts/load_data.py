from pathlib import Path
import duckdb

# Locate the project and source data folders
PROJECT_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = PROJECT_DIR / "data"
DATABASE_PATH = PROJECT_DIR / "ecommerce.duckdb"

def main():
    if not DATA_DIR.exists():
        raise FileNotFoundError(f"Data folder not found: {DATA_DIR}")

    csv_files = sorted(DATA_DIR.glob("*.csv"))

    if not csv_files:
        raise FileNotFoundError(f"No CSV files found in: {DATA_DIR}")

    print(f"Project folder: {PROJECT_DIR}")
    print(f"Found {len(csv_files)} CSV files.")
    print("Creating database...")

    with duckdb.connect(str(DATABASE_PATH)) as connection:
        for csv_file in csv_files:
            table_name = "raw_" + csv_file.stem
            safe_table_name = table_name.replace('"', '""')
            csv_path = str(csv_file.resolve())

            connection.execute(
                f'CREATE OR REPLACE TABLE "{safe_table_name}" AS '
                "SELECT * FROM read_csv_auto(?)",
                [csv_path],
            )

            row_count = connection.execute(
                f'SELECT COUNT(*) FROM "{safe_table_name}"'
            ).fetchone()[0]

            print(f"Loaded {table_name}: {row_count:,} rows")

    print("\nSUCCESS: All CSV files have been loaded.")
    print(f"Database saved at: {DATABASE_PATH}")

if __name__ == "__main__":
    main()