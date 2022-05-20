CREATE VIEW [tt].[PageModel] AS

select
	  p.PageKey 
	, p.ReadOnlyKey
	, p.PageName
	, IsReadOnly = convert(bit, 0)
from tt.[Page] p
GO