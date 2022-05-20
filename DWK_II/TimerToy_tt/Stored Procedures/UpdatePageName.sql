CREATE PROCEDURE [tt].[UpdatePageName]
	  @PageKey char(36)
	, @PageName nvarchar(150)
AS

update u set
	u.PageName = ltrim(rtrim(@PageName))
from tt.Page u 
-- ReadOnly Page Key will get ignored.
where u.PageKey = @PageKey
;

return 0;

GO