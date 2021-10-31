CREATE TABLE [org].[User]
(
	  [UserName] nvarchar(50) NOT NULL
	, [SponsorName] nvarchar(50) NOT null
	, [OwnerName] nvarchar(50) NOT null
	, [InsertDate] datetime not null DEFAULT getdate()
    CONSTRAINT [PK_Users] PRIMARY KEY ([UserName])
)

GO

CREATE INDEX [IX_Users_SponsorName] ON [org].[User] ([SponsorName])
GO

CREATE INDEX [IX_Users_OwnerName] ON [org].[User] ([OwnerName])
GO

CREATE INDEX [IX_Users_InsertDate] ON [org].[User] ([InsertDate])
GO