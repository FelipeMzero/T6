require("T6.KeyBindSelector")
require("T6.ButtonLayoutOptions")
require("T6.StickLayoutOptions")

local PTBR = {
	["MENU_SENSITIVITY_VERY_LOW_CAPS"]              = "Muito Baixa",
	["MENU_SENSITIVITY_LOW_CAPS"]                   = "Baixa",
	["MENU_SENSITIVITY_MEDIUM_CAPS"]                = "Media",
	["MENU_SENSITIVITY_HIGH_CAPS"]                  = "Alta",
	["MENU_SENSITIVITY_VERY_HIGH_CAPS"]             = "Muito Alta",
	["MENU_SENSITIVITY_INSANE_CAPS"]                = "Extrema",
	["MENU_NO_CAPS"]                                = "NAO",
	["MENU_YES_CAPS"]                               = "SIM",
	["MENU_INVERT_MOUSE_CAPS"]                      = "Inverter Mouse",
	["MENU_FREE_LOOK_CAPS"]                         = "Visao Livre",
	["MENU_MOUSE_SENSITIVITY_CAPS"]                 = "Sensibilidade do Mouse",
	["MENU_CONTROLS_CAPS"]                          = "CONTROLES",
	["MENU_LOOK_CAPS"]                              = "VISAO",
	["MENU_MOVE_CAPS"]                              = "MOVIMENTACAO",
	["MENU_COMBAT_CAPS"]                            = "COMBATE",
	["MENU_INTERACT_CAPS"]                          = "INTERACAO",
	["PLATFORM_GAMEPAD_CAPS"]                       = "CONTROLE",
	["MENU_LEAN_LEFT_CAPS"]                         = "Inclinar Esquerda",
	["MENU_LEAN_RIGHT_CAPS"]                        = "Inclinar Direita",
	["MENU_LOOK_UP_CAPS"]                           = "Olhar Para Cima",
	["MENU_LOOK_DOWN_CAPS"]                         = "Olhar Para Baixo",
	["MENU_TURN_LEFT_CAPS"]                         = "Virar Esquerda",
	["MENU_TURN_RIGHT_CAPS"]                        = "Virar Direita",
	["MENU_MOUSE_LOOK_CAPS"]                        = "Visao com Mouse",
	["MENU_CENTER_VIEW_CAPS"]                       = "Centralizar Visao",
	["MENU_FORWARD_CAPS"]                           = "Mover Para Frente",
	["MENU_BACKPEDAL_CAPS"]                         = "Mover Para Tras",
	["MENU_MOVE_LEFT_CAPS"]                         = "Mover Esquerda",
	["MENU_MOVE_RIGHT_CAPS"]                        = "Mover Direita",
	["MENU_STANDJUMP_CAPS"]                         = "Agachar/Pular",
	["MENU_GO_TO_CROUCH_CAPS"]                      = "Abaixar",
	["MENU_GO_TO_PRONE_CAPS"]                       = "Deitar",
	["MENU_TOGGLE_CROUCH_CAPS"]                     = "Alternar Agachamento",
	["MENU_TOGGLE_PRONE_CAPS"]                      = "Alternar Posicao Deitada",
	["MENU_CROUCH_CAPS"]                            = "Agachar",
	["MENU_PRONE_CAPS"]                             = "Deitar",
	["PLATFORM_CHANGE_STANCE_CAPS"]                 = "Mudar Posicao",
	["MENU_STRAFE_CAPS"]                            = "Desvio Lateral",
	["MENU_ATTACK_CAPS"]                            = "Atacar",
	["MENU_AIM_DOWN_THE_SIGHT_CAPS"]                = "Apontar",
	["MENU_TOGGLE_AIM_DOWN_THE_SIGHT_CAPS"]         = "Alternar Mira",
	["MENU_MELEE_ATTACK_CAPS"]                      = "Corpo a Corpo",
	["PLATFORM_SWITCH_WEAPON_CAPS"]                 = "Trocar Arma",
	["PLATFORM_NEXT_WEAPON_CAPS"]                   = "Proxima Arma",
	["MENU_RELOAD_WEAPON_CAPS"]                     = "Recarregar",
	["MENU_SPRINT_CAPS"]                            = "Correr",
	["MENU_SPRINT_HOLD_BREATH_CAPS"]                = "Correr / Prender Respiracao",
	["MENU_STEADY_SNIPER_RIFLE_CAPS"]               = "Estabilizar Franco-Atirador",
	["PLATFORM_THROW_PRIMARY_CAPS"]                 = "Lancar Equip. Primario",
	["PLATFORM_THROW_SECONDARY_CAPS"]               = "Lancar Equip. Secundario",
	["MENU_USE_CAPS"]                               = "Usar / Interagir",
	["PLATFORM_ACTIONSLOT_3"]                       = "Slot de Acao 3",
	["PLATFORM_NEXT_SCORE_STREAK_CAPS"]             = "Proximo Scorestreak",
	["PLATFORM_PREVIOUS_SCORE_STREAK_CAPS"]         = "Scorestreak Anterior",
	["PLATFORM_ACTIVATE_SCORE_STREAK_CAPS"]         = "Ativar Scorestreak",
	["PLATFORM_ACTIONSLOT_1_HINT"]                  = "Seleciona o proximo scorestreak disponivel.",
	["PLATFORM_ACTIONSLOT_2_HINT"]                  = "Seleciona o scorestreak anterior.",
	["PLATFORM_ACTIONSLOT_4_HINT"]                  = "Ativa o scorestreak selecionado.",
	["MENU_SCREENSHOT_CAPS"]                        = "Captura de Tela",
	["MPUI_CHOOSE_CLASS_CAPS"]                      = "Escolher Classe",
	["PLATFORM_SCOREBOARD_CAPS"]                    = "Placar",
	["PLATFORM_SCOREBOARD_TOGGLE_CAPS"]             = "Alternar Placar",
	["MENU_VOICE_CHAT_BUTTON_CAPS"]                 = "Chat de Voz",
	["MENU_CHAT_CAPS"]                              = "Chat Publico",
	["MENU_TEAM_CHAT_CAPS"]                         = "Chat do Time",
	["PLATFORM_ENABLE_GAMEPAD_CAPS"]                = "Habilitar Controle",
	["MENU_TARGET_ASSIST_CAPS"]                     = "Assistencia de Mira",
	["MENU_TARGET_ASSIST_DESC"]                     = "Ativa ou desativa a assistencia de mira com controle.",
	["MENU_LOOK_INVERSION_CAPS"]                    = "Inverter Visao Vertical",
	["MENU_LOOK_INVERSION_DESC"]                    = "Inverte o eixo vertical do movimento da camera.",
	["PLATFORM_CONTROLLER_VIBRATION_CAPS"]          = "Vibracao do Controle",
	["PLATFORM_CONTROLLER_VIBRATION_DESC"]          = "Ativa ou desativa a vibracao do controle.",
	["MENU_THEATER_BUTTON_LAYOUT_CAPS"]             = "Layout Teatro",
	["MENU_THEATER_BUTTON_LAYOUT_DESC"]             = "Configura o layout de botoes no modo Teatro.",
	["MENU_THUMBSTICK_LAYOUT_CAPS"]                 = "Layout dos Analogs",
	["MENU_THUMBSTICK_LAYOUT_DESC"]                 = "Configura o layout dos analogs do controle.",
	["MENU_BUTTON_LAYOUT_CAPS"]                     = "Layout dos Botoes",
	["MENU_BUTTON_LAYOUT_DESC"]                     = "Configura o layout dos botoes do controle.",
	["MENU_LOOK_SENSITIVITY_CAPS"]                  = "Sensibilidade da Camera",
	["PLATFORM_LOOK_SENSITIVITY_DESC"]              = "Ajusta a sensibilidade de rotacao da camera.",
	["DEADZONE_MAX"]                                = "Zona Morta Maxima",
	["DEADZONE_MAX_DESC"]                           = "Ajusta a zona morta maxima do analog.",
	["DEADZONE_MIN"]                                = "Zona Morta Minima",
	["DEADZONE_MIN_DESC"]                           = "Ajusta a zona morta minima do analog.",
}

