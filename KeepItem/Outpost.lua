LibCyrodiilTracker.KeepItem.Outpost = setmetatable(
    {
        ManagerType = LibCyrodiilTracker.Manager.TYPE.KEEP_OUTPOST,
        traitList   = {
            LibCyrodiilTracker.KeepItem.AbstractKeepItem,
            LibCyrodiilTracker.KeepItem.Trait.TraitFlag,
            LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack,
            LibCyrodiilTracker.KeepItem.Trait.TraitTravelLink,
            LibCyrodiilTracker.KeepItem.Trait.TraitGuildName,
        }
    },
    {__index = LibCyrodiilTracker.multiIndex}
)
LibCyrodiilTracker.KeepItem.Outpost.__index = LibCyrodiilTracker.KeepItem.Outpost

function LibCyrodiilTracker.KeepItem.Outpost:New(keepId, bgContext, keepType)
    local outpost = self:obtainBaseItem(keepId, bgContext, keepType)

    setmetatable(outpost, self)

    outpost:addFlagKey()
    outpost:addUnderAttackKey()
    outpost:addTravelLinkKey()
    outpost:addGuildNameKey()

    outpost:addGlobalEvent()
    outpost:addManagerLoadAllEvent()

    return outpost
end

function LibCyrodiilTracker.KeepItem.Outpost:onManagerLoadAll()
    self:findFlagObjective()
end
