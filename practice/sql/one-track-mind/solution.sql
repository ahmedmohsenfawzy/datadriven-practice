with cte as(
select user_id
from api_calls
where user_id is not null and lower(method) != 'get'
), 
cte2 as(
select endpoint, count(distinct user_id) as get_only_users, dense_rank() over(order by count(distinct user_id)desc) as rnk
from api_calls
where user_id is not null and lower(method) = 'get' and user_id not in (select user_id from cte)
group by endpoint
)
select endpoint, get_only_users
from cte2
where rnk = 1
