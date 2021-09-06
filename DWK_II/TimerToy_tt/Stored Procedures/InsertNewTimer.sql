CREATE PROCEDURE [tt].[InsertNewTimer]
	 @PageKey char(36)
AS


declare @MaxSortIndex int = (
	select max(t.SortIndex) from tt.Timer t where t.PageKey = @PageKey
)

declare @TimerKey char(36)= convert(char(36), newid());


insert into tt.Timer(TimerKey, TimerDescription, StartTime, IsRunning, ElapsedTime, PageKey, SortIndex)
select 
	  @TimerKey
	, [TimerDescription] = 'Click To Edit'
	, [StartTime] = getutcdate()
	, [IsRunning] = 0
	, [ElapsedTime] = 0	
	, [PageKey] = @PageKey
	, [SortIndex] = coalesce(@MaxSortIndex, 0) + 1 
;

select *
from tt.vwSelectAll a
where a.TimerKey = @TimerKey;

return 0