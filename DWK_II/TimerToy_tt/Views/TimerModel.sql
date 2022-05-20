CREATE VIEW [tt].[TimerModel] AS 

select 
	t.TimerKey
	, t.TimerName
	, t.IsRunning
	, t.ElapsedTime
from tt.TimerView t
GO