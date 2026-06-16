require("T6.Lobby")
require("T6.Menus.PopupMenus")

CoD.IMGUIOrange = {}
CoD.IMGUIOrange.r = 0.98
CoD.IMGUIOrange.g = 0.43
CoD.IMGUIOrange.b = 0.10
CoD.TheaterLobby = {}
CoD.TheaterLobby.DemoList = {}
CoD.TheaterLobby.DemoList.ColumnWidth = {}
CoD.TheaterLobby.DemoList.ColumnWidth[1] = 225
CoD.TheaterLobby.DemoList.ColumnWidth[2] = 210
CoD.TheaterLobby.DemoList.ColumnWidth[3] = 110
CoD.TheaterLobby.DemoList.ColumnSpacing = 5
CoD.TheaterLobby.DemoList.ColumnTotalWidth = 555
CoD.TheaterLobby.DemoList.RowHeight = CoD.CoD9Button.Height
CoD.TheaterLobby.DemoList.LeftOffset = -50
CoD.TheaterLobby.DemoListButton = {}
CoD.TheaterLobby.DemoListButton.Height = 30
CoD.TheaterLobby.DemoListButton.TextOffset = 5
CoD.TheaterLobby.DemoListButton.TextHeight = CoD.textSize.Default
CoD.TheaterLobby.DemoListButton.Font = CoD.fonts.Default

local CloseAllPopups = function (Popup, ClientInstance)
    if Popup.m_inputDisabled == nil then
        Popup:goBack(ClientInstance.controller)
        if Popup.occludedMenu ~= nil then
            Popup.occludedMenu:processEvent({
                name = "closeallpopups",
                controller = ClientInstance.controller
            })
        end
    end
end

local LeaveTheaterLobby = function (TheaterLobby, ClientInstance)
	Engine.SetTheaterFileInfo(false)
	
	Engine.SetDvar("invite_visible", 1)
	Engine.SetGametype(Dvar.ui_gametype:get())
	
	Engine.ExecNow(ClientInstance.controller, "xstoppartykeeptogether")
	CoD.resetGameModes()
	CoD.StartMainLobby(ClientInstance.controller)
	Engine.SessionModeSetPrivate(false)
	TheaterLobby:processEvent({
		name = "lose_host"
	})
	
	CoD.Menu.goBack(TheaterLobby, ClientInstance.controller)
	
	if CoD.isMultiplayer then
		Engine.Exec(ClientInstance.controller, "party_updateActiveMenu")
	end
end

local BackButtonAction = function (TheaterLobby, ClientInstance)
	CoD.Lobby.ConfirmLeaveGameLobby(TheaterLobby, {
		controller = ClientInstance.controller,
		leaveLobbyHandler = LeaveTheaterLobby
	})
end

local DemoSortFunc = function (a, b)
	local numa = tonumber(a.timestamp)
	local numb = tonumber(b.timestamp)

	if numa == nil and numb == nil then
		return false;
	elseif numa == nil then
		return false
	elseif numb == nil then
		return true
	else
		return numa > numb 
	end
end

local StartDemoAction = function (Button, ClientInstance)
	Engine.Exec(0, "demo_play " .. CoD.TheaterLobby.CurrentDemo.name .. "\n")
end

local StartShoutcastDemoAction = function (Button, ClientInstance)
	Engine.Exec(0, "demo_play " .. CoD.TheaterLobby.CurrentDemo.name .. " Shoutcast\n")
end

local ButtonActionFunc = function (Button, ClientInstance)
	CoD.TheaterLobby.BaseMenu:openPopup("DemoListPopup", ClientInstance.controller)
end

local DeleteDemoPopupAction = function (Button, ClientInstance)
	local popup = Button:getParent():getParent()
	CloseAllPopups(popup, ClientInstance)
	CoD.TheaterLobby.BaseMenu:openPopup("DeleteFilmPopup", ClientInstance.controller)
