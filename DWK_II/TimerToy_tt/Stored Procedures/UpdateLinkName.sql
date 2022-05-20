CREATE PROCEDURE [tt].[UpdateLinkName]
	  @PageKey char(36)
	, @LinkKey int
	, @LinkName nvarchar(150)
AS

update l set
	LinkName = trim(@LinkName)
from tt.Link l
join tt.[Page] p on p.PageKey = l.PageKey
where l.LinkKey = @LinkKey
and p.PageKey = @PageKey
;

return 0;
GO