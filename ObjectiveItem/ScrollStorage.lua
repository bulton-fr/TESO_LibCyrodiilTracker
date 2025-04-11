LibCyrodiilTracker.ObjectiveItem.ScrollStorage = setmetatable(
	{ManagerType = LibCyrodiilTracker.Manager.TYPE.OBJECTIVE_SCROLL_STORAGE},
    {__index = LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem}
)
LibCyrodiilTracker.ObjectiveItem.ScrollStorage.__index = LibCyrodiilTracker.ObjectiveItem.ScrollStorage

function LibCyrodiilTracker.ObjectiveItem.ScrollStorage:New(keepId, objectiveId, bgContext, objectiveType)
    local scrollStorage = self:obtainBaseItem(keepId, objectiveId, bgContext, objectiveType)

    scrollStorage.scroll = nil -- Defined by Scroll

    setmetatable(scrollStorage, self)

    scrollStorage:addGlobalEvent()

    return scrollStorage
end
