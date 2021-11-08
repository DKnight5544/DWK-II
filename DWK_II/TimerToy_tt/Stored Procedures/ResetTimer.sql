CREATE PROCEDURE [tt].[ResetTimer]
	@TimerKey char(36)
AS

update t set
	  t.ElapsedTime = 0
	, t.IsRunning = 0
	, t.StartTime = null

from tt.Timer t
where t.TimerKey = @TimerKey
;


select *
from tt.vwSelectAll a
where a.TimerKey = @TimerKey;

RETURN 0