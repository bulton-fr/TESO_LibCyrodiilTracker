LibCyrodiilTracker.KeepItem.Trait.TraitGuildName = {}

function LibCyrodiilTracker.KeepItem.Trait.TraitGuildName:addGuildNameKey()
    self.guildName = GetClaimedKeepGuildName(self.keepId, self.bgCtx)
end

function LibCyrodiilTracker.KeepItem.Trait.TraitGuildName:updateGuildName()
    self.guildName = GetClaimedKeepGuildName(self.keepId, self.bgCtx)
end

function LibCyrodiilTracker.KeepItem.Trait.TraitGuildName:hasGuildName()
    if self.guildName == nil or self.guildName == "" then
        return false
    end

    return true
end

function LibCyrodiilTracker.KeepItem.Trait.TraitGuildName:setGuildName(guildName)
    self.guildName = guildName
end
