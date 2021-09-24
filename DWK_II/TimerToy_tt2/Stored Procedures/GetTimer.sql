CREATE PROCEDURE [tt2].[GetTimer]
	@Key char(36)
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

select 
	  TimerKey = @Key
	, t.TimerName
	, t.IsRunning
	, t.ChildCount
	, t.CreationTime
	, t.ElapsedTime
	, IsReadOnly = @IsReadOnly
from tt2.TimerView t
where t.TimerKey = @TimerKey
order by t.CreationTime
;


RETURN 0
