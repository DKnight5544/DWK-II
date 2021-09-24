CREATE PROCEDURE [tt2].[AddRootTimer]
AS

declare @ParentKey char(36)= convert(char(36), newid());

-- ensure no dupes
while exists (
	select 1 from tt2.Timer t 
	where t.TimerKey = @ParentKey or t.ParentKey = @ParentKey or t.ReadOnlyKey = @ParentKey) 
begin
	select @ParentKey = convert(char(36), newid());
end

exec tt2.AddTimer @ParentKey;

return 0