LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage = {}

function LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage:addScrollKey()
    if self.scroll == nil then
        self.scroll = {}
    end

    self.scroll.storage = nil
end

function LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage:findScrollStorage()
    local compareFct = function(scrollStorageItem)
        if scrollStorageItem.keepId.id == self.id then
            return true
        else
            return false
        end
    end

    self.scroll.storage = self.Manager:findBy(self.Manager.TYPE.OBJECTIVE_SCROLL_STORAGE, compareFct)
end