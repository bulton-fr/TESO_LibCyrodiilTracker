LibCyrodiilTracker.KeepItem.Trait.TraitScroll = {}

function LibCyrodiilTracker.KeepItem.Trait.TraitScroll:addScrollKey()
    if self.scroll == nil then
        self.scroll = {}
    end

    self.scroll.item = nil
end

function LibCyrodiilTracker.KeepItem.Trait.TraitScroll:findScrollItem()
    local compareFct = function(scrollItem)
        if scrollItem.currentKeep == nil then
            return false
        end

        if scrollItem.currentKeep.itemType == self.itemType and scrollItem.currentKeep.id == self.id then
            return true
        else
            return false
        end
    end

    self.scroll.item = self.Manager:findBy(self.Manager.TYPE.OBJECTIVE_SCROLL, compareFct)
    self.scroll.storage.scroll = self.scroll.item
end