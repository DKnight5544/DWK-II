CREATE FUNCTION [tt2].[GetTimerTable]
(
	@Key char(36)
	,@SelectCode char(1)  -- (T)imer or (C)hildren
)
RETURNS @returntable TABLE
(
	  TimerKey char(36) null
	, ReadOnlyKey char(36) null
	, TimerName varchar(150) null
	, IsRunning bit null
	, ChildCount int null
	, CreationTime datetime null
	, ElapsedTime int null
	, IsReadOnly bit null
)
BEGIN 

declare @IsReadOnly bit;
declare @TimerKey char(36);
declare @ParentKey char(36);

select
	  @IsReadOnly = 0
	, @TimerKey = t.TimerKey
	, @ParentKey = t.ParentKey
from tt2.Timer t
where t.TimerKey = @Key;

if @TimerKey is null begin
	select
		  @IsReadOnly = 1
		, @TimerKey = t.TimerKey
		, @ParentKey = t.ParentKey
	from tt2.Timer t
	where t.ReadOnlyKey = @Key;
end;

insert into @returntable

select 
	  TimerKey = iif(@isReadOnly = 0, t.TimerKey, t.ReadOnlyKey)
	, t.ReadOnlyKey
	, t.TimerName
	, t.IsRunning
	, ChildCount = tt2.GetChildCount(t.TimerKey)
	, t.CreationTime
	, ElapsedTime = tt2.GetElapsedTime(t.TimerKey)
	, IsReadOnly = @IsReadOnly
from tt2.Timer t
where 1=1
and t.ParentKey = @ParentKey 
and t.TimerKey = @TimerKey
and @SelectCode = 'T'

union

select 
	  TimerKey = iif(@isReadOnly = 0, t.TimerKey, t.ReadOnlyKey)
	, t.ReadOnlyKey
	, t.TimerName
	, t.IsRunning
	, ChildCount = tt2.GetChildCount(t.TimerKey)
	, t.CreationTime
	, ElapsedTime = tt2.GetElapsedTime(t.TimerKey)
	, IsReadOnly = @IsReadOnly
from tt2.Timer t
where 1=1
and t.ParentKey = @TimerKey 
and @SelectCode = 'C'

RETURN

END
