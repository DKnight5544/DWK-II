CREATE PROCEDURE [ll].[AddLink]
	  @ParentKey varchar(36)
AS


declare @AllowAdding bit = (
	select l.AllowAdding
	from ll.Links l
	where l.[Key] = @ParentKey
)


declare @Key char(36) = convert(varchar(36), newid());

select @ParentKey = nullif(@ParentKey,'')



insert into ll.Links ([Key], [Text], [Url], [ParentKey])
select 
	  @Key
	, [Text] = iif(@ParentKey is null, 'Please Bookmark this Page','Please Contribute')
	, [Url] =  iif(@ParentKey is null, null, 'https://paypal.me/wigiwiz')
	, [ParentKey] = @ParentKey
where @AllowAdding = 1 or @ParentKey is null
	;
	
select * from ll.Links l where l.[Key] = @Key;

return 0;