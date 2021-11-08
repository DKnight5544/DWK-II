CREATE PROCEDURE [tt].[UpdateTimerName]
	@TimerKey char(36),
	@TimerDescription nvarchar(150)
AS


update t set
	TimerDescription = ltrim(rtrim(@TimerDescription))
from tt.Timer t
where t.TimerKey = @TimerKey
;

select *
from tt.vwSelectAll a
where a.TimerKey = @TimerKey;

return 0;