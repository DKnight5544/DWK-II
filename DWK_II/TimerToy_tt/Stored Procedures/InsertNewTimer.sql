CREATE PROCEDURE [tt].[InsertNewTimer]
	 @PageKey char(36)
	 , @IsBookMark bit
AS


declare @MaxSortIndex int = (
	select max(t.SortIndex) from tt.Timer t where t.PageKey = @PageKey
)

declare @TimerKey char(36)
	, @NewPageKey nvarchar(36);

if (@IsBookMark = 0) begin
	select @TimerKey = convert(char(36), newid());
end
else begin
	exec tt.InsertNewPage @NewPageKey;
	select @TimerKey = @NewPageKey;
end

insert into tt.Timer(TimerKey, TimerDescription, StartTime, IsRunning, IsBookmark, ElapsedTime, PageKey, SortIndex)
select 
	  @TimerKey
	, [TimerDescription] = 'Click To Edit'
	, [StartTime] = getutcdate()
	, [IsRunning] = 0
	, [IsBookmark] = @IsBookMark
	, [ElapsedTime] = 0	
	, [PageKey] = @PageKey
	, [SortIndex] = coalesce(@MaxSortIndex, 0) + 1 
;


select *
from tt.vwSelectAll a
where a.TimerKey = @TimerKey;

return 0