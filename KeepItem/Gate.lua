LibCyrodiilTracker.KeepItem.Gate = setmetatable(
    {
        ManagerType = LibCyrodiilTracker.Manager.TYPE.KEEP_GATE,
        traitList   = {
            LibCyrodiilTracker.KeepItem.AbstractKeepItem,
        }
    },
    {__index = LibCyrodiilTracker.multiIndex}
)
LibCyrodiilTracker.KeepItem.Gate.__index = LibCyrodiilTracker.KeepItem.Gate

function LibCyrodiilTracker.KeepItem.Gate:New(keepId, bgContext, keepType)
    local gate = self:obtainBaseItem(keepId, bgContext, keepType)

    gate.keep    = {}
    gate.cstKeep = {}
    gate.open    = false --@TODO : add manual detection (done on event), no function for that
    -- maybe try with IsKeepPassable(), and IsKeepTypePassable()

    setmetatable(gate, self)

    gate:addGlobalEvent()
    gate:addManagerLoadAllEvent()

    return gate
end

function LibCyrodiilTracker.KeepItem.Gate:onManagerLoadAll()
    self:findKeep()
    self:updateIsOpen()
end

function LibCyrodiilTracker.KeepItem.Gate:defineCstInfo(cstInfo)
    self.cstKeep = cstInfo.keep
end

function LibCyrodiilTracker.KeepItem.Gate:findKeep()
    local keep = nil

    for _, keepCstName in ipairs(self.cstKeep) do
        keep = self.Manager:findByCstName(keepCstName)

        if keep ~= nil and keep ~= false then
            table.insert(self.keep, keep)
        end
    end
end

function LibCyrodiilTracker.KeepItem.Gate:updateIsOpen()
    self.open = true

    for _, keep in ipairs(self.keep) do
        if keep.alliance == self.alliance then
            self.open = false
        end
    end
end
