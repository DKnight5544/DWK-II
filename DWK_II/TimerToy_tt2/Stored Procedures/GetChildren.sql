CREATE PROCEDURE [tt2].[GetChildren]
	@ParentKey char(36)
AS

select 
	  TimerKey = iif(pc.ChildKey = t.TimerKey, t.TimerKey, t.ReadOnlyKey)
	, t.ReadOnlyKey
	, t.TimerName
	, t.IsRunning
	, ChildCount = tt2.GetChildCount(t.TimerKey)
	, t.CreationTime
	, t.ElapsedTime
	, IsReadOnly = convert(bit, iif(pc.ChildKey = t.TimerKey, 0, 1))

from tt2.ParentChild pc
join tt2.SelectAllView t 
on t.TimerKey = pc.ChildKey or t.ReadOnlyKey = pc.ChildKey

where pc.ParentKey = @ParentKey

RETURN 0

GO