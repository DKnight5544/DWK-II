CREATE PROCEDURE [cl].[GetUsers]
	@LinkName varchar(50)
AS

select * from cl.Users u where u.LinkName00 = @LinkName;
