LibCyrodiilTracker.KeepItem.Town = setmetatable(
    {
        ManagerType = LibCyrodiilTracker.Manager.TYPE.KEEP_RESOURCE,
        traitList   = {
            LibCyrodiilTracker.KeepItem.AbstractKeepItem,
            LibCyrodiilTracker.KeepItem.Trait.TraitFlag,
            LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack,
            LibCyrodiilTracker.KeepItem.Trait.TraitGuildName, --@TODO to check if possible
        }
    },
    {__index = LibCyrodiilTracker.multiIndex}
)
LibCyrodiilTracker.KeepItem.Town.__index = LibCyrodiilTracker.KeepItem.Town

function LibCyrodiilTracker.KeepItem.Town:New(keepId, bgContext, keepType)
    local town = self:obtainBaseItem(keepId, bgContext, keepType)

    setmetatable(town, self)

    town:addGlobalEvent()
    town:addManagerLoadAllEvent()

    return town
end

function LibCyrodiilTracker.KeepItem.Town:onManagerLoadAll()
    self:findFlagObjective()
end
