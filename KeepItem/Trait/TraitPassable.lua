LibCyrodiilTracker.KeepItem.Trait.TraitPassable = {}

function LibCyrodiilTracker.KeepItem.Trait.TraitPassable:addPassableKey()
    self.passable = IsKeepPassable(self.keepId, self.bgCtx)
end

function LibCyrodiilTracker.KeepItem.Trait.TraitPassable:updatePassable()
    self.passable = IsKeepPassable(self.keepId, self.bgCtx)
end

function LibCyrodiilTracker.KeepItem.Trait.TraitPassable:isPassable()
    return self.passable
end

function LibCyrodiilTracker.KeepItem.Trait.TraitPassable:setPassable(passable)
    self.passable = passable
end
