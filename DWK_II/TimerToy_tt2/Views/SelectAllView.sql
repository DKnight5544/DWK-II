CREATE VIEW [tt2].[SelectAllView] AS 

select
	  pc.ParentKey
	, t.TimerKey
	, t.ReadOnlyKey
	, t.TimerName
	, t.CreationTime
	, t.StartTime
	, t.IsRunning
	, ElapsedTime = iif(t.IsRunning = 1, t.ElapsedTime + datediff(second, t.StartTime, getutcdate()), t.ElapsedTime)
	, ChildCount = tt2.GetChildCount(t.TimerKey)

from tt2.Timer t
left join tt2.ParentChild pc 
on pc.ChildKey = t.TimerKey
