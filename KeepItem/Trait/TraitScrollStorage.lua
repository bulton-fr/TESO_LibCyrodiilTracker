LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage = {}

function LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage:addScrollStorageKey()
    if self.scroll == nil then
        self.scroll = {}
    end

    self.scroll.storage = nil
end

function LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage:findScrollStorage()
    self.scroll.storage = self.Manager:findBy(
        self.Manager.TYPE.OBJECTIVE_SCROLL_STORAGE,
        LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage.compareScrollStorage,
        self
    )
end

function LibCyrodiilTracker.KeepItem.Trait.TraitScrollStorage.compareScrollStorage(manager, scrollStorageItem, me)
    if scrollStorageItem.keepId == me.keepId then
        return true
    else
        return false
    end
end