

-- TimerToys
grant view definition on tt.vwSelectAll to TimerToysApp
grant view definition on tt.[Page] to TimerToysApp

grant execute on tt.AdjustTimer to TimerToysApp
grant execute on tt.DeleteTimer to TimerToysApp
grant execute on tt.InsertNewPage to TimerToysApp
grant execute on tt.InsertNewTimer to TimerToysApp
grant execute on tt.ResetTimer to TimerToysApp
grant execute on tt.SelectAllByPage to TimerToysApp
grant execute on tt.ToggleTimer to TimerToysApp
grant execute on tt.UpdatePageName to TimerToysApp
grant execute on tt.UpdateTimerName to TimerToysApp
grant execute on tt.SelectPageData to TimerToysApp

-- TT2

grant view definition on tt2.TimerModel to TimerToysApp

grant execute on tt2.AddRootTimer to TimerToysApp
grant execute on tt2.AddTimer to TimerToysApp
grant execute on tt2.GetChildren to TimerToysApp
grant execute on tt2.GetTimer to TimerToysApp
grant execute on tt2.ToggleTimer to TimerToysApp

grant execute on tt2.AdjustTimer to TimerToysApp
grant execute on tt2.ResetTimer to TimerToysApp
grant execute on tt2.DeleteTimer to TimerToysApp
grant execute on tt2.RenameTimer to TimerToysApp

-- Domain Sales
grant execute on ds.AddPotentialBuyer to TimerToysApp
grant execute on ds.GetPotentialBuyers to TimerToysApp

-- Chain Letter
grant execute on cl.AddUser to TimerToysApp
grant execute on cl.GetUsers to TimerToysApp