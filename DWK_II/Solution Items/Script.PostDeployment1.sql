

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

--- alotalinks

grant view definition on ll.Links to TimerToysApp
grant execute on ll.AddLink to TimerToysApp
grant execute on ll.EditLink to TimerToysApp
grant execute on ll.GetLinks to TimerToysApp
grant execute on ll.GetLink to TimerToysApp
grant execute on ll.DeleteLink to TimerToysApp