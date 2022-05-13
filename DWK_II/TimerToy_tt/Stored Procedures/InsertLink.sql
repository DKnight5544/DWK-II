CREATE PROCEDURE [tt].[InsertLink]
	 @PageKey char(36)
AS

declare  @NewPageKey char(36) = convert(char(36),newid());
declare  @ReadOnlyKey char(36) = convert(char(36),newid());

insert into tt.[Page](PageKey, ReadOnlyKey, PageName)
select 
	  @NewPageKey
	, @ReadOnlyKey
	, 'Save This Page'
;


insert into tt.Link(LinkName, LinkUrl, PageKey)
select 
	  LinkName = 'New Link'
	, LinkUrl = @NewPageKey
	, PageKey = p.PageKey
from tt.[Page] p
where p.PageKey = @PageKey
;

return 0