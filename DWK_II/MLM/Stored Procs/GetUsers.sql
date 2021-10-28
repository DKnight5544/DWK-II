CREATE PROCEDURE [mlm].[GetUsers]
	@UserName nvarchar(50)
AS

select * from (

select UserType = 'S', u.UserName, u.DownlineCount, u.InsertDate
from mlm.Users u
where u.UserName = @UserName

Union All

select 'U', u.UserName, u.DownlineCount, u.InsertDate
from mlm.Users u
join mlm.UplineView v on v.UserName = @UserName
where u.UserName in (v.u1Name, v.u2Name, v.u3Name, v.u4Name, v.u5Name)

Union All

select 'D', u.UserName, u.DownlineCount, u.InsertDate
from mlm.Users u
where u.UplineName = @UserName

) x

order by x.InsertDate


;
