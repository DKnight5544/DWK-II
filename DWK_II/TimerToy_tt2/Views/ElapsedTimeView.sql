CREATE VIEW [tt2].[ElapsedTimeView] AS

select 
	t.TimerKey
	, ElapsedTime = iif(t.IsRunning = 1, t.ElapsedTime + datediff(second, t.StartTime, getutcdate()), t.ElapsedTime)
from tt2.Timer t
