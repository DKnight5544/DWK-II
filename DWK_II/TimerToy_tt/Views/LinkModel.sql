CREATE VIEW [tt].[LinkModel] AS 

select 
	l.LinkKey
	, l.LinkName
	, l.LinkUrl
from tt.Link l
GO