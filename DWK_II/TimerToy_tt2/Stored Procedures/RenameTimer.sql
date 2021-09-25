CREATE PROCEDURE [tt2].[RenameTimer]
	@Key char(36)
	, @NewName nvarchar(150)
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
set t.TimerName = @NewName
from tt2.Timer t
where t.TimerKey = @TimerKey
and @IsReadOnly = 0
and nullif(@NewName,'') is not null

exec tt2.GetTimer @Key

RETURN 0
