CREATE PROCEDURE [tt2].[AddTimer]
	@ParentKey char(36)
AS

declare @TimerKey char(36)= convert(char(36), newid());

-- ensure no dupes
while exists (
	select 1 from tt2.Timer t 
	where t.TimerKey = @TimerKey or t.ReadOnlyKey = @TimerKey) 
begin
	select @TimerKey = convert(char(36), newid());
end

declare @ReadOnlyKey char(36)= convert(char(36), newid());

-- ensure no dupes
while exists (
	select 1 from tt2.Timer t 
	where t.TimerKey = @ReadOnlyKey or t.ReadOnlyKey = @ReadOnlyKey) 
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


insert into tt2.Timer(TimerKey, ReadOnlyKey, TimerName, StartTime, IsRunning, ElapsedTime, CreationTime)
select 
	  [TimerKey] = @TimerKey
	, [ReadOnlyKey] = @ReadOnlyKey
	, [TimerName] = 'Click To Edit'
	, [StartTime] = null
	, [IsRunning] = 0
	, [ElapsedTime] = 0
	, [CreationTime] = GETUTCDATE();
;

insert into tt2.ParentChild (ParentKey, ChildKey)
select @ParentKey, @TimerKey
where @ParentKey is not null

exec tt2.GetTimer @TimerKey;

return