COPY raw.flights FROM 'export_mapp/raw_flights.csv' (FORMAT 'csv', force_not_null ('_dlt_load_id', '_dlt_id'), quote '"', delimiter ',', HEADER 1);
COPY raw.flights__code_share_data FROM 'export_mapp/raw_flights__code_share_data.csv' (FORMAT 'csv', force_not_null ('_dlt_parent_id', '_dlt_list_idx', '_dlt_id'), quote '"', delimiter ',', HEADER 1);
COPY raw.flights__remarks_english FROM 'export_mapp/raw_flights__remarks_english.csv' (FORMAT 'csv', force_not_null ('_dlt_parent_id', '_dlt_list_idx', '_dlt_id'), quote '"', delimiter ',', HEADER 1);
COPY raw.flights__remarks_swedish FROM 'export_mapp/raw_flights__remarks_swedish.csv' (FORMAT 'csv', force_not_null ('_dlt_parent_id', '_dlt_list_idx', '_dlt_id'), quote '"', delimiter ',', HEADER 1);
COPY raw.flights__via_destinations FROM 'export_mapp/raw_flights__via_destinations.csv' (FORMAT 'csv', force_not_null ('_dlt_parent_id', '_dlt_list_idx', '_dlt_id'), quote '"', delimiter ',', HEADER 1);
COPY raw._dlt_loads FROM 'export_mapp/raw__dlt_loads.csv' (FORMAT 'csv', force_not_null ('load_id', 'status', 'inserted_at'), quote '"', delimiter ',', HEADER 1);
COPY raw._dlt_pipeline_state FROM 'export_mapp/raw__dlt_pipeline_state.csv' (FORMAT 'csv', force_not_null ('version', 'engine_version', 'pipeline_name', 'state', 'created_at', '_dlt_load_id', '_dlt_id'), quote '"', delimiter ',', HEADER 1);
COPY raw._dlt_version FROM 'export_mapp/raw__dlt_version.csv' (FORMAT 'csv', force_not_null ('version', 'engine_version', 'inserted_at', 'schema_name', 'version_hash', 'schema'), quote '"', delimiter ',', HEADER 1);
