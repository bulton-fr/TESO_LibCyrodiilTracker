LibCyrodiilTracker.KeepItem.AbstractKeepItem = setmetatable(
    {Manager = LibCyrodiilTracker.Manager},
    {__index = LibCyrodiilTracker.AbstractItem}
)
LibCyrodiilTracker.KeepItem.AbstractKeepItem.__index = LibCyrodiilTracker.KeepItem.AbstractKeepItem

function LibCyrodiilTracker.KeepItem.AbstractKeepItem:obtainBaseItem(keepId, bgContext, keepType)
    local item = LibCyrodiilTracker.AbstractItem.obtainBaseItem(self, keepId, bgContext, keepType)

    item.name     = GetKeepName(keepId)
    item.alliance = GetKeepAlliance(keepId, bgContext)

    return item
end

function LibCyrodiilTracker.KeepItem.AbstractKeepItem:checkIsMe(managerKey, cstId)
    if managerKey.cat ~= self.ManagerType.cat and managerKey.type ~= self.ManagerType.type then
        return false
    end

    if self.keepId ~= cstId then
        return false
    end

    return true
end
