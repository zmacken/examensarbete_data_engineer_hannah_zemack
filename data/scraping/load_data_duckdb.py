import duckdb

conn = duckdb.connect("data/swedavia.duckdb", read_only=True)
