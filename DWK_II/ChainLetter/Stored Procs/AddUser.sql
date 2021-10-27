CREATE PROCEDURE [cl].[AddUser]
	@OldName varchar(50) NULL,
	@NewName varchar(50)
AS

if(@OldName is null) select @OldName = 'WigiWiz'

if not exists (select 1 from cl.Users u where u.LinkName00 = @NewName) 
begin
	insert into cl.Users (
		  LinkName00
		, LinkName01
		, LinkName02
		, LinkName03
		, LinkName04
		, LinkName05
	)
	select
		  LinkName00 = @NewName
		, LinkName01 = u.LinkName00
		, LinkName02 = u.LinkName01
		, LinkName03 = u.LinkName02
		, LinkName04 = u.LinkName03
		, LinkName05 = u.LinkName04
	from cl.Users u
	where u.LinkName00 = @OldName
	;
	
	-- Now Update the user counts.

	update u2
	set	u2.LinkCount += 1
	from cl.Users u1
	join cl.Users u2 
	on u2.LinkName00 = u1.LinkName01	
	or u2.LinkName00 = u1.LinkName02	
	or u2.LinkName00 = u1.LinkName03	
	or u2.LinkName00 = u1.LinkName04	
	or u2.LinkName00 = u1.LinkName05
	where u1.LinkName00 = @NewName
	;


end