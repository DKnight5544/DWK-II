CREATE PROCEDURE [tt].[SelectPageData]
	@PageKey char(36)
AS

	select p.*
	from tt.[Page] p
	where p.PageKey = @PageKey

RETURN 0
