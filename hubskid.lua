-- Aurex Hub â€” Anti-Die
-- Colors: deep navy / midnight storm blue palette
-- Layout: reshaped â€” wider header, cards side by side, cleaner spacing

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
if not player then
    warn("[Aurex] Run this as a client LocalScript.")
    return
end

local playerGui = player:WaitForChild("PlayerGui")
local previous = playerGui:FindFirstChild("AurexAntiDie")
if previous then previous:Destroy() end

-- â”€â”€ UTILITIES â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

local function addCorner(parent, radius)
    local o = Instance.new("UICorner")
    o.CornerRadius = UDim.new(0, radius)
    o.Parent = parent
    return o
end

local function borderSequence()
    return ColorSequence.new({
        ColorSequenceKeypoint.new(0,    Color3.fromRGB(0,   18,  60)),
        ColorSequenceKeypoint.new(0.30, Color3.fromRGB(20,  80, 180)),
        ColorSequenceKeypoint.new(0.62, Color3.fromRGB(60, 140, 255)),
        ColorSequenceKeypoint.new(1,    Color3.fromRGB(10,  40, 120)),
    })
end

local function addGradientStroke(parent, thickness, initialRotation)
    local stroke = Instance.new("UIStroke")
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Thickness = thickness
    stroke.Color = Color3.new(1, 1, 1)
    stroke.Parent = parent

    local grad = Instance.new("UIGradient")
    grad.Color = borderSequence()
    grad.Rotation = initialRotation or 0
    grad.Parent = stroke

    return stroke, grad
end

local function makeDraggable(target)
    local dragging = false
    local dragStart = Vector2.zero
    local startPos = target.Position

    target.Active = true

    target.InputBegan:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseButton1
        and input.UserInputType ~= Enum.UserInputType.Touch then return end
        dragging  = true
        dragStart = input.Position
        startPos  = target.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end)

    UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then return end
        local delta = input.Position - dragStart
        target.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end)
end

-- â”€â”€ PALETTE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- Every colour is drawn from a midnight storm / deep navy range.
local COL = {
    PANEL_BG      = Color3.fromRGB(7,   12,  30),   -- near-black navy
    PANEL_BG2     = Color3.fromRGB(10,  18,  45),   -- slightly lighter well
    HEADER_GLOW   = Color3.fromRGB(20,  70, 180),
    ACCENT        = Color3.fromRGB(40, 110, 255),
    TITLE_0       = Color3.fromRGB(15,  40, 120),
    TITLE_MID     = Color3.fromRGB(80, 160, 255),
    TITLE_1       = Color3.fromRGB(180, 220, 255),
    SUBTITLE      = Color3.fromRGB(90, 140, 220),
    MINI_BG       = Color3.fromRGB(12,  30,  80),
    CARD_BG       = Color3.fromRGB(12,  22,  55),
    DOT_OFF       = Color3.fromRGB(30,  60, 140),
    DOT_ON        = Color3.fromRGB(60, 140, 255),
    LABEL         = Color3.fromRGB(200, 225, 255),
    KNOB_OFF_BG   = Color3.fromRGB(30,  55, 130),
    KNOB_ON_BG    = Color3.fromRGB(180, 220, 255),
    TRACK_OFF     = Color3.fromRGB(18,  40, 100),
    TRACK_ON      = Color3.fromRGB(30,  90, 200),
    TRACK_G0      = Color3.fromRGB(60, 130, 255),
    TRACK_G1      = Color3.fromRGB(30,  80, 200),
}

-- â”€â”€ SCREEN GUI â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local screenGui = Instance.new("ScreenGui")
screenGui.Name           = "AurexAntiDie"
screenGui.ResetOnSpawn   = false
screenGui.DisplayOrder   = 999999
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent         = playerGui

-- â”€â”€ OUTER BORDER WRAP â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- Reshaped: wider and slightly taller, more breathing room for side-by-side cards
local borderWrap = Instance.new("Frame")
borderWrap.Name                 = "BorderWrap"
borderWrap.Size                 = UDim2.new(0, 310, 0, 175)
borderWrap.Position             = UDim2.new(0.5, -155, 0.5, -88)
borderWrap.BackgroundColor3     = COL.PANEL_BG
borderWrap.BackgroundTransparency = 0.08
borderWrap.BorderSizePixel      = 0
borderWrap.Active               = true
borderWrap.ZIndex               = 10
borderWrap.Parent               = screenGui
addCorner(borderWrap, 22)

local _, outerBorderGradient = addGradientStroke(borderWrap, 2, 0)
makeDraggable(borderWrap)

