-- leaked by stinker again 

local v222 = game:GetService("TweenService")
local up26 = v222
local v195 = game.CoreGui:FindFirstChild("ThunderScreen")
if v195 then
    v195:Destroy()
end
local up27 = {}
local v194 = Instance.new("ScreenGui")
v194.Name = "Balaraja"
v194.Parent = game.CoreGui
v194.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
v194.ResetOnSpawn = false
local v198 = Instance.new("Frame")
local up28 = v198
up28.Name = "NotiFrame"
up28.Parent = v194
up28.AnchorPoint = Vector2.new(0.5, 0.5)
up28.BackgroundTransparency = 1
up28.Position = UDim2.new(0.5, 0, .12, 0)
up28.Size = UDim2.new(0, 520, 0, 100)
local v200 = Instance.new("UIListLayout")
v200.Parent = up28
v200.FillDirection = Enum.FillDirection.Vertical
v200.SortOrder = Enum.SortOrder.LayoutOrder
v200.Padding = UDim.new(0, 6)
local v197 = Instance.new("UIPadding")
v197.Parent = up28
v197.PaddingTop = UDim.new(0, 8)
v197.PaddingLeft = UDim.new(0, 8)
v197.PaddingRight = UDim.new(0, 8)
v198 = function(arg11_1, arg11_2, arg11_3, arg11_4)
    local v132 = arg11_4
    local v133 = arg11_3
    local v134 = arg11_2
    if not (arg11_2) then
        v134 = "Notification"
    end
    local v138 = v133 or ""
    local v135 = ((tonumber(v132)) or 2)
    local v137 = Instance.new("Frame")
    local up1 = v137
    up1.Name = "TitleFrame"
    up1.Parent = up28
    up1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    up1.Size = UDim2.new(0, 0, 0, 0)
    local v140 = Instance.new("UICorner")
    v140.CornerRadius = UDim.new(0, 6)
    v140.Parent = up1
    v137 = up1
    local v143 = UDim2.new(0, 260, 0, 80)
    local v142 = Enum.EasingDirection.Out
    local v144 = Enum.EasingStyle.Back
    v137:TweenSize(v143, v142, v144, 0.25, true)
    local v141 = Instance.new("TextLabel")
    v141.Parent = up1
    v141.BackgroundTransparency = 1
    v141.Position = UDim2.new(.05, 0, .12, 0)
    v141.Size = UDim2.new(.9, 0, .32, 0)
    v141.Font = Enum.Font.GothamBold
    v141.TextColor3 = Color3.fromRGB(255, 255, 255)
    v141.TextSize = 16
    v141.TextXAlignment = Enum.TextXAlignment.Left
    v141.Text = v134
    v142 = Instance.new("TextLabel")
    v142.Parent = up1
    v142.BackgroundTransparency = 1
    v142.Position = UDim2.new(.05, 0, .52, 0)
    v142.Size = UDim2.new(.9, 0, .32, 0)
    v142.Font = Enum.Font.Gotham
    v142.TextColor3 = Color3.fromRGB(220, 220, 220)
    v142.TextSize = 14
    v142.TextXAlignment = Enum.TextXAlignment.Left
    v142.TextWrapped = true
    v142.Text = v138
    v143 = Instance.new("Frame")
    v143.Parent = up1
    v143.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    v143.BorderSizePixel = 0
    v143.Position = UDim2.new(.05, 0, .9, 0)
    v143.Size = UDim2.new(0, 240, 0, 3)
    v144 = Instance.new("UICorner")
    v144.CornerRadius = UDim.new(0, 3)
    v144.Parent = v143
    v137 = up26
    local v147 = TweenInfo
    local v145 = v137.Create
    v147 = v147.new(v135, Enum.EasingStyle.Linear)
    local v150 = UDim2.new(0, 0, 0, 3)
    v145 = v145(v137, v143, v147, {["Size"] = v150})
    v145:Play()
    task.delay(v135, function()
        local v81 = up26
        local v82 = up1
        local v83 = TweenInfo.new(0.25, Enum.EasingStyle.Quart)
        local v93 = v81.Create
        local v85 = UDim2.new(0, 0, 0, 80)
        v93 = v93(v81, v82, v83, {["Size"] = v85})
        v93:Play()
        task.wait(0.25)
        up1:Destroy()
        return
    end)

    return
