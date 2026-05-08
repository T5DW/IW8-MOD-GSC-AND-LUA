local LUI_CoD_LuaCall_ExecuteNow = Engine.DAGFFDGFII
local Dvar_GetInt = Dvar.CFHDGABACF
local Get_DvarString = Dvar.DHEEJCCJBH
local Dvar_SetString = Dvar.BDEHAEGHAF
local IsDemoBuild = Engine.BGAAHHAGAC
local Dvar_GetString = Dvar.DHEEJCCJBH

-- Menus Menu
function wyatts_wz_menus(menu, controller)
    local self = LUI.UIElement.new()
    self.id = "wyatts_wz_menus"
    
    local controllerIndex = controller or 0
    
    -- Background
    local background = LUI.UIImage.new()
    background:SetRGBFromInt(0, 0)
    background:SetAlpha(0.8)
    background:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, 0)
    self:addElement(background)
    
    -- Banner
    local banner = LUI.UIImage.new()
    banner:SetRGBFromInt(0x333333, 0)
    banner:SetAlpha(0.9)
    banner:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, _1080p * 200)
    self:addElement(banner)
    
    -- Title text
    local text = LUI.UIText.new()
    text:setText("MENUS", 0)
    text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
    text:SetAlignment(LUI.Alignment.Left)
    text:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 800, _1080p * 40, _1080p * 100)
    self:addElement(text)
    
    -- Game Modes Button - top left (goes back to wyatts_wz)
    local gameModesBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "GAME MODES",
        description = "Return to Game Modes"
    })
    gameModesBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 300, _1080p * 120, _1080p * 180)
    gameModesBtn.Text:setText("GAME MODES")
    gameModesBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu wyatts_wz")
    end)
    self:addElement(gameModesBtn)
    
    -- Settings Button - top
    local settingsBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "SETTINGS",
        description = "Open Settings Menu"
    })
    settingsBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 320, _1080p * 520, _1080p * 120, _1080p * 180)
    settingsBtn.Text:setText("SETTINGS")
    settingsBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu wyatts_wz_settings")
    end)
    self:addElement(settingsBtn)
    
    -- Menus Button - top
    local menusBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "MENUS",
        description = "Menu Navigation"
    })
    menusBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 540, _1080p * 720, _1080p * 120, _1080p * 180)
    menusBtn.Text:setText("MENUS")
    menusBtn:registerEventHandler("button_action", function(element, event)
        -- Already in menus menu
    end)
    self:addElement(menusBtn)
    
    -- MP MAIN MENU Button
    local mpMainMenuBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "MP MAIN MENU",
        description = "Open MP Main Menu"
    })
    mpMainMenuBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 450, _1080p * 300, _1080p * 360)
    mpMainMenuBtn.Text:setText("MP MAIN MENU")
    mpMainMenuBtn:registerEventHandler("button_action", function(element, event)
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu MPmainmenu")
    end)
    self:addElement(mpMainMenuBtn)
    
    -- MP Private Match Button
    local mpPrivateMatchBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "MP PRIVATE MATCH",
        description = "Open MP Private Match"
    })
    mpPrivateMatchBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 450, _1080p * 400, _1080p * 460)
    mpPrivateMatchBtn.Text:setText("MP PRIVATE MATCH")
    mpPrivateMatchBtn:registerEventHandler("button_action", function(element, event)
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu PrivateMatchLobby")
    end)
    self:addElement(mpPrivateMatchBtn)
    
    -- SystemLink Menu Button
    local systemLinkBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "SYSTEMLINK MENU",
        description = "Open SystemLink Menu"
    })
    systemLinkBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 450, _1080p * 500, _1080p * 560)
    systemLinkBtn.Text:setText("SYSTEMLINK MENU")
    systemLinkBtn:registerEventHandler("button_action", function(element, event)
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu systemlinkmenu")
    end)
    self:addElement(systemLinkBtn)
    
    -- BACK TO MP Button
    local backMPBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "BACK TO MP",
        description = "Return to Multiplayer Private Match"
    })
    backMPBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1200, _1080p * 1450, _1080p * 800, _1080p * 860)
    backMPBtn.Text:setText("BACK TO MP")
    backMPBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu PrivateMatchLobby")
    end)
    self:addElement(backMPBtn)
    
    -- BACK TO WZ Button
    local backWZBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "BACK TO WZ",
        description = "Return to Warzone Private Match"
    })
    backWZBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1480, _1080p * 1730, _1080p * 800, _1080p * 860)
    backWZBtn.Text:setText("BACK TO WZ")
    backWZBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu WarzonePrivateMatchLobby")
    end)
    self:addElement(backWZBtn)
    
    return self
