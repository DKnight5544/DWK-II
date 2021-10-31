CREATE PROCEDURE [mlm].[GetUser]
	@UserName nvarchar(50)
AS

select * 
from mlm.UserModel v
where v.UserName = @UserName
;
