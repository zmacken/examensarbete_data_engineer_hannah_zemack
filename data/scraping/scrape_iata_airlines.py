import pandas as pd

url = "https://en.wikipedia.org/wiki/List_of_airline_codes"

dfs = pd.read_html(
    url,
    storage_options={"User-Agent": "examensarbete-scraper/1.0 (mail@mail.se)"},
)

df = dfs[0]

print(df.head())

df.to_csv("iata_airlines.csv", index=False)