local function L(key)
	return PTBR[key] or Engine.Localize(key)
end

CoD.OptionsControls = {}
CoD.OptionsControls.CurrentTabIndex = nil

CoD.OptionsControls.Button_AddChoices_LookSensitivity = function (sensitivities)
	sensitivities.strings = {
		L("MENU_SENSITIVITY_VERY_LOW_CAPS"),
		L("MENU_SENSITIVITY_LOW_CAPS"),
		"3",
		L("MENU_SENSITIVITY_MEDIUM_CAPS"),
		"5",
		"6",
		"7",
		L("MENU_SENSITIVITY_HIGH_CAPS"),
		"9",
		"10",
		L("MENU_SENSITIVITY_VERY_HIGH_CAPS"),
		"12",
		"13",
		L("MENU_SENSITIVITY_INSANE_CAPS")
	}
	sensitivities.values = {
		CoD.SENSITIVITY_1,
		CoD.SENSITIVITY_2,
		CoD.SENSITIVITY_3,
		CoD.SENSITIVITY_4,
		CoD.SENSITIVITY_5,
		CoD.SENSITIVITY_6,
		CoD.SENSITIVITY_7,
		CoD.SENSITIVITY_8,
		CoD.SENSITIVITY_9,
		CoD.SENSITIVITY_10,
		CoD.SENSITIVITY_11,
		CoD.SENSITIVITY_12,
		CoD.SENSITIVITY_13,
		CoD.SENSITIVITY_14
	}
	CoD.Options.Button_AddChoices(sensitivities)
