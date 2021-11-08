CREATE TABLE [org].[Trans] (
    [TransID]    VARCHAR (17) NOT NULL,
    [UserName]    NVARCHAR (50) NOT NULL
    CONSTRAINT [PK_Trans] PRIMARY KEY CLUSTERED ([TransID] ASC)
);
GO

CREATE INDEX [IX_Trans_UserName] ON [org].[Trans] ([UserName])
GO
