LibCyrodiilTracker.KeepItem.Trait.TraitFlag = {}

function LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage:addScrollKey()
    self.flagObjective = {}
end

function LibCyrodiilTracker.KeepItem.Trait.TraitFlag:findFlagObjective()
    local compareFct = function(flag)
        if flag.keepId.id == self.id then
            return true
        else
            return false
        end
    end

    self.flagObjective = self.Manager:findAll(self.Manager.TYPE.OBJECTIVE_FLAG, compareFct)

    for _, flagItem in ipairs(self.flagObjective) do
        flagItem:setParentItem(self)
    end
end
