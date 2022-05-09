CREATE VIEW [tt].[TimerView] AS

select
	t.TimerKey
	, t.TimerName
	, IsRunning = iif(t.StartTime is null, 0, 1)
	, ElapsedTime = iif(
						t.StartTime is null
					, t.ElapsedTime
					, datediff(second, t.StartTime, getutcdate()) + t.ElapsedTime
					)
	, t.PageKey
from tt.Timer t