CREATE TABLE [tt].[Timer]
(
	  [TimerKey] int identity(1,1)
	, [TimerName] nvarchar(150) NOT NULL
	, [StartTime] datetime NULL
	, [ElapsedTime] int NOT NULL default(0)
	, [PageKey] char(36) NOT NULL
	, CONSTRAINT [PK_Timer] PRIMARY KEY CLUSTERED([TimerKey])
	, CONSTRAINT [FK_Timer_Page] FOREIGN KEY ([PageKey]) REFERENCES tt.[Page]([PageKey])
)

GO

CREATE UNIQUE INDEX [UIX_PageTimer] ON [tt].[Timer] ([PageKey],[TimerKey]) 
GO
