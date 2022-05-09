CREATE PROCEDURE [tt].[InsertLink]
	 @PageKey char(36)
AS

insert into tt.Link(LinkName, LinkUrl, PageKey)
select 
	  LinkName = 'Please Donate'
	, LinkUrl = 'https://www.paypal.com/paypalme/wigiwiz'
	, PageKey = p.PageKey
from tt.[Page] p
where p.PageKey = @PageKey
;

return 0