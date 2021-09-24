﻿CREATE TABLE [tt].Page
(
	 PageKey CHAR(36) NOT NULL
    ,PageName NVARCHAR(150) NOT NULL
	,CONSTRAINT [PK_Page] PRIMARY KEY (PageKey)
)

GO


CREATE UNIQUE INDEX [UIX_Page] ON [tt].[Page] ([PageKey])
