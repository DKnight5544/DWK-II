CREATE PROCEDURE [org].[AddUser]
	@SponsorName nvarchar(50),
	@UserName nvarchar(50)
AS

declare @SponsorOrgCount int,
		@SponsorOwner nvarchar(50),
		@OwnerName nvarchar(50)
;

if exists (select 1 from org.[User] u where u.UserName = @SponsorName)

begin

	select @SponsorOrgCount = count(*) from org.[User] u where u.SponsorName = @SponsorName;
	select @SponsorOwner = u.OwnerName from org.[User] u where u.UserName = @SponsorName;
	select @OwnerName = iif(@SponsorOrgCount > 1, @SponsorName, @SponsorOwner);
   

	insert into org.[User] (UserName, SponsorName, OwnerName)
	select upper(@UserName), upper(@SponsorName), upper(@OwnerName)
	where not exists (
		select 1
		from org.[User] u
		where u.UserName = @UserName
	)

end