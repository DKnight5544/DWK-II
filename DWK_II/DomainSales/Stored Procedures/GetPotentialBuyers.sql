create procedure [ds].[GetPotentialBuyers]
	@Domain nvarchar(50)
as

select
	pb.Buyer, pb.ReferredBy
from ds.PotentialBuyer pb
where pb.Domain = @Domain
;