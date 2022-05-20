CREATE PROCEDURE [tt].[DeleteTimer]
	  @PageKey char(36)
	, @TimerKey int
AS


delete t
from tt.Timer t
join tt.[Page] p on p.PageKey = t.PageKey
where t.TimerKey = @TimerKey
and p.PageKey = @PageKey;

RETURN 0

GO