end

MenuBuilder.registerType("wyatts_wz_menus", wyatts_wz_menus)

-- Settings Menu
function wyatts_wz_settings(menu, controller)
    local self = LUI.UIElement.new()
    self.id = "wyatts_wz_settings"
    
    local controllerIndex = controller or 0
    
    -- Background
    local background = LUI.UIImage.new()
    background:SetRGBFromInt(0, 0)
    background:SetAlpha(0.8)
    background:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, 0)
    self:addElement(background)
    
    -- Banner
    local banner = LUI.UIImage.new()
    banner:SetRGBFromInt(0x333333, 0)
    banner:SetAlpha(0.9)
    banner:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, _1080p * 200)
    self:addElement(banner)
    
    -- Title text
    local text = LUI.UIText.new()
    text:setText("WYATTS GSC SETTINGS", 0)
    text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
    text:SetAlignment(LUI.Alignment.Left)
    text:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 800, _1080p * 40, _1080p * 100)
    self:addElement(text)
    
    -- Game Modes Button - top left
    local gameModesBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "GAME MODES",
        description = "Return to Game Modes"
    })
    gameModesBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 300, _1080p * 120, _1080p * 180)
    gameModesBtn.Text:setText("GAME MODES")
    gameModesBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu wyatts_wz")
    end)
    self:addElement(gameModesBtn)
    
    -- Settings Button - top
    local settingsBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "SETTINGS",
        description = "Settings Menu"
    })
    settingsBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 320, _1080p * 520, _1080p * 120, _1080p * 180)
    settingsBtn.Text:setText("SETTINGS")
    settingsBtn:registerEventHandler("button_action", function(element, event)
        -- Already in settings menu
    end)
    self:addElement(settingsBtn)
    
    -- Menus Button - top
    local menusBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "MENUS",
        description = "Menu Navigation"
    })
    menusBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 540, _1080p * 720, _1080p * 120, _1080p * 180)
    menusBtn.Text:setText("MENUS")
    menusBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu wyatts_wz_menus")
    end)
    self:addElement(menusBtn)
    
    -- Get current Stim Boost state
    local currentStimState = Dvar_GetInt("Stim_Boost")
    local stimButtonText = "ENABLE STIM BOOST"
    if currentStimState == 1 then
        stimButtonText = "DISABLE STIM BOOST"
    end
    
    -- Toggle Stim Boost Button
    local stimBoostBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = stimButtonText,
        description = "Toggle Stim Boost (Speed boost when using stim)"
    })
    stimBoostBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 450, _1080p * 240, _1080p * 300)
    stimBoostBtn.Text:setText(stimButtonText)
    stimBoostBtn:registerEventHandler("button_action", function(element, event)
        local currentState = Dvar_GetInt("Stim_Boost")
        
        if currentState == 1 then
            -- Disable Stim Boost
            Dvar_SetString("Stim_Boost", "0")
            LUI_CoD_LuaCall_ExecuteNow("set Stim_Boost 0")
            stimBoostBtn.Text:setText("ENABLE STIM BOOST")
            LUI_CoD_LuaCall_ExecuteNow("iprintlnbold \"^1Stim Boost DISABLED\"")
        else
            -- Enable Stim Boost
            Dvar_SetString("Stim_Boost", "1")
            LUI_CoD_LuaCall_ExecuteNow("set Stim_Boost 1")
            stimBoostBtn.Text:setText("DISABLE STIM BOOST")
            LUI_CoD_LuaCall_ExecuteNow("iprintlnbold \"^2Stim Boost ENABLED\"")
        end
    end)
    self:addElement(stimBoostBtn)
    
    -- BACK TO MP Button
    local backMPBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "BACK TO MP",
        description = "Return to Multiplayer Private Match"
    })
    backMPBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1200, _1080p * 1450, _1080p * 800, _1080p * 860)
    backMPBtn.Text:setText("BACK TO MP")
    backMPBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu PrivateMatchLobby")
    end)
    self:addElement(backMPBtn)
    
    -- BACK TO WZ Button
    local backWZBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "BACK TO WZ",
        description = "Return to Warzone Private Match"
    })
    backWZBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1480, _1080p * 1730, _1080p * 800, _1080p * 860)
    backWZBtn.Text:setText("BACK TO WZ")
    backWZBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu WarzonePrivateMatchLobby")
    end)
    self:addElement(backWZBtn)
    
    return self
