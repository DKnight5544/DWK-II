CREATE PROCEDURE [tt].[UpdateLinkUrl]
	  @PageKey char(36)
	, @LinkKey int
	, @LinkUrl nvarchar(max)
AS

update l set
	l.LinkUrl = trim(@LinkUrl)
from tt.Link l
join tt.[Page] p on p.PageKey = l.PageKey
where l.LinkKey = @LinkKey
and p.PageKey = @PageKey
;

return 0;