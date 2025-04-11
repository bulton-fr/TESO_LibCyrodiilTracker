LibCyrodiilTracker.KeepItem.Resource = setmetatable(
    {
        ManagerType = LibCyrodiilTracker.Manager.TYPE.KEEP_RESOURCE,
        traitList   = {
            LibCyrodiilTracker.KeepItem.AbstractKeepItem,
            LibCyrodiilTracker.KeepItem.Trait.TraitFlag,
            LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack,
            LibCyrodiilTracker.KeepItem.Trait.TraitGuildName,
        }
    },
    {__index = LibCyrodiilTracker.multiIndex}
)
LibCyrodiilTracker.KeepItem.Resource.__index = LibCyrodiilTracker.KeepItem.Resource

function LibCyrodiilTracker.KeepItem.Resource:New(keepId, bgContext, keepType)
    local resource = self:obtainBaseItem(keepId, bgContext, keepType)

    resource.type = GetKeepResourceType(keepId)
    resource.keep = nil --Set from event on Keep

    setmetatable(resource, self)

    resource:addFlagKey()
    resource:addUnderAttackKey()
    resource:addGuildNameKey()

    resource:addGlobalEvent()
    resource:addManagerLoadAllEvent()

    return resource
end

function LibCyrodiilTracker.KeepItem.Outpost:onManagerLoadAll()
    self:findFlagObjective()
end
