require("T6.LeftRightSelector")
CoD.DvarLeftRightSelector = {}
local DvarSelectorSetDvarFunc = function (DvarSelector)
	Engine.SetDvar(DvarSelector.parentSelectorButton.m_dvarName, DvarSelector.value)
	if UIExpression.IsInGame() == 0 then
		for Key, DvarValue in pairs(CoD.PrivateGameLobby.DvarDefaults) do
			if DvarSelector.parentSelectorButton.m_dvarName == Key then 
				if DvarSelector.value ~= DvarValue then 
					DvarSelector.parentSelectorButton:showStarIcon(true)
				else 
					DvarSelector.parentSelectorButton:showStarIcon(false)
				end
			end
		end
	end
end

CoD.DvarLeftRightSelector.AddChoice = function (ParentButton, LocalClientIndex, DvarName, Value, ExtraParams, StartingValue)
	local f2_local0 = nil
	if StartingValue ~= nil then
		f2_local0 = StartingValue
	else
		f2_local0 = DvarSelectorSetDvarFunc
	end
	CoD.LeftRightSelector.AddChoice(ParentButton, DvarName, f2_local0, {
		parentSelectorButton = ParentButton,
		value = Value,
		extraParams = ExtraParams
	})
end

CoD.DvarLeftRightSelector.getCurrentValue = function (DvarSelector)
	return UIExpression.DvarString(nil, DvarSelector.m_dvarName)
end

CoD.DvarLeftRightSelector.new = function (LocalClientIndex, ButtonName, DvarName, Description, f4_arg4)
	local DvarSelector = CoD.LeftRightSelector.new(ButtonName, UIExpression.DvarString(nil, DvarName), Description, f4_arg4, "cac_grid_nav")
	DvarSelector.m_dvarName = DvarName
	DvarSelector.m_currentController = LocalClientIndex
	DvarSelector.addChoice = CoD.DvarLeftRightSelector.AddChoice
	DvarSelector.getCurrentValue = CoD.DvarLeftRightSelector.getCurrentValue
	return DvarSelector
end

