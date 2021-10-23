CREATE PROCEDURE [tt2].[GetTimer]
	@TimerKey char(36)
AS

select 
	  TimerKey = iif(@TimerKey = t.TimerKey, t.TimerKey, t.ReadOnlyKey)
	, t.ReadOnlyKey
	, t.TimerName
	, t.IsRunning
	, ChildCount = tt2.GetChildCount(t.TimerKey)
	, t.CreationTime
	, t.ElapsedTime
	, IsReadOnly = convert(bit, iif(@TimerKey = t.TimerKey, 0, 1))

from tt2.SelectAllView t
where t.TimerKey = @TimerKey
or t.ReadOnlyKey = @TimerKey;

RETURN 0
