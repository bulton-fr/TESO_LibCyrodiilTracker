LibCyrodiilTracker.KeepItem.Temple = setmetatable(
    {
        ManagerType = LibCyrodiilTracker.Manager.TYPE.KEEP_TEMPLE,
        traitList   = {
            LibCyrodiilTracker.KeepItem.AbstractKeepItem,
            LibCyrodiilTracker.KeepItem.Trait.TraitScroll,
            LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage,
        }
    },
    {__index = LibCyrodiilTracker.multiIndex}
)
LibCyrodiilTracker.KeepItem.Temple.__index = LibCyrodiilTracker.KeepItem.Temple

function LibCyrodiilTracker.KeepItem.Temple:New(keepId, bgContext, keepType)
    local temple = self:obtainBaseItem(keepId, bgContext, keepType)

    temple.gate = nil

    setmetatable(temple, self)

    temple:addScrollKey()
    temple:addScrollStorageKey()

    temple:addGlobalEvent()
    temple:addManagerLoadAllEvent()

    return temple
end

function LibCyrodiilTracker.KeepItem.Temple:onManagerLoadAll()
    self:findGate()
    self:findScrollStorage()
    self:findScrollItem()
end

function LibCyrodiilTracker.KeepItem.Temple:findGate()
    self.gate = self.Manager:findByCstName(self.cstName, self.Manager.TYPE.KEEP_GATE)
end
