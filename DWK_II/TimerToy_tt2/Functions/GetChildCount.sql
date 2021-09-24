CREATE FUNCTION [tt2].[GetChildCount]
(
	@TimerKey char(36)
)
RETURNS INT
AS


BEGIN

	return (
		select count(*) 
		from tt2.Timer t 
		where t.ParentKey = @TimerKey
		);
	
END
