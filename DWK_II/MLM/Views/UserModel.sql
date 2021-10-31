CREATE VIEW [mlm].[UserModel] AS 

select 
	  u1.UserName
	, u1Name = nullif(u2.UserName, 'TOP')
	, u2Name = nullif(u3.UserName, 'TOP')
	, u3Name = nullif(u4.UserName, 'TOP')
	, u4Name = nullif(u5.UserName, 'TOP')
	, u5Name = nullif(u6.UserName, 'TOP')
from mlm.Users u1  
left join mlm.Users u2 on u2.UserName = u1.UplineName
left join mlm.Users u3 on u3.UserName = u2.UplineName
left join mlm.Users u4 on u4.UserName = u3.UplineName
left join mlm.Users u5 on u5.UserName = u4.UplineName
left join mlm.Users u6 on u6.UserName = u5.UplineName
;