CREATE PROCEDURE [tt2].[AddRootTimer]
AS

declare @TimerKey char(36)= convert(char(36), newid());

-- ensure no dupes
while exists (
	select 1 from tt2.Timer t 
	where t.TimerKey = @TimerKey or t.ParentKey = @TimerKey or t.ReadOnlyKey = @TimerKey) 
begin
	select @TimerKey = convert(char(36), newid());
end

declare @ReadOnlyKey char(36)= convert(char(36), newid());

-- ensure no dupes
while exists (
	select 1 from tt2.Timer t 
	where t.TimerKey = @ReadOnlyKey or t.ParentKey = @ReadOnlyKey or t.ReadOnlyKey = @ReadOnlyKey) 
begin
	select @ReadOnlyKey = convert(char(36), newid());
end


insert into tt2.Timer(TimerKey, ReadOnlyKey, ParentKey, TimerName, StartTime, IsRunning, ElapsedTime, CreationTime)
select 
	  [TimerKey] = @TimerKey
	, [ReadOnlyKey] = @ReadOnlyKey
	, [ParentKey] = @TimerKey
	, [TimerName] = 'Click To Edit'
	, [StartTime] = null
	, [IsRunning] = 0
	, [ElapsedTime] = 0
	, [CreationTime] = GETUTCDATE();
;

select *
from tt2.TimerView a
where a.ParentKey = @TimerKey
and a.TimerKey = @TimerKey;

return 0