CREATE TABLE [tt].[Page] (
    [PageKey]  CHAR (36)      NOT NULL,
    [PageName] NVARCHAR (150) NOT NULL,
    CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED ([PageKey] ASC)
);







GO


CREATE UNIQUE INDEX [UIX_Page] ON [tt].[Page] ([PageKey])

GO