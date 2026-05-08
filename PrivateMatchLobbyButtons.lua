MenuBuilder.registerTypeOverride("PrivateMatchLobbyButtons", function(buildOriginal)
    return function(menu, optionsData)
        local self = buildOriginal(menu, optionsData)

        if not self then
            return self
        end

        local controllerIndex = optionsData and optionsData.controllerIndex
        if not controllerIndex and self.getRootController then
            controllerIndex = self:getRootController()
        end

       -- button creator so the menu doesnt crash 
        local function CreateButton(text)
            local btn = MenuBuilder.BuildRegisteredType("GenericButton", {
                controllerIndex = controllerIndex
            })

            if not btn then return nil end

            if btn.setText then
                btn:setText(text)
            elseif btn.SetText then
                btn:SetText(text)
            elseif btn.Text and btn.Text.setText then
                btn.Text:setText(text)
            elseif btn.ButtonText and btn.ButtonText.setText then
                btn.ButtonText:setText(text)
            end

            return btn
        end

      -- todo: remvoe this bc it was a old button from my old PrivateMatchLobbyButtons.lua file -_- i just forgot to do it ok...
        local overdriveBtn = CreateButton("OVERDRIVE")

        if overdriveBtn then
            overdriveBtn:registerEventHandler("button_action", function()
                -- REAL MATCH SETTINGS
                Dvar.SetDvarString("g_gametype", "dm")
                Dvar.SetDvarString("sv_mapname", "mp_m_speedball")
                return true
            end)
        end

  -- opens my menu for MP and creates the MENU button for the Private match lobby!
        local menuBtn = CreateButton("MENU")

        if menuBtn then
            menuBtn:registerEventHandler("button_action", function()
                -- Open wyatts_wz menu
                LUI.FlowManager.RequestAddMenu("wyatts_wz", false, controllerIndex)
                return true
            end)
            
            -- Position the button
            if menuBtn.SetAnchorsAndPosition then
                menuBtn:SetAnchorsAndPosition(0, 1, 0, 1, _1080p * 0, _1080p * 400, _1080p * 300, _1080p * 370)
            end
            
            -- Add the button to the menu
            if self.addElement then
                self:addElement(menuBtn)
            end
            self.MenuBtn = menuBtn
        end

        return self
    end
end)

-- Modified wyatts_wz menu with TWO back buttons (BACK TO MP and BACK TO WZ)
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
