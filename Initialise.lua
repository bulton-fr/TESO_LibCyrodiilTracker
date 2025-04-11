LibCyrodiilTracker = {}

LibCyrodiilTracker.name       = "LibCyrodiilTracker"
LibCyrodiilTracker.dirName    = "LibCyrodiilTracker"
LibCyrodiilTracker.ready      = false
LibCyrodiilTracker.loaded     = false
LibCyrodiilTracker.inCyrodiil = false

LibCyrodiilTracker.KeepItem       = {}
LibCyrodiilTracker.KeepItem.Trait = {}
LibCyrodiilTracker.ObjectiveItem  = {}

function LibCyrodiilTracker:Initialise()
    if IsInCyrodiil() == true then
        self.inCyrodiil = true
        self.loadData()
    end

    self.ready = true
end

function LibCyrodiilTracker.loadData(force)
    if self.loaded == true and force ~= true then
        return
    end

    self.loaded = false
    LibCyrodiilTracker.Manager:loadAll()
    self.loaded = true
end

function LibCyrodiilTracker.multiIndex(table, key)
    if table.traitList == nil then
        return nil
    end

    for _, trait in ipairs(table.traitList) do
        if trait[key] ~= nil then
            --to avoid recall this method : perf
            --source : https://www.lua.org/pil/16.3.html
            table[key] = trait[key]

            return table[key]
        end
    end

    return nil
end
