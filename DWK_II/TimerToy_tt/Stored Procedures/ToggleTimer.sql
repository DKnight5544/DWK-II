CREATE PROCEDURE [tt].[ToggleTimer]
	  @TimerKey char(36)
AS

declare @IsRunning bit = (select t.IsRunning from Timer t where t.TimerKey = @TimerKey);

if(@IsRunning = 0) begin

	-- timer is toggeling to ON
	update t set
		  t.StartTime   = getutcdate()
		, t.IsRunning   = 1
	from tt.Timer t
	where t.TimerKey = @TimerKey


end

else begin 

-- timer is toggeling to OFF
update t set
	  t.ElapsedTime = t.ElapsedTime + datediff(second, t.StartTime, getutcdate())
	, t.StartTime   = null
	, t.IsRunning   = 0
from tt.Timer t
where t.TimerKey = @TimerKey
;

end

select *
from tt.vwSelectAll a
where a.TimerKey = @TimerKey;

return 0;