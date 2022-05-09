CREATE PROCEDURE [tt].[InsertTimer]
	 @PageKey char(36)
AS


insert into tt.Timer(TimerName, StartTime, ElapsedTime, PageKey)
select
	  [TimerName] = 'New Timer'
	, [StartTime] = null
	, [ElapsedTime] = 0	
	, [PageKey] = p.PageKey
from tt.[Page] p
where p.PageKey = @PageKey
;

return 0