﻿CREATE VIEW [tt2].[TimerModel]
	AS 


select 
	  TimerKey = convert(char(36), null)
	, ReadOnlyKey = convert(char(36), null)
	, TimerName = convert(nvarchar(150), null)
	, IsRunning = convert(bit, null)
	, ChildCount = convert(int, null)
	, CreationTime = convert(datetime, null)
	, ElapsedTime =  convert(int, null)
	, IsReadOnly = convert(bit, null)
