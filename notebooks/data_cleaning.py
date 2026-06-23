import pandas as pd

files = [
    "candidates.csv",
    "skills.csv",
    "salary_offers.csv",
    "hiring_process.csv"
]

for file in files:
    df = pd.read_csv(f"../data/raw/{file}")

    # Remove duplicates
    df = df.drop_duplicates()

    # Standardize columns
    df.columns = df.columns.str.lower().str.strip()

    # Save cleaned files
    output_name = file.replace(".csv", "_cleaned.csv")
    df.to_csv(f"../data/cleaned/{output_name}", index=False)

    print(f"{file} cleaned successfully!")