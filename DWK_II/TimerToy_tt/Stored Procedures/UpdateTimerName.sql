CREATE PROCEDURE [tt].[UpdateTimerName]
	  @PageKey char(36)
	, @TimerKey int
	, @TimerName nvarchar(150)
AS

update t set
	TimerName = ltrim(rtrim(@TimerName))
from tt.Timer t
join tt.[Page] p on p.PageKey = t.PageKey
where t.TimerKey = @TimerKey
and p.PageKey = @PageKey
;

return 0;