local mainFrame = Instance.new("Frame")
mainFrame.Name               = "MainFrame"
mainFrame.Size               = UDim2.new(1, -4, 1, -4)
mainFrame.Position           = UDim2.new(0, 2, 0, 2)
mainFrame.BackgroundTransparency = 1
mainFrame.BorderSizePixel    = 0
mainFrame.ClipsDescendants   = true
mainFrame.ZIndex             = 11
mainFrame.Parent             = borderWrap
addCorner(mainFrame, 20)

-- â”€â”€ HEADER GLOW â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local headerGlow = Instance.new("Frame")
headerGlow.Size               = UDim2.new(1, 0, 0, 65)
headerGlow.Position           = UDim2.fromOffset(0, 0)
headerGlow.BackgroundColor3   = COL.HEADER_GLOW
headerGlow.BackgroundTransparency = 0.88
headerGlow.BorderSizePixel    = 0
headerGlow.ZIndex             = 12
headerGlow.Parent             = mainFrame
addCorner(headerGlow, 20)

local headerGlowGrad = Instance.new("UIGradient")
headerGlowGrad.Rotation    = 90
headerGlowGrad.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.10),
    NumberSequenceKeypoint.new(1, 1),
})
headerGlowGrad.Parent = headerGlow

-- â”€â”€ HEADER â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local header = Instance.new("Frame")
header.Name               = "Header"
header.Size               = UDim2.new(1, 0, 0, 48)
header.BackgroundTransparency = 1
header.BorderSizePixel    = 0
header.ZIndex             = 13
header.Parent             = mainFrame

-- Left accent bar
local accent = Instance.new("Frame")
accent.Size             = UDim2.new(0, 3, 0, 28)
accent.Position         = UDim2.new(0, 10, 0, 10)
accent.BackgroundColor3 = COL.ACCENT
accent.BorderSizePixel  = 0
accent.ZIndex           = 14
accent.Parent           = header
addCorner(accent, 2)

-- Title
local title = Instance.new("TextLabel")
title.Name              = "Title"
title.Size              = UDim2.new(1, -70, 0, 19)
title.Position          = UDim2.new(0, 18, 0, 7)
title.BackgroundTransparency = 1
title.Text              = "Aurex Hub Anti-Die"
title.TextColor3        = Color3.new(1, 1, 1)
title.Font              = Enum.Font.GothamBlack
title.TextSize          = 15
title.TextXAlignment    = Enum.TextXAlignment.Left
title.ZIndex            = 14
title.Parent            = header

local titleGradient = Instance.new("UIGradient")
titleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   COL.TITLE_0),
    ColorSequenceKeypoint.new(0.5, COL.TITLE_MID),
    ColorSequenceKeypoint.new(1,   COL.TITLE_1),
})
titleGradient.Rotation = 0
titleGradient.Parent   = title

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Name               = "Subtitle"
subtitle.Size               = UDim2.new(1, -70, 0, 13)
subtitle.Position           = UDim2.new(0, 18, 0, 27)
subtitle.BackgroundTransparency = 1
subtitle.Text               = "discord.gg/aurexhub"
subtitle.TextColor3         = COL.SUBTITLE
subtitle.TextTransparency   = 0.25
subtitle.Font               = Enum.Font.GothamMedium
subtitle.TextSize           = 9
subtitle.TextXAlignment     = Enum.TextXAlignment.Left
subtitle.ZIndex             = 14
subtitle.Parent             = header

-- Minimise button (top-right)
local minimise = Instance.new("TextButton")
minimise.Name                = "Minimize"
minimise.Size                = UDim2.new(0, 26, 0, 26)
minimise.Position            = UDim2.new(1, -38, 0.5, -13)
minimise.BackgroundColor3    = COL.MINI_BG
minimise.BackgroundTransparency = 0.15
minimise.AutoButtonColor     = false
minimise.BorderSizePixel     = 0
minimise.Font                = Enum.Font.GothamBlack
minimise.Text                = "-"
minimise.TextSize            = 16
minimise.TextColor3          = Color3.new(1, 1, 1)
minimise.ZIndex              = 14
minimise.Parent              = header
addCorner(minimise, 9)

local _, minimiseGradient = addGradientStroke(minimise, 1.5, 0)

