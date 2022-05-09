CREATE PROCEDURE [tt].[ResetTimer]
	  @PageKey char(36)
	, @TimerKey char(36)
AS


update t set
	  t.ElapsedTime = 0
	  , t.StartTime = null
from tt.Timer t
join tt.[Page] p on p.PageKey = @PageKey
where t.TimerKey = @TimerKey
;

return 0;
