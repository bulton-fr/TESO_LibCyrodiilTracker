LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack = {}

function LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage:addUnderAttackKey()
    self.underAttack = GetKeepUnderAttack(self.keepId, self.bgCtx)
end

function LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage:updateUnderAttack()
    self.underAttack = GetKeepUnderAttack(self.keepId, self.bgCtx)
end

function LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage:isUnderAttack()
    return self.underAttack
end

function LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage:setUnderAttack(underAttack)
    self.underAttack = underAttack
end
