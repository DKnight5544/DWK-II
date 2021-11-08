CREATE VIEW [tt].[vwSelectAll]
	AS 

select
	  p.PageKey
	, p.PageName
	, t.TimerKey
	, t.TimerDescription
	, t.IsRunning
	, t.SortIndex
	, ElapsedTime = iif(t.IsRunning = 1, t.ElapsedTime + datediff(second, t.StartTime, getutcdate()), t.ElapsedTime)
from tt.[Page] p
join tt.Timer t on t.PageKey = p.PageKey
;
GO