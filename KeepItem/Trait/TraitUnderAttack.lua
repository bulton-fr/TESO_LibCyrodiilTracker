LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack = {}

function LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack:addUnderAttackKey()
    self.underAttack = GetKeepUnderAttack(self.keepId, self.bgCtx)
end

function LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack:updateUnderAttack()
    self.underAttack = GetKeepUnderAttack(self.keepId, self.bgCtx)
end

function LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack:isUnderAttack()
    return self.underAttack
end

function LibCyrodiilTracker.KeepItem.Trait.TraitUnderAttack:setUnderAttack(underAttack)
    self.underAttack = underAttack
end
