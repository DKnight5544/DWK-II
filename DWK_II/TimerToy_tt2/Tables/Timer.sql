CREATE TABLE [tt2].[Timer]
(
	  [TimerKey] char(36) NOT NULL
	, [ReadOnlyKey] char(36) NOT NULL
	, [ParentKey] char(36) NOT NULL
	, [TimerName] nvarchar(150) NOT NULL
	, [StartTime] datetime NULL
	, [IsRunning] bit NOT NULL
	, [ElapsedTime] int NOT NULL
	, [CreationTime] datetime not null
)

GO

CREATE UNIQUE INDEX [UIX_Timer] ON [tt2].[Timer] ([TimerKey]) 
GO

ALTER TABLE [tt2].[Timer] ADD  CONSTRAINT [PK_Timer] PRIMARY KEY CLUSTERED
([ParentKey], [TimerKey])
GO
