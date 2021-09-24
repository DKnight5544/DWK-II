CREATE VIEW [tt2].[TimerView]
	AS 
	
with cte as (

select	 
	  t.TimerKey
	, t.ReadOnlyKey
	, t.ParentKey
	, t.TimerName
	, t.StartTime
	, t.IsRunning
	, ElapsedTime = case when t.IsRunning = 1 then t.ElapsedTime + datediff(second, t.StartTime, getutcdate())
							else t.ElapsedTime
							end
	, t.CreationTime
from tt2.Timer t

)

, cte2 as (
	select 
		  t.ParentKey
		, ChildrenCount = count(*) 
		, ChildrenElaspsedTime = sum(t.ElapsedTime)
	from cte t
	join cte t2 on t2.ParentKey = t.TimerKey
	where t2.TimerKey <> t2.ParentKey
	group by t.ParentKey

)

select 
	  t.TimerKey
	, t.ParentKey
	, t.ReadOnlyKey
	, t.TimerName
	, t.IsRunning
	, ChildrenCount = isnull(t2.ChildrenCount, 0)
	, t.CreationTime
	, ElapsedTime = case when t2.ChildrenCount > 0 then t2.ChildrenElaspsedTime
					else t.ElapsedTime  
					end
			
from cte t
left join cte2 t2
on t2.ParentKey = t.TimerKey
;