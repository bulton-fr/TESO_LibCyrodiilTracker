LibCyrodiilTracker.ObjectiveItem.Scroll = setmetatable(
	{ManagerType = LibCyrodiilTracker.Manager.TYPE.OBJECTIVE_SCROLL},
    {__index = LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem}
)
LibCyrodiilTracker.ObjectiveItem.Scroll.__index = LibCyrodiilTracker.ObjectiveItem.Scroll

function LibCyrodiilTracker.ObjectiveItem.Scroll:New(keepId, objectiveId, bgContext, objectiveType)
    local scroll = self:obtainBaseItem(keepId, objectiveId, bgContext, objectiveType)

    scroll.shortname   = ""
    scroll.storageKeep = {
        temple  = nil,
        last    = nil, -- @TODO : add last keep's alliance when captured
        current = nil,
    }
    scroll.carried     = {
        state         = nil,
        characterName = "",
        displayName   = "",
        alliance      = nil,
        startedAt     = nil
    }
    scroll.dropped     = {
        state     = nil,
        startedAt = nil
    }

    setmetatable(scroll, self)

    scroll:defineShortname()

    scroll:addGlobalEvent()
    scroll:addManagerLoadAllEvent()

    return scroll
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:defineShortname()
    local shortnameList = {
        ['Altadoon']  = 'Altadoon',
        ['Mnem']      = 'Mnem',
        ['Ghartok']   = 'Ghartok',
        ['Chim']      = 'Chim',
        ['Ni%-Mohk']  = 'Ni-Mohk',
        ['Alma Ruma'] = 'Alma Ruma',
    }

    for shortnameMatch, shortname in pairs(shortnameList) do
        if string.match(self.name, shortnameMatch) then
            self.shortname = shortname
            return
        end
    end
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:onManagerLoadAll()
    self:findTemple()
    self:findCurrentStorage()
    --self:findLastStorage() -- Not existing data when loaded
    self:updateCarriedInfo()
    self:updateDroppedInfo()
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:findTemple()
    self.storageKeep.temple = self.Manager:findById(self.keepId, self.Manager.TYPE.KEEP_TEMPLE)
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:findCurrentStorage()
    local keepId = GetKeepThatHasCapturedThisArtifactScrollObjective(self.storageKeep.temple.keepId, self.objectiveId, self.bgCtx)

    if keepId == self.storageKeep.temple.keepId then
        self.storageKeep.current = self.storageKeep.temple
    else
        self.storageKeep.current = self.Manager:findById(keepId, self.Manager.TYPE.KEEP_KEEP)
    end

    if self.storageKeep.current ~= nil then
        self.storageKeep.current.scroll = self
    end
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:findCarriedInfo()
    self.carried.state = IsCarryableObjectiveCarriedByLocalPlayer(self.storageKeep.temple.keepId, self.objectiveId, self.bgCtx)

    if self.carried.state == false then
        self.carried.characterName = ""
        self.carried.displayName   = ""
        self.carried.alliance      = nil

        return
    end

    self.carried.characterName, self.carried.displayName, _ = GetCarryableObjectiveHoldingCharacterInfo(
        self.storageKeep.temple.keepId,
        self.objectiveId,
        self.bgCtx
    )

    self.carried.alliance, _ = GetCarryableObjectiveHoldingAllianceInfo(self.storageKeep.temple.keepId, self.objectiveId, self.bgCtx)
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:findDroppedInfo()
    if self.controlState == OBJECTIVE_CONTROL_STATE_FLAG_DROPPED then
        self.dropped.state = true
    else
        self.dropped.state = false
    end
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:isOffensiveScroll()
    if self.objectiveType == OBJECTIVE_ARTIFACT_OFFENSIVE then
        return true
    end

    return false
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:isDefensiveScroll()
    if self.objectiveType == OBJECTIVE_ARTIFACT_DEFENSIVE then
        return true
    end

    return false
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:isRunning()
    if self.controlState == OBJECTIVE_CONTROL_STATE_FLAG_HELD then
        return true
    end

    return false
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:isDropped()
    if self.controlState == OBJECTIVE_CONTROL_STATE_FLAG_DROPPED then
        return true
    end

    return false
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:isAtTemple()
    if self.controlState == OBJECTIVE_CONTROL_STATE_FLAG_AT_BASE then
        return true
    end

    return false
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:isAtKeep()
    if self.controlState == OBJECTIVE_CONTROL_STATE_FLAG_AT_ENEMY_BASE then
        return true
    end

    return false
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:isDeposited()
    if self:isAtTemple() == true or self:isAtKeep() == true then
        return true
    end

    return false
end
