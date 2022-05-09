CREATE PROCEDURE [tt].[SelectPage]
	@PageKey char(36)
AS

	select distinct
		PageKey = @PageKey
		, p.ReadOnlyKey
		, p.PageName
		, IsReadOnly = convert(bit, iif(p.ReadOnlyKey = @PageKey, 1, 0))
	from tt.[Page] p
	where @PageKey in (p.PageKey, p.ReadOnlyKey)

RETURN 0