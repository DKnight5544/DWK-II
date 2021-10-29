CREATE VIEW [mlm].[UplineView] AS 

select 
	  u1.UserName
	, u1.DownlineCount
	, u1.ClickCount
	, u1Name = nullif(u1.UplineName, 'TOP')
	, u2Name = nullif(u2.UplineName, 'TOP')
	, u3Name = nullif(u3.UplineName, 'TOP')
	, u4Name = nullif(u4.UplineName, 'TOP')
	, u5Name = nullif(u5.UplineName, 'TOP')
from mlm.Users u1  
left join mlm.Users u2 on u2.UserName = u1.UplineName
left join mlm.Users u3 on u3.UserName = u2.UplineName
left join mlm.Users u4 on u4.UserName = u3.UplineName
left join mlm.Users u5 on u5.UserName = u4.UplineName

;