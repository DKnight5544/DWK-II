/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM $(TableName)					
--------------------------------------------------------------------------------------
*/

grant execute on tt.fnReformatSeconds to TimerToysApp;

grant execute on tt.AdjustTimer to TimerToysApp;
grant execute on tt.DeleteFolder to TimerToysApp;
grant execute on tt.DeleteTimer to TimerToysApp;
grant execute on tt.InsertNewFolder to TimerToysApp;
grant execute on tt.InsertNewTimer to TimerToysApp;
grant execute on tt.InsertNewPage to TimerToysApp;
grant execute on tt.ResetTimer to TimerToysApp;
grant execute on tt.SelectAllByPage to TimerToysApp;
grant execute on tt.SelectPageByKey to TimerToysApp;
grant execute on tt.ToggleOffset to TimerToysApp;
grant execute on tt.ToggleTimer to TimerToysApp;
grant execute on tt.UpdateFolderName to TimerToysApp;
grant execute on tt.UpdatePageName to TimerToysApp;
grant execute on tt.UpdateTimerName to TimerToysApp;
grant execute on tt.CloneTimer to TimerToysApp;

grant select on tt.vwSelectAll to TimerToysApp;

grant view definition on tt.Page to TimerToysApp;