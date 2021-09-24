CREATE VIEW [tt2].[TimerModel]
	AS 


select 
	  TimerKey = convert(char(36), null)
	, TimerName = convert(varchar(150), null)
	, IsRunning = convert(bit, null)
	, ChildrenCount = convert(int, null)
	, CreationTime = convert(datetime, null)
	, ElapsedTime =  convert(int, null)
	, IsReadOnly = convert(bit, null)
