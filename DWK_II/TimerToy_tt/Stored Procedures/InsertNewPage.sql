CREATE PROCEDURE [tt].[InsertNewPage]
	@PageKey char(36) output
AS

select  @PageKey  = convert(char(36),newid());


declare @IsBookmark bit = 0

insert into tt.Page(PageKey,PageName)
select @PageKey, 'Bookmark this Page - Click To Edit'
;

exec tt.InsertNewTimer @PageKey, @IsBookmark;

return 0;