minimise.MouseEnter:Connect(function()
    TweenService:Create(minimise, TweenInfo.new(0.12, Enum.EasingStyle.Quad), {
        BackgroundColor3 = COL.ACCENT,
        BackgroundTransparency = 0.05,
    }):Play()
end)
minimise.MouseLeave:Connect(function()
    TweenService:Create(minimise, TweenInfo.new(0.12, Enum.EasingStyle.Quad), {
        BackgroundColor3 = COL.MINI_BG,
        BackgroundTransparency = 0.15,
    }):Play()
end)

-- Thin divider beneath header
local divider = Instance.new("Frame")
divider.Size            = UDim2.new(1, -24, 0, 1)
divider.Position        = UDim2.new(0, 12, 0, 50)
divider.BackgroundColor3 = COL.ACCENT
divider.BackgroundTransparency = 0.7
divider.BorderSizePixel = 0
divider.ZIndex          = 13
divider.Parent          = mainFrame

-- â”€â”€ CONTENT (side-by-side cards) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- Reshaped: two cards sit next to each other in a horizontal row
-- instead of the original vertical stack.
local content = Instance.new("Frame")
content.Name               = "Content"
content.Size               = UDim2.new(1, -20, 1, -62)
content.Position           = UDim2.new(0, 10, 0, 56)
content.BackgroundTransparency = 1
content.BorderSizePixel    = 0
content.ZIndex             = 13
content.Parent             = mainFrame

local animatedCardShines   = {}
local animatedCardStrokes  = {}
local animatedToggleStrokes = {}
local toggleStates         = { antiDie = false, antiFling = false }

