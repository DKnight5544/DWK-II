CREATE PROCEDURE [org].[GetUser]
	@UserName nvarchar(50)
AS

select * 
from org.UserModel v
where v.UserName = @UserName
;
