CREATE TABLE [mlm].[Users]
(
	  [UserName] nvarchar(50) NOT NULL
	, [UplineName] nvarchar(50) NOT null
	, [InsertDate] datetime not null DEFAULT getdate()
    CONSTRAINT [PK_Users] PRIMARY KEY ([UserName])
)

GO

CREATE INDEX [IX_Users_UplineName] ON [mlm].[Users] ([UplineName])
GO

CREATE INDEX [IX_Users_InsertDate] ON [mlm].[Users] ([InsertDate])
GO