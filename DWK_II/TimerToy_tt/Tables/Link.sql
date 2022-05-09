CREATE TABLE [tt].[Link]
(
	  [LinkKey] int identity(1,1)
	, [LinkName] nvarchar(150) NOT NULL
	, [LinkUrl] nvarchar(max) NULL
	, [PageKey] char(36) NOT NULL
	, CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED([LinkKey])
	, CONSTRAINT [FK_Link_Page] FOREIGN KEY ([PageKey]) REFERENCES tt.[Page]([PageKey])
)

GO

CREATE UNIQUE INDEX [UIX_LinkTimer] ON [tt].[Link] ([PageKey],[LinkKey]) 
GO
