CREATE TABLE [ds].[PotentialBuyer]
(
	[Domain] NVARCHAR(50) NOT NULL,
	[Buyer] NVARCHAR(100) NOT NULL, 
    [ReferredBy] NVARCHAR(100) NOT NULL, 
    CONSTRAINT [PK_PotentialBuyer] PRIMARY KEY ([Domain],[Buyer])
)
