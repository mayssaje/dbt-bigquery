import pandas as pd
from datetime import datetime

def model(dbt, session):
    source_df = dbt.source("raw", "customers").to_pandas()
    source_df["ingestion_timestamp"] = datetime.utcnow()
    return source_df
