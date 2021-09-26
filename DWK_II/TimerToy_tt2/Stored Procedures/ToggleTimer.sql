CREATE PROCEDURE [tt2].[ToggleTimer]
	  @TimerKey char(36)
AS

declare @IsRunning bit = (select t.IsRunning from tt2.Timer t where t.TimerKey = @TimerKey );
declare @ChildrenCount int = tt2.GetChildCount(@TimerKey);


if(@IsRunning = 0) begin

	-- timer is toggeling to ON
	update t set
		  t.StartTime = getutcdate()
		, t.IsRunning = 1
	from tt2.Timer t
	where t.TimerKey = @TimerKey
	and @ChildrenCount = 0
	;


end

else begin 

	-- timer is toggeling to OFF
	update t set
		  t.ElapsedTime = t.ElapsedTime + datediff(second, t.StartTime, getutcdate())
		, t.StartTime   = null
		, t.IsRunning   = 0
	from tt2.Timer t
	where t.TimerKey = @TimerKey
	and @ChildrenCount = 0
	;

end

exec tt2.GetTimer @TimerKey

return 0;