create procedure [ds].[AddPotentialBuyer]
	@Domain nvarchar(50),
	@Buyer nvarchar(100),
	@ReferredBy nvarchar(100)
as


insert into ds.PotentialBuyer (Domain, Buyer, ReferredBy)
select @Domain, @Buyer, @ReferredBy
where not exists (
	select 1
	from ds.PotentialBuyer
	where Domain = @Domain
	and Buyer = @Buyer
)
;
