select
  endpoint,
  count(call_id) as total_calls,
  round(avg(latency),2) as avg_latency,
  round(count(case when latency > 500 then 1 end), 2) as high_latency_count
from api_calls
group by endpoint
having count(call_id) >= 5;