end

MenuBuilder.registerType("wyatts_wz_settings", wyatts_wz_settings)

-- Main Menu
function wyatts_wz(menu, controller)
    local self = LUI.UIElement.new()
    self.id = "wyatts_wz"
    
    local controllerIndex = controller or 0
    
    -- Background
    local background = LUI.UIImage.new()
    background:SetRGBFromInt(0, 0)
    background:SetAlpha(0.8)
    background:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, 0)
    self:addElement(background)
    
    -- Banner
    local banner = LUI.UIImage.new()
    banner:SetRGBFromInt(0x333333, 0)
    banner:SetAlpha(0.9)
    banner:SetAnchorsAndPosition(0, 1, 0, 1, 0, 0, 0, _1080p * 200)
    self:addElement(banner)
    
    -- Title text
    local text = LUI.UIText.new()
    text:setText("WYATTS GSC MOD MENU", 0)
    text:SetFont(FONTS.GetFont(FONTS.MainBold.File))
    text:SetAlignment(LUI.Alignment.Left)
    text:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 800, _1080p * 40, _1080p * 100)
    self:addElement(text)
    
    -- Game Modes Button - top left
    local gameModesBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "GAME MODES",
        description = "Game Modes Menu"
    })
    gameModesBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 300, _1080p * 120, _1080p * 180)
    gameModesBtn.Text:setText("GAME MODES")
    gameModesBtn:registerEventHandler("button_action", function(element, event)
        -- Already in game modes menu
    end)
    self:addElement(gameModesBtn)
    
    -- Settings Button - top
    local settingsBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "SETTINGS",
        description = "Open Settings Menu"
    })
    settingsBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 320, _1080p * 520, _1080p * 120, _1080p * 180)
    settingsBtn.Text:setText("SETTINGS")
    settingsBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu wyatts_wz_settings")
    end)
    self:addElement(settingsBtn)
    
    -- Menus Button - top
    local menusBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "MENUS",
        description = "Menu Navigation"
    })
    menusBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 540, _1080p * 720, _1080p * 120, _1080p * 180)
    menusBtn.Text:setText("MENUS")
    menusBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu wyatts_wz_menus")
    end)
    self:addElement(menusBtn)
    
    -- LOADOUTS ROYAL 1.30 - 1.37
    local lrBtn1 = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "LOADOUTS ROYAL 1.30 - 1.37",
        description = "Loadouts Royal 1.30 - 1.37"
    })
    lrBtn1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 450, _1080p * 240, _1080p * 300)
    lrBtn1.Text:setText("LOADOUTS ROYAL 1.30 - 1.37")
    lrBtn1:registerEventHandler("button_action", function(element, event)
        LUI_CoD_LuaCall_ExecuteNow("exec br_core.cfg;MKQQKMRORQ 16;set scr_br_loadout_option \"standardammo\";set scr_br_allowLoadout 1;set scr_br_use_set_loadouts 1;set scr_br_allowLoadoutOnlyInPreLobby 0;exec br_core.cfg;br_minplayers 0;seta zetaforce 1;seta br_kiosk_sales_discount 100;NSQLTTMRMP mp_escape2")
    end)
    self:addElement(lrBtn1)
    
    -- LOADOUTS ROYAL 1.38 - 1.54
    local lrBtn2 = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "LOADOUTS ROYAL 1.38 - 1.54",
        description = "Loadouts Royal 1.38 - 1.54"
    })
    lrBtn2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 450, _1080p * 320, _1080p * 380)
    lrBtn2.Text:setText("LOADOUTS ROYAL 1.38 - 1.54")
    lrBtn2:registerEventHandler("button_action", function(element, event)
        LUI_CoD_LuaCall_ExecuteNow("exec br_core.cfg;MKQQKMRORQ 16;set scr_br_loadout_option \"standardammo\";set scr_br_allowLoadout 1;set scr_br_use_set_loadouts 1;set scr_br_allowLoadoutOnlyInPreLobby 0;exec br_core.cfg;br_minplayers 0;seta zetaforce 1;seta br_kiosk_sales_discount 100;NSQLTTMRMP mp_escape3")
    end)
    self:addElement(lrBtn2)
    
    -- LOADOUTS ROYAL 1.60 - 1.67
    local lrBtn3 = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "LOADOUTS ROYAL 1.60 - 1.67",
        description = "Loadouts Royal 1.60 - 1.67"
    })
    lrBtn3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 450, _1080p * 400, _1080p * 460)
    lrBtn3.Text:setText("LOADOUTS ROYAL 1.60 - 1.67")
    lrBtn3:registerEventHandler("button_action", function(element, event)
        LUI_CoD_LuaCall_ExecuteNow("exec br_core.cfg;MKQQKMRORQ 16;set scr_br_loadout_option \"standardammo\";set scr_br_allowLoadout 1;set scr_br_use_set_loadouts 1;set scr_br_allowLoadoutOnlyInPreLobby 0;exec br_core.cfg;br_minplayers 0;seta zetaforce 1;seta br_kiosk_sales_discount 100;NSQLTTMRMP mp_escape4")
    end)
    self:addElement(lrBtn3)
    
    -- PLUNDER + WYATTS GSC 1.30 - 1.37
    local plunderBtn1 = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "PLUNDER + WYATTS GSC 1.30 - 1.37",
        description = "Plunder with Wyatt's GSC Mod 1.30 - 1.37"
    })
    plunderBtn1:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 550, _1080p * 520, _1080p * 580)
    plunderBtn1.Text:setText("PLUNDER + WYATTS GSC 1.30 - 1.37")
    plunderBtn1:registerEventHandler("button_action", function(element, event)
        LUI_CoD_LuaCall_ExecuteNow("set scr_br_gametype dmz;set scr_br_loadout_option \"standardammo\";set scr_br_allowLoadout 1;set scr_br_use_set_loadouts 1;set scr_br_allowLoadoutOnlyInPreLobby 0;NSQLTTMRMP mp_escape2")
    end)
    self:addElement(plunderBtn1)
    
    -- PLUNDER + WYATTS GSC 1.38 - 1.54
    local plunderBtn2 = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "PLUNDER + WYATTS GSC 1.38 - 1.54",
        description = "Plunder with Wyatt's GSC Mod 1.38 - 1.54"
    })
    plunderBtn2:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 550, _1080p * 600, _1080p * 660)
    plunderBtn2.Text:setText("PLUNDER + WYATTS GSC 1.38 - 1.54")
    plunderBtn2:registerEventHandler("button_action", function(element, event)
        LUI_CoD_LuaCall_ExecuteNow("set scr_br_gametype dmz;set scr_br_loadout_option \"standardammo\";set scr_br_allowLoadout 1;set scr_br_use_set_loadouts 1;set scr_br_allowLoadoutOnlyInPreLobby 0;NSQLTTMRMP mp_escape3")
    end)
    self:addElement(plunderBtn2)
    
    -- PLUNDER + WYATTS GSC 1.60 - 1.67
    local plunderBtn3 = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "PLUNDER + WYATTS GSC 1.60 - 1.67",
        description = "Plunder with Wyatt's GSC Mod 1.60 - 1.67"
    })
    plunderBtn3:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 100, _1080p * 550, _1080p * 680, _1080p * 740)
    plunderBtn3.Text:setText("PLUNDER + WYATTS GSC 1.60 - 1.67")
    plunderBtn3:registerEventHandler("button_action", function(element, event)
        LUI_CoD_LuaCall_ExecuteNow("set scr_br_gametype dmz;set scr_br_loadout_option \"standardammo\";set scr_br_allowLoadout 1;set scr_br_use_set_loadouts 1;set scr_br_allowLoadoutOnlyInPreLobby 0;NSQLTTMRMP mp_escape4")
    end)
    self:addElement(plunderBtn3)
    
    -- BACK TO MP Button
    local backMPBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "BACK TO MP",
        description = "Return to Multiplayer Private Match"
    })
    backMPBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1200, _1080p * 1450, _1080p * 800, _1080p * 860)
    backMPBtn.Text:setText("BACK TO MP")
    backMPBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu PrivateMatchLobby")
    end)
    self:addElement(backMPBtn)
    
    -- BACK TO WZ Button
    local backWZBtn = MenuBuilder.BuildRegisteredType("GenericButton", {
        controllerIndex = controllerIndex,
        text = "BACK TO WZ",
        description = "Return to Warzone Private Match"
    })
    backWZBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 1480, _1080p * 1730, _1080p * 800, _1080p * 860)
    backWZBtn.Text:setText("BACK TO WZ")
    backWZBtn:registerEventHandler("button_action", function(element, event)
        Dvar_SetString("LOQQOSNQKN", "0")
        LUI_CoD_LuaCall_ExecuteNow("luiopenmenu WarzonePrivateMatchLobby")
    end)
    self:addElement(backWZBtn)
    
    return self
