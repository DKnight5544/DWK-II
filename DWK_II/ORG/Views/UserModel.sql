CREATE VIEW [org].[UserModel] AS 

select
	  UserName = u.[UserName]
	, UserSponsorCount = (select count(*) from org.[User] where SponsorName = u.UserName and UserName <> SponsorName)
	, UserOwnerCount = (select count(*) from org.[User] where OwnerName = u.UserName and UserName <> SponsorName)
	, SponsorName = u.SponsorName
	, SponsorSponsorCount = (select count(*) from org.[User] where SponsorName = u.SponsorName and UserName <> SponsorName)
	, SponsorOwnerCount = (select count(*) from org.[User] where OwnerName = u.SponsorName and UserName <> SponsorName)
	, OwnerName = u.OwnerName
	, OwnerSponsorCount = (select count(*) from org.[User] where SponsorName = u.OwnerName and UserName <> SponsorName)
	, OwnerOwnerCount = (select count(*) from org.[User] where OwnerName = u.OwnerName and UserName <> SponsorName)
	, BadgeCount

from org.[User] u