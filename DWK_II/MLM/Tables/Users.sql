CREATE TABLE [mlm].[Users]
(
	  [LinkName00] varchar(50) NOT NULL 
	, [LinkCount] int Not Null Default(0)
	, [InsertDate] datetime not null DEFAULT getdate()
	, [LinkName01] varchar(50)
	, [LinkName02] varchar(50)
	, [LinkName03] varchar(50)
	, [LinkName04] varchar(50)
	, [LinkName05] varchar(50)
    CONSTRAINT [PK_Users] PRIMARY KEY ([LinkName00])
)

GO

CREATE INDEX [IX_Users_LinkName01] ON [mlm].[Users] ([LinkName01])
GO
CREATE INDEX [IX_Users_LinkName02] ON [mlm].[Users] ([LinkName02])
GO
CREATE INDEX [IX_Users_LinkName03] ON [mlm].[Users] ([LinkName03])
GO
CREATE INDEX [IX_Users_LinkName04] ON [mlm].[Users] ([LinkName04])
GO
CREATE INDEX [IX_Users_LinkName05] ON [mlm].[Users] ([LinkName05])
GO
CREATE INDEX [IX_Users_InsertDate] ON [mlm].[Users] ([InsertDate])
GO

