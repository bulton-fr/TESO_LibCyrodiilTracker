LibCyrodiilTracker.KeepItem.Bridge = setmetatable(
    {
        ManagerType = LibCyrodiilTracker.Manager.TYPE.KEEP_BRIDGE,
        traitList   = {
            LibCyrodiilTracker.KeepItem.AbstractKeepItem,
            LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack,
            LibCyrodiilTracker.KeepItem.Trait.TraitPassable,
        }
    },
    {__index = LibCyrodiilTracker.multiIndex}
)
LibCyrodiilTracker.KeepItem.Bridge.__index = LibCyrodiilTracker.KeepItem.Bridge

function LibCyrodiilTracker.KeepItem.Bridge:New(keepId, bgContext, keepType)
    local bridge = self:obtainBaseItem(keepId, bgContext, keepType)

    setmetatable(bridge, self)

    bridge:addPassableKey()
    bridge:addGlobalEvent()

    return bridge
end
