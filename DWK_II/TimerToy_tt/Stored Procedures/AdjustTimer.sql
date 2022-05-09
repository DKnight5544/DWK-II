CREATE PROCEDURE [tt].[AdjustTimer]
	  @PageKey char(36)
	, @TimerKey char(36)
	, @Offset int
AS


update t set
	  t.ElapsedTime = t.ElapsedTime + @Offset
from tt.Timer t
join tt.[Page] p on p.PageKey = @PageKey
where t.TimerKey = @TimerKey
;

update t set
	  t.ElapsedTime = 0
from tt.Timer t
join tt.[Page] p on p.PageKey = @PageKey
where t.TimerKey = @TimerKey
and t.ElapsedTime < 0
;

return 0;
