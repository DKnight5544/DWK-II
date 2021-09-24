CREATE VIEW [tt2].[TimerView]
	AS 	

select	 
	  t.TimerKey
	, t.ReadOnlyKey
	, t.ParentKey
	, t.TimerName
	, t.StartTime
	, t.IsRunning
	, t.CreationTime
	, ElapsedTime = tt2.GetElapsedTime(t.TimerKey)
	, ChildCount = tt2.GetChildCount(t.TimerKey)
from tt2.Timer t
;