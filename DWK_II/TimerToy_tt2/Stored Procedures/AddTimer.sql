CREATE PROCEDURE [tt2].[AddTimer]
	@ParentKey char(36)
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

-- Make Sure that if the parent timer is turn off and reset
update t set
	  t.ElapsedTime = 0
	, t.StartTime   = null
	, t.IsRunning   = 0
from tt2.Timer t
where t.TimerKey = @ParentKey;


insert into tt2.Timer(TimerKey, ReadOnlyKey, ParentKey, TimerName, StartTime, IsRunning, ElapsedTime, CreationTime)
select 
	  [TimerKey] = @TimerKey
	, [ReadOnlyKey] = @ReadOnlyKey
	, [ParentKey] = @ParentKey
	, [TimerName] = 'Click To Edit'
	, [StartTime] = null
	, [IsRunning] = 0
	, [ElapsedTime] = 0
	, [CreationTime] = GETUTCDATE();
;

select 
	  a.TimerKey
	, a.TimerName
	, a.IsRunning
	, a.ChildCount
	, a.CreationTime
	, a.ElapsedTime
	, IsReadOnly = convert(bit, 0)
from tt2.TimerView a
where a.ParentKey = @ParentKey
and a.TimerKey = @TimerKey;

return 0