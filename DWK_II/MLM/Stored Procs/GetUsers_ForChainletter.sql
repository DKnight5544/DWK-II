CREATE PROCEDURE [mlm].[GetUsers_ForChainLetter]
	@UserName nvarchar(50)
AS

select * 
from mlm.UplineView v
where v.UserName = @UserName
;
