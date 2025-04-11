LibCyrodiilTracker.KeepItem.Base = setmetatable(
    {
        ManagerType = LibCyrodiilTracker.Manager.TYPE.KEEP_BASE,
        traitList   = {
            LibCyrodiilTracker.KeepItem.AbstractKeepItem,
            LibCyrodiilTracker.KeepItem.Trait.TraitTravelLink,
        }
    },
    {__index = LibCyrodiilTracker.multiIndex}
)
LibCyrodiilTracker.KeepItem.Base.__index = LibCyrodiilTracker.KeepItem.Base

function LibCyrodiilTracker.KeepItem.Base:New(keepId, bgContext, keepType)
    local base = self:obtainBaseItem(keepId, bgContext, keepType)

    setmetatable(base, self)
    
    base:addGlobalEvent()

    return base
end
