CREATE TABLE [org].[User] (
    [UserName]    NVARCHAR (50) NOT NULL,
    [SponsorName] NVARCHAR (50) NOT NULL,
    [OwnerName]   NVARCHAR (50) NOT NULL,
    [BadgeCount] int NOT NULL DEFAULT(0),
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([UserName] ASC)
);



GO

CREATE INDEX [IX_Users_SponsorName] ON [org].[User] ([SponsorName])
GO

CREATE INDEX [IX_Users_OwnerName] ON [org].[User] ([OwnerName])
GO


GO