end

local DeleteFilmAction = function (Popup, ClientInstance)
	if Engine.DeleteDemoFile(CoD.TheaterLobby.CurrentDemo.index) == true then
		RefreshListFunc(CoD.TheaterLobby.BaseMenu, CoD.TheaterLobby.BaseMenu.demoList)
	end
	
	CloseAllPopups(Popup, ClientInstance)
end

local GetZombieGameTypeName = function (Gametype, Mapname)
	local RawGametypeName = UIExpression.TableLookup(nil, CoD.gametypesTable, 0, 0, 1, Gametype, 7)
	if RawGametypeName == "" then
		return Gametype
	end
	local LocalizedGametypeName = Engine.Localize(RawGametypeName)
	if Mapname ~= nil then
		local RawGametypeAndMapname = RawGametypeName .. "_" .. Mapname
		if string.match(Engine.Localize(RawGametypeAndMapname), RawGametypeAndMapname) == nil then
			return RawGametypeAndMapname
		end
	end
	return LocalizedGametypeName
end

local GetDisplayableMap = function (Mapname, Gametype, Location)
	if CoD.isZombie then
		local DisplayMap = UIExpression.TableLookup(nil, CoD.mapsTable, 0, Mapname, 3)
		if DisplayMap ~= "" and DisplayMap ~= nil then
			if Gametype ~= "zclassic" then
				local DisplayLocation = Engine.Localize(Engine.GetZombieMapName(Location))
				return Engine.Localize(DisplayMap) .. " / " .. DisplayLocation
			end

			return Engine.Localize(DisplayMap)
		end
	else
		local DisplayMap = UIExpression.TableLookup(nil, CoD.mapsTable, 0, Mapname, 3)
		if DisplayMap ~= "" and DisplayMap ~= nil then
			return Engine.Localize(DisplayMap)
		end
	end

	return Mapname
end

local GetDisplayableGametype = function ()
	local Gametype = CoD.TheaterLobby.CurrentDemo.gametype
	if CoD.isZombie then
		local Mapname = CoD.TheaterLobby.CurrentDemo.map
		if Gametype == "zclassic" and Mapname ~= "zm_transit" then
			Gametype = "ZMUI_" .. Gametype .. "_" .. Mapname
		else
			Gametype = GetZombieGameTypeName(CoD.TheaterLobby.CurrentDemo.gametype)
		end
	else
		Gametype = UIExpression.TableLookup(nil, CoD.gametypesTable, 0, 0, 1, Gametype, 7)
	end
	if Gametype ~= "" and Gametype ~= nil then
		return Engine.Localize(Gametype)
	end
	return CoD.TheaterLobby.CurrentDemo.gametype
end

