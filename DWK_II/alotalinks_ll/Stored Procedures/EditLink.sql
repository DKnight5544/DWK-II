CREATE PROCEDURE [ll].[EditLink]
	  @Key char(36)
	, @Text nvarchar(50)
	, @Url nvarchar(2083)
	, @AllowEditing bit
	, @AllowAdding bit
AS
	

update l
set 
	  [Text] = coalesce(nullif(@Text,''), 'Add Some Text')
	, [Url] = nullif(@Url,'')
	, AllowEditing = @AllowEditing
	, AllowAdding = @AllowAdding
from ll.Links l
where 1=1
and l.[Key] = @Key
and l.[AllowEditing] = 1;

select * from ll.Links l where l.[Key] = @Key;


RETURN 0
