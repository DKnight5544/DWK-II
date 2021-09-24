CREATE PROCEDURE [tt2].[GetChildren]
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
	  TimerKey = iif(@IsReadOnly = 0, t.TimerKey, t.ReadOnlyKey)
	, t.TimerName
	, t.IsRunning
	, t.ChildCount
	, t.CreationTime
	, t.ElapsedTime
	, IsReadOnly = @IsReadOnly
from tt2.TimerView t
where t.ParentKey = @TimerKey
order by t.CreationTime
;


RETURN 0
