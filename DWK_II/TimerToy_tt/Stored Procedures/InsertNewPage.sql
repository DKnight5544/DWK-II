CREATE PROCEDURE [tt].[InsertNewPage]
AS


declare  @PageKey char(36) = convert(char(36),newid());

insert into tt.Page(PageKey,PageName)
select @PageKey, 'Bookmark this Page - Click To Edit'
;

exec tt.InsertNewTimer @PageKey;

return 0;