local ShowButtonBorderFunc = function (ButtonBorder, ClientInstance)
	Engine.PlaySound("uin_navigation_click")
	CoD.TheaterLobby.CurrentDemo = ButtonBorder.demoInfo

	if ButtonBorder.infoContainer.infoList ~= nil then
		ButtonBorder:show()
		if CoD.TheaterLobby.CurrentDemo.validData == false then
			ButtonBorder.infoContainer.infoList.fileName:setText("NAME: " .. CoD.TheaterLobby.CurrentDemo.name)
			ButtonBorder.infoContainer.infoList.revision:setText("Missing Metadata")
			ButtonBorder.infoContainer.infoList.date:setText("")
			ButtonBorder.infoContainer.infoList.server:setText("")
			ButtonBorder.infoContainer.infoList.map:setText("")
			ButtonBorder.infoContainer.infoList.gametype:setText("")
			ButtonBorder.infoContainer.infoList.length:setText("")
			ButtonBorder.infoContainer.infoList.preview:hide()
			ButtonBorder.infoContainer.infoList.preview.border:hide()
			return
		end
		ButtonBorder.infoContainer.infoList.fileName:setText("NAME: " .. CoD.TheaterLobby.CurrentDemo.name)
		ButtonBorder.infoContainer.infoList.revision:setText("VERSION: " .. CoD.TheaterLobby.CurrentDemo.revision)
		ButtonBorder.infoContainer.infoList.date:setText("DATE: " .. CoD.TheaterLobby.CurrentDemo.date)
		ButtonBorder.infoContainer.infoList.server:setText("HOSTNAME: " .. CoD.TheaterLobby.CurrentDemo.server)
		ButtonBorder.infoContainer.infoList.map:setText("MAP: " .. GetDisplayableMap(CoD.TheaterLobby.CurrentDemo.map, CoD.TheaterLobby.CurrentDemo.gametype, CoD.TheaterLobby.CurrentDemo.location))
		ButtonBorder.infoContainer.infoList.gametype:setText("GAMETYPE: " .. GetDisplayableGametype())
		ButtonBorder.infoContainer.infoList.length:setText("LENGTH: " .. CoD.TheaterLobby.CurrentDemo.length)
		if CoD.isZombie then
			local previewImage = "loadscreen_" .. CoD.TheaterLobby.CurrentDemo.map .. "_" .. CoD.TheaterLobby.CurrentDemo.gametype .. "_" .. CoD.TheaterLobby.CurrentDemo.location
			ButtonBorder.infoContainer.infoList.preview:setImage(RegisterMaterial(previewImage))
		else 
			local previewImage = "loadscreen_" .. CoD.TheaterLobby.CurrentDemo.map
			ButtonBorder.infoContainer.infoList.preview:setImage(RegisterMaterial(previewImage))
		end
		ButtonBorder.infoContainer.infoList.preview:show()
		ButtonBorder.infoContainer.infoList.preview.border:show()
	end
end

