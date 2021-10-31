CREATE VIEW [org].[UserModel] AS 


with OwnerCount as (

	select
		  UserName = u1.OwnerName 
		, OwnerCount = count(*)
	from org.[User] u1
	where u1.UserName <> u1.SponsorName
	group by u1.OwnerName

)

, SponsorCount as (

	select
		  UserName = u1.SponsorName 
		, SponsorCount = count(*)
	from org.[User] u1
	where u1.UserName <> u1.SponsorName
	group by u1.SponsorName

)

-- select * from SponsorCount


select
	  u1.[UserName]
	, UserSponsorCount = sc1.SponsorCount
	, UserOwnerCount = oc1.OwnerCount
	, SponsorName = iif(u1.UserName <> u1.SponsorName, u1.[SponsorName], null)
	, SponsorSponsorCount = sc2.SponsorCount
	, SponsorOwnerCount = oc3.OwnerCount
	, OwnerName = iif(u1.UserName <> u1.SponsorName, u1.[OwnerName], null)
	, OwnerSponsorCount = sc3.SponsorCount
	, OwnerOwnerCount = oc3.OwnerCount

from org.[User] u1
join SponsorCount sc1 on sc1.UserName = u1.UserName
left join SponsorCount sc2 on sc2.UserName = u1.SponsorName and u1.UserName <> u1.SponsorName
left join SponsorCount sc3 on sc3.UserName = u1.OwnerName and u1.UserName <> u1.SponsorName
join OwnerCount oc1 on oc1.UserName = u1.UserName
left join OwnerCount oc2 on oc2.UserName = u1.SponsorName and u1.UserName <> u1.SponsorName
left join OwnerCount oc3 on oc3.UserName = u1.OwnerName and u1.UserName <> u1.SponsorName