end

CoD.OptionsControls.Button_AddChoices_InvertMouse = function (lookTabButtonList, LocalClientIndex)
	lookTabButtonList:addChoice(LocalClientIndex, L("MENU_NO_CAPS"), 0.02)
	lookTabButtonList:addChoice(LocalClientIndex, L("MENU_YES_CAPS"), -0.02)
end

CoD.OptionsControls.Callback_GamepadSelector = function (gamepadEnabled, client)
	if client then
		Engine.SetHardwareProfileValue(gamepadEnabled.parentSelectorButton.m_profileVarName, gamepadEnabled.value)
		if gamepadEnabled.value == 1 then
			Dvar.gpad_enabled:set(true)
			Engine.Exec(0, "execcontrollerbindings")
		else
			Dvar.gpad_enabled:set(false)
		end
	end
end

CoD.OptionsControls.Button_AddChoices_Gamepad = function (gamepadButtonList)
	gamepadButtonList:addChoice("Desativado", 0, nil, CoD.OptionsControls.Callback_GamepadSelector)
	gamepadButtonList:addChoice("Ativado", 1, nil, CoD.OptionsControls.Callback_GamepadSelector)
end

CoD.OptionsControls.AddKeyBindingElements = function (localClientIndex, buttonList, keyCommandsAndLabels)
	for Key, keyCommandAndLabel in ipairs(keyCommandsAndLabels) do
		if keyCommandAndLabel.command == "break" then
			buttonList:addSpacer(CoD.CoD9Button.Height / 2)
		else
			local label = L(keyCommandAndLabel.label)
			if keyCommandAndLabel.hint ~= nil then
				buttonList:addKeyBindSelector(localClientIndex, label, keyCommandAndLabel.command, CoD.BIND_PLAYER, keyCommandAndLabel.hint)
			else
				buttonList:addKeyBindSelector(localClientIndex, label, keyCommandAndLabel.command, CoD.BIND_PLAYER)
			end
		end
	end
end

CoD.OptionsControls.Button_AddChoices_YesOrNo = function (lookTabButtonList, LocalClientIndex)
	lookTabButtonList.strings = {
		Engine.Localize("MENU_NO_CAPS"),
		Engine.Localize("MENU_YES_CAPS")
	}
	lookTabButtonList.values = {
		0,
		1
	}
	CoD.OptionsControls.Button_AddChoices(lookTabButtonList, LocalClientIndex)
end

CoD.OptionsControls.Button_AddChoices = function (lookTabButtonList, LocalClientIndex)
	if lookTabButtonList.strings == nil or #lookTabButtonList.strings == 0 then
		return 
	end
	for StringIndex = 1, #lookTabButtonList.strings, 1 do
		lookTabButtonList:addChoice(LocalClientIndex, lookTabButtonList.strings[StringIndex], lookTabButtonList.values[StringIndex])
	end
