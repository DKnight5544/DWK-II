CREATE PROCEDURE [mlm].[AddUser]
	@UplineName nvarchar(50),
	@UserName nvarchar(50)
AS

if(not exists(
	select 1
	from mlm.Users u
	where u.UserName = @UserName
)

and exists(
	select 1
	from mlm.Users u
	where u.UserName = @UplineName
))

begin    

-- first insert new user
insert into mlm.Users (UserName, UplineName)
select @UserName, @UplineName
;

-- now update the downline count.
update u set u.DownlineCount += 1 from mlm.Users u where u.UserName = @UplineName;
select @UplineName = u.UplineName from mlm.Users u where u.UserName = @UplineName;
update u set u.DownlineCount += 1 from mlm.Users u where u.UserName = @UplineName;
select @UplineName = u.UplineName from mlm.Users u where u.UserName = @UplineName;
update u set u.DownlineCount += 1 from mlm.Users u where u.UserName = @UplineName;
select @UplineName = u.UplineName from mlm.Users u where u.UserName = @UplineName;
update u set u.DownlineCount += 1 from mlm.Users u where u.UserName = @UplineName;
select @UplineName = u.UplineName from mlm.Users u where u.UserName = @UplineName;
update u set u.DownlineCount += 1 from mlm.Users u where u.UserName = @UplineName;

end

