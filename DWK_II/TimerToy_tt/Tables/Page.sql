CREATE TABLE [tt].[Page] (
    [PageKey]  CHAR (36)      NOT NULL,
    [ReadOnlyKey]  CHAR (36)      NOT NULL,
    [PageName] NVARCHAR (150) NOT NULL,
    CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED ([PageKey] ASC)
);
GO

CREATE UNIQUE INDEX [UIX_ReadOnly] ON [tt].[Page] ([ReadOnlyKey])
GO