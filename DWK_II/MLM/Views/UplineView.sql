CREATE VIEW [mlm].[UplineView] AS 

select 
	u1.UserName
	, u1Name = u1.UplineName
	, u2Name = u2.UplineName
	, u3Name = u3.UplineName
	, u4Name = u4.UplineName
	, u5Name = u5.UplineName
from mlm.Users u1  
left join mlm.Users u2 on u2.UserName = u1.UplineName
left join mlm.Users u3 on u3.UserName = u2.UplineName
left join mlm.Users u4 on u4.UserName = u3.UplineName
left join mlm.Users u5 on u5.UserName = u4.UplineName

;