CREATE PROCEDURE [ll].[DeleteLink]
	  @Key char(36)
AS
	
	delete from ll.Links 
	where [Key] = @Key;


RETURN 0
