LibCyrodiilTracker.Manager = {}

--LibCyrodiilTracker.Manager.CATEGORY = {
--    KEEP      = 'keep',
--    OBJECTIVE = 'objective'
--}

LibCyrodiilTracker.Manager.TYPE = {
    KEEP_KEEP                 = {cat = 'keep', type = 'keep'},
    KEEP_RESOURCE             = {cat = 'keep', type = 'resource'},
    KEEP_BASE                 = {cat = 'keep', type = 'base'},
    KEEP_TEMPLE               = {cat = 'keep', type = 'temple'},
    KEEP_GATE                 = {cat = 'keep', type = 'gate'},
    KEEP_OUTPOST              = {cat = 'keep', type = 'outpost'},
    KEEP_TOWN                 = {cat = 'keep', type = 'town'},
    KEEP_BRIDGE               = {cat = 'keep', type = 'bridge'},
    KEEP_MILEGATE             = {cat = 'keep', type = 'milegate'},
    OBJECTIVE_FLAG            = {cat = 'objective', type = 'flag'},
    OBJECTIVE_SCROLL          = {cat = 'objective', type = 'scroll'},
    OBJECTIVE_SCROLL_STORAGE  = {cat = 'objective', type = 'scrollStorage'},
    OBJECTIVE_VOLENDRUNG_BASE = {cat = 'objective', type = 'volendrungBase'}
    OBJECTIVE_VOLENDRUNG      = {cat = 'objective', type = 'volendrung'}
}

LibCyrodiilTracker.Manager.list = {
    keep      = {
        keep     = {},
        resource = {},
        base     = {},
        temple   = {},
        gate     = {},
        outpost  = {},
        town     = {},
        bridge   = {},
        milegate = {}
    },
    objective = {
        flag           = {},
        scroll         = {},
        scrollStorage  = {};
        volendrungBase = {}
        volendrung     = {}
    }
}

LibCyrodiilTracker.Manager.callbackManager = ZO_CallbackObject:New()
LibCyrodiilTracker.Manager.callbackEvents  = {
    loadAll = 'LibCyrodiilTracker_Event_Manager_LoadAll',
    cstInfo = 'LibCyrodiilTracker_Event_Manager_CstInfo'
}

function LibCyrodiilTracker.Manager:loadAll()
    self:loadKeepItem()
    self:loadObjectiveItem()
    self:fireCstInfo()
    
    LibCyrodiilTracker.Manager.callbackManager:FireCallbacks(LibCyrodiilTracker.Manager.callbackEvents.loadAll)
end

function LibCyrodiilTracker.Manager:loadKeepItem()
    local keepIdx = 0
    local nbKeep  = GetNumKeeps()

    for keepIdx = 1, nbKeep do
        local keepId, bgContext = GetKeepKeysByIndex(keepIdx)
        local keepType = GetKeepType(keepId)

        -- KEEPTYPE_IMPERIAL_CITY_DISTRICT -> PASS, not in cyrodiil directly

        if keepType == KEEPTYPE_KEEP then --keep
            table.insert(self.list.keep.keep, LibCyrodiilTracker.KeepItem.Keep:New(keepId, bgContext, keepType))
        elseif keepType == KEEPTYPE_RESOURCE then --resource
            table.insert(self.list.keep.resource, LibCyrodiilTracker.KeepItem.Resource:New(keepId, bgContext, keepType))
        elseif keepType == KEEPTYPE_BORDER_KEEP then --base
            table.insert(self.list.keep.base, LibCyrodiilTracker.KeepItem.Base:New(keepId, bgContext, keepType))
        elseif keepType == KEEPTYPE_ARTIFACT_KEEP then --temple
            table.insert(self.list.keep.temple, LibCyrodiilTracker.KeepItem.Temple:New(keepId, bgContext, keepType))
        elseif keepType == KEEPTYPE_ARTIFACT_GATE then --gate
            table.insert(self.list.keep.gate, LibCyrodiilTracker.KeepItem.Gate:New(keepId, bgContext, keepType))
        elseif keepType == KEEPTYPE_OUTPOST then --outpost
            table.insert(self.list.keep.outpost, LibCyrodiilTracker.KeepItem.Outpost:New(keepId, bgContext, keepType))
        elseif keepType == KEEPTYPE_TOWN then --town
            table.insert(self.list.keep.town, LibCyrodiilTracker.KeepItem.Town:New(keepId, bgContext, keepType))
        elseif keepType == KEEPTYPE_BRIDGE then --bridge
            table.insert(self.list.keep.bridge, LibCyrodiilTracker.KeepItem.Bridge:New(keepId, bgContext, keepType))
        elseif keepType == KEEPTYPE_MILEGATE then --milegate
            table.insert(self.list.keep.milegate, LibCyrodiilTracker.KeepItem.Milegate:New(keepId, bgContext, keepType))
        end
    end
end