end

CoD.OptionsControls.CreateLookTab = function (lookTab, localClientIndex)
	local lookTabContainer = LUI.UIContainer.new()
	local lookTabButtonList = CoD.Options.CreateButtonList()
	lookTab.buttonList = lookTabButtonList
	lookTabContainer:addElement(lookTabButtonList)
	CoD.OptionsControls.AddKeyBindingElements(localClientIndex, lookTabButtonList, {
		{
			command = "+leanleft",
			label = "MENU_LEAN_LEFT_CAPS"
		},
		{
			command = "+leanright",
			label = "MENU_LEAN_RIGHT_CAPS"
		},
		{
			command = "+lookup",
			label = "MENU_LOOK_UP_CAPS"
		},
		{
			command = "+lookdown",
			label = "MENU_LOOK_DOWN_CAPS"
		},
		{
			command = "+left",
			label = "MENU_TURN_LEFT_CAPS"
		},
		{
			command = "+right",
			label = "MENU_TURN_RIGHT_CAPS"
		},
		{
			command = "+mlook",
			label = "MENU_MOUSE_LOOK_CAPS"
		},
		{
			command = "centerview",
			label = "MENU_CENTER_VIEW_CAPS"
		}
	})
	lookTabButtonList:addSpacer(CoD.CoD9Button.Height / 2)
	CoD.OptionsControls.Button_AddChoices_InvertMouse(lookTabButtonList:addDvarLeftRightSelector(localClientIndex, L("MENU_INVERT_MOUSE_CAPS"), "m_pitch"), localClientIndex)
	CoD.OptionsControls.Button_AddChoices_YesOrNo(lookTabButtonList:addDvarLeftRightSelector(localClientIndex, L("MENU_FREE_LOOK_CAPS"), "cl_freelook"), localClientIndex)
	local MouseSensitivityOptions = lookTabButtonList:addProfileLeftRightSlider(localClientIndex, L("MENU_MOUSE_SENSITIVITY_CAPS"), "mouseSensitivity", 0.01, 30, "Use as setas para ajustes mais precisos.", nil, nil, CoD.Options.AdjustSFX)
	MouseSensitivityOptions:setNumericDisplayFormatString("%.2f")
	MouseSensitivityOptions:setRoundToFraction(0.5)
	MouseSensitivityOptions:setBarSpeed(0.01)
	return lookTabContainer
end

CoD.OptionsControls.CreateMoveTab = function (moveTab, localClientIndex)
	local moveTabContainer = LUI.UIContainer.new()
	local moveTabButtonList = CoD.Options.CreateButtonList()
	moveTab.buttonList = moveTabButtonList
	moveTabContainer:addElement(moveTabButtonList)
	CoD.OptionsControls.AddKeyBindingElements(localClientIndex, moveTabButtonList, {
		{
			command = "+forward",
			label = "MENU_FORWARD_CAPS"
		},
		{
			command = "+back",
			label = "MENU_BACKPEDAL_CAPS"
		},
		{
			command = "+moveleft",
			label = "MENU_MOVE_LEFT_CAPS"
		},
		{
			command = "+moveright",
			label = "MENU_MOVE_RIGHT_CAPS"
		},
		{
			command = "break"
		},
		{
			command = "+gostand",
			label = "MENU_STANDJUMP_CAPS"
		},
		{
			command = "gocrouch",
			label = "MENU_GO_TO_CROUCH_CAPS"
		},
		{
			command = "goprone",
			label = "MENU_GO_TO_PRONE_CAPS"
		},
		{
			command = "togglecrouch",
			label = "MENU_TOGGLE_CROUCH_CAPS"
		},
		{
			command = "toggleprone",
			label = "MENU_TOGGLE_PRONE_CAPS"
		},
		{
			command = "+movedown",
			label = "MENU_CROUCH_CAPS"
		},
		{
			command = "+prone",
			label = "MENU_PRONE_CAPS"
		},
		{
			command = "break"
		},
		{
			command = "+stance",
			label = "PLATFORM_CHANGE_STANCE_CAPS"
		},
		{
			command = "+strafe",
			label = "MENU_STRAFE_CAPS"
		}
	})
	return moveTabContainer
