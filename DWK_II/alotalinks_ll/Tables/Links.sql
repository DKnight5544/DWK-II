CREATE TABLE [ll].[Links]
(
	 [Key] VARCHAR(36) NOT NULL
	,[Text] nvarchar(50) NOT NULL
	,[Url] nvarchar(2083) NULL
	,[ParentKey] char(36) NULL
	,[SortIndex] bigint identity(1,1) NOT NULL
	,[AllowEditing] BIT NOT NULL DEFAULT (1) 
    CONSTRAINT [PK_Links] PRIMARY KEY ([Key]), 
    [AllowAdding] BIT NOT NULL DEFAULT (1) 
)
GO

CREATE INDEX [IX_Links_ParentId_SortIndex] ON [ll].[Links] (ParentKey asc, SortIndex)
