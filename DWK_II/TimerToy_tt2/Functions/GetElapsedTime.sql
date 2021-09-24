CREATE FUNCTION [tt2].[GetElapsedTime]
(
	@TimerKey char(36)
)
RETURNS INT
AS


BEGIN

	declare @ChildCount int = tt2.GetChildCount(@TimerKey);

	declare @ElapsedTime int = 0;

	if (@ChildCount = 0) begin
		select @ElapsedTime = iif(t.IsRunning = 1, t.ElapsedTime + datediff(second, t.StartTime, getutcdate()), t.ElapsedTime)
		from tt2.Timer t where t.TimerKey = @TimerKey;
	end

	else if (@ChildCount > 0) begin

		declare @Children table (
			TimerKey char(36) not null
		)

		insert into @Children 
		select t.TimerKey from tt2.Timer t where t.ParentKey = @TimerKey;

		

		declare @ChildKey char(36);

		while(select count(*) from @Children) > 0 begin
			select @ChildKey = min(c.TimerKey) from @Children c
			select @ElapsedTime += tt2.GetElapsedTime(@ChildKey);
			delete from @Children where TimerKey = @ChildKey;
		end

	end		
	
	return @ElapsedTime
	
END