end

CoD.OptionsControls.CreateCombatTab = function (combatTab, localClientIndex)
	local combatTabContainer = LUI.UIContainer.new()
	local combatTabButtonList = CoD.Options.CreateButtonList()
	combatTab.buttonList = combatTabButtonList
	combatTabContainer:addElement(combatTabButtonList)
	CoD.OptionsControls.AddKeyBindingElements(localClientIndex, combatTabButtonList, {
		{
			command = "+attack",
			label = "MENU_ATTACK_CAPS"
		},
		{
			command = "+speed_throw",
			label = "MENU_AIM_DOWN_THE_SIGHT_CAPS"
		},
		{
			command = "+toggleads_throw",
			label = "MENU_TOGGLE_AIM_DOWN_THE_SIGHT_CAPS"
		},
		{
			command = "+melee",
			label = "MENU_MELEE_ATTACK_CAPS"
		},
		{
			command = "+weapnext_inventory",
			label = "PLATFORM_SWITCH_WEAPON_CAPS"
		},
		{
			command = "weapprev",
			label = "PLATFORM_NEXT_WEAPON_CAPS"
		},
		{
			command = "+reload",
			label = "MENU_RELOAD_WEAPON_CAPS"
		},
		{
			command = "+sprint",
			label = "MENU_SPRINT_CAPS"
		},
		{
			command = "+breath_sprint",
			label = "MENU_SPRINT_HOLD_BREATH_CAPS"
		},
		{
			command = "+holdbreath",
			label = "MENU_STEADY_SNIPER_RIFLE_CAPS"
		},
		{
			command = "+frag",
			label = "PLATFORM_THROW_PRIMARY_CAPS"
		},
		{
			command = "+smoke",
			label = "PLATFORM_THROW_SECONDARY_CAPS"
		}
	})
	return combatTabContainer
end

CoD.OptionsControls.CreateInteractTab = function (interactTab, localClientIndex)
	local interactTabContainer = LUI.UIContainer.new()
	local interactTabButtonList = CoD.Options.CreateButtonList()
	interactTab.buttonList = interactTabButtonList
	interactTabContainer:addElement(interactTabButtonList)
	local interactTabContents = {}
	if CoD.isZombie then
		interactTabContents = {
			{
				command = "+activate",
				label = "MENU_USE_CAPS"
			},
			{
				command = "break"
			},
			{
				command = "+actionslot 3",
				label = "PLATFORM_ACTIONSLOT_3"
			},
			{
				command = "+actionslot 1",
				label = "PLATFORM_NEXT_SCORE_STREAK_CAPS",
				hint = L("PLATFORM_ACTIONSLOT_1_HINT")
			},
			{
				command = "+actionslot 2",
				label = "PLATFORM_PREVIOUS_SCORE_STREAK_CAPS",
				hint = L("PLATFORM_ACTIONSLOT_2_HINT")
			},
			{
				command = "+actionslot 4",
				label = "PLATFORM_ACTIVATE_SCORE_STREAK_CAPS",
				hint = L("PLATFORM_ACTIONSLOT_4_HINT")
			},
			{
				command = "break"
			},
			{
				command = "screenshotjpeg",
				label = "MENU_SCREENSHOT_CAPS"
			}
		}
	elseif CoD.isMultiplayer then
		interactTabContents = {
			{
				command = "+activate",
				label = "MENU_USE_CAPS"
			},
			{
				command = "break"
			},
			{
				command = "+actionslot 3",
				label = "PLATFORM_ACTIONSLOT_3"
			},
			{
				command = "+actionslot 1",
				label = "PLATFORM_NEXT_SCORE_STREAK_CAPS"
			},
			{
				command = "+actionslot 2",
				label = "PLATFORM_PREVIOUS_SCORE_STREAK_CAPS"
			},
			{
				command = "+actionslot 4",
				label = "PLATFORM_ACTIVATE_SCORE_STREAK_CAPS"
			},
			{
				command = "break"
			},
			{
				command = "screenshotjpeg",
				label = "MENU_SCREENSHOT_CAPS"
			}
		}
	end
	table.insert(interactTabContents, {
		command = "chooseclass_hotkey",
		label = "MPUI_CHOOSE_CLASS_CAPS"
	})
	table.insert(interactTabContents, {
		command = "+scores",
		label = "PLATFORM_SCOREBOARD_CAPS"
	})
	table.insert(interactTabContents, {
		command = "togglescores",
		label = "PLATFORM_SCOREBOARD_TOGGLE_CAPS"
	})
	table.insert(interactTabContents, {
		command = "break"
	})
	table.insert(interactTabContents, {
		command = "+talk",
		label = "MENU_VOICE_CHAT_BUTTON_CAPS"
	})
	table.insert(interactTabContents, {
		command = "chatmodepublic",
		label = "MENU_CHAT_CAPS"
	})
	table.insert(interactTabContents, {
		command = "chatmodeteam",
		label = "MENU_TEAM_CHAT_CAPS"
	})
	CoD.OptionsControls.AddKeyBindingElements(localClientIndex, interactTabButtonList, interactTabContents)
	return interactTabContainer