local CreateDemoInfoSection = function (TheaterLobbyMenu)
	local DemoInfoList = LUI.UIVerticalList.new({
		left = -300,
		top = CoD.Menu.TitleHeight,
		right = 0,
		bottom = CoD.textSize.Condensed,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		spacing = CoD.TheaterLobby.DemoList.ColumnSpacing
	})
	DemoInfoList.title = LUI.UIText.new({
		left = 0,
		top = 0,
		right = 100,
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	DemoInfoList.title:setRGB(CoD.IMGUIOrange.r, CoD.IMGUIOrange.g, CoD.IMGUIOrange.b)
	DemoInfoList.title:setText("DEMO INFORMATION")
	DemoInfoList.fileName = LUI.UIText.new({
		left = 0,
		top = 0,
		right = 100,
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	DemoInfoList.revision = LUI.UIText.new({
		left = 0,
		top = 0,
		right = 100,
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	DemoInfoList.date = LUI.UIText.new({
		left = 0,
		top = 0,
		right = 100,
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	DemoInfoList.server = LUI.UIText.new({
		left = 0,
		top = 0,
		right = 100,
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	DemoInfoList.map = LUI.UIText.new({
		left = 0,
		top = 0,
		right = 100,
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	DemoInfoList.gametype = LUI.UIText.new({
		left = 0,
		top = 0,
		right = 100,
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	DemoInfoList.length = LUI.UIText.new({
		left = 0,
		top = 0,
		right = 100,
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	
	DemoInfoList.preview = LUI.UIImage.new()
	DemoInfoList.preview:setLeftRight(true, false, 0, 320)
	DemoInfoList.preview:setTopBottom(true, false, 0, 180)
	DemoInfoList.preview:setAlpha(1)
	DemoInfoList.preview.border = CoD.Border.new(2, 0.98, 0.43, 0.10)
	DemoInfoList.preview.border:hide()
	DemoInfoList.preview:addElement(DemoInfoList.preview.border)
	DemoInfoList.preview:hide()
	DemoInfoList:addElement(DemoInfoList.title)
	DemoInfoList:addElement(DemoInfoList.fileName)
	DemoInfoList:addElement(DemoInfoList.revision)
	DemoInfoList:addElement(DemoInfoList.date)
	DemoInfoList:addElement(DemoInfoList.server)
	DemoInfoList:addElement(DemoInfoList.map)
	DemoInfoList:addElement(DemoInfoList.gametype)
	DemoInfoList:addElement(DemoInfoList.length)
	DemoInfoList:addSpacer(50)
	DemoInfoList:addElement(DemoInfoList.preview)
	TheaterLobbyMenu:addElement(DemoInfoList)
	TheaterLobbyMenu.infoList = DemoInfoList
end

local CreateDemoListButton = function (TheaterLobbyMenu, f2_arg0, DemoInfo, UIElementTable, ClientInstance)
	local DemoListButton = LUI.UIButton.new(UIElementTable, ClientInstance)
	DemoListButton.id = "DemoListButton." .. DemoInfo.name
	DemoListButton.demo = DemoInfo
	local ButtonRow = LUI.UIHorizontalList.new({
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = CoD.TheaterLobby.DemoList.ColumnSpacing
	})
	local MapName = LUI.UIText.new({
		left = 0,
		top = -CoD.TheaterLobby.DemoListButton.TextHeight / 2,
		right = CoD.TheaterLobby.DemoList.ColumnWidth[1],
		bottom = CoD.TheaterLobby.DemoListButton.TextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.TheaterLobby.DemoListButton.Font
	})
	local Date = LUI.UIText.new({
		left = 0,
		top = -CoD.TheaterLobby.DemoListButton.TextHeight / 2,
		right = CoD.TheaterLobby.DemoList.ColumnWidth[2],
		bottom = CoD.TheaterLobby.DemoListButton.TextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.TheaterLobby.DemoListButton.Font
	})
	local Length = LUI.UIText.new({
		left = 0,
		top = -CoD.TheaterLobby.DemoListButton.TextHeight / 2,
		right = CoD.TheaterLobby.DemoList.ColumnWidth[3],
		bottom = CoD.TheaterLobby.DemoListButton.TextHeight / 2,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.TheaterLobby.DemoListButton.Font
	})
	MapName:setText(GetDisplayableMap(DemoInfo.map, DemoInfo.gametype, DemoInfo.location))
	Date:setText(DemoInfo.date)
	Length:setText(DemoInfo.length)
	ButtonRow:addSpacer(CoD.TheaterLobby.DemoListButton.TextOffset)
	ButtonRow:addElement(MapName)
	ButtonRow:addElement(Date)
	ButtonRow:addElement(Length)
	DemoListButton:addElement(ButtonRow)
	local ButtonBorder = CoD.Border.new(2, 0.98, 0.43, 0.10)
	ButtonBorder.demoInfo = DemoInfo
	ButtonBorder.infoContainer = TheaterLobbyMenu
	ButtonBorder:hide()
	ButtonBorder:registerEventHandler("button_over", ShowButtonBorderFunc)
	ButtonBorder:registerEventHandler("button_up", ButtonBorder.hide)
	DemoListButton:addElement(ButtonBorder)
	return DemoListButton
end

RefreshListFunc = function (TheaterLobbyMenu, DemoList)
	DemoList.verticalList:removeAllChildren()
	DemoList.scrollbar.image:setRGB(CoD.IMGUIOrange.r, CoD.IMGUIOrange.g, CoD.IMGUIOrange.b)
	local DemoListings = Engine.GetDemoList()
	if DemoListings == nil or #DemoListings == 0 then
		return
	end
	table.sort(DemoListings, DemoSortFunc)
	for DemoListingsIndex, DemoInfo in ipairs(DemoListings) do
		local DemoListButton = CreateDemoListButton(TheaterLobbyMenu, DemoListingsIndex, DemoInfo, {
			left = 0,
			top = 0,
			right = CoD.TheaterLobby.DemoList.ColumnTotalWidth,
			bottom = CoD.TheaterLobby.DemoList.RowHeight,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = false,
			spacing = CoD.TheaterLobby.DemoList.ColumnSpacing
		})
		DemoListButton:registerEventHandler("button_action", ButtonActionFunc)
		DemoList:addElementToList(DemoListButton)
		if DemoListingsIndex == 1 and CoD.useController then
			DemoListButton:processEvent({
				name = "gain_focus"
			})
		end
	end
end

local CreateDemoList = function (TheaterLobbyMenu, UIElementTable)
	local DemoList = CoD.ScrollingVerticalList.new(UIElementTable)
	DemoList.id = "DemoList"
	RefreshListFunc(TheaterLobbyMenu, DemoList)
	return DemoList
end

LUI.createMenu.DeleteFilmPopup = function (LocalClientIndex)
    local DeleteFilmPopup = CoD.Menu.NewSmallPopup("DeleteFilmPopup")
    CoD.perController[LocalClientIndex].firstTime = true
    CoD.PopupMenus.SetupConfirmPopup(DeleteFilmPopup, Engine.Localize("MENU_DELETE"), "Are you sure you want to delete this clip?", DeleteFilmAction, CloseAllPopups)
    DeleteFilmPopup:setPriority(1000)
    DeleteFilmPopup.confirmButton:processEvent({
        name = "gain_focus"
    })
    return DeleteFilmPopup
end

LUI.createMenu.DemoListPopup = function (LocalClientIndex)
    local DemoListPopup = CoD.Menu.NewSmallPopup("DemoListPopup")
    DemoListPopup:registerEventHandler("closeallpopups", CloseAllPopups)
    DemoListPopup.m_ownerController = LocalClientIndex
    DemoListPopup:addSelectButton()
    DemoListPopup:addBackButton()
    DemoListPopup:addTitle(Engine.Localize("MENU_OPTIONS_CAPS"))
    DemoListPopup.buttonList = CoD.ButtonList.new({
        leftAnchor = true,
        rightAnchor = false,
        left = 0,
        right = CoD.ButtonList.DefaultWidth,
        topAnchor = true,
        bottomAnchor = true,
        top = CoD.textSize.Big + 10,
        bottom = 0
    })
	
    DemoListPopup.startFilmButton = DemoListPopup.buttonList:addButton(Engine.Localize("MPUI_START_FILM_CAPS"))
    DemoListPopup.startFilmButton:registerEventHandler("button_action", StartDemoAction)
	
	DemoListPopup.startFilmButton = DemoListPopup.buttonList:addButton(Engine.Localize("MPUI_SHOUTCAST_FILM_CAPS"))
    DemoListPopup.startFilmButton:registerEventHandler("button_action", StartShoutcastDemoAction)
	
	DemoListPopup.buttonList:addSpacer(50)
	
    DemoListPopup.deleteFilmButton = DemoListPopup.buttonList:addButton(Engine.Localize("MENU_DELETE_CAPS"))
    DemoListPopup.deleteFilmButton:registerEventHandler("button_action", DeleteDemoPopupAction)
	
    DemoListPopup:addElement(DemoListPopup.buttonList)
    DemoListPopup.buttonList:processEvent({
        name = "gain_focus"
    })
    Engine.PlaySound("cac_loadout_edit_sel")
    return DemoListPopup
end

LUI.createMenu.TheaterLobby = function (LocalClientIndex, f1_arg1)
	local TheaterLobbyMenu = CoD.Menu.New("TheaterLobby")
	TheaterLobbyMenu:setPreviousMenu("MainLobby")
	TheaterLobbyMenu.controller = LocalClientIndex
	TheaterLobbyMenu:registerEventHandler("open_menu", CoD.Lobby.OpenMenu)
	TheaterLobbyMenu:addSelectButton()
	TheaterLobbyMenu:addBackButton()
	
	if CoD.isMultiplayer then
		Engine.Exec(LocalClientIndex, "party_updateActiveMenu")
	end
	Engine.Exec(LocalClientIndex, "loadcommonff")
	if ShowGlobe then
		ShowGlobe()
	end
	
	TheaterLobbyMenu:registerEventHandler("button_prompt_back", BackButtonAction)
	TheaterLobbyMenu:addTitle(Engine.Localize("MPUI_THEATER_LOBBY_CAPS"))

	TheaterLobbyMenu.header = LUI.UIHorizontalList.new({
		left = CoD.TheaterLobby.DemoList.LeftOffset,
		top = CoD.Menu.TitleHeight,
		right = 0,
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		spacing = CoD.TheaterLobby.DemoList.ColumnSpacing
	})
	TheaterLobbyMenu:addElement(TheaterLobbyMenu.header)
	TheaterLobbyMenu.backgroundGroup = LUI.UIHorizontalList.new({
		left = CoD.TheaterLobby.DemoList.LeftOffset,
		top = CoD.Menu.TitleHeight + CoD.CoD9Button.Height,
		right = 0,
		bottom = -CoD.CoD9Button.Height - 10,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = CoD.TheaterLobby.DemoList.ColumnSpacing,
		alpha = 0.065
	})
	TheaterLobbyMenu:addElement(TheaterLobbyMenu.backgroundGroup)
	local Columns = {
		LUI.UIImage.new({
			left = 0,
			top = 0,
			right = CoD.TheaterLobby.DemoList.ColumnWidth[1],
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		}),
		LUI.UIImage.new({
			left = 0,
			top = 0,
			right = CoD.TheaterLobby.DemoList.ColumnWidth[2],
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		}),
		LUI.UIImage.new({
			left = 0,
			top = 0,
			right = CoD.TheaterLobby.DemoList.ColumnWidth[3],
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		})
	}
	TheaterLobbyMenu.backgroundGroup:addElement(Columns[1])
	TheaterLobbyMenu.backgroundGroup:addElement(Columns[2])
	TheaterLobbyMenu.backgroundGroup:addElement(Columns[3])
	TheaterLobbyMenu.demoList = CreateDemoList(TheaterLobbyMenu, {
		left = CoD.TheaterLobby.DemoList.LeftOffset,
		top = CoD.Menu.TitleHeight + CoD.CoD9Button.Height,
		right = CoD.TheaterLobby.DemoList.ColumnTotalWidth + CoD.TheaterLobby.DemoList.LeftOffset,
		bottom = -CoD.CoD9Button.Height - 10,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true,
		spacing = 10
	})
	TheaterLobbyMenu:addElement(TheaterLobbyMenu.demoList)
	local MapName = LUI.UIText.new({
		left = 0,
		top = 0,
		right = CoD.TheaterLobby.DemoList.ColumnWidth[1],
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	local Date = LUI.UIText.new({
		left = 0,
		top = 0,
		right = CoD.TheaterLobby.DemoList.ColumnWidth[2],
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	local Length = LUI.UIText.new({
		left = 0,
		top = 0,
		right = CoD.TheaterLobby.DemoList.ColumnWidth[4],
		bottom = CoD.textSize.Condensed,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Condensed
	})
	MapName:setText(Engine.Localize("MENU_MAP_NAME_CAPS"))
	Date:setText("DATE")
	Length:setText("LENGTH")
	TheaterLobbyMenu.header:addSpacer(CoD.TheaterLobby.DemoListButton.TextOffset)
	TheaterLobbyMenu.header:addElement(MapName)
	TheaterLobbyMenu.header:addElement(Date)
	TheaterLobbyMenu.header:addElement(Length)
	CreateDemoInfoSection(TheaterLobbyMenu)
	
	CoD.TheaterLobby.BaseMenu = TheaterLobbyMenu
	return TheaterLobbyMenu
end