CREATE PROCEDURE [mlm].[AddClick]
	@UserName nvarchar(50)
AS

update u set u.ClickCount += 1 
from mlm.Users u 
where u.UserName = @UserName
;