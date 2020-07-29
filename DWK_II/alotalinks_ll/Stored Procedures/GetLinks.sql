CREATE PROCEDURE [ll].[GetLinks]
	@Key char(36)
AS	

	select
		*
	from ll.Links l
	where l.[Key] = @Key

	union all
	
	select
		*
	from ll.Links l
	where l.[ParentKey] = @Key
	and l.[Key] <> l.ParentKey

	order by SortIndex;

RETURN 0
