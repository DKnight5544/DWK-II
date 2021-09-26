CREATE FUNCTION [tt2].[GetChildCount]
(
	@ParentKey char(36)
)
RETURNS INT
AS


BEGIN

	return (
		select count(*) 
		from tt2.ParentChild pc
		where pc.ParentKey = @ParentKey
		);
	
END