-- Cards are placed at X offsets â€” left and right â€” filling the row
local function makeFeatureCard(cardName, text, xOffset, stateKey)
    local CARD_W = 133

    local card = Instance.new("Frame")
    card.Name               = cardName
    card.Size               = UDim2.new(0, CARD_W, 1, 0)
    card.Position           = UDim2.new(0, xOffset, 0, 0)
    card.BackgroundColor3   = COL.CARD_BG
    card.BackgroundTransparency = 0.08
    card.BorderSizePixel    = 0
    card.ZIndex             = 14
    card.Parent             = content
    addCorner(card, 16)

    local _, cardStrokeGrad = addGradientStroke(card, 1.2, 0)
    table.insert(animatedCardStrokes, cardStrokeGrad)

    -- Shine overlay
    local shine = Instance.new("Frame")
    shine.Size                  = UDim2.new(1, 0, 1, 0)
    shine.BackgroundColor3      = Color3.new(1, 1, 1)
    shine.BackgroundTransparency = 0.94
    shine.BorderSizePixel       = 0
    shine.ZIndex                = 14
    shine.Parent                = card
    addCorner(shine, 16)

    local shineGrad = Instance.new("UIGradient")
    shineGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)),
    })
    shineGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1),
    })
    shineGrad.Rotation = 90
    shineGrad.Parent   = shine
    table.insert(animatedCardShines, shineGrad)

    -- Feature label, centred in upper portion
    local featureLabel = Instance.new("TextLabel")
    featureLabel.Size               = UDim2.new(1, -12, 0, 22)
    featureLabel.Position           = UDim2.new(0, 6, 0, 14)
    featureLabel.BackgroundTransparency = 1
    featureLabel.Text               = text
    featureLabel.TextColor3         = COL.LABEL
    featureLabel.Font               = Enum.Font.GothamBold
    featureLabel.TextSize           = 13
    featureLabel.TextXAlignment     = Enum.TextXAlignment.Center
    featureLabel.ZIndex             = 15
    featureLabel.Parent             = card

    -- Status dot below label
    local dot = Instance.new("Frame")
    dot.Size            = UDim2.new(0, 6, 0, 6)
    dot.Position        = UDim2.new(0.5, -3, 0, 40)
    dot.BackgroundColor3 = COL.DOT_OFF
    dot.BorderSizePixel = 0
    dot.ZIndex          = 16
    dot.Parent          = card
    addCorner(dot, 3)

    -- Toggle track, centred at bottom of card
    local track = Instance.new("TextButton")
    track.Name              = "Toggle"
    track.Size              = UDim2.new(0, 44, 0, 24)
    track.Position          = UDim2.new(0.5, -22, 1, -34)
    track.BackgroundColor3  = COL.TRACK_OFF
    track.BorderSizePixel   = 0
    track.AutoButtonColor   = false
    track.Text              = ""
    track.ZIndex            = 15
    track.Parent            = card
    addCorner(track, 12)

    local trackGrad = Instance.new("UIGradient")
    trackGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, COL.TRACK_G0),
        ColorSequenceKeypoint.new(1, COL.TRACK_G1),
    })
    trackGrad.Rotation = 0
    trackGrad.Parent   = track

    local _, toggleStrokeGrad = addGradientStroke(track, 1, 0)
    table.insert(animatedToggleStrokes, toggleStrokeGrad)

    local knob = Instance.new("TextButton")
    knob.Name                  = "Knob"
    knob.Size                  = UDim2.new(0, 20, 0, 20)
    knob.Position              = UDim2.new(0, 2, 0, 2)
    knob.BackgroundColor3      = COL.KNOB_OFF_BG
    knob.BackgroundTransparency = 0.55
    knob.BorderSizePixel       = 0
    knob.AutoButtonColor       = false
    knob.Text                  = ""
    knob.ZIndex                = 16
    knob.Parent                = track
    addCorner(knob, 10)

    local function render(animated)
        local on = toggleStates[stateKey]
        local ti = TweenInfo.new(animated and 0.18 or 0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

        TweenService:Create(track, ti, {
            BackgroundColor3 = on and COL.TRACK_ON or COL.TRACK_OFF,
        }):Play()

        TweenService:Create(knob, ti, {
            Position            = on and UDim2.new(0, 22, 0, 2) or UDim2.new(0, 2, 0, 2),
            BackgroundColor3    = on and COL.KNOB_ON_BG or COL.KNOB_OFF_BG,
            BackgroundTransparency = on and 0 or 0.55,
        }):Play()

        TweenService:Create(dot, ti, {
            BackgroundColor3 = on and COL.DOT_ON or COL.DOT_OFF,
        }):Play()
    end

    local function toggle()
        toggleStates[stateKey] = not toggleStates[stateKey]
        render(true)
    end

    track.Activated:Connect(toggle)
    knob.Activated:Connect(toggle)
    render(false)

    return card
end

-- Left card at x=0, right card at x=143 (133 wide + 10 gap)
makeFeatureCard("AntiDieCard",   "Anti Die",   0,   "antiDie")
makeFeatureCard("AntiFlingCard", "Anti Fling", 143, "antiFling")

-- â”€â”€ MINIMISE / RESTORE â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local EXPANDED_SIZE     = UDim2.new(0, 310, 0, 175)
local COLLAPSED_SIZE    = UDim2.new(0, 310, 0, 52)
local CONTENT_POS_OPEN  = UDim2.new(0, 10, 0, 56)
local CONTENT_POS_SHUT  = UDim2.new(0, 10, 0, -85)
local isCollapsed       = false
local minimiseBusy      = false

minimise.MouseButton1Click:Connect(function()
    if minimiseBusy then return end
    minimiseBusy  = true
    isCollapsed   = not isCollapsed
    minimise.Text = isCollapsed and "+" or "-"

    local ti = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)

    if isCollapsed then
        content.Visible = true
        TweenService:Create(content,    ti, { Position = CONTENT_POS_SHUT }):Play()
        local wt = TweenService:Create(borderWrap, ti, { Size = COLLAPSED_SIZE })
        wt:Play()
        wt.Completed:Once(function()
            content.Visible = false
            divider.Visible = false
            minimiseBusy    = false
        end)
    else
        divider.Visible  = true
        content.Visible  = true
        content.Position = CONTENT_POS_SHUT
        TweenService:Create(content,    ti, { Position = CONTENT_POS_OPEN }):Play()
        local wt = TweenService:Create(borderWrap, ti, { Size = EXPANDED_SIZE })
        wt:Play()
        wt.Completed:Once(function()
            content.Position = CONTENT_POS_OPEN
            minimiseBusy     = false
        end)
    end
end)

-- â”€â”€ ANIMATED GRADIENTS â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
RunService.RenderStepped:Connect(function(dt)
    local s = dt * 60

    outerBorderGradient.Rotation = (outerBorderGradient.Rotation + 0.9 * s) % 360
    headerGlowGrad.Rotation      = (headerGlowGrad.Rotation      + 1.4 * s) % 360
    titleGradient.Rotation       = (titleGradient.Rotation       + 1.2 * s) % 360
    minimiseGradient.Rotation    = (minimiseGradient.Rotation    + 1.6 * s) % 360

    for _, g in animatedCardShines do
        g.Rotation = (g.Rotation + 1.4 * s) % 360
    end
    for _, g in animatedCardStrokes do
        g.Rotation = (g.Rotation + 1.8 * s) % 360
    end
    for _, g in animatedToggleStrokes do
        g.Rotation = (g.Rotation + 1.8 * s) % 360
    end
end)

print("[Aurex] UI loaded â€” midnight storm build")
