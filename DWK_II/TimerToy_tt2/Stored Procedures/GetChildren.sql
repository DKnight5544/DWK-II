CREATE PROCEDURE [tt2].[GetChildren]
	@Key char(36)
AS

select  *
from tt2.GetTimerTable(@Key, 'C') t
order by t.CreationTime
;

RETURN 0
