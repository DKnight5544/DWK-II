CREATE PROCEDURE [tt].[AdjustTimer]
	@TimerKey char(36)
	, @Seconds int
AS

declare @IsRunning bit = (select t.IsRunning from tt.Timer t where t.TimerKey = @TimerKey); 

if(@IsRunning = 1) begin

	-- timer is toggeling to OFF
	update t set
		  t.ElapsedTime = t.ElapsedTime + datediff(second, t.StartTime, getutcdate())
		, t.StartTime   = null
		, t.IsRunning   = 0
	from tt.Timer t
	where t.TimerKey = @TimerKey
	;

end

update t set
 t.ElapsedTime = iif(t.ElapsedTime + @Seconds < 0, 0 , t.ElapsedTime + @Seconds)
from tt.Timer t
where t.TimerKey = @TimerKey
;

if(@IsRunning = 1) begin

	-- timer is toggeling to ON
	update t set
		  t.StartTime   = getutcdate()
		, t.IsRunning   = 1
	from tt.Timer t
	where t.TimerKey = @TimerKey

end


select *
from tt.vwSelectAll a
where a.TimerKey = @TimerKey;

RETURN 0
