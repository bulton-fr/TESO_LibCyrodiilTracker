LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem = setmetatable(
    {Manager = LibCyrodiilTracker.Manager},
    {__index = LibCyrodiilTracker.AbstractItem}
)
LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem.__index = LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem

function LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem:obtainBaseItem(keepId, objectiveId, bgContext, objectiveType)
    local item = LibCyrodiilTracker.AbstractItem.obtainBaseItem(self, keepId, bgContext, objectiveType)

    local objName, _, objCtrlState = GetObjectiveInfo(keepId, objectiveId, bgContext)

    item.objectiveId  = objectiveId
    item.controlState = objCtrlState
    item.controlEvent = GetLastObjectiveControlEvent(keepId, objectiveId, bgContext)
    item.parentItem   = nil --Defined from parent
    item.name         = objName

    return item
end

function LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem:checkIsMe(managerKey, cstId)
    if managerKey.cat ~= self.ManagerType.cat and managerKey.type ~= self.ManagerType.type then
        return false
    end

    if self.objectiveId ~= cstId then
        return false
    end

    return true
end

function LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem:setParentItem(parentItem)
    self.parentItem = parentItem
end
