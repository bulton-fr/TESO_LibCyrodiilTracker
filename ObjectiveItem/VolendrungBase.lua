LibCyrodiilTracker.ObjectiveItem.VolendrungBase = setmetatable(
	{ManagerType = LibCyrodiilTracker.Manager.TYPE.OBJECTIVE_VOLENDRUNG_BASE},
    {__index = LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem}
)
LibCyrodiilTracker.ObjectiveItem.VolendrungBase.__index = LibCyrodiilTracker.ObjectiveItem.VolendrungBase

function LibCyrodiilTracker.ObjectiveItem.VolendrungBase:New(keepId, objectiveId, bgContext, objectiveType)
    local volendrungBase = self:obtainBaseItem(keepId, objectiveId, bgContext, objectiveType)

    setmetatable(volendrungBase, self)

    volendrungBase:addGlobalEvent()
    volendrungBase:addManagerLoadAllEvent()

    return volendrungBase
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:onManagerLoadAll()
    self:findVolendrung()
end

function LibCyrodiilTracker.ObjectiveItem.Scroll:findVolendrung()
    if self.controlState ~= OBJECTIVE_CONTROL_STATE_UNKNOWN then
        self.volendrung = self.Manager:obtainVolendrung()
        self.volendrung.base = self
    end
end
