CREATE PROCEDURE [tt2].[GetTimer]
	@Key char(36)
AS

select  *
from tt2.GetTimerTable(@Key, 'T') t
order by t.CreationTime
;

RETURN 0