end

CoD.OptionsControls.CreateGamepadTab = function (gamepadTab, localClientIndex)
	local gamepadButtonListContainer = LUI.UIContainer.new()
	local gamepadButtonList = CoD.Options.CreateButtonList()
	gamepadTab.buttonList = gamepadButtonList
	gamepadButtonListContainer:addElement(gamepadButtonList)
	CoD.OptionsControls.Button_AddChoices_Gamepad(gamepadButtonList:addHardwareProfileLeftRightSelector(L("PLATFORM_ENABLE_GAMEPAD_CAPS"), "gpad_enabled"))
	if UIExpression.IsInGame() == 1 and UIExpression.DvarBool(nil, "sv_allowAimAssist") == 0 then
		local targetAssistSelector = gamepadButtonList:addProfileLeftRightSelector(localClientIndex, L("MENU_TARGET_ASSIST_CAPS"), "somethingalwaysfalse", "Assistencia de mira desativada neste servidor.")
		targetAssistSelector:lock()
		CoD.Options.Button_AddChoices_EnabledOrDisabled(targetAssistSelector)
	else
		local targetAssistSelector = gamepadButtonList:addProfileLeftRightSelector(localClientIndex, L("MENU_TARGET_ASSIST_CAPS"), "input_targetAssist", L("MENU_TARGET_ASSIST_DESC"))
		CoD.Options.Button_AddChoices_EnabledOrDisabled(targetAssistSelector)
	end
	CoD.Options.Button_AddChoices_EnabledOrDisabled(gamepadButtonList:addProfileLeftRightSelector(localClientIndex, L("MENU_LOOK_INVERSION_CAPS"), "input_invertpitch", L("MENU_LOOK_INVERSION_DESC")))
	CoD.Options.Button_AddChoices_EnabledOrDisabled(gamepadButtonList:addProfileLeftRightSelector(localClientIndex, L("PLATFORM_CONTROLLER_VIBRATION_CAPS"), "gpad_rumble", L("PLATFORM_CONTROLLER_VIBRATION_DESC")))
	if UIExpression.IsDemoPlaying(localClientIndex) ~= 0 then
		local theaterButtonLayout = gamepadButtonList:addProfileLeftRightSelector(localClientIndex, L("MENU_THEATER_BUTTON_LAYOUT_CAPS"), "demo_controllerconfig", L("MENU_THEATER_BUTTON_LAYOUT_DESC"))
		CoD.ButtonLayout.AddChoices(theaterButtonLayout, localClientIndex)
		theaterButtonLayout:disableCycling()
		theaterButtonLayout:registerEventHandler("button_action", CoD.OptionsControls.Button_ButtonLayout)
	else
		local gamepadThumbSticksOptions = gamepadButtonList:addProfileLeftRightSelector(localClientIndex, L("MENU_THUMBSTICK_LAYOUT_CAPS"), "gpad_sticksConfig", L("MENU_THUMBSTICK_LAYOUT_DESC"))
		CoD.StickLayout.AddChoices(gamepadThumbSticksOptions)
		gamepadThumbSticksOptions:disableCycling()
		gamepadThumbSticksOptions:registerEventHandler("button_action", CoD.OptionsControls.Button_StickLayout)
		local gamepadButtonsOptions = gamepadButtonList:addProfileLeftRightSelector(localClientIndex, L("MENU_BUTTON_LAYOUT_CAPS"), "gpad_buttonsConfig", L("MENU_BUTTON_LAYOUT_DESC"))
		CoD.ButtonLayout.AddChoices(gamepadButtonsOptions, localClientIndex)
		gamepadButtonsOptions:disableCycling()
		gamepadButtonsOptions:registerEventHandler("button_action", CoD.OptionsControls.Button_ButtonLayout)
	end
	CoD.OptionsControls.Button_AddChoices_LookSensitivity(gamepadButtonList:addProfileLeftRightSelector(localClientIndex, L("MENU_LOOK_SENSITIVITY_CAPS"), "input_viewSensitivity", L("PLATFORM_LOOK_SENSITIVITY_DESC")))
	local GamepadDeadzoneMin = gamepadButtonList:addDvarLeftRightSlider(localClientIndex, L("DEADZONE_MAX"), "gpad_stick_deadzone_max", 0.01, 1, L("DEADZONE_MAX_DESC"))
	GamepadDeadzoneMin:setNumericDisplayFormatString("%.2f")
	GamepadDeadzoneMin:setRoundToFraction(0.01)
	GamepadDeadzoneMin:setBarSpeed(0.20)
	local FOVScaleSlider = gamepadButtonList:addDvarLeftRightSlider(localClientIndex, L("DEADZONE_MIN"), "gpad_stick_deadzone_min", 0.2, 1, L("DEADZONE_MIN_DESC"))
	FOVScaleSlider:setNumericDisplayFormatString("%.2f")
	FOVScaleSlider:setRoundToFraction(0.01)
	FOVScaleSlider:setBarSpeed(0.20)
	return gamepadButtonListContainer
