--[========================================================[
    Wine Script - Vault Integration with R6 Full Body Hitbox
]========================================================]

local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local CONFIG_FILE_NAME = "WineScript_Config.json"

-- CREATOR TAG:
local authorName = "wine" 

local defaultConfig = {
    Language = "EN",
    WallHopEnabled = false,
    InfJumpEnabled = false,
    speedEnabled = false,
    speedMultiplier = 1.15,
    fakeJumpHeight = 30,
    currentButtonScale = 1.0,
    floatButtonsVisible = true,
    hitboxEnabled = false,
    hitboxSize = 5,
    teamCheck = true,
    hitboxTargetPart = "All Body (R6)",
    spoofEnabled = false,
    FakeName = "911",
    FakeDisplay = "911",
    espAtivo = false,
    boxAtivo = true,
    tracerAtivo = true,
    healthBarAtivo = true,
    corGlobalIdx = 1,
    espBombAtivo = false,
    espBombBox = true,
    espBombChams = true,
    espBombAntenna = true,
    corBombIdx = 1,
    autoSaveEnabled = true,
    autoSaveInterval = 30,
    korbloxEnabled = false,
    korbloxHeadless = false,
    korbloxSide = "Left",
    selectedTimeOfDay = "Morning",
    highQualityMode = "Ultra 4K",
}

local function saveConfig(configData)
    if writefile then
        pcall(function()
            writefile(CONFIG_FILE_NAME, HttpService:JSONEncode(configData))
        end)
    end
end

local function loadConfig()
    if readfile and isfile and isfile(CONFIG_FILE_NAME) then
        local success, result = pcall(function()
            return HttpService:JSONDecode(readfile(CONFIG_FILE_NAME))
        end)
        if success and type(result) == "table" then
            for k, v in pairs(defaultConfig) do
                if result[k] == nil then
                    result[k] = v
                end
            end
            result.Language = "EN"
            if result.highQualityEnabled ~= nil and result.highQualityMode == nil then
                result.highQualityMode = result.highQualityEnabled and "Ultra 4K" or "Off"
            end
            return result
        end
    end
    saveConfig(defaultConfig)
    return defaultConfig
end

local savedConfig = loadConfig()

local function updateAndSaveGlobalConfig()
    local currentConfig = {
        Language = "EN",
        WallHopEnabled = savedConfig.WallHopEnabled,
        InfJumpEnabled = savedConfig.InfJumpEnabled,
        speedEnabled = savedConfig.speedEnabled,
        speedMultiplier = savedConfig.speedMultiplier,
        fakeJumpHeight = savedConfig.fakeJumpHeight,
        currentButtonScale = savedConfig.currentButtonScale,
        floatButtonsVisible = savedConfig.floatButtonsVisible,
        hitboxEnabled = savedConfig.hitboxEnabled,
        hitboxSize = savedConfig.hitboxSize,
        teamCheck = savedConfig.teamCheck,
        hitboxTargetPart = savedConfig.hitboxTargetPart,
        spoofEnabled = savedConfig.spoofEnabled,
        FakeName = savedConfig.FakeName,
        FakeDisplay = savedConfig.FakeDisplay,
        espAtivo = savedConfig.espAtivo,
        boxAtivo = savedConfig.boxAtivo,
        tracerAtivo = savedConfig.tracerAtivo,
        healthBarAtivo = savedConfig.healthBarAtivo,
        corGlobalIdx = savedConfig.corGlobalIdx,
        espBombAtivo = savedConfig.espBombAtivo,
        espBombBox = savedConfig.espBombBox,
        espBombChams = savedConfig.espBombChams,
        espBombAntenna = savedConfig.espBombAntenna,
        corBombIdx = savedConfig.corBombIdx,
        autoSaveEnabled = savedConfig.autoSaveEnabled,
        autoSaveInterval = savedConfig.autoSaveInterval,
        korbloxEnabled = savedConfig.korbloxEnabled,
        korbloxHeadless = savedConfig.korbloxHeadless,
        korbloxSide = savedConfig.korbloxSide,
        selectedTimeOfDay = savedConfig.selectedTimeOfDay,
        highQualityMode = savedConfig.highQualityMode,
    }
    saveConfig(currentConfig)
end

-- ==========================================
-- WINE KEY SYSTEM UI (HUMAN GRAMMAR)
-- ==========================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WineKeySystem"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = CoreGui

local blurOverlay = Instance.new("Frame")
blurOverlay.Size = UDim2.new(1, 0, 1, 0)
blurOverlay.BackgroundColor3 = Color3.fromRGB(5, 2, 3)
blurOverlay.BackgroundTransparency = 0.5
blurOverlay.BorderSizePixel = 0
blurOverlay.Parent = screenGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 220)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(22, 7, 11)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 18)
frameCorner.Parent = mainFrame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(160, 25, 45)
frameStroke.Transparency = 0.25
frameStroke.Thickness = 2
frameStroke.Parent = mainFrame

local frameGradient = Instance.new("UIGradient")
frameGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 10, 16)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 4, 7))
})
frameGradient.Rotation = 45
frameGradient.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -50, 0, 28)
title.Position = UDim2.new(0, 25, 0, 22)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "enter ur key bro 🍷"
title.TextColor3 = Color3.fromRGB(255, 230, 235)
title.TextSize = 17
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -50, 0, 18)
subtitle.Position = UDim2.new(0, 25, 0, 50)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.Text = "put ur key in here to unlock it bro"
subtitle.TextColor3 = Color3.fromRGB(175, 110, 120)
subtitle.TextSize = 12
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = mainFrame

local textBoxContainer = Instance.new("Frame")
textBoxContainer.Size = UDim2.new(1, -50, 0, 46)
textBoxContainer.Position = UDim2.new(0, 25, 0, 84)
textBoxContainer.BackgroundColor3 = Color3.fromRGB(14, 4, 7)
textBoxContainer.BorderSizePixel = 0
textBoxContainer.Parent = mainFrame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 12)
boxCorner.Parent = textBoxContainer

local boxStroke = Instance.new("UIStroke")
boxStroke.Color = Color3.fromRGB(80, 15, 25)
boxStroke.Thickness = 1.5
boxStroke.Parent = textBoxContainer

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(1, -20, 1, 0)
textBox.Position = UDim2.new(0, 10, 0, 0)
textBox.BackgroundTransparency = 1
textBox.Font = Enum.Font.GothamMedium
textBox.PlaceholderText = "enter ur key..."
textBox.PlaceholderColor3 = Color3.fromRGB(110, 65, 75)
textBox.Text = ""
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.TextSize = 13
textBox.ClearTextOnFocus = false
textBox.Parent = textBoxContainer

-- Error notification label inside the UI
local errorLabel = Instance.new("TextLabel")
errorLabel.Size = UDim2.new(1, -50, 0, 16)
errorLabel.Position = UDim2.new(0, 25, 0, 132)
errorLabel.BackgroundTransparency = 1
errorLabel.Font = Enum.Font.GothamBold
errorLabel.Text = ""
errorLabel.TextColor3 = Color3.fromRGB(255, 75, 75)
errorLabel.TextSize = 11
errorLabel.TextXAlignment = Enum.TextXAlignment.Left
errorLabel.Parent = mainFrame

