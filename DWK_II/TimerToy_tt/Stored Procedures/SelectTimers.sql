CREATE PROCEDURE [tt].[SelectTimers]
	@PageKey char(36)
AS


	select 
		  TimerKey = iif(@PageKey = p.ReadOnlyKey, 0, t.TimerKey)
		, t.TimerName
		, t.IsRunning
		, t.ElapsedTime
	from tt.TimerView t
	join tt.[Page] p on p.PageKey = t.PageKey
	where @PageKey in (p.PageKey, p.ReadOnlyKey)



RETURN 0