end

CoD.OptionsControls.TabChanged = function (controlsWidget, controlsTab)
	controlsWidget.buttonList = controlsWidget.tabManager.buttonList
	local child = controlsWidget.buttonList:getFirstChild()
	while not child.m_focusable do
		child = child:getNextSibling()
	end
	if child ~= nil then
		child:processEvent({
			name = "gain_focus"
		})
	end
	CoD.OptionsControls.CurrentTabIndex = controlsTab.tabIndex
end

CoD.OptionsControls.DefaultPopup_RestoreDefaultControls = function (defaultsPopup, client)
	Engine.SetProfileVar(client.controller, "input_invertpitch", 0)
	Engine.SetProfileVar(client.controller, "gpad_rumble", 1)
	Engine.SetProfileVar(client.controller, "gpad_sticksConfig", CoD.THUMBSTICK_DEFAULT)
	Engine.SetProfileVar(client.controller, "gpad_buttonsConfig", CoD.BUTTONS_DEFAULT)
	Engine.SetProfileVar(client.controller, "input_viewSensitivity", CoD.SENSITIVITY_4)
	Engine.SetProfileVar(client.controller, "mouseSensitivity", 5)
	local defaultControlsConfig = "default_controls"
	if CoD.isMultiplayer then
		defaultControlsConfig = "default_mp_controls"
	end
	local language = Engine.GetLanguage()
	if language then
		defaultControlsConfig = defaultControlsConfig .. "_" .. language
	end
	Engine.ExecNow(client.controller, "exec " .. defaultControlsConfig)
	Engine.Exec(client.controller, "execcontrollerbindings")
	Dvar.gpad_stick_deadzone_max:set(0.01)
	Dvar.gpad_stick_deadzone_min:set(0.2)
	Engine.SyncHardwareProfileWithDvars()
	defaultsPopup:goBack(client.controller)
end

CoD.OptionsControls.OnFinishControls = function (menu, client)
	Engine.Exec(client.controller, "updateMustHaveBindings")
	if UIExpression.IsInGame() == 1 then
		Engine.Exec(client.controller, "updateVehicleBindings")
	end
	if CoD.useController and Engine.LastInput_Gamepad() then
		menu:dispatchEventToRoot({
			name = "input_source_changed",
			controller = client.controller,
			source = 0
		})
	else
		menu:dispatchEventToRoot({
			name = "input_source_changed",
			controller = client.controller,
			source = 1
		})
	end
