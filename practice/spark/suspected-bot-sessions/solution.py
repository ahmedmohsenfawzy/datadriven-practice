from pyspark.sql.function import col
from pyspark.sql.function import year
rdd = (user_sessions.filter((col("session_duration_sec") < 100) 
  & (year(col("session_start")) == 2026))
  .select("session_id","user_id","session_duration_sec")
)
rdd.show()
