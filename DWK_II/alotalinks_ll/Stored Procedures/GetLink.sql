CREATE PROCEDURE [ll].[GetLink]
	@Key char(36)
AS	

	select
		*
	from ll.Links l
	where l.[Key] = @Key

RETURN 0