end

MenuBuilder.registerType("wyatts_wz", wyatts_wz)

-- Button to open the menu
MenuBuilder.registerTypeOverride("WarzonePrivateMatchPlayMenuButtons", function(buildOriginal)
    return function(menu, optionsData)
        local self = buildOriginal(menu, optionsData)

        local controllerIndex = optionsData and optionsData.controllerIndex or self:getRootController()

        local WyattsGSCButton = MenuBuilder.BuildRegisteredType("WarzonePrivateMatchButton", {
            controllerIndex = controllerIndex
        })
        WyattsGSCButton.id = "WyattsGSCButton"
        WyattsGSCButton:SetAnchorsAndPosition(0, 1, 0, 1, 0, _1080p * 430, _1080p * 180, _1080p * 230)
        WyattsGSCButton.Text:setText(ToUpperCase("More WZ GameModes"))
        WyattsGSCButton.Description:setText("")
        WyattsGSCButton.DisabledText:setText("")
        
        -- Open menu when clicked
        WyattsGSCButton:registerEventHandler("button_action", function(element, event)
            LUI.FlowManager.RequestAddMenu("wyatts_wz", false, controllerIndex)
        end)

        WyattsGSCButton:addElementBefore(self.WarzonePrivateMatchPlayerListButton)
        self.WyattsGSCButton = WyattsGSCButton

        return self
    end
end)