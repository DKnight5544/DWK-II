CREATE FUNCTION [tt2].[GetElapsedTime]
(
	@Key char(36)
)
RETURNS INT
AS


BEGIN

	declare @ElapsedTime int = 0;

	declare @TimerCount int = tt2.GetChildCount(@Key);

	if(@TimerCount = 0) begin
		select @ElapsedTime = sum(t.ElapsedTime)
		from tt2.ElapsedTimeView t
		where t.TimerKey = @Key;
	end
	else begin	
		select @ElapsedTime = sum(t.ElapsedTime)
		from tt2.ElapsedTimeView t
		join tt2.ParentChild pc on pc.ChildKey = t.TimerKey
		where pc.ParentKey = @Key;
	end
	
	return @ElapsedTime
	
END
