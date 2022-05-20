CREATE PROCEDURE [tt].[SelectLinks]
	@PageKey char(36)
AS


;with Step1 as (

	select 
		  LinkKey = iif(@PageKey = p.ReadOnlyKey, 0, l.LinkKey)
		, l.LinkName
		, l.LinkUrl
		, Url36 = right(l.LinkUrl, 36)
		, PageKey = @PageKey
	from tt.Link l
	join tt.[Page] p on p.PageKey = l.PageKey
	where @PageKey in (p.PageKey, p.ReadOnlyKey)

)

-- select * from Step1

, Step2 as (

	select 
		s.*
		, p.ReadOnlyKey
	from Step1 s
	left join tt.[Page] p
	on p.PageKey = s.Url36

)

, Step3 as (

	select
		s.LinkKey
		, s.LinkName
		, s.LinkUrl
		, s.Url36
		, s.PageKey
		, s.ReadOnlyKey
		, NewLinkUrl = case when (s.LinkKey = 0 AND s.ReadOnlyKey is not null) then replace(s.LinkUrl, s.Url36, s.ReadOnlyKey)
					else s.LinkUrl 
					end 

	from Step2 s

)

select
		s.LinkKey
		, s.LinkName
		, LinkUrl = s.NewLinkUrl
		, s.PageKey
from Step3 s

RETURN 0
GO