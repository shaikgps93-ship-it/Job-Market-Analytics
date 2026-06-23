import pandas as pd

files = [
    "../data/cleaned/candidates_cleaned.csv",
    "../data/cleaned/skills_cleaned.csv",
    "../data/cleaned/salary_offers_cleaned.csv",
    "../data/cleaned/hiring_process_cleaned.csv"
]

for file in files:
    df = pd.read_csv(file)
    print("\n", file)
    print(df.columns.tolist())