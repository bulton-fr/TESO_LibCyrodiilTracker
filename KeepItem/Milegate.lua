LibCyrodiilTracker.KeepItem.Milegate = {
    Manager = LibCyrodiilTracker.Manager
}
LibCyrodiilTracker.KeepItem.Milegate = setmetatable(
    {
        ManagerType = LibCyrodiilTracker.Manager.TYPE.KEEP_MILEGATE,
        traitList   = {
            LibCyrodiilTracker.KeepItem.AbstractKeepItem,
            LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack,
            LibCyrodiilTracker.KeepItem.Trait.TraitPassable,
        }
    },
    {__index = LibCyrodiilTracker.multiIndex}
)
LibCyrodiilTracker.KeepItem.Milegate.__index = LibCyrodiilTracker.KeepItem.Milegate

function LibCyrodiilTracker.KeepItem.Milegate:New(keepId, bgContext, keepType)
    local milegate = self:obtainBaseItem(keepId, bgContext, keepType)

    setmetatable(milegate, self)

    bridge:addPassableKey()
    bridge:addGlobalEvent()

    return milegate
end
