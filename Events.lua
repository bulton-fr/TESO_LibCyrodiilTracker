LibCyrodiilTracker.Events = {}

--[[
-- Called when the addon is loaded
--
-- @param number eventCode
-- @param string addonName name of the loaded addon
--]]
function LibCyrodiilTracker.Events.onLoaded(eventCode, addOnName)
    -- The event fires each time *any* addon loads - but we only care about when our own addon loads.
    if addOnName == LibCyrodiilTracker.dirName then
        LibCyrodiilTracker:Initialise()
        EVENT_MANAGER:UnregisterForEvent("LibCyrodiilTrackerAddonLoad", EVENT_ADD_ON_LOADED) 
    end
end

function LibCyrodiilTracker.Events.onLoadScreen(eventCode, initial)
    if LibCyrodiilTracker.ready == false then
        return
    end

    if IsInCyrodiil() == true then
        --Security into the method to avoid load at each call of it
        LibCyrodiilTracker:loadData()
    end
end
