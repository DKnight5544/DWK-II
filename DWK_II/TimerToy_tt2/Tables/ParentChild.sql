CREATE TABLE [tt2].[ParentChild]
(
	  [ParentKey] char(36) NOT NULL
	, [ChildKey] char(36) NOT NULL
)

GO

ALTER TABLE [tt2].[ParentChild] ADD  CONSTRAINT [PK_ParentChild] PRIMARY KEY CLUSTERED
([ParentKey], [ChildKey])
GO
