LibCyrodiilTracker.KeepItem.Trait.TraitScroll = {}

function LibCyrodiilTracker.KeepItem.Trait.TraitScroll:addScrollKey()
    if self.scroll == nil then
        self.scroll = {}
    end

    self.scroll.item = nil
end

function LibCyrodiilTracker.KeepItem.Trait.TraitScroll:findScrollItem()
    self.scroll.item = self.Manager:findBy(
        self.Manager.TYPE.OBJECTIVE_SCROLL,
        LibCyrodiilTracker.KeepItem.Trait.TraitScroll.compareScrollItem,
        self
    )

    -- Only security but should not happens
    if self.scroll.storage ~= nil then
        self.scroll.storage.scroll = self.scroll.item
    end
end

function LibCyrodiilTracker.KeepItem.Trait.TraitScroll.compareScrollItem(manager, scrollItem, me)
    if scrollItem.currentKeep == nil then
        return false
    end

    if scrollItem.currentKeep.itemType == me.itemType and scrollItem.currentKeep.keepId == me.keepId then
        return true
    else
        return false
    end
end