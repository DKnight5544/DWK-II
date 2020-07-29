CREATE PROCEDURE [tt].[DeleteTimer]
	@TimerKey char(36)

AS

-- dont delete the last timer.
declare @PageKey char(36) = (select t.PageKey from tt.Timer t where t.TimerKey = @TimerKey);
declare @TimerCount int = (select count(*) from tt.Timer t where t.PageKey = @PageKey);

delete t
from tt.Timer t
where t.TimerKey = @TimerKey
and @TimerCount > 1;

RETURN 0
