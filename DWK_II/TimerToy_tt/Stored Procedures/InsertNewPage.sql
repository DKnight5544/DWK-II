CREATE PROCEDURE [tt].[InsertNewPage]
AS


declare  @PageKey char(36) = convert(char(36),newid());

while exists ( select 1 from tt.[Page] p where left(p.PageKey, 28) = left(@PageKey, 28) )
begin
	select @PageKey = convert(char(36),newid());
end

insert into tt.Page(PageKey,PageName)
select @PageKey, 'Bookmark this Page - Click To Edit'
;

exec tt.InsertNewTimer @PageKey;

return 0;