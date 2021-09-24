CREATE PROCEDURE [tt].[AdjustTimer]
	@TimerKey char(36)
	, @Seconds int
AS


update t set
	  t.ElapsedTime = @Seconds
	, t.StartTime = iif(t.IsRunning = 1, getutcdate(), null)
from tt.Timer t
where t.TimerKey = @TimerKey
;

select *
from tt.vwSelectAll a
where a.TimerKey = @TimerKey;

RETURN 0
