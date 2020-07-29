CREATE PROCEDURE [tt].[SelectAllByPage]
	@PageKey char(36)
AS

	select *
	from tt.vwSelectAll x
	where x.PageKey = @PageKey

RETURN 0
