CREATE PROCEDURE [tt].[DeleteLink]
	  @PageKey char(36)
	, @LinkKey int
AS


delete l
from tt.Link l
join tt.[Page] p on p.PageKey = l.PageKey
where l.LinkKey = @LinkKey
and p.PageKey = @PageKey;

RETURN 0

GO