end
up27.Notification = v198
local v199 = Instance.new("ScreenGui")
local up29 = v199
up29.Name = "ZENHUB"
up29.Parent = game.CoreGui
up29.ResetOnSpawn = false
local v223 = Instance.new("Frame")
v223.Name = "MAIN"
v223.Parent = up29
v223.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
v223.Position = UDim2.new(0.5, -160, 0.5, -110)
v223.Size = UDim2.new(0, 320, 0, 220)
v223.AnchorPoint = Vector2.new(0.5, 0.5)
v223.Active = true
v223.Draggable = true
local v201 = Instance.new("UICorner")
v201.CornerRadius = UDim.new(0, 10)
v201.Parent = v223
local v204 = Instance.new("Frame")
v204.Name = "Header"
v204.Parent = v223
v204.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
v204.BorderSizePixel = 0
v204.Position = UDim2.new(0, 0, 0, 0)
v204.Size = UDim2.new(1, 0, 0, 36)
local v207 = Instance.new("UICorner")
v207.CornerRadius = UDim.new(0, 10)
v207.Parent = v204
local v208 = Instance.new("TextLabel")
v208.Parent = v204
v208.BackgroundTransparency = 1
v208.Position = UDim2.new(0, 12, 0, 0)
v208.Size = UDim2.new(.8, -24, 1, 0)
v208.Font = Enum.Font.GothamBold
v208.Text = "Kite"
v208.TextColor3 = Color3.fromRGB(255, 255, 255)
v208.TextSize = 16
v208.TextXAlignment = Enum.TextXAlignment.Left
local v212 = Instance.new("TextButton")
v212.Name = "X"
v212.Parent = v204
v212.AnchorPoint = Vector2.new(1, 0.5)
v212.Position = UDim2.new(1, -10, 0.5, 0)
v212.Size = UDim2.new(0, 26, 0, 26)
v212.Font = Enum.Font.GothamBold
v212.Text = "X"
v212.TextColor3 = Color3.fromRGB(255, 255, 255)
v212.TextSize = 14
v212.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
local v213 = Instance.new("UICorner")
v213.CornerRadius = UDim.new(0, 6)
v213.Parent = v212
local v214 = Instance.new("Frame")
v214.Name = "Content"
v214.Parent = v223
v214.BackgroundTransparency = 1
v214.Position = UDim2.new(0, 0, 0, 40)
v214.Size = UDim2.new(1, 0, 1, -40)
local v211 = Instance.new("TextLabel")
v211.Parent = v214
v211.BackgroundTransparency = 1
v211.Position = UDim2.new(0, 12, 0, 4)
v211.Size = UDim2.new(1, -24, 0, 22)
v211.Font = Enum.Font.Gotham
v211.Text = "Enter key"
v211.TextColor3 = Color3.fromRGB(220, 220, 220)
v211.TextSize = 14
v211.TextXAlignment = Enum.TextXAlignment.Left
local v209 = Instance.new("TextBox")
local up30 = v209
up30.Name = "keyhere"
up30.Parent = v214
up30.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
up30.BorderSizePixel = 0
up30.Position = UDim2.new(0, 12, 0, 28)
up30.Size = UDim2.new(1, -24, 0, 32)
up30.Font = Enum.Font.Gotham
up30.PlaceholderText = "ENTER YOUR KEY HERE"
up30.Text = ""
up30.TextColor3 = Color3.fromRGB(255, 255, 255)
up30.TextSize = 14
up30.ClearTextOnFocus = false
local v217 = Instance.new("UICorner")
v217.CornerRadius = UDim.new(0, 6)
v217.Parent = up30
local v216 = Instance.new("Frame")
v216.Parent = v214
v216.BackgroundTransparency = 1
v216.Position = UDim2.new(0, 12, 0, 72)
v216.Size = UDim2.new(1, -24, 0, 36)
v209 = function(arg12_1, arg12_2)
    arg12_1.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    arg12_1.BorderSizePixel = 0
    arg12_1.Size = UDim2.new(0.5, -6, 1, 0)
    arg12_1.Font = Enum.Font.GothamBold
    arg12_1.Text = arg12_2
    arg12_1.TextColor3 = Color3.fromRGB(255, 255, 255)
    arg12_1.TextSize = 13
    local v156 = (Instance.new("UICorner"))
    v156.CornerRadius = UDim.new(0, 6)
    v156.Parent = arg12_1
    return
end
local v224 = Instance.new("TextButton")
v224.Name = "getkey"
v224.Parent = v216
v224.Position = UDim2.new(0, 0, 0, 0)
v209(v224, "GET KEY")
local v225 = Instance.new("TextButton")
v225.Name = "confirm"
v225.Parent = v216
v225.Position = UDim2.new(0.5, 6, 0, 0)
v209(v225, "CONFIRM")
local v219 = function(arg13_1)
    local up2 = arg13_1
    local v168 = up2.MouseEnter
    local v167 = function()
        local v49 = up26
        local v50 = up2
        local v56 = TweenInfo.new
        local v54 = Enum
        local v48 = v49.Create
        local v51 = v56(.15, v54.EasingStyle.Sine)
        local v53 = Color3.fromRGB(90, 90, 90)
        v48 = v48(v49, v50, v51, {["BackgroundColor3"] = v53})
        v48:Play()
        return
    end
    v168:Connect(v167)
    v168 = up2.MouseLeave
    v167 = function()
        local v61 = up26
        local v62 = up2
        local v63 = TweenInfo.new(.15, Enum.EasingStyle.Sine)
        local v65 = Color3
        local v69 = v61.Create
        v65 = v65.fromRGB(80, 80, 80)
        v69 = v69(v61, v62, v63, {["BackgroundColor3"] = v65})
        v69:Play()
        return
    end
    v168:Connect(v167)

    return
end
v219(v224)
v219(v225)
v219(v212)
v224.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://linkzy.space/u/74736b9a")
        up27:Notification("Key system", "Link copied. Paste into your browser.", 3)
    else
        up27:Notification("Key system", "Clipboard unavailable. Open: https://xdabo.com/keyuni", 4)
    end
    return
end)
v225.MouseButton1Click:Connect(function()
    local v177, v178, v180, v181, v183
    local v182 = up30.Text
    if (v182 == "KEY-FREEND") then
        up27:Notification("Success", "Key verified. Executing...", 3)
        task.wait(1.5)
        up29:Destroy()
        v183 = pcall
        v181 = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GoblinKun009/MainThing/refs/heads/main/2913575155932811.lua.txt", true))()
            return
        end
        v178 = {v183(v181)}
        v177 = v178[2]
        if (not v178[1]) then
            v183 = up27
            v180 = tostring(v177)
            v183:Notification("Loader error", v180, 4)
        end
    else
        up27:Notification("Error", "Wrong key. Please try again.", 3)
    end
    return
end)
local v228 = function()
    up29:Destroy()
    return
end
v212.MouseButton1Click :Connect(v228)

return