end



CoD.OptionsControls.CloseMenu = function (menu, client)
	CoD.OptionsControls.OnFinishControls(menu, client)
	CoD.Options.CloseMenu(menu, client)
end

CoD.OptionsControls.OpenDefaultPopup = function (popup, client)
	local menu = popup:openMenu("SetDefaultControlsPopup", client.controller)
	menu:registerEventHandler("confirm_action", CoD.OptionsControls.DefaultPopup_RestoreDefaultControls)
	popup:close()
end

CoD.OptionsControls.OpenButtonLayout = function (buttonLayout, client)
	buttonLayout:saveState()
	buttonLayout:openMenu("ButtonLayout", client.controller)
	buttonLayout:close()
end

CoD.OptionsControls.OpenStickLayout = function (stickLayout, client)
	stickLayout:saveState()
	stickLayout:openMenu("StickLayout", client.controller)
	stickLayout:close()
end

CoD.OptionsControls.Button_StickLayout = function (gamepadThumbSticksOptions, client)
	gamepadThumbSticksOptions:dispatchEventToParent({
		name = "open_stick_layout",
		controller = client.controller
	})
end

CoD.OptionsControls.Button_ButtonLayout = function (gamepadButtonsOptions, client)
	gamepadButtonsOptions:dispatchEventToParent({
		name = "open_button_layout",
		controller = client.controller
	})
end

LUI.createMenu.OptionsControlsMenu = function (localClientIndex)
	local controlsWidget = nil
	if UIExpression.IsInGame() == 1 then
		controlsWidget = CoD.InGameMenu.New("OptionsControlsMenu", localClientIndex, L("MENU_CONTROLS_CAPS"))
	else
		controlsWidget = CoD.Menu.New("OptionsControlsMenu")
		controlsWidget:addTitle(L("MENU_CONTROLS_CAPS"), LUI.Alignment.Center)
		controlsWidget:addLargePopupBackground()
	end
	controlsWidget:setPreviousMenu("OptionsMenu")
	controlsWidget:setOwner(localClientIndex)
	controlsWidget:registerEventHandler("button_prompt_back", CoD.OptionsControls.Back)
	controlsWidget:registerEventHandler("restore_default_controls", CoD.OptionsControls.RestoreDefaultControls)
	controlsWidget:registerEventHandler("tab_changed", CoD.OptionsControls.TabChanged)
	controlsWidget:registerEventHandler("open_button_layout", CoD.OptionsControls.OpenButtonLayout)
	controlsWidget:registerEventHandler("open_stick_layout", CoD.OptionsControls.OpenStickLayout)
	controlsWidget:registerEventHandler("open_default_popup", CoD.OptionsControls.OpenDefaultPopup)
	controlsWidget:addSelectButton()
	controlsWidget:addBackButton()
	CoD.Options.AddResetPrompt(controlsWidget)
	local controlsTabs = CoD.Options.SetupTabManager(controlsWidget, 800)
	controlsTabs:addTab(localClientIndex, L("MENU_LOOK_CAPS"), CoD.OptionsControls.CreateLookTab)
	controlsTabs:addTab(localClientIndex, L("MENU_MOVE_CAPS"), CoD.OptionsControls.CreateMoveTab)
	controlsTabs:addTab(localClientIndex, L("MENU_COMBAT_CAPS"), CoD.OptionsControls.CreateCombatTab)
	controlsTabs:addTab(localClientIndex, L("MENU_INTERACT_CAPS"), CoD.OptionsControls.CreateInteractTab)
	controlsTabs:addTab(localClientIndex, L("PLATFORM_GAMEPAD_CAPS"), CoD.OptionsControls.CreateGamepadTab)
	if CoD.OptionsControls.CurrentTabIndex then
		controlsTabs:loadTab(localClientIndex, CoD.OptionsControls.CurrentTabIndex)
	else
		controlsTabs:refreshTab(localClientIndex)
	end
	return controlsWidget
end
