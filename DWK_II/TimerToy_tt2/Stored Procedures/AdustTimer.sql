CREATE PROCEDURE [tt2].[AdjustTimer]
	@Key char(36),
	@Seconds int
AS

declare @IsReadOnly bit;
declare @TimerKey char(36);

select
	  @IsReadOnly = 0
	, @TimerKey = t.TimerKey
from tt2.Timer t
where t.TimerKey = @Key;

if @TimerKey is null begin
	select
		  @IsReadOnly = 1
		, @TimerKey = t.TimerKey
	from tt2.Timer t
	where t.ReadOnlyKey = @Key;
end

update t
set t.ElapsedTime += @Seconds
from tt2.Timer t
where t.TimerKey = @TimerKey
and @IsReadOnly = 0;

exec tt2.GetTimer @Key

RETURN 0

GO