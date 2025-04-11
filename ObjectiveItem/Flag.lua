LibCyrodiilTracker.ObjectiveItem.Flag = setmetatable(
	{ManagerType = LibCyrodiilTracker.Manager.TYPE.OBJECTIVE_FLAG},
    {__index = LibCyrodiilTracker.ObjectiveItem.AbstractObjectiveItem}
)
LibCyrodiilTracker.ObjectiveItem.Flag.__index = LibCyrodiilTracker.ObjectiveItem.Flag

function LibCyrodiilTracker.ObjectiveItem.Flag:New(keepId, objectiveId, bgContext, objectiveType)
    local flag = self:obtainBaseItem(keepId, objectiveId, bgContext, objectiveType)

    local influenceAlliance, influenceInRange = GetCaptureAreaObjectiveLastInfluenceState(keepId, objectiveId, bgContext)

	flag.alliance = {
		--@TODO TO CHECK
		owner     = GetCaptureAreaObjectiveOwner(keepId, objectiveId, bgContext),
		influence = influenceAlliance
	}
	flag.percent  = nil
	flag.captured = IsCaptureAreaObjectiveCaptured(keepId, objectiveId, bgContext)

    setmetatable(flag, self)

    flag:calcPercent()
    flag:addGlobalEvent()

    return flag
end

function LibCyrodiilTracker.ObjectiveItem.Flag:calcPercent()
    --@TODO
end

-- From Miat's PvP Alert : PVP:GetCapturePercentFromAlliance(objectiveState, objectiveAlliance, captureAlliance)
function LibCyrodiilTracker.ObjectiveItem.Flag:calcPercentPvPAlert(objectiveState, objectiveAlliance, captureAlliance)
	local percent
	if objectiveState == OBJECTIVE_CONTROL_STATE_AREA_ABOVE_CONTROL_THRESHOLD then
		if captureAlliance == objectiveAlliance then
			percent = 90
		else
			percent = 51
		end
	elseif objectiveState == OBJECTIVE_CONTROL_STATE_AREA_NO_CONTROL then
		if captureAlliance == 0 then
			percent = 0
		else
			percent = 10
		end
	elseif objectiveState == OBJECTIVE_CONTROL_STATE_AREA_MAX_CONTROL then
		percent = 100
	elseif objectiveState == OBJECTIVE_CONTROL_STATE_AREA_BELOW_CONTROL_THRESHOLD then
		if captureAlliance == objectiveAlliance then
			percent = 40
		else
			percent = 10
		end
	end

	if not percent then
		percent = 99
		-- d('missing percent!')
	end
	return percent
end
