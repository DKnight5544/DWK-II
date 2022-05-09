CREATE PROCEDURE [tt].[SelectLinks]
	@PageKey char(36)
AS


	select 
		  LinkKey = iif(@PageKey = p.ReadOnlyKey, 0, l.LinkKey)
		, l.LinkName
		, l.LinkUrl
		, PageKey = @PageKey
	from tt.Link l
	join tt.[Page] p on p.PageKey = l.PageKey
	where @PageKey in (p.PageKey, p.ReadOnlyKey)
	;


RETURN 0