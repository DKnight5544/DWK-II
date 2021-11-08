CREATE PROCEDURE [org].[AddBadge]
	@TransID varchar(17),
	@UserName nvarchar(50)
AS

declare @msg char(1);

if not exists (select 1 from org.trans t where t.TransID = @TransID)
begin

	update org.[User]
	set BadgeCount += 1
	where UserName = @UserName

	insert into org.trans (TransID, UserName)
	select @TransID, @UserName
	;

	select @msg = 'S';

end
else begin

	select @msg = 'D';

end

select @msg;

;