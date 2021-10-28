CREATE PROCEDURE [mlm].[GetUsers_ForChainletter]
	@UserName nvarchar(50)
AS

select * 
from mlm.UplineView v
where v.UserName = @UserName
;
