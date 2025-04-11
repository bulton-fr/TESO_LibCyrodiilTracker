LibCyrodiilTracker.KeepItem.Trait.TraitFlag = {}

function LibCyrodiilTracker.KeepItem.Trait.TraitFlag:addFlagKey()
    self.flagObjective = {}
end

function LibCyrodiilTracker.KeepItem.Trait.TraitFlag:findFlagObjective()
    self.flagObjective = self.Manager:findAll(
        self.Manager.TYPE.OBJECTIVE_FLAG,
        LibCyrodiilTracker.KeepItem.Trait.TraitFlag.compareFlagObjective,
        self
    )

    for _, flagItem in ipairs(self.flagObjective) do
        flagItem:setParentItem(self)
    end
end

function LibCyrodiilTracker.KeepItem.Trait.TraitFlag.compareFlagObjective(manager, flag, me)
    if flag.keepId == me.keepId then
        return true
    else
        return false
    end
end
