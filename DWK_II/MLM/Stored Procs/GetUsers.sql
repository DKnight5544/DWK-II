CREATE PROCEDURE [mlm].[GetUsers]
	@LinkName varchar(50)
AS

select * from mlm.Users u where u.LinkName00 = @LinkName;
