CREATE PROCEDURE [tt].[ToggleTimer]
	  @PageKey char(36)
	, @TimerKey int
AS

declare @elapsedTime int;

update t set
		t.StartTime = iif(t.StartTime is null, GETUTCDATE(), null)
		, t.ElapsedTime = iif(
			t.StartTime is null, t.ElapsedTime
			, datediff(second, t.StartTime, getutcdate()) + t.ElapsedTime
			)
from tt.Timer t
join tt.[Page] p on p.PageKey = t.PageKey
where t.TimerKey = @TimerKey
and p.PageKey = @PageKey
;

return 0;