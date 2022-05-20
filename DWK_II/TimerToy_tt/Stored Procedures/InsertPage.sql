CREATE PROCEDURE [tt].[InsertPage]
AS


declare  @PageKey char(36) = convert(char(36),newid());
declare  @ReadOnlyKey char(36) = convert(char(36),newid());

insert into tt.[Page](PageKey, ReadOnlyKey, PageName)
select 
	  @PageKey
	, @ReadOnlyKey
	, 'Save This Page'
;

select PageKey = @PageKey

return 0;
GO