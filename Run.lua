EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerAddonLoad", EVENT_ADD_ON_LOADED, LibCyrodiilTracker.Events.onLoaded)
EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerScreenLoad", EVENT_PLAYER_ACTIVATED, LibCyrodiilTracker.Events.onLoadScreen)

--[[
EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerScroll", EVENT_ARTIFACT_CONTROL_STATE, LibCyrodiilTracker.Events.onScrollRunner)
EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerScrollUpdate", EVENT_ARTIFACT_SCROLL_STATE_CHANGED, LibCyrodiilTracker.Events.onScrollUpdate)
EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerGuildKeepClaim", EVENT_GUILD_CLAIM_KEEP_CAMPAIGN_NOTIFICATION, LibCyrodiilTracker.Events.onGuildKeepClaim)
--EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerGuildKeepLost", EVENT_GUILD_LOST_KEEP_CAMPAIGN_NOTIFICATION, LibCyrodiilTracker.Events.onGuildKeepLost)
EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerKeepGateState", EVENT_KEEP_GATE_STATE_CHANGED, LibCyrodiilTracker.Events.onKeepGateState)
EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerKeepIsPassable", EVENT_KEEP_IS_PASSABLE_CHANGED, LibCyrodiilTracker.Events.onKeepIsPassable)
EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerKeepUAUpdate", EVENT_KEEP_UNDER_ATTACK_CHANGED , LibCyrodiilTracker.Events.onKeepUAUpdate)

EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerDaedricStateUpdate", EVENT_DAEDRIC_ARTIFACT_OBJECTIVE_STATE_CHANGED , LibCyrodiilTracker.Events.onDaedricStateUpdate)
EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerDaedricLookingForFaction",  EVENT_DAEDRIC_ARTIFACT_OBJECTIVE_SPAWNED_BUT_NOT_REVEALED , LibCyrodiilTracker.Events.onDaedricLFF)
--EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerDaedricPickupAsEmperor",  EVENT_NO_DAEDRIC_PICKUP_AS_EMPEROR , LibCyrodiilTracker.Events.onDaedricEmperor)
--EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerDaedricPickupWhenStealthed",  EVENT_NO_DAEDRIC_PICKUP_WHEN_STEALTHED , LibCyrodiilTracker.Events.onDaedricStealthed)

EVENT_MANAGER:RegisterForEvent("LibCyrodiilTrackerKeepGuardAlert",  EVENT_GUILD_KEEP_ATTACK_UPDATE , LibCyrodiilTracker.Events.onKeepGuardAlert)

--EVENT_KEEP_ALLIANCE_OWNER_CHANGED (*integer* _keepId_, *integer* _battlegroundContext_, *[Alliance|#Alliance]* _owningAlliance_, *[Alliance|#Alliance]* _oldOwningAlliance_)
--* EVENT_FAST_TRAVEL_KEEP_NETWORK_LINK_CHANGED (*luaindex* _linkIndex_, *[FastTravelLinkType|#FastTravelLinkType]* _linkType_, *[Alliance|#Alliance]* _owningAlliance_, *[FastTravelLinkType|#FastTravelLinkType]* _oldLinkType_, *[Alliance|#Alliance]* _oldOwningAlliance_, *bool* _isLocal_)
--* EVENT_GUILD_KEEP_CLAIM_UPDATED (*integer* _guildId_)
--]]