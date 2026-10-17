import sys
from pathlib import Path
import dagster as dg
import dlt
from dagster_dlt import DagsterDltResource, dlt_assets

ROOT = Path(__file__).resolve().parent.parent # absolut sökvög till projektets root-mapp
sys.path.insert(0, str(ROOT / "data_extract_load")) # lägger till sökvägen för att kunna importera load_data.py
from load_data import flights_source #lägger till sökvägen för att kunna importera load_data.py

DB_PATH = ROOT / "data" / "swedavia.duckdb" # absolut sökväg till databasen


dlt_resource = DagsterDltResource()

@dlt_assets(
    dlt_source=flights_source(),
    dlt_pipeline=dlt.pipeline(
        pipeline_name="flight_data",
        dataset_name="raw",
        destination=dlt.destinations.duckdb(str(DB_PATH)),
    ),
)
def dlt_load(context: dg.AssetExecutionContext, dlt: DagsterDltResource):
    yield from dlt.run(context=context)

job_dlt = dg.define_asset_job(
    "job_dlt",
    selection =dg.AssetSelection.keys("dlt_flights_source_flights_resource"),
)

schedule_dlt = dg.ScheduleDefinition(
    job=job_dlt,
    cron_schedule="0 10,22 * * *", # körs varje dag vid midnatt och mitt på dagen
    execution_timezone="Europe/Stockholm"
    )

defs = dg.Definitions(
    assets=[dlt_load],
    resources={"dlt": dlt_resource},
    jobs=[job_dlt],
    schedules=[schedule_dlt],
)

