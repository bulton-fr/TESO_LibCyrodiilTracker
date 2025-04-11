LibCyrodiilTracker.KeepItem.Keep = setmetatable(
    {
        ManagerType = LibCyrodiilTracker.Manager.TYPE.KEEP_KEEP,
        traitList   = {
            LibCyrodiilTracker.KeepItem.AbstractKeepItem,
            LibCyrodiilTracker.KeepItem.Trait.TraitScroll,
            LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage,
            LibCyrodiilTracker.KeepItem.Trait.TraitFlag,
            LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack,
            LibCyrodiilTracker.KeepItem.Trait.TraitTravelLink,
            LibCyrodiilTracker.KeepItem.Trait.TraitGuildName,
        }
    },
    {__index = LibCyrodiilTracker.multiIndex}
)
LibCyrodiilTracker.KeepItem.Keep.__index = LibCyrodiilTracker.KeepItem.Keep

function LibCyrodiilTracker.KeepItem.Keep:New(keepId, bgContext, keepType)
    local keep = self:obtainBaseItem(keepId, bgContext, keepType)

    keep.resourceList = {
        food = nil,
        ore  = nil,
        wood = nil
    }

    setmetatable(keep, self)

    keep:addScrollKey()
    keep:addScrollStorageKey()
    keep:addFlagKey()
    keep:addUnderAttackKey()
    keep:addTravelLinkKey()
    keep:addGuildNameKey()

    keep:addGlobalEvent()
    keep:addManagerLoadAllEvent()

    return keep
end

function LibCyrodiilTracker.KeepItem.Keep:onManagerLoadAll()
    self:findResource()
    self:findFlagObjective()
    self:findScrollStorage()
    self:findScrollItem()
end

function LibCyrodiilTracker.KeepItem.Keep:findResource()
    local resKeepIdFood = GetResourceKeepForKeep(self.id, RESOURCETYPE_FOOD)
    local resKeepIdOre  = GetResourceKeepForKeep(self.id, RESOURCETYPE_ORE)
    local resKeepIdWood = GetResourceKeepForKeep(self.id, RESOURCETYPE_WOOD)

    self.resourceList.food = self.Manager:findById(resKeepIdFood, self.Manager.TYPE.KEEP_RESOURCE)
    self.resourceList.ore  = self.Manager:findById(resKeepIdOre, self.Manager.TYPE.KEEP_RESOURCE)
    self.resourceList.wood = self.Manager:findById(resKeepIdWood, self.Manager.TYPE.KEEP_RESOURCE)
end
