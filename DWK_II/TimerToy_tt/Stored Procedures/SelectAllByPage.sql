CREATE PROCEDURE [tt].[SelectAllByPage]
	@PageKey char(36)
AS

	if exists (select 1 from tt.[Page] p where p.PageKey = @PageKey) 
	begin
		select *
		from tt.vwSelectAll x
		where x.PageKey = @PageKey;
		return 0;
	end

	
	select 
		  PageKey = left(x.PageKey, 28) + 'READONLY'
		, x.PageName
		, TimerKey = null
		, x.TimerDescription
		, x.IsRunning
		, x.SortIndex
		, x.ElapsedTime
	from tt.vwSelectAll x
	where left(x.PageKey, 28) = left(@PageKey, 28);

RETURN 0