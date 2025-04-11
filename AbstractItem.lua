LibCyrodiilTracker.AbstractItem = {
    Manager = LibCyrodiilTracker.Manager,
}
LibCyrodiilTracker.AbstractItem.__index = LibCyrodiilTracker.AbstractItem

function LibCyrodiilTracker.AbstractItem:obtainBaseItem(keepId, bgContext, keepType)
    return {
        keepId   = keepId,
        bgCtx    = bgContext,
        itemType = keepType,
        name     = nil,
        cstName  = nil,
        cstAlias = nil,
    }
end

function LibCyrodiilTracker.AbstractItem:addGlobalEvent()
    local item = self

    self.Manager.callbackManager:RegisterCallback(
        self.Manager.callbackEvents.defineCstInfo,
        function(managerKey, cstName, cstInfo)
            if self:checkIsMe(managerKey, cstInfo.id) == true then
                self:setCstName(cstName)

                if cstInfo.alias ~= nil then
                    self:setCstAlias(cstInfo.alias)
                end

                if self['defineCstInfo'] ~= nil then
                    self:defineCstInfo(cstInfo)
                end
            end
        end
    )
end

function LibCyrodiilTracker.AbstractItem:setCstName(cstName)
    self.cstName = cstName
end

function LibCyrodiilTracker.AbstractItem:setCstAlias(cstAlias)
    self.cstAlias = cstAlias
end

function LibCyrodiilTracker.AbstractItem:addManagerLoadAllEvent()
    local item = self

    self.Manager.callbackManager:RegisterCallback(
        self.Manager.callbackEvents.loadAll,
        function()
            if item['onManagerLoadAll'] ~= nil then
                item.onManagerLoadAll(item)
            end
        end
    )
end