textBox.Focused:Connect(function()
    boxStroke.Color = Color3.fromRGB(160, 25, 45)
end)
textBox.FocusLost:Connect(function()
    boxStroke.Color = Color3.fromRGB(80, 15, 25)
end)

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(1, -50, 0, 42)
submitBtn.Position = UDim2.new(0, 25, 0, 154)
submitBtn.BackgroundColor3 = Color3.fromRGB(145, 20, 40)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.Text = "enter key"
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.TextSize = 14
submitBtn.AutoButtonColor = false
submitBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 12)
btnCorner.Parent = submitBtn

local btnGradient = Instance.new("UIGradient")
btnGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(175, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 15, 30))
})
btnGradient.Rotation = 90
btnGradient.Parent = submitBtn

submitBtn.MouseEnter:Connect(function()
    submitBtn.BackgroundColor3 = Color3.fromRGB(165, 25, 45)
end)
submitBtn.MouseLeave:Connect(function()
    submitBtn.BackgroundColor3 = Color3.fromRGB(145, 20, 40)
end)

local function loadMainScript()
    screenGui:Destroy()

    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

    local L = {
        Main = "Main", Info = "Info", Combat = "Combat", Movement = "Movement", Visuals = "Visuals", Other = "Other", Themes = "Themes",
        SpeedTitle = "⚡  Makes you faster", SpeedToggle = "TURN SPEED ON / OFF", SpeedSlider = "Speed Multiplier",
        WallHopTitle = "🧱  Auto wallhop", WallHopToggle = "TURN WALLHOP ON / OFF",
        InfJumpTitle = "🦘  Infinite Jump", InfJumpToggle = "TURN INFINITE JUMP ON / OFF",
        DoubleJumpTitle = "🚀  Double jump", DoubleJumpSlider = "Double Jump Height", DoubleJumpBtnToggle = "SHOW / HIDE DOUBLE JUMP BUTTON",
        LookTitle = "👁  Look at the enemies", LookToggle = "SHOW / HIDE LOOK GUI",
        FloatingTitle = "📏  Floating Buttons", FloatingToggle = "Show / Hide Floating Buttons", FloatingScale = "Button Size (Scale)",
        HitboxTitle = "🎯  Makes hitbox bigger", HitboxToggle = "TURN HITBOX ON / OFF", HitboxSlider = "Hitbox Size", TeamCheck = "Team Check", HitboxPart = "Hitbox Target Part",
        SpoofTitle = "🎭  Name Spoofer", SpoofDesc = "Fake your name with wine style", SpoofToggle = "TURN SPOOF ON / OFF", FakeNameInput = "Fake Name", FakeDisplayInput = "Fake Display",
        EspTitle = "👁  Esp people", EspSystem = "General ESP System", EspBox = "ESP Box", EspTracer = "Tracer (Lines)", EspHealth = "Health Bar", EspColor = "General ESP Color (Box, Tracer)",
        EspBombTitle = "💣  Esp the bomb", EspBombToggle = "Turn ESP Bomb ON", EspBombBox = "Turn Bomb Box ON", EspBombChams = "Turn Bomb Chams ON", EspBombAntenna = "Turn Bomb Antenna ON", EspBombColor = "Bomb ESP Color",
        BvTitle = "🔄  Bate e Volta", BvDesc = "Teleport to nearest enemy and back", BvDistance = "Max Room Distance", BvButtonInfo = "⚡  B&V Button", BvButtonDesc = "Click the floating B&V button to execute",
        PotatoTitle = "🥔  Potato Mode", PotatoDesc = "FPS boost for weak PCs", PotatoToggle = "TURN POTATO MODE ON / OFF",
        HQTitle = "💎  Graphics Quality Suite", HQDesc = "Choose between Off, Mid, or Ultra 4K (Crisp lighting + shiny reflective floors)", HQDropdown = "Graphics Mode",
        KorbloxTitle = "🦵  Korblox & Headless", KorbloxDesc = "Removes your left leg and head visually bro", KorbloxToggle = "TURN KORBLOX ON / OFF", KorbloxHeadlessToggle = "TURN HEADLESS ON / OFF (Korblox)", KorbloxSideDropdown = "Korblox Side",
        TimeTitle = "⏰  Time of Day", TimeDesc = "Switch between morning and night time", TimeDropdown = "Time Mode",
        AutoSaveTitle = "💾  Save Settings", AutoSaveDesc = "Manage automatic configuration saving", AutoSaveToggle = "TURN AUTO SAVE ON / OFF", AutoSaveInterval = "Auto Save Interval (Seconds)", AutoSaveNow = "Save Now", AutoSaveNowDesc = "Click to force immediate save",
        ThemeTitle = "🎨  Interface Theme", ThemeDesc = "Change the UI look", ThemeSelect = "Theme", ThemeNote = "Deep Wine Theme enabled", CreditsTitle = "💖  Credits", CreditsDesc = "made by " .. authorName .. " – we keep it real"
    }

    WindUI:AddTheme({
        Name = "WineDark",
        Background = Color3.fromRGB(18, 5, 8),
        Accent = Color3.fromRGB(160, 25, 45),
        Dialog = Color3.fromRGB(26, 8, 12),
        Outline = Color3.fromRGB(180, 30, 50),
        Text = Color3.fromRGB(255, 230, 235),
        Placeholder = Color3.fromRGB(180, 120, 130),
        Button = Color3.fromRGB(160, 25, 45),
        Icon = Color3.fromRGB(220, 80, 100),
        Toggle = Color3.fromRGB(180, 30, 50),
        Slider = Color3.fromRGB(180, 30, 50),
        Checkbox = Color3.fromRGB(180, 30, 50),
    })

    local Window = WindUI:CreateWindow({
        Title = "🍷 Wine 💖 Vault",
        Icon = "zap",
        Theme = "WineDark",
        Transparent = true,
        Size = UDim2.fromOffset(780, 560),
        SideBarWidth = 180,
        HideSearchBar = true,
        ToggleKey = Enum.KeyCode.K,
    })

    local MainSection = Window:Section({ Title = L.Main, Icon = "home", Opened = true })
    local InfoTab = MainSection:Tab({ Title = L.Info, Icon = "info" })
    local CombatTab = MainSection:Tab({ Title = L.Combat, Icon = "target" })
    local MovementTab = MainSection:Tab({ Title = L.Movement, Icon = "move" })
    local VisualsTab = MainSection:Tab({ Title = L.Visuals, Icon = "eye" })
    local OtherTab = MainSection:Tab({ Title = L.Other, Icon = "box" })
    local ThemesTab = Window:Section({ Title = L.ThemeTitle, Icon = "palette", Opened = true }):Tab({ Title = L.Themes, Icon = "palette" })

    local function getExecutor()
        local exec = "Unknown"
        if syn and syn.crypt then exec = "Synapse X"
        elseif KRNL_LOADED then exec = "Krnl"
        elseif scriptware and scriptware.version then exec = "ScriptWare"
        elseif getexecutorname then exec = getexecutorname()
        elseif game:GetService("RunService"):IsStudio() then exec = "Roblox Studio"
        end
        return exec
    end

    local function getStats()
        local player = game.Players.LocalPlayer
        local stats = { wins = "N/A", kills = "N/A" }
        local ls = player:FindFirstChild("leaderstats")
        if ls then
            local win = ls:FindFirstChild("Wins") or ls:FindFirstChild("Win")
            if win then stats.wins = tostring(win.Value) end
            local kill = ls:FindFirstChild("Kills") or ls:FindFirstChild("KOs") or ls:FindFirstChild("KO")
            if kill then stats.kills = tostring(kill.Value) end
        end
        return stats
    end

    local sameColor = Color3.fromRGB(160, 25, 45)

    InfoTab:Paragraph({ Title = "⚡  Wine Script", Desc = "Created by " .. authorName, Color = sameColor })

    local player = game.Players.LocalPlayer
    local stats = getStats()
    local exec = getExecutor()
    local playersOnline = tostring(game.Players.NumPlayers)

    InfoTab:Paragraph({
        Title = "📊  Player Stats (Timebomb Duels)",
        Desc = "👤 Username: " .. player.Name .. "\n🏷️ Display: " .. player.DisplayName .. "\n🆔 User ID: " .. tostring(player.UserId) .. "\n💻 Executor: " .. exec .. "\n👥 Players Online: " .. playersOnline .. "\n🏆 Wins: " .. stats.wins .. "\n⚔️ Kills: " .. stats.kills,
        Color = sameColor,
    })

    local speedEnabled = savedConfig.speedEnabled
    local speedMultiplier = savedConfig.speedMultiplier
    local fakeJumpHeight = savedConfig.fakeJumpHeight

    local hitboxEnabled = savedConfig.hitboxEnabled
    local hitboxSize = savedConfig.hitboxSize
    local teamCheck = savedConfig.teamCheck
    local hitboxTargetPart = savedConfig.hitboxTargetPart

    local spoofEnabled = savedConfig.spoofEnabled
    local CONFIG_Spoof = {
        FakeName = savedConfig.FakeName,
        FakeDisplay = savedConfig.FakeDisplay,
        Badge = utf8.char(0xE000),
        BadgeAlt = "✓",
        UseAltBadge = false,
        Separator = " "
    }

    local lookState = { lookingAtPlayer = false, targetPlayer = nil }

    local espAtivo = savedConfig.espAtivo
    local boxAtivo = savedConfig.boxAtivo
    local tracerAtivo = savedConfig.tracerAtivo
    local healthBarAtivo = savedConfig.healthBarAtivo
    local corGlobalIdx = savedConfig.corGlobalIdx

    local espBombAtivo = savedConfig.espBombAtivo
    local espBombBox = savedConfig.espBombBox
    local espBombChams = savedConfig.espBombChams
    local espBombAntenna = savedConfig.espBombAntenna
    local corBombIdx = savedConfig.corBombIdx

    local autoSaveEnabled = savedConfig.autoSaveEnabled
    local autoSaveInterval = savedConfig.autoSaveInterval
    local korbloxEnabled = savedConfig.korbloxEnabled
    local korbloxHeadless = savedConfig.korbloxHeadless
    local korbloxSide = "Left"
    local selectedTimeOfDay = savedConfig.selectedTimeOfDay
    local highQualityMode = savedConfig.highQualityMode or "Ultra 4K"

    local potatoEnabled = false

    local function syncAndSave()
        savedConfig.speedEnabled = speedEnabled
        savedConfig.speedMultiplier = speedMultiplier
        savedConfig.fakeJumpHeight = fakeJumpHeight
        savedConfig.hitboxEnabled = hitboxEnabled
        savedConfig.hitboxSize = hitboxSize
        savedConfig.teamCheck = teamCheck
        savedConfig.hitboxTargetPart = hitboxTargetPart
        savedConfig.spoofEnabled = spoofEnabled
        savedConfig.FakeName = CONFIG_Spoof.FakeName
        savedConfig.FakeDisplay = CONFIG_Spoof.FakeDisplay
        savedConfig.espAtivo = espAtivo
        savedConfig.boxAtivo = boxAtivo
        savedConfig.tracerAtivo = tracerAtivo
        savedConfig.healthBarAtivo = healthBarAtivo
        savedConfig.corGlobalIdx = corGlobalIdx
        savedConfig.espBombAtivo = espBombAtivo
        savedConfig.espBombBox = espBombBox
        savedConfig.espBombChams = espBombChams
        savedConfig.espBombAntenna = espBombAntenna
        savedConfig.corBombIdx = corBombIdx
        savedConfig.autoSaveEnabled = autoSaveEnabled
        savedConfig.autoSaveInterval = autoSaveInterval
        savedConfig.korbloxEnabled = korbloxEnabled
        savedConfig.korbloxHeadless = korbloxHeadless
        savedConfig.korbloxSide = korbloxSide
        savedConfig.selectedTimeOfDay = selectedTimeOfDay
        savedConfig.highQualityMode = highQualityMode
        saveConfig(savedConfig)
    end

    task.spawn(function()
        while true do
            task.wait(5)
            if autoSaveEnabled then
                syncAndSave()
            end
        end
    end)

    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Workspace = game:GetService("Workspace")
    local Lighting = game:GetService("Lighting")
    local PathfindingService = game:GetService("PathfindingService")
    local CurrentCamera = Workspace.CurrentCamera

    CombatTab:Paragraph({ Title = L.HitboxTitle, Desc = "Wine precision hitbox expander (All Body R6 support).", Color = sameColor })
    CombatTab:Toggle({ Title = L.HitboxToggle, Value = hitboxEnabled, Callback = function(v) hitboxEnabled = v syncAndSave() end })
    CombatTab:Slider({ Title = L.HitboxSlider, Value = { Min = 1, Max = 12, Default = hitboxSize }, Step = 0.5, Callback = function(v) hitboxSize = v syncAndSave() end })
    CombatTab:Toggle({ Title = L.TeamCheck, Value = teamCheck, Callback = function(v) teamCheck = v syncAndSave() end })
    CombatTab:Dropdown({ Title = L.HitboxPart, Values = {"All Body (R6)", "Head", "Other"}, Value = hitboxTargetPart, Callback = function(v) hitboxTargetPart = v syncAndSave() end })

    CombatTab:Paragraph({ Title = L.SpoofTitle, Desc = L.SpoofDesc, Color = sameColor })
    CombatTab:Toggle({ Title = L.SpoofToggle, Value = spoofEnabled, Callback = function(v) spoofEnabled = v syncAndSave() end })
    CombatTab:Input({ Title = L.FakeNameInput, Default = CONFIG_Spoof.FakeName, Placeholder = "Name...", Callback = function(v) CONFIG_Spoof.FakeName = v syncAndSave() end })
    CombatTab:Input({ Title = L.FakeDisplayInput, Default = CONFIG_Spoof.FakeDisplay, Placeholder = "Display...", Callback = function(v) CONFIG_Spoof.FakeDisplay = v syncAndSave() end })

    local FollowingEnabled = false
    local lockedTargetChar = nil
    local currentWaypoints = {}
    local currentWaypointIndex = 1
    local lastPathComputeTime = 0
    local maxFollowDistance = 60

    local function hasGreenDot(player)
        if not player or not player.Character then return false end
        local char = player.Character
        for _, descendant in ipairs(char:GetDescendants()) do
            if descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") or descendant:IsA("Frame") or descendant:IsA("BoxHandleAdornment") or descendant:IsA("SelectionBox") then
                local color = descendant:IsA("Frame") and descendant.BackgroundColor3 or descendant.ImageColor3
                if color.G > 0.6 and color.R < 0.4 and color.B < 0.4 then
                    return true
                end
            elseif descendant:IsA("Highlight") then
                local fill = descendant.FillColor
                local outline = descendant.OutlineColor
                if (fill.G > 0.6 and fill.R < 0.4) or (outline.G > 0.6 and outline.R < 0.4) then
                    return true
                end
            end
        end
        return false
    end

    local function isTeammate(player)
        if not player or player == LocalPlayer then return true end
        if LocalPlayer.Team ~= nil and player.Team ~= nil then
            if LocalPlayer.Team == player.Team then return true end
        elseif LocalPlayer.TeamColor == player.TeamColor and LocalPlayer.TeamColor ~= BrickColor.new("White") then
            return true
        end
        if hasGreenDot(player) then
            return true
        end
        return false
    end

    local function isBombEquipped()
        local char = LocalPlayer.Character
        if not char then return false end
        for _, child in ipairs(char:GetChildren()) do
            if child:IsA("Tool") and child.Name:lower():find("bomb") then
                return true
            end
        end
        return false
    end

    local function isValidTarget(char, myRootPos)
        if not char or not char.Parent then return false end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or hum.Health <= 0 or not root then return false end

        local player = Players:GetPlayerFromCharacter(char)
        if not player or isTeammate(player) then return false end

        if myRootPos and (myRootPos - root.Position).Magnitude > maxFollowDistance then
            return false
        end

        return true
    end

    local function getTargetEnemy()
        local myChar = LocalPlayer.Character
        if not myChar then return nil end
        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        if not myRoot then return nil end

        if lockedTargetChar and isValidTarget(lockedTargetChar, myRoot.Position) then
            local currentRoot = lockedTargetChar:FindFirstChild("HumanoidRootPart")
            if currentRoot then
                local dist = (myRoot.Position - currentRoot.Position).Magnitude
                if dist <= maxFollowDistance then
                    return lockedTargetChar
                end
            end
        end

        local nearestChar = nil
        local shortestDistance = math.huge

        for _, player in ipairs(Players:GetPlayers()) do
            if not isTeammate(player) and player.Character and isValidTarget(player.Character, myRoot.Position) then
                local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                local distance = (myRoot.Position - targetRoot.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    nearestChar = player.Character
                end
            end
        end

        lockedTargetChar = nearestChar
        return nearestChar
    end

    local function hasLineOfSight(origin, destination, ignoreList)
        local direction = destination - origin
        local params = RaycastParams.new()
        params.FilterDescendantsInstances = ignoreList
        params.FilterType = Enum.RaycastFilterType.Exclude
        
        local result = Workspace:Raycast(origin, direction, params)
        return result == nil
    end

    CombatTab:Paragraph({ Title = "🎯  Auto-Follow (Strict Teammate Check + Max Distance + Stealth)", Desc = "Smoothly chases enemies within max distance holding a bomb without jumping or looking blatant.", Color = sameColor })
    CombatTab:Toggle({
        Title = "TURN AUTO-FOLLOW ON / OFF", Value = FollowingEnabled,
        Callback = function(v) 
            FollowingEnabled = v 
            if not v then
                currentWaypoints = {}
                lockedTargetChar = nil
            end
        end
    })
    CombatTab:Slider({
        Title = "Max Follow Distance", Value = { Min = 20, Max = 150, Default = maxFollowDistance }, Step = 5,
        Callback = function(v) maxFollowDistance = v end
    })

    RunService.RenderStepped:Connect(function()
        if not FollowingEnabled then return end

        if not isBombEquipped() then
            return
        end

        local myChar = LocalPlayer.Character
        if not myChar then return end

        local myRoot = myChar:FindFirstChild("HumanoidRootPart")
        local myHumanoid = myChar:FindFirstChildOfClass("Humanoid")
        if not myRoot or not myHumanoid then return end

        local targetChar = getTargetEnemy()
        if not targetChar then
            return
        end

        local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
        if not targetRoot then return end

        local targetDistance = (targetRoot.Position - myRoot.Position).Magnitude
        local dynamicPrediction = math.clamp(targetDistance * 0.015, 0.1, 0.35)

        local targetVelocity = targetRoot.AssemblyLinearVelocity or targetRoot.Velocity or Vector3.zero
        local predictedPosition = targetRoot.Position + (targetVelocity * dynamicPrediction)

        local ignoreList = {myChar, targetChar}
        local canSeeTarget = hasLineOfSight(myRoot.Position, predictedPosition, ignoreList)

        if canSeeTarget then
            local targetDir = (predictedPosition - myRoot.Position).Unit
            myHumanoid:Move(targetDir, false)
            currentWaypoints = {}
        else
            local now = tick()
            if now - lastPathComputeTime > 0.15 then
                lastPathComputeTime = now
                
                local path = PathfindingService:CreatePath({
                    AgentRadius = 2.5,
                    AgentHeight = 5,
                    AgentCanJump = false
                })
                
                pcall(function()
                    path:ComputeAsync(myRoot.Position, predictedPosition)
                    if path.Status == Enum.PathStatus.Success then
                        currentWaypoints = path:GetWaypoints()
                        currentWaypointIndex = 2
                    end
                end)
            end

            if #currentWaypoints > 0 and currentWaypointIndex <= #currentWaypoints then
                local targetWaypoint = currentWaypoints[currentWaypointIndex]
                local waypointPos = targetWaypoint.Position
                local distanceToWaypoint = (Vector3.new(myRoot.Position.X, 0, myRoot.Position.Z) - Vector3.new(waypointPos.X, 0, waypointPos.Z)).Magnitude

                local moveDir = (waypointPos - myRoot.Position).Unit
                myHumanoid:Move(moveDir, false)

                if distanceToWaypoint < 3.0 then
                    currentWaypointIndex = currentWaypointIndex + 1
                end
            else
                local moveDir = (predictedPosition - myRoot.Position).Unit
                myHumanoid:Move(moveDir, false)
            end
        end
    end)

    MovementTab:Paragraph({ Title = L.SpeedTitle, Desc = "", Color = sameColor })
    MovementTab:Toggle({
        Title = L.SpeedToggle, Value = speedEnabled,
        Callback = function(v) 
            speedEnabled = v 
            syncAndSave()
        end
    })
    MovementTab:Slider({
        Title = L.SpeedSlider, Value = { Min = 1, Max = 3, Default = speedMultiplier }, Step = 0.05,
        Callback = function(v) speedMultiplier = v syncAndSave() end
    })

    MovementTab:Paragraph({ Title = L.WallHopTitle, Desc = "", Color = sameColor })
    
    local wallhopEnabled = false
    local humanoid = nil
    local lastJumpTime = 0
    local jumpCooldown = 0.15
    local WALL_CHECK_DISTANCE = 3

    local function isNearWall()
        if not LocalPlayer.Character then return false end
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return false end
        local params = RaycastParams.new()
        params.FilterDescendantsInstances = {LocalPlayer.Character}
        params.FilterType = Enum.RaycastFilterType.Blacklist

        local directions = {
            Vector3.new(1, 0, 0),  
            Vector3.new(-1, 0, 0), 
            Vector3.new(0, 0, 1),   
            Vector3.new(0, 0, -1)   
        }
        for _, dir in ipairs(directions) do
            local ray = Workspace:Raycast(rootPart.Position, dir * WALL_CHECK_DISTANCE, params)
            if ray and ray.Instance then
                return true, dir
            end
        end
        return false
    end

    local function doTapRotation()
        if not LocalPlayer.Character then return end
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end
        local nearWall, wallDir = isNearWall()
        if not nearWall then return end
        local angle = math.deg(math.atan2(wallDir.Z, wallDir.X)) + 180
        local rotationCFrame = CFrame.Angles(0, math.rad(angle + 130), 0)
        local originalCFrame = rootPart.CFrame
        rootPart.CFrame = originalCFrame * rotationCFrame
        task.wait(0.05)
        rootPart.CFrame = originalCFrame
    end

    local function onJumpTap()
        if not wallhopEnabled or not humanoid then return end
        if tick() - lastJumpTime < jumpCooldown then return end
        if isNearWall() then
            lastJumpTime = tick()
            doTapRotation()
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end

    local function setupCharacter(character)
        humanoid = character:WaitForChild("Humanoid")
        humanoid.StateChanged:Connect(function(_, newState)
            if newState == Enum.HumanoidStateType.Jumping then
                onJumpTap()
            end
        end)
    end

    if LocalPlayer.Character then
        setupCharacter(LocalPlayer.Character)
    end
    LocalPlayer.CharacterAdded:Connect(setupCharacter)

    MovementTab:Toggle({
        Title = L.WallHopToggle, Value = wallhopEnabled,
        Callback = function(v)
            wallhopEnabled = v
            syncAndSave()
        end
    })

    MovementTab:Paragraph({ Title = L.InfJumpTitle, Desc = "", Color = sameColor })
    
    local infJumpEnabled = savedConfig.InfJumpEnabled or false
    UserInputService.JumpRequest:Connect(function()
        if infJumpEnabled then
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)

    MovementTab:Toggle({
        Title = L.InfJumpToggle, Value = infJumpEnabled,
        Callback = function(v)
            infJumpEnabled = v
            savedConfig.InfJumpEnabled = v
            syncAndSave()
        end
    })

    MovementTab:Paragraph({ Title = L.DoubleJumpTitle, Desc = "", Color = sameColor })
    MovementTab:Slider({
        Title = L.DoubleJumpSlider, Value = { Min = 10, Max = 100, Default = fakeJumpHeight }, Step = 5,
        Callback = function(v) fakeJumpHeight = v syncAndSave() end
    })

    MovementTab:Paragraph({ Title = L.LookTitle, Desc = "", Color = sameColor })
    MovementTab:Toggle({
        Title = L.LookToggle, Value = lookState.lookingAtPlayer,
        Callback = function(v) lookState.lookingAtPlayer = v end
    })

    VisualsTab:Paragraph({ Title = L.EspTitle, Desc = "", Color = sameColor })
    VisualsTab:Toggle({ Title = L.EspSystem, Value = espAtivo, Callback = function(v) espAtivo = v syncAndSave() end })
    VisualsTab:Toggle({ Title = L.EspBox, Value = boxAtivo, Callback = function(v) boxAtivo = v syncAndSave() end })
    VisualsTab:Toggle({ Title = L.EspTracer, Value = tracerAtivo, Callback = function(v) tracerAtivo = v syncAndSave() end })
    VisualsTab:Toggle({ Title = L.EspHealth, Value = healthBarAtivo, Callback = function(v) healthBarAtivo = v syncAndSave() end })

    local nomeCores = { "Yellow Electric", "Pure White", "Nuclear Red", "Cyan Fluorescent", "Radioactive Green", "Neon Pink", "Colorful (RGB)" }
    VisualsTab:Dropdown({
        Title = L.EspColor, Values = nomeCores, Value = nomeCores[corGlobalIdx] or nomeCores[1],
        Callback = function(selected) for i, c in ipairs(nomeCores) do if c == selected then corGlobalIdx = i break end end syncAndSave() end
    })

    VisualsTab:Paragraph({ Title = L.EspBombTitle, Desc = "", Color = sameColor })
    VisualsTab:Toggle({ Title = L.EspBombToggle, Value = espBombAtivo, Callback = function(v) espBombAtivo = v syncAndSave() end })
    VisualsTab:Toggle({ Title = L.EspBombBox, Value = espBombBox, Callback = function(v) espBombBox = v syncAndSave() end })
    VisualsTab:Toggle({ Title = L.EspBombChams, Value = espBombChams, Callback = function(v) espBombChams = v syncAndSave() end })
    VisualsTab:Toggle({ Title = L.EspBombAntenna, Value = espBombAntenna, Callback = function(v) espBombAntenna = v syncAndSave() end })
    VisualsTab:Dropdown({
        Title = L.EspBombColor, Values = nomeCores, Value = nomeCores[corBombIdx] or nomeCores[1],
        Callback = function(selected) for i, c in ipairs(nomeCores) do if c == selected then corBombIdx = i break end end syncAndSave() end
    })

    local function applyGraphicsMode(mode)
        highQualityMode = mode
        syncAndSave()
        pcall(function()
            for _, effectName in ipairs({"WineBloom", "WineColorCorrection", "WineSunRays", "WineDOF"}) do
                local fx = Lighting:FindFirstChild(effectName)
                if fx then fx:Destroy() end
            end

            if mode == "Off" then
                Lighting.GlobalShadows = true
                Lighting.Brightness = 2
                Lighting.EnvironmentDiffuseScale = 1
                Lighting.EnvironmentSpecularScale = 1
                pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic end)
            elseif mode == "Mid" then
                Lighting.GlobalShadows = true
                Lighting.Brightness = 2.3
                Lighting.ClockTime = 14
                Lighting.EnvironmentDiffuseScale = 1.6
                Lighting.EnvironmentSpecularScale = 1.8
                Lighting.OutdoorAmbient = Color3.fromRGB(150, 150, 170)
                Lighting.Ambient = Color3.fromRGB(80, 80, 100)
                
                local bloom = Instance.new("BloomEffect")
                bloom.Name = "WineBloom"
                bloom.Intensity = 1.2
                bloom.Size = 48
                bloom.Threshold = 0.4
                bloom.Parent = Lighting

                local cc = Instance.new("ColorCorrectionEffect")
                cc.Name = "WineColorCorrection"
                cc.Brightness = 0.08
                cc.Contrast = 0.3
                cc.Saturation = 0.45
                cc.Parent = Lighting

                workspace.Terrain.WaterWaveSize = 0.15
                workspace.Terrain.WaterWaveSpeed = 6
                workspace.Terrain.WaterReflectance = 0.9
                workspace.Terrain.WaterTransparency = 0.8

                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        if obj.Material == Enum.Material.SmoothPlastic or obj.Material == Enum.Material.Neon or obj.Material == Enum.Material.Glass or obj.Name:lower():find("floor") or obj.Name:lower():find("ground") or obj.Name:lower():find("base") then
                            obj.Reflectance = math.clamp(obj.Reflectance + 0.3, 0.2, 0.6)
                        end
                        obj.CastShadow = true
                    end
                end

                pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level16 end)
            elseif mode == "Ultra 4K" then
                Lighting.GlobalShadows = true
                Lighting.Brightness = 3.2
                Lighting.ClockTime = 14
                Lighting.EnvironmentDiffuseScale = 2.5
                Lighting.EnvironmentSpecularScale = 3.0
                Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 220)
                Lighting.Ambient = Color3.fromRGB(120, 120, 150)
                
                local bloom = Instance.new("BloomEffect")
                bloom.Name = "WineBloom"
                bloom.Intensity = 2.2
                bloom.Size = 80
                bloom.Threshold = 0.2
                bloom.Parent = Lighting

                local cc = Instance.new("ColorCorrectionEffect")
                cc.Name = "WineColorCorrection"
                cc.Brightness = 0.12
                cc.Contrast = 0.4
                cc.Saturation = 0.6
                cc.Parent = Lighting

                local sr = Instance.new("SunRaysEffect")
                sr.Name = "WineSunRays"
                sr.Intensity = 0.5
                sr.Spread = 1
                sr.Parent = Lighting

                local dof = Instance.new("DepthOfFieldEffect")
                dof.Name = "WineDOF"
                dof.FarIntensity = 0.05
                dof.FocusDistance = 50
                dof.InFocusRadius = 30
                dof.NearIntensity = 0
                dof.Parent = Lighting

                workspace.Terrain.WaterWaveSize = 0.25
                workspace.Terrain.WaterWaveSpeed = 10
                workspace.Terrain.WaterReflectance = 1
                workspace.Terrain.WaterTransparency = 0.85

                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        if obj.Material == Enum.Material.SmoothPlastic or obj.Material == Enum.Material.Neon or obj.Material == Enum.Material.Glass or obj.Name:lower():find("floor") or obj.Name:lower():find("ground") or obj.Name:lower():find("base") then
                            obj.Reflectance = math.clamp(obj.Reflectance + 0.5, 0.3, 0.9)
                        end
                        obj.CastShadow = true
                    end
                end
                pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level21 end)
            end
        end)
    end

    OtherTab:Paragraph({ Title = L.HQTitle, Desc = L.HQDesc, Color = sameColor })
    OtherTab:Dropdown({
        Title = L.HQDropdown,
        Values = { "Off", "Mid", "Ultra 4K" },
        Value = highQualityMode,
        Callback = function(v)
            applyGraphicsMode(v)
        end
    })

    if highQualityMode ~= "Off" then
        applyGraphicsMode(highQualityMode)
    end

    OtherTab:Paragraph({ Title = L.PotatoTitle, Desc = L.PotatoDesc, Color = sameColor })
    OtherTab:Toggle({ Title = L.PotatoToggle, Value = potatoEnabled, Callback = function(v)
        potatoEnabled = v
        pcall(function()
            if v then
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 9e9
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.EnvironmentDiffuseScale = 0
                Lighting.EnvironmentSpecularScale = 0
                for _, obj in ipairs(Lighting:GetChildren()) do
                    if obj:IsA("BlurEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("BloomEffect") or obj:IsA("SunRaysEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("Atmosphere") then
                        obj.Enabled = false
                    end
                end
                workspace.Terrain.WaterWaveSize = 0
                workspace.Terrain.WaterWaveSpeed = 0
                workspace.Terrain.WaterReflectance = 0
                workspace.Terrain.WaterTransparency = 1
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        obj.Material = Enum.Material.SmoothPlastic
                        obj.Reflectance = 0
                        obj.CastShadow = false
                    elseif obj:IsA("Texture") or obj:IsA("Decal") then
                        obj.Transparency = 1
                    elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") or obj:IsA("Beam") then
                        obj.Enabled = false
                    end
                end
                pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
            else
                Lighting.GlobalShadows = true
                pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic end)
            end
        end)
    end })

    -- Robust Korblox & Headless Application Function (Persists through respawns)
    local function applyKorbloxAndHeadless(char)
        if not char then return end
        
        -- Apply Korblox leg hiding if enabled
        if korbloxEnabled then
            task.spawn(function()
                local targetLegNames = {"Left Leg", "LeftLowerLeg", "LeftFoot", "LeftUpperLeg"}
                for _, partName in ipairs(targetLegNames) do
                    local legPart = char:WaitForChild(partName, 2)
                    if legPart then
                        legPart.Transparency = 1
                        for _, child in ipairs(legPart:GetChildren()) do
                            if child:IsA("SpecialMesh") or child:IsA("FileMesh") then
                                child:Destroy()
                            elseif child:IsA("BasePart") then
                                child.Transparency = 1
                            end
                        end
                    end
                end
            end)
        end

        -- Apply Headless head hiding if enabled
        if korbloxHeadless then
            task.spawn(function()
                local head = char:WaitForChild("Head", 2)
                if head then
                    head.Transparency = 1
                    for _, child in ipairs(head:GetChildren()) do
                        if child:IsA("SpecialMesh") or child:IsA("FileMesh") or child:IsA("Decal") then
                            child:Destroy()
                        elseif child:IsA("BasePart") then
                            child.Transparency = 1
                        end
                    end
                end
            end)
        end
    end

    -- Hook into character respawns to reapply automatically and maintain Korblox/Headless
    LocalPlayer.CharacterAdded:Connect(function(newChar)
        newChar:WaitForChild("HumanoidRootPart")
        if korbloxEnabled or korbloxHeadless then
            task.wait(0.3)
            applyKorbloxAndHeadless(newChar)
        end
    end)

    OtherTab:Paragraph({ Title = L.KorbloxTitle, Desc = L.KorbloxDesc, Color = sameColor })
    OtherTab:Toggle({
        Title = L.KorbloxToggle, Value = korbloxEnabled,
        Callback = function(v)
            korbloxEnabled = v
            syncAndSave()
            if LocalPlayer.Character then
                applyKorbloxAndHeadless(LocalPlayer.Character)
            end
        end
    })

    OtherTab:Toggle({
        Title = L.KorbloxHeadlessToggle, Value = korbloxHeadless,
        Callback = function(v)
            korbloxHeadless = v
            syncAndSave()
            if LocalPlayer.Character then
                applyKorbloxAndHeadless(LocalPlayer.Character)
            end
        end
    })

    if (korbloxEnabled or korbloxHeadless) and LocalPlayer.Character then
        applyKorbloxAndHeadless(LocalPlayer.Character)
    end

    OtherTab:Paragraph({ Title = L.TimeTitle, Desc = L.TimeDesc, Color = sameColor })
    OtherTab:Dropdown({
        Title = L.TimeDropdown,
        Values = { "Morning", "Night" },
        Value = selectedTimeOfDay,
        Callback = function(v)
            selectedTimeOfDay = v
            syncAndSave()
            if v == "Morning" then
                Lighting.ClockTime = 14
            elseif v == "Night" then
                Lighting.ClockTime = 0
            end
        end
    })

    pcall(function()
        if selectedTimeOfDay == "Morning" then
            Lighting.ClockTime = 14
        elseif selectedTimeOfDay == "Night" then
            Lighting.ClockTime = 0
        end
    end)

    OtherTab:Paragraph({ Title = L.AutoSaveTitle, Desc = L.AutoSaveDesc, Color = sameColor })
    OtherTab:Toggle({ Title = L.AutoSaveToggle, Value = autoSaveEnabled, Callback = function(v) autoSaveEnabled = v syncAndSave() end })
    OtherTab:Slider({ Title = L.AutoSaveInterval, Value = { Min = 10, Max = 120, Default = autoSaveInterval }, Step = 5, Callback = function(v) autoSaveInterval = v syncAndSave() end })
    OtherTab:Button({
        Title = L.AutoSaveNow,
        Callback = function()
            syncAndSave()
            WindUI:Notify({ Title = "Wine Script", Content = "Settings successfully saved!", Duration = 3 })
        end
    })

    ThemesTab:Paragraph({ Title = L.ThemeTitle, Desc = L.ThemeDesc, Color = sameColor })
    ThemesTab:Dropdown({ Title = L.ThemeSelect, Desc = L.ThemeNote, Values = { "WineDark" }, Value = "WineDark", Callback = function(v) pcall(function() WindUI:SetTheme(v) end) end })
    ThemesTab:Paragraph({ Title = L.CreditsTitle, Desc = L.CreditsDesc, Color = sameColor })

    RunService.RenderStepped:Connect(function()
        if not speedEnabled then return end
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hum and hrp and hum.MoveDirection.Magnitude > 0 then
                local vel = hrp.AssemblyLinearVelocity
                hrp.AssemblyLinearVelocity = Vector3.new(hum.MoveDirection.X * 16 * speedMultiplier, vel.Y, hum.MoveDirection.Z * 16 * speedMultiplier)
            end
        end
    end)

    local r6Parts = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "HumanoidRootPart"}

    task.spawn(function()
        while true do
            task.wait(0.3)
            pcall(function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer then
                        local skipPlayer = false
                        if teamCheck and isTeammate(plr) then
                            skipPlayer = true
                        end

                        local char = plr.Character
                        local hum = char and char:FindFirstChildOfClass("Humanoid")
                        if char and hum and hum.Health > 0 then
                            for _, part in ipairs(char:GetChildren()) do
                                if part:IsA("BasePart") then
                                    if hitboxEnabled and not skipPlayer then
                                        local shouldExpand = false
                                        if hitboxTargetPart == "All Body (R6)" then
                                            for _, r6Name in ipairs(r6Parts) do
                                                if part.Name == r6Name then
                                                    shouldExpand = true
                                                    break
                                                end
                                            end
                                        elseif hitboxTargetPart == "Head" then
                                            if part.Name == "Head" then
                                                shouldExpand = true
                                            end
                                        else
                                            if part.Name ~= "Head" then
                                                shouldExpand = true
                                            end
                                        end

                                        if shouldExpand then
                                            part.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                                            part.Transparency = 0.75
                                            part.CanCollide = false
                                            part.CanQuery = false
                                            part.Massless = true
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

    local RealName, RealDisplay = LocalPlayer.Name, LocalPlayer.DisplayName
    local function SpoofAndBadge(obj)
        if not spoofEnabled or not obj.Text or obj.Text == "" then return end
        local VERIFIED_BADGE = CONFIG_Spoof.UseAltBadge and CONFIG_Spoof.BadgeAlt or CONFIG_Spoof.Badge
        local TargetName, TargetDisplay = CONFIG_Spoof.FakeName, CONFIG_Spoof.FakeDisplay .. CONFIG_Spoof.Separator .. VERIFIED_BADGE
        local text = obj.Text
        if text:find(TargetDisplay) then return end
        if text == CONFIG_Spoof.FakeDisplay then obj.Text = TargetDisplay return end
        if text == CONFIG_Spoof.FakeName then return end
        local newText = text
        if newText:find(RealDisplay) then newText = newText:gsub(RealDisplay, TargetDisplay) end
        if newText:find(RealName) then newText = newText:gsub(RealName, TargetName) end
        if newText ~= obj.Text then obj.Text = newText end
    end

    local function MonitorObject(obj)
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            SpoofAndBadge(obj)
            obj:GetPropertyChangedSignal("Text"):Connect(function() if spoofEnabled then SpoofAndBadge(obj) end end)
        end
    end

    pcall(function()
        for _, v in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do MonitorObject(v) end
        LocalPlayer.PlayerGui.DescendantAdded:Connect(MonitorObject)
    end)

    local blackListAliados = {}
    local salas = {
        {Name = "Sala 1", Position = Vector3.new(265.9, 16.75, 33.7), Size = Vector3.new(56, 44, 67)},
        {Name = "Sala 2", Position = Vector3.new(42.5, 19.5, -32.1), Size = Vector3.new(61, 37, 68)},
        {Name = "Sala 3", Position = Vector3.new(116.1, 16.5, -30.4), Size = Vector3.new(61, 33, 64)},
        {Name = "Sala 4", Position = Vector3.new(191.6, 18, -30.4), Size = Vector3.new(64, 36, 64)},
        {Name = "Sala 5", Position = Vector3.new(189.6, 16, 102.0), Size = Vector3.new(61, 33, 70)},
        {Name = "Sala 6", Position = Vector3.new(116.6, 17, 102.5), Size = Vector3.new(63, 33, 71)},
        {Name = "Sala 7", Position = Vector3.new(42.1, 12.5, 102.5), Size = Vector3.new(63, 25, 68)}
    }

    local function getSalaAtual(posicao)
        for _, sala in ipairs(salas) do
            local scf = CFrame.new(sala.Position)
            local relPos = scf:PointToObjectSpace(posicao)
            if math.abs(relPos.X) <= sala.Size.X / 2 and math.abs(relPos.Y) <= sala.Size.Y / 2 and math.abs(relPos.Z) <= sala.Size.Z / 2 then return sala end
        end
        return nil
    end

    local function IsPlayerStandingOnSomething(targetChar, targetRoot)
        local params = RaycastParams.new() params.FilterType = Enum.RaycastFilterType.Exclude params.FilterDescendantsInstances = {targetChar}
        return Workspace:Raycast(targetRoot.Position, Vector3.new(0, -4.5, 0), params) ~= nil
    end

    local function GetNearestLookTarget()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return nil end
        local nearest, nearestDist = nil, math.huge
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and not blackListAliados[plr] then
                local targetChar = plr.Character
                local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
                local targetHum = targetChar and targetChar:FindFirstChildOfClass("Humanoid")
                if targetRoot and targetHum and targetHum.Health > 0 and IsPlayerStandingOnSomething(targetChar, targetRoot) then
                    local dist = (root.Position - targetRoot.Position).Magnitude
                    if dist < nearestDist then nearestDist = dist nearest = plr end
                end
            end
        end
        return nearest
    end

    RunService.RenderStepped:Connect(function()
        if not lookState.lookingAtPlayer then return end
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        lookState.targetPlayer = GetNearestLookTarget()
        if lookState.targetPlayer and lookState.targetPlayer.Character then
            local targetRoot = lookState.targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                root.CFrame = CFrame.lookAt(root.Position, Vector3.new(targetRoot.Position.X, root.Position.Y, targetRoot.Position.Z))
            end
        end
    end)

    local hasDrawing = false
    pcall(function() local test = Drawing.new("Line") test:Remove() hasDrawing = true end)

    if hasDrawing then
        local listaCores = {
            {nome = "Yellow Electric", type = "fixed", color = Color3.fromRGB(255, 255, 0)},
            {nome = "Pure White", type = "fixed", color = Color3.fromRGB(255, 255, 255)},
            {nome = "Nuclear Red", type = "fixed", color = Color3.fromRGB(255, 0, 0)},
            {nome = "Cyan Fluorescent", type = "fixed", color = Color3.fromRGB(0, 255, 255)},
            {nome = "Radioactive Green", type = "fixed", color = Color3.fromRGB(0, 255, 60)},
            {nome = "Neon Pink", type = "fixed", color = Color3.fromRGB(255, 0, 150)},
            {nome = "Colorful (RGB)", type = "rainbow", color = Color3.fromRGB(255, 255, 255)}
        }

        local HeadOff, LegOff = Vector3.new(0, 0.5, 0), Vector3.new(0, 3, 0)
        local function getColorFromConfig(idx)
            local cfg = listaCores[idx] or listaCores[1]
            if cfg.type == "rainbow" then return Color3.fromHSV(tick() % 5 / 5, 1, 1) end
            return cfg.color
        end

        local function createBoxEsp(v)
            local Box, HealthBar, Tracer = Drawing.new("Square"), Drawing.new("Line"), Drawing.new("Line")
            Box.Visible, Box.Thickness, Box.Filled = false, 2, false
            HealthBar.Visible, HealthBar.Thickness = false, 2
            Tracer.Visible, Tracer.Thickness = false, 1

            RunService.RenderStepped:Connect(function()
                if not espAtivo or not v.Character or not v.Character:FindFirstChild("Humanoid") or not v.Character:FindFirstChild("HumanoidRootPart") or v == LocalPlayer or v.Character.Humanoid.Health <= 0 or blackListAliados[v] then
                    Box.Visible, HealthBar.Visible, Tracer.Visible = false, false, false
                    return
                end
                local myChar = LocalPlayer.Character
                local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                local minhaSala = myRoot and getSalaAtual(myRoot.Position)
                local targetRoot = v.Character.HumanoidRootPart
                local salaDoAlvo = getSalaAtual(targetRoot.Position)
                if not minhaSala or not salaDoAlvo or minhaSala.Name ~= salaDoAlvo.Name then
                    Box.Visible, HealthBar.Visible, Tracer.Visible = false, false, false
                    return
                end
                local Head = v.Character:FindFirstChild("Head")
                if not Head then return end
                local RootPosition, onScreen = CurrentCamera:WorldToViewportPoint(targetRoot.Position)
                local HeadPosition = CurrentCamera:WorldToViewportPoint(Head.Position + HeadOff)
                local LegPosition = CurrentCamera:WorldToViewportPoint(targetRoot.Position - LegOff)
                local corGlobalAtual = getColorFromConfig(corGlobalIdx)
                Box.Color, Tracer.Color = corGlobalAtual, corGlobalAtual
                Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                local health = v.Character.Humanoid.Health / v.Character.Humanoid.MaxHealth
                HealthBar.From = Vector2.new(Box.Position.X + Box.Size.X + 5, Box.Position.Y + Box.Size.Y * (1 - health))
                HealthBar.To = Vector2.new(Box.Position.X + Box.Size.X + 5, Box.Position.Y + Box.Size.Y)
                HealthBar.Color = Color3.new(1 - health, health, 0)
                local viewportSize = CurrentCamera.ViewportSize
                Tracer.From = Vector2.new(viewportSize.X / 2, viewportSize.Y)
                Tracer.To = Vector2.new(RootPosition.X, RootPosition.Y)
                Box.Visible = onScreen and boxAtivo
                HealthBar.Visible = onScreen and healthBarAtivo
                Tracer.Visible = onScreen and tracerAtivo
            end)
        end

        for _, plr in ipairs(Players:GetPlayers()) do if plr ~= LocalPlayer then createBoxEsp(plr) end end
        Players.PlayerAdded:Connect(function(plr) if plr ~= LocalPlayer then createBoxEsp(plr) end end)

        local bombasDesenhadas = {}
        local function createBombEsp(bombPart)
            if not bombPart or not bombPart:IsA("BasePart") or bombasDesenhadas[bombPart] then return end
            local AntennaLine, BoxOutline, Box = Drawing.new("Line"), Drawing.new("Square"), Drawing.new("Square")
            AntennaLine.Visible, AntennaLine.Thickness = false, 3
            BoxOutline.Visible, BoxOutline.Thickness, BoxOutline.Color, BoxOutline.Filled = false, 3, Color3.new(0, 0, 0), false
            Box.Visible, Box.Thickness, Box.Filled = false, 1, false

            local highlight = Instance.new("Highlight")
            highlight.Adornee = bombPart.Parent:IsA("Model") and bombPart.Parent or bombPart
            highlight.FillTransparency, highlight.OutlineTransparency, highlight.Enabled, highlight.Parent = 0.35, 0, false, CoreGui

            bombasDesenhadas[bombPart] = {Line = AntennaLine, BoxOutline = BoxOutline, Box = Box, Highlight = highlight}

            local connection
            connection = RunService.RenderStepped:Connect(function()
                if not espBombAtivo or not bombPart or not bombPart.Parent then
                    AntennaLine.Visible, BoxOutline.Visible, Box.Visible, highlight.Enabled = false, false, false, false
                    if not bombPart or not bombPart.Parent then
                        AntennaLine:Remove() BoxOutline:Remove() Box:Remove() highlight:Destroy()
                        bombasDesenhadas[bombPart] = nil connection:Disconnect()
                    end
                    return
                end
                local myChar = LocalPlayer.Character
                local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                local minhaSala = myRoot and getSalaAtual(myRoot.Position)
                local salaDaBomb = getSalaAtual(bombPart.Position)
                if not minhaSala or not salaDaBomb or minhaSala.Name ~= salaDaBomb.Name then
                    AntennaLine.Visible, BoxOutline.Visible, Box.Visible, highlight.Enabled = false, false, false, false
                    return
                end
                local currentBombColor = getColorFromConfig(corBombIdx)
                highlight.FillColor, AntennaLine.Color, Box.Color, highlight.Enabled = currentBombColor, currentBombColor, currentBombColor, espBombChams
                local bombPos = bombPart.Position
                local screenPos, onScreen = CurrentCamera:worldToViewportPoint(bombPos)
                if onScreen then
                    local viewportSize = CurrentCamera.ViewportSize
                    AntennaLine.From = Vector2.new(viewportSize.X / 2, 0)
                    AntennaLine.To = Vector2.new(screenPos.X, screenPos.Y)
                    AntennaLine.Visible = espBombAntenna
                    local sizeFactor = math.clamp(1000 / (CurrentCamera.CFrame.Position - bombPos).Magnitude, 15, 120)
                    Box.Size = Vector2.new(sizeFactor * 0.8, sizeFactor)
                    Box.Position = Vector2.new(screenPos.X - Box.Size.X / 2, screenPos.Y - Box.Size.Y / 2)
                    BoxOutline.Size, BoxOutline.Position = Box.Size, Box.Position
                    Box.Visible, BoxOutline.Visible = espBombBox, espBombBox
                else
                    AntennaLine.Visible, BoxOutline.Visible, Box.Visible = false, false, false
                end
            end)
        end

        local function checkWorkspaceForBombs()
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") and (obj.Name:lower():find("bomb") or obj.Name:lower():find("timebomb")) then
                    createBombEsp(obj)
                end
            end
        end

        checkWorkspaceForBombs()
        Workspace.DescendantAdded:Connect(function(obj)
            if obj:IsA("BasePart") and (obj.Name:lower():find("bomb") or obj.Name:lower():find("timebomb")) then
                createBombEsp(obj)
            end
        end)
    end

    WindUI:Notify({ Title = "Wine Script", Content = "Loaded successfully, bro! 🍷", Duration = 4 })
end

submitBtn.MouseButton1Click:Connect(function()
    if textBox.Text == "vault.tuff" then
        loadMainScript()
    else
        errorLabel.Text = "❌ incorrect key bro, try again (vault.tuff)"
        boxStroke.Color = Color3.fromRGB(255, 50, 50)
        task.delay(1.5, function()
            if boxStroke then
                boxStroke.Color = Color3.fromRGB(80, 15, 25)
            end
        end)
    end
end)

textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if textBox.Text == "vault.tuff" then
            loadMainScript()
        else
            errorLabel.Text = "❌ incorrect key bro, try again (vault.tuff)"
            boxStroke.Color = Color3.fromRGB(255, 50, 50)
            task.delay(1.5, function()
                if boxStroke then
                    boxStroke.Color = Color3.fromRGB(80, 15, 25)
                end
            end)
        end
    end
end)
