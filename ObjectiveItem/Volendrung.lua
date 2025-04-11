LibCyrodiilTracker.ObjectiveItem.Volendrung = setmetatable(
	{ManagerType = LibCyrodiilTracker.Manager.TYPE.OBJECTIVE_VOLENDRUNG},
    {__index = LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem}
)
LibCyrodiilTracker.ObjectiveItem.Volendrung.__index = LibCyrodiilTracker.ObjectiveItem.Volendrung

function LibCyrodiilTracker.ObjectiveItem.Volendrung:New(keepId, objectiveId, bgContext, objectiveType)
    local volendrung = self:obtainBaseItem(keepId, objectiveId, bgContext, objectiveType)

    volendrung.base    = nil
    volendrung.popAt   = nil,
    volendrung.lff     = nil, --Looking For Faction
    volendrung.carried = {
        state         = nil,
        characterName = "",
        displayName   = "",
        alliance      = nil,
        startedAt     = nil
    },
    volendrung.dropped = {
        state     = nil,
        startedAt = nil
    },

    setmetatable(volendrung, self)

    volendrung:addGlobalEvent()
    volendrung:addManagerLoadAllEvent()

    return volendrung
end

function LibCyrodiilTracker.ObjectiveItem.Volendrung:onManagerLoadAll()
    self:updateCarriedInfo()
    self:updateDroppedInfo()
    --Not for LFF state because we can't know it if we are not here when that occurs
end

function LibCyrodiilTracker.ObjectiveItem.Volendrung:findCarriedInfo()
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

function LibCyrodiilTracker.ObjectiveItem.Volendrung:findDroppedInfo()
    if self.controlState == OBJECTIVE_CONTROL_STATE_FLAG_DROPPED then
        self.dropped.state = true
    else
        self.dropped.state = false
    end
end

function LibCyrodiilTracker.ObjectiveItem.Volendrung:isUnknownState()
    if self.controlState == OBJECTIVE_CONTROL_STATE_UNKNOWN or self.state == nil then
        return true
    end

    return false
end

function LibCyrodiilTracker.ObjectiveItem.Volendrung:isLFF()
    return self.lff
end

function LibCyrodiilTracker.ObjectiveItem.Volendrung:isPoped()
    if self:isCarried() == true or self:isOnGround() == true or self:isWaitingAtPopLocation() == true then
        return true
    end

    return false
end

function LibCyrodiilTracker.ObjectiveItem.Volendrung:isCarried()
    if self.controlState == OBJECTIVE_CONTROL_STATE_FLAG_HELD then
        return true
    end

    return false
end

function LibCyrodiilTracker.ObjectiveItem.Volendrung:isOnGround()
    if self.controlState == OBJECTIVE_CONTROL_STATE_FLAG_DROPPED then
        return true
    end

    return false
end

function LibCyrodiilTracker.ObjectiveItem.Volendrung:isWaitingAtPopLocation()
    if self.controlState == OBJECTIVE_CONTROL_STATE_FLAG_AT_BASE then
        return true
    end

    return false
end