function LibCyrodiilTracker.Manager:loadObjectiveItem()
    local objectiveIndex = 0
    local nbObjective    = GetNumObjectives()

    for objectiveIndex = 1, nbObjective do
        local keepId, objectiveId, bgContext = GetObjectiveIdsForIndex(objectiveIndex)
        local objectiveType = GetObjectiveType(keepId, objectiveId, bgContext)

        -- OBJECTIVE_NONE -> PASS, nothing to do
        -- OBJECTIVE_FLAG_CAPTURE -> PASS, it's for BG
        -- OBJECTIVE_CAPTURE_POINT -> PASS, it's for BG
        -- OBJECTIVE_ASSAULT -> PASS, not in Cyrodiil
        -- OBJECTIVE_RETURN -> PASS, not in Cyrodiil
        -- OBJECTIVE_BALL -> PASS, not in Cyrodiil

        if objectiveType == OBJECTIVE_CAPTURE_AREA then -- flag in keep
            table.insert(self.list.objective.flag, LibCyrodiilTracker.ObjectiveItem.Flag:New(keepId, objectiveId, bgContext, objectiveType))
        elseif objectiveType == OBJECTIVE_ARTIFACT_OFFENSIVE then -- scroll (off)
            table.insert(self.list.objective.scroll, LibCyrodiilTracker.ObjectiveItem.Scroll:New(keepId, objectiveId, bgContext, objectiveType))
        elseif objectiveType == OBJECTIVE_ARTIFACT_DEFENSIVE then -- scroll (def)
            table.insert(self.list.objective.scroll, LibCyrodiilTracker.ObjectiveItem.Scroll:New(keepId, objectiveId, bgContext, objectiveType))
        elseif objectiveType == OBJECTIVE_ARTIFACT_RETURN then -- scroll storage in keep
            table.insert(self.list.objective.scrollStorage, LibCyrodiilTracker.ObjectiveItem.ScrollStorage:New(keepId, objectiveId, bgContext, objectiveType))
        elseif objectiveType == OBJECTIVE_DAEDRIC_WEAPON then -- volendrung
            table.insert(self.list.objective.volendrungBase, LibCyrodiilTracker.ObjectiveItem.VolendrungBase:New(keepId, objectiveId, bgContext, objectiveType))
        end
    end

    table.insert(self.list.objective.volendrung, LibCyrodiilTracker.ObjectiveItem.Volendrung:New())
end

function LibCyrodiilTracker.Manager:fireCstInfo()
    local map = {
        KEEP            = KEEP_KEEP,
        BASE            = KEEP_BASE,
        TEMPLE          = KEEP_TEMPLE,
        GATE            = KEEP_GATE,
        OUTPOST         = KEEP_OUTPOST,
        TOWN            = KEEP_TOWN,
        BRIDGE          = KEEP_BRIDGE,
        MILEGATE        = KEEP_MILEGATE,
        VOLENDRUNG_BASE = OBJECTIVE_VOLENDRUNG_BASE
    }

    for cstKey, managerKey in pairs(LibCyrodiilTracker.CST) do
        for cstName, data in pairs(LibCyrodiilTracker.CST[cstName]) do
            LibCyrodiilTracker.Manager.callbackManager:FireCallbacks(
                LibCyrodiilTracker.Manager.callbackEvents.cstInfo,
                managerKey,
                cstName,
                data
            )
        end
    end
end

function LibCyrodiilTracker.Manager:findAll(typeInfo, compareFct, ...)
    catType  = typeInfo.cat
    itemType = typeInfo.type

    local itemList = {}

    if self.list[catType] == nil then
        return itemList
    elseif self.list[catType][itemType] == nil then
        return itemList
    end

    for _, item in ipairs(self.list[catType][itemType]) do
        if compareFct(item, unpack(arg)) == true then
            table.insert(itemList, item)
        end
    end

    return itemList
end

function LibCyrodiilTracker.Manager:findBy(typeInfo, compareFct, ...)
    local list = self:findAll(typeInfo, compareFct, unpack(arg))

    if #list == 1 then
        return list[1]
    elseif #list > 1
        return false --Should not happens
    end

    return nil
end

function LibCyrodiilTracker.Manager:findById(itemId, typeInfo)
    return self:findBy(typeInfo, self:compareFindById, itemId)
end

function LibCyrodiilTracker.Manager:compareFindById(item, itemId)
    if item.id == itemId then
        return true
    end

    return false
end

function LibCyrodiilTracker.Manager:findByCstName(itemCstName, typeInfo)
    return self:findBy(typeInfo, self:compareFindByCstName, itemCstName)
end

function LibCyrodiilTracker.Manager:compareFindByCstName(item, itemCstName)
    if item.cstName == itemCstName then
        return true
    end

    return false
end

function LibCyrodiilTracker.Manager:obtainVolendrung()
    return self.list.objective.volendrung[1]
end
