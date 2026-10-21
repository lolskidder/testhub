local vm = {}
vm[53] = function(...) return {n = select("#", ...), ...} end        -- pack varargs
function vm:uT(t) return table.unpack(t, 1, t.n or #t) end            -- unpack packed varargs
function vm:yT(t, offset, ...)                                        -- SETLIST: t[offset+i] = arg_i
  for i = 1, select("#", ...) do t[offset + i] = (select(i, ...)) end
end
function vm:QT(a, b) error(("outlined closure %s/%s is missing from the dump"):format(tostring(a), tostring(b))) end

-- ===== UI library (was proto f17) =====
local vm8 = (function()
  local vm2, vm3 = nil, nil -- VM-internal values passed to vm:QT (unused)

  local reg = {}
  local v1 = game
  reg.localPlayer = v1
  local function fn(arg1_3)
    local v2 = reg.localPlayer
    return v2:GetService(arg1_3)
  end
  local userInputService = fn("UserInputService")
  local tweenService = fn("TweenService")
  local httpService = fn("HttpService")
  reg.slot10 = httpService
  local runService = fn("RunService")
  reg.slot19 = runService
  local localPlayer, v3 = fn("Players").LocalPlayer, Enum
  reg.slot4 = v3
  local fromRGB = Color3.fromRGB
  local new = UDim2.new
  reg.getHumanoid = new
  local new2 = UDim.new
  local new3 = Vector2.new
  local new4, new5 = Font.new("rbxasset://fonts/families/Montserrat.json", reg.slot4.FontWeight.SemiBold), Font.new("rbxasset://fonts/families/Montserrat.json", reg.slot4.FontWeight.Bold)
  local new6 = Font.new("rbxasset://fonts/families/Montserrat.json", reg.slot4.FontWeight.ExtraBold)
  local new7 = Font.new("rbxasset://fonts/families/RobotoMono.json", reg.slot4.FontWeight.SemiBold)
  local new8 = Font.new("rbxassetid://12187365977", reg.slot4.FontWeight.Bold)
  local tbl2 = {bg = fromRGB(16, 18, 40), tx = fromRGB(242, 244, 255), a1 = fromRGB(122, 162, 255), a2 = fromRGB(185, 139, 255), g1 = fromRGB(255, 229, 138), g2 = fromRGB(255, 155, 88), dk = fromRGB(42, 18, 0), mint = fromRGB(110, 255, 182), red = fromRGB(255, 110, 110), sky = fromRGB(143, 180, 255), pink = fromRGB(255, 158, 207), vio = fromRGB(199, 166, 255), gold = fromRGB(255, 210, 122), wh = fromRGB(255, 255, 255), val = fromRGB(217, 222, 255), dc = fromRGB(88, 101, 242), pn = fromRGB(24, 26, 54), w1 = fromRGB(36, 40, 86), w2 = fromRGB(14, 15, 34), gv = fromRGB(184, 255, 156), on = fromRGB(255, 255, 254)}
  local tbl3 = {{"Twilight", fromRGB(36, 40, 86), fromRGB(14, 15, 34), fromRGB(122, 162, 255), fromRGB(185, 139, 255)}, {"Aurora", fromRGB(10, 84, 82), fromRGB(4, 26, 38), fromRGB(63, 224, 176), fromRGB(127, 255, 216)}, {"Ocean", fromRGB(8, 70, 128), fromRGB(3, 20, 52), fromRGB(47, 185, 221), fromRGB(127, 220, 255)}, {"Midnight", fromRGB(52, 24, 112), fromRGB(10, 4, 36), fromRGB(118, 100, 226), fromRGB(160, 132, 240)}, {"Sakura", fromRGB(118, 44, 96), fromRGB(36, 12, 40), fromRGB(255, 140, 200), fromRGB(255, 196, 228)}, {"Onyx", fromRGB(58, 46, 22), fromRGB(8, 6, 2), fromRGB(255, 206, 110), fromRGB(255, 150, 80)}, {"Black", fromRGB(50, 50, 56), fromRGB(16, 16, 19), fromRGB(250, 251, 255), fromRGB(176, 182, 198), fromRGB(14, 14, 18)}, {"Mono", fromRGB(92, 94, 104), fromRGB(30, 31, 36), fromRGB(250, 251, 255), fromRGB(196, 200, 214), fromRGB(20, 21, 26)}}
  local tbl4, tbl5 = {tbl2.gold, tbl2.mint, tbl2.sky, tbl2.pink, tbl2.vio}, {LeftShift = "LShift", RightShift = "RShift", LeftControl = "LCtrl", RightControl = "RCtrl", LeftAlt = "LAlt", RightAlt = "RAlt"}
  local v4 = reg.getHumanoid(1, 0, 1, 0)
  local v5 = reg.getHumanoid(0.5, 0, 0.5, 0)
  local v6 = new3(0.5, 0.5)
  local v7 = new3(1, 0.5)
  local center = reg.slot4.TextXAlignment.Center
  local center2 = reg.slot4.HorizontalAlignment.Center
  local horizontal = reg.slot4.FillDirection.Horizontal
  local y = reg.slot4.AutomaticSize.Y
  local x = reg.slot4.AutomaticSize.X
  local atEnd = reg.slot4.TextTruncate.AtEnd
  local center3 = reg.slot4.VerticalAlignment.Center
  local v8 = reg.getHumanoid(1, 0, 0, 0)
  local v9 = reg.getHumanoid(1, 0, 0.5, 0)
  local v10 = new3(1, 0)
  reg.slot7 = v10
  local quint = reg.slot4.EasingStyle.Quint
  local back, num, num2 = reg.slot4.EasingStyle.Back, 46, 54
  local function fn2(arg1_4, arg2_3)
    local v11 = reg.getHumanoid
    return v11(0, arg1_4, 0, arg2_3)
  end
  local tbl6, tbl7 = {}, {"home", "zap", "egg", "farm", "leaf", "eye", "user", "settings", "search", "minus", "x", "shield", "target", "crosshair", "key", "palette", "folder", "star", "check", "down", "gauge", "wind", "ghost", "clock", "coins", "pin", "info", "warn", "ok", "sliders", "grid", "server", "flame", "swords", "trash", "save", "copy", "plus", "refresh", "crown", "gem", "hand", "wand", "sparkles", "discord"}
  for index, item in ipairs(tbl7) do
    tbl6[item] = index - 1
  end
  local str, v12 = "tienkhanh1/venyx-assets@main/venyx-icons3.png"
  local qT = vm:QT(1, 2, {[1] = reg}, vm2, vm3, nil)
  local function fn3()
    if v12 == nil then
      v12 = qT("Venyx/icons3.png", {"https://raw.githubusercontent.com/" .. str:gsub("@", "/"), "https://cdn.jsdelivr.net/gh/tienkhanh1/venyx-assets@main/venyx-icons3.png"}) or false
    end
    local v13 = v12
    return v13
  end
  local tbl8, tbl9 = {Opt = {}, Keys = {}, Alias = {}, th = tbl3[1][1]}, {AutoLoad = true, AutoSave = true, Active = "Default", Theme = "Black", Cfg = 2}
  reg.slot2 = tbl8
  reg.slot11 = tbl9
  reg.slot2.State = reg.slot11
  local tbl10 = {}
  local function fn4(arg1_5, arg2_4)
    local v14 = tbl10
    v14[#tbl10 + 1] = arg1_5:Connect(arg2_4)
  end
  local function fn5()
    local tbl11 = {}
    for i = 1, 10, 1 do
      tbl11[i] = string.char(math.random(97, 122))
    end
    return table.concat(tbl11)
  end
  reg.slot3 = function(arg1_6, arg2_5)
    local instance = Instance.new(arg1_6)
    instance.Name = fn5()
    arg1_6 = arg2_5.Parent
    arg2_5.Parent = nil
    for key, item2 in next, arg2_5, nil do
      if type(key) == "number" then
        item2.Parent = instance
      else
        instance[key] = item2
      end
    end
    instance.Parent = arg1_6
    return instance
  end
  local tbl12 = {BackgroundTransparency = 1, BorderSizePixel = 0, BackgroundColor3 = tbl2.wh}
  local function fn6(arg1_7, arg2_6, arg3_2)
    local function fn7(arg1_8)
      local tbl13 = {arg2_6, tbl12}
      for index2, item3 in ipairs(tbl13) do
        for key2, item4 in next, item3, nil do
          if arg1_8[key2] == nil then
            arg1_8[key2] = item4
          end
        end
      end
      if arg3_2 then
        if arg1_8.TextSize then
          arg1_8.TextSize = math.floor((arg1_8.TextSize * 1.18) + 0.5)
        end
      end
      local v15 = ((arg1_8.TextTruncate == atEnd) and not arg1_8.AutomaticSize) and arg1_8.TextSize
      if v15 then
        arg1_8.TextTruncate = nil
      end
      tbl13 = reg.slot3
      local v16 = tbl13(arg1_7, arg1_8)
      if v15 then
        local function fn8()
          if v16.AbsoluteSize.X < 2 then
            return
          elseif v16:GetAttribute("nofit") then
            return
          elseif v16.TextSize == v15 then
            if v16.TextBounds.X <= v16.AbsoluteSize.X then
              return
            end
          end
          v16.TextSize = v15
          local alt = v16:GetAttribute("alt")
          if alt then
            if v16.Text ~= alt then
              if v16.TextBounds.X > v16.AbsoluteSize.X then
                v16.Text = alt
                return
              end
            end
          end
          while true do
            local x2, absoluteSize = v16.TextBounds.X, v16.AbsoluteSize
            if not ((x2 > absoluteSize.X) and (v16.TextSize > 8)) then
              break
            end
            v16.TextSize = v16.TextSize - 1
          end
        end
        v16:GetPropertyChangedSignal("Text"):Connect(fn8)
        v16:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn8)
      end
      return v16
    end
    return fn7
  end
  local tbl14, v17 = {FontFace = new4, TextColor3 = tbl2.tx, TextSize = 13, TextXAlignment = reg.slot4.TextXAlignment.Left}, fn6("Frame", {})
  reg.slot6 = v17
  local v18 = fn6("Frame", {BackgroundTransparency = 0})
  local v19 = fn6("TextButton", {Text = "", AutoButtonColor = false}, true)
  local v20 = fn6("TextLabel", tbl14, true)
  local v21 = fn6("TextBox", {Text = "", PlaceholderColor3 = fromRGB(178, 180, 188), ClearTextOnFocus = false, FontFace = new4, TextColor3 = tbl2.tx, TextSize = 13, TextXAlignment = tbl14.TextXAlignment}, true)
  local v22 = fn6("ScrollingFrame", {ScrollBarThickness = 2, ScrollBarImageTransparency = 0.6, CanvasSize = reg.getHumanoid(), AutomaticCanvasSize = y, ScrollingDirection = reg.slot4.ScrollingDirection.Y})
  local v23 = fn6("ImageLabel", {})
  local function fn9(arg1_9)
    local v24 = tbl6[arg1_9.Image]
    if v24 then
      local v25 = fn3()
      arg1_9.Image = v25 or ""
      if v25 then
        arg1_9.ImageRectOffset = new3((v24 % 8) * 64, (v24 // 8) * 64)
        arg1_9.ImageRectSize = new3(64, 64)
      end
    end
    return v23(arg1_9)
  end
  local function fn10(arg1_10, arg2_7, arg3_3, arg4)
    return fn9({AnchorPoint = v6, Position = v5, Size = fn2(arg2_7, arg2_7), Image = arg1_10, ImageColor3 = arg3_3, ImageTransparency = arg4})
  end
  local function fn11(arg1_11)
    return "rbxthumb://type=AvatarHeadShot&id=" .. (localPlayer.UserId .. ("&w=" .. (arg1_11 .. ("&h=" .. arg1_11))))
  end
  local function fn12(arg1_12)
    local v26 = reg.slot3
    return v26("UICorner", {CornerRadius = (arg1_12 and new2(0, arg1_12)) or new2(1, 0)})
  end
  local function fn13(arg1_13, arg2_8)
    local v27, tbl15, v28 = reg.slot3, {Transparency = arg1_13, Color = arg2_8 or tbl2.wh}, reg.slot4
    tbl15.ApplyStrokeMode = v28.ApplyStrokeMode.Border
    return v27("UIStroke", tbl15)
  end
  local function fn14(arg1_14, arg2_9, arg3_4)
    local v29 = reg.slot3
    return v29("UIGradient", {Color = ColorSequence.new(arg1_14, arg2_9), Rotation = arg3_4 or 0})
  end
  local function fn15(arg1_15, ...)
    local tbl16, tbl17 = {}, {...}
    for index3, item5 in ipairs(tbl17) do
      tbl16[index3] = NumberSequenceKeypoint.new(item5[1], item5[2])
    end
    tbl17 = reg.slot3
    return tbl17("UIGradient", {Rotation = arg1_15, Transparency = NumberSequence.new(tbl16)})
  end
  local function fn16(arg1_16, arg2_10, arg3_5, arg4_2)
    local v30 = reg.slot3
    return v30("UIPadding", {PaddingTop = new2(0, arg1_16), PaddingRight = new2(0, arg2_10 or arg1_16), PaddingBottom = new2(0, arg3_5 or arg1_16), PaddingLeft = new2(0, (arg4_2 or arg2_10) or arg1_16)})
  end
  reg.slot9 = function(arg1_17, arg2_11, arg3_6, arg4_3)
    local v31, tbl18, v32 = reg.slot3, {Padding = new2(0, arg1_17 or 0), HorizontalAlignment = arg2_11, VerticalAlignment = arg3_6, FillDirection = arg4_3}, reg.slot4
    tbl18.SortOrder = v32.SortOrder.LayoutOrder
    return v31("UIListLayout", tbl18)
  end
  local function fn17(arg1_18, arg2_12, arg3_7)
    local v33 = reg.slot6
    return v33({Parent = arg1_18, Position = arg2_12, Size = arg3_7, BackgroundTransparency = 0.9})
  end
  local function fn18(arg1_19, arg2_13, arg3_8, arg4_4, arg5, arg6)
    local new9, v34, v35, v36 = TweenInfo.new, arg3_8 or 0.25, arg4_4 or quint
    if arg5 then
      v36 = arg5
    else
      arg3_8 = reg.slot4
      v36 = arg3_8.EasingDirection.Out
    end
    arg5 = tweenService:Create(arg1_19, new9(v34, v35, v36, 0, false, arg6 or 0), arg2_13)
    arg5:Play()
    return arg5
  end
  local function fn19(arg1_20, arg2_14, arg3_9)
    fn4(arg1_20.MouseEnter, function()
      fn18(arg1_20, {BackgroundTransparency = arg2_14}, 0.15)
    end)
    fn4(arg1_20.MouseLeave, function()
      fn18(arg1_20, {BackgroundTransparency = arg3_9 or 1}, 0.25)
    end)
  end
  local function fn20(arg1_21, arg2_15, arg3_10)
    local function fn21()
      if not (arg3_10()) then
        arg2_15.Visible = false
      end
    end
    arg1_21.Completed:Connect(fn21)
  end
  local function fn22(arg1_22, ...)
    if arg1_22 then
      pcall(arg1_22, ...)
    end
  end
  local function fn23(arg1_23)
    local v37, v38, v39 = reg.slot4, arg1_23.UserInputType == reg.slot4.UserInputType.MouseButton1
    if v38 then
      v39 = v38
    else
      local v40
      v40, v39 = reg.slot4, arg1_23.UserInputType == reg.slot4.UserInputType.Touch
    end
    return v39
  end
  local tbl19 = {p = Vector3.zero, t = 0, m = 0}
  fn4(userInputService.InputBegan, function(arg1_24)
    if fn23(arg1_24) then
      tbl19.p, tbl19.t = arg1_24.Position, os.clock()
      tbl19.m = 0
      tbl19.s = false
    end
  end)
  fn4(userInputService.InputChanged, function(arg1_25)
    local v41, v42, v43 = reg.slot4, arg1_25.UserInputType == reg.slot4.UserInputType.Touch
    if v42 then
      v43 = v42
    else
      local v44
      v44, v43 = reg.slot4, arg1_25.UserInputType == reg.slot4.UserInputType.MouseMovement
    end
    if v43 then
      tbl19.m = math.max(tbl19.m, (arg1_25.Position - tbl19.p).Magnitude)
    end
  end)
  local function fn24()
    return ((tbl19.m < 14) and ((os.clock() - tbl19.t) < 0.45)) and not tbl19.s
  end
  local function fn25(arg1_26, arg2_16)
    fn4(arg1_26.Activated, function(...)
      if fn24() then
        arg2_16(...)
      end
    end)
  end
  local function fn26(arg1_27)
    local str2 = tostring(arg1_27)
    local match, v45 = str2:match("^(%-?%d+)(.*)$")
    if not (match) then
      return str2
    end
    return match:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^(%-?),", "%1") .. v45
  end
  local function fn27(arg1_28, arg2_17, arg3_11, arg4_5)
    local anchorPoint, position, size = arg1_28.AnchorPoint, arg1_28.Position, arg1_28.Size
    if not (arg1_28.Parent:FindFirstChildWhichIsA("UIGridStyleLayout")) then
      arg1_28.AnchorPoint = v6
      local v46 = reg.getHumanoid
      arg1_28.Position = position + v46((0.5 - anchorPoint.X) * size.X.Scale, (0.5 - anchorPoint.X) * size.X.Offset, (0.5 - anchorPoint.Y) * size.Y.Scale, (0.5 - anchorPoint.Y) * size.Y.Offset)
    end
    size = reg.slot3
    local v47 = size("UIScale", {Parent = arg1_28})
    arg3_11 = arg3_11 or arg1_28
    fn4(arg3_11.InputBegan, function(arg1_29)
      if not (fn23(arg1_29)) then
        return
      end
      fn18(v47, {Scale = arg2_17 or 0.96}, 0.12)
      if arg4_5 then
        arg4_5(true)
      end
    end)
    fn4(arg3_11.InputEnded, function(arg1_30)
      if not (fn23(arg1_30)) then
        return
      end
      fn18(v47, {Scale = 1}, 0.4, back)
      if arg4_5 then
        arg4_5(false)
      end
    end)
  end
  local function fn28(arg1_31, arg2_18)
    return {p = arg1_31, v = new3(), t = arg1_31, a = arg2_18}
  end
  local function fn29(arg1_32, arg2_19)
    if (arg1_32.t - arg1_32.p).Magnitude < 0.03 then
      if arg1_32.v.Magnitude < 0.03 then
        return
      end
    end
    arg2_19 = math.min(arg2_19, 0.05)
    local ceil = math.ceil(arg2_19 * 240)
    local v48 = arg2_19 / ceil
    for i2 = 1, ceil, 1 do
      arg1_32.v = arg1_32.v + ((((arg1_32.t - arg1_32.p) * 230) - (arg1_32.v * 29)) * v48)
      arg1_32.p = arg1_32.p + (arg1_32.v * v48)
    end
    arg1_32.a(arg1_32.p)
  end
  local function fn30(arg1_33, arg2_20, arg3_12)
    local v49, v50, v51, v52
    local function fn31()
      local userInputType, v53 = v49.UserInputType, reg.slot4
      return userInputType == v53.UserInputType.Touch
    end
    fn4(arg1_33.InputBegan, function(arg1_34)
      if not (v49) then
        if fn23(arg1_34) then
          local v54, t = new3(arg1_34.Position.X, arg1_34.Position.Y), arg2_20.t
          v49, v50, v51, v52 = arg1_34, v54, t, false
        end
      end
    end)
    fn4(userInputService.InputChanged, function(arg1_35)
      if not (v49) then
        return
      end
      if fn31() and (arg1_35 ~= v49) then
        return
      elseif not (fn31()) then
        local v55 = reg.slot4
        if arg1_35.UserInputType ~= v55.UserInputType.MouseMovement then
          return
        end
      end
      local v56 = new3(arg1_35.Position.X, arg1_35.Position.Y) - v50
      v52 = v52 or (v56.Magnitude > 5)
      if v52 then
        arg2_20.t = arg3_12(v51 + v56)
      end
    end)
    fn4(userInputService.InputEnded, function(arg1_36)
      if v49 then
        if arg1_36 == v49 then
          v49 = nil
        elseif not (fn31()) then
          local v57 = reg.slot4
          if arg1_36.UserInputType == v57.UserInputType.MouseButton1 then
            v49 = nil
          end
        end
      end
    end)
    local function fn32()
      local v58 = v52
      return v58
    end
    return fn32
  end
  local function fn33(arg1_37, arg2_21, arg3_13, arg4_6, arg5_2)
    local tbl20, v59, v60, tbl21, v61 = {Parent = arg1_37, AnchorPoint = arg5_2, Position = arg4_6, Size = fn2(arg2_21, arg3_13)}, fn12(), fn14(tbl2.g1, tbl2.g2, 45), {AnchorPoint = new3(0.5, 1)}, reg.getHumanoid
    tbl21.Position = v61(0.5, 0, 1, -((arg3_13 * 0.12) // 1))
    tbl21.Size = fn2((arg2_21 * 0.45) // 1, (arg2_21 * 0.45) // 1)
    tbl21.BackgroundColor3 = fromRGB(255, 246, 214)
    vm:yT(tbl21, 0, fn12())
    vm:yT(tbl20, 0, v59, v60, v18(tbl21))
    return v18(tbl20)
  end
  local tbl22 = {"Venyx/mark1.png", {"data:iVBORw0KGgoAAAANSUhEUgAAAIYAAACACAYAAADOIBGMAAAPWklEQVR4nOydedRd0xnGn8/qH6VKQtIEFVESJTGFGKrRIk1Lo9RUZZWlWLS0S9qaaQ1VStAGCdpGzFMQjURVUkPNpVTFGErNbRUd1Oo/PI+7b9Z1c+6Z9rvvOefe81trr/199557hr3f8+7pfd+9DGpqIlgGNTUR1IJRE8kSwXjvvfdWYLqOaRxq+grW+eZMVzMt2/xsiWAMDAz8i9kzTA/xgCNQ0xewrk9idh/TE5SB/zU/H2g76BPMXmb6CNPNTHvw4P+gpudgXQ9hNpvpc0z/ZxrGun6r+f2H+hj84m/MrnD/bs+0iCfYCjU9BetUdfsYGkIhLmoVChHV+Ty/5e8RTHfxRMegpidgXZ7FbD7TsJaPz28/binBoOTcy+yqto9P4QmvZFoONZWEdbcS0wL+OaXtK2mLR9qP7zRcPS/isz2ZHuXJx6OmUrDOvshsEdN2EV9Pj/pNpGBQgu5idm/EV2sxPcAL7Y2aSsC6+g6z3zANj/j6Ntb1g1G/i5vgOj3mu8t4we+jptSwjo5lNi3mkFM7fTGA+BO/xGy1mENOo8QdjZrSwbqbyizu5X2BdTey05dJU+KnJ3x/FG/gUtSUBg0QmG5EvFCI2LpN0hgrMnuVaVnEs5Bpx9aZs5ruw/r6OBr9ic8kHKpZ7lVYX+90OiBWY/CHb6NDr7UN9Xbn88Y+hppCYNkPQuMFTRIKcW6cUIhYjeEuqGny15GOu5m250X/jZquwTpamdltTOunOPxdptVZR/+IOyhx2d1Nk09DOjR9fqtTaTVdwL24v0c6oRBnJgmFSNQY7uJj0JhbT4tW6ybyBv6LmmCwXoYyu4Np3Qw/G816eSbpoFSGOjyRZs1uQXq2YJqDmmC4gYGmuLMIxdw0QiGyWHCdjWxM5M3/GjXmsFyXR2P0sQGycVbaA1M1JS03pOnTTZCN6ymlu6LGBGdl9VumzyIb97AeUptQZLX5nIXs7MKHqZsVO65BdqEQs7IcnFVjaNld0+SDkZ3zKLGHoiY3LP8LmR2I7GhkOTLLBGQmjeEmRc5EPg7hg30XNblg2R2OfEIhzsg6K51JYwg3uym70BWRj0m8yVtRkxqW+WRmc5EPzVloQuvdLD/K7Ffi5iauQH5m80HXQU0qWFZjmV2J/MzMKhQir8PR+cjPCmgIx6dQEwvLaCQanc3lkZ9fIAe5BIMS+Ciz3yE/eguuQk1H3FzFPGSbwGpnHutqMXLg46LoozXEeD58kr1HP3MJ03rwI+0a11Jk7ny2worV+skY+LEXpdqnDe05WK4nMvsh/Lif5boFcuLr1OzTCV1yDhbEhqj5AJbFV+AvFGI2PPDVGJro0tA1ycIrib8wbeT8Z/sW1yFX/83X4EleZav7uJd6aQxe+E1mF8GfNZkuRs1l8BcKcZGvz7FFfIxzYMPOzgeiL+GzH8lsS9hwLjzxakqauEWynWDD+pT2LEZBlYfltxGzh2HDNSy/r8ETq4g6vkPXVmaij3DzFVfDjhkwwEQwKKEyGklrMJyE5jdORv+gfsVo2PAc6+J2GGAZg+tU2HEchSOrQVDl4DN+AXZNsDCbMDTpYwg3dP0n7FA/Y3yeBaAq4JqQB+A35d3O8lYG2GYaww1dLSa8mmg95UfoXU6DrVBcbmmVb6YxBN+CbeC3uBbFBBeWoWdgOclzbwFs2dAtbppgKhiCD30/s81gxxNM43qlSXHGvHLHWBN2PMTy2RSGhAgAewlskbr9MXoHNSGWQiFy2VzEEUJjaEr3r0wrwZa1+VY8iwrDstEy+iLY8nemEdYa1VxjuA6QySRLGz9B9Unt8JOBs0M0s+YaQ/DNWB0NrWGN/GEXooKwTOR05bUU3oGhaZyUsxIkyDxv9EU0vKWs+Rmqy1TYMzeEUIiQuw+EUJtj+ebthorhohyOhD0hyvgDgjQlTVggMsAZCVue4lvyaVQIlsNzsB+JLGY5jEIgQu9XYrnq2mQdFnRlXB3dTg7WQiGs7GAiCa0xPsnsRdgjX8xRZTcFdIFNNMQOEWFoaKj+hQiqMXjjcoD+FexReKEjUX5OQBihODekUIigGkPwrVF/4AmEYZiLEVY6nGFvqAm5UXkdidISfE80PsCTzEI5MZdZa5yEMMwLLRQiuMYQfHt2R8MHMwRDWFBvoETweWWR9RTCsBOfN3gIq67sosgHuRZhZkLFQSgfUxCGxd0QCtHN7TVDaYzDnDVUKeC9rMLsYIQhVBkuRTcFI8ToRGhIaOHSZ8VRCIeFc1cqutLHaMK36ZfM9oc98rpareh5DW0vhUaMMl+XzShm8Pm+jS7RTY0hzkMY1JTsgeLRmkgIoRChyi6SrmoMwbdKIY63hj2P843yDcngBZ9NUXfXhj3z+WxfRhfptsYQeaP+JbGe89MoBF57R4QRCtH1ADNd1xiChagxvpX3VSsL+GYVIhx8pjuZTYA9hWjCIjSGCGWmN9Et3HUVXlO7S4YQClGIu2ZRgiEn3lCzld9C9wk1WniF2qKQIHaFCIYzXs0dOCyBvNFzc+H8RL6JMPwUBVGUxhASjBBbZA1lZXnHh8iAhsmDYI9cPs39RdJSmGBQayhOVCibxa5NBCHcWs3UInelLGRU0sTt/KeZwhC7L45w1urBCGhzISeiNQcK3DqsyKakqTV+jjB0Y9U11GLZmQMF7ydXqMYQzi4yhBXWoyzcoPFDA83H6GUZUfQWpYVqDMECkNoMsQ6wQcg5DZ5bztYhJummFS0UonDBcGTdiC8tSfub+xBiUx51NkMN4zNRCsFwXuwhjFD2RTj2hj3Ty2KmWHgfo0nAHv62LOzbYAjvdXtm82HPYNchL5yyNCXSGnLjCzGvEcLX9auw57SyCIUojcYQfBOHM3sVtrzGAl8FhvA+pe4tA8Oob7GG64iXgtJoDMGCeQ32HdHhrMgvwQieS3E5raMFTSuTUIhSCYZDgWStVeqesMPyXEJzOIUtlnWidILh3pzDYItJ9F0XX2xn2DLFxUgtFWXUGBIO7V1i6aA0iJW6C/zR7kMfhR3P8lktg+aaUUrBcFj7ilg0AdbNyNEoKaUalbTDt/xx2IVVlnHQsLy+JyFipfNe1kdJKbPGEEfADjUBPib41nMX30OJKbVg8I26CbbR/3w6oZYTZXPKvr99qZsS4bbefAQ2vMkKyTUHwfuQG6SVQdFo3sczKDFlb0qkNf4Eu+0pBrOCM5v58zeTYScUM8ouFKL0guE4Aw1zNwv2QXasjItlZ3ECKkAlBMMZxVptrZWpn0FtsRyzHWGD+kxDUAGqojEkHFpDeRL+DHV+pmnZgWlF+KNguNoPdRGvfyPTeBQAr7st02ym2HgllREMh5WXWZahp9Uw9TAK9z1o7PWmGdQHWDk3Ma2DLuAE4kH+qSD9Cnh/U9zxpR+VtMOHuwH+6xVvsZIGpzmQ13ub2Qrw40peby93vqhAdcfz+yCb9bidIKYzTW75eBGvNzbud1XTGEKhjHwj5wxK05y4gPa+QqEFsiVbk7tAdX9oO+ZkXuslJtMFOp7vODR2apzc9tWxSb+tnGCwYGWyPx3+7JXimDwjmHbOibDjjIrqtxrTDazME+GJgtUxaXFOnvLD276+nfdzY9I5KteUCBelT3MBw+HHqiykVztcYwSzF+CHvOxGR7ka8vxz0HmEpKH5xDy7IvK8mzOTh/zIDod8nue9I+E0lWxKpDU0C2nhnxq3FmMRfe+Qgc7+p3GuDXLCulMdRmSAx+ue70Nnobg0jVCISmqMJk5dfh35eYMFNSTivAoM/zL8AsTP4rn3izuA11FY6eMRz0E8z4UJ55EGlZaIWySU9hqTdnW5khqjhRPgx8qug9aObEF8dw1I01dQZKGkuZkLeI8dTf/4nfomdyN55XjfLCYHlRYMPujT8HeKPsZF8/0A/r0Gsx/Aj1N4b88nHeQCyGjkk7QL4hG8r1ntH/KzTZg9xLRBwu/lmpBpB+1KNyWChSM7C3VEffxUVbgKTqvpb3mvJRV0HM+zEjLtaMRnUESeNJGTZYKwm3xb+RtNvF2O5LiiC3n8RGSk8oIh3Pj/BpSDHVgRNyMjfAYtFKbRVH9EQ4jSOILLbnZcHrfHnhAMkbIjF5rjWAmnICd8Bu0sYLVgJyQUDyMHPSMYImBk3jT8mZXg0wQ13RM03BwLf3ZOM5HViaqPStopUmN4W7W7KDrboLES68M+PkIhekowXEzMzO27AVfx2nNggNsET9GN826Gtz/PcSk86ammRFAdr4rG3ECI3QujeJ1pXWtvMj7HODT2kstio7o778Nk//hea0r0xr3CrJsb9h44EMDFkOfU6GNehp9cbyUUoucEQ7CALkG2Qs3LTF5rLgJAjaFdrr+R4Se78DdmEYR6rilpwkLSGohWJ01jY7SgEdDGAwHCLvLeZb+RNxaXyS6LPSsYwu1fYumw1IqEwsrfZQm8Z5nd+TQJml6fwHt7EB70ZFPSxHl7hfAmPyOQUGwJ//vVEsHNbs0nNz2tMQQLaBgaoxSrQPCKFTZ2wDjON+9zY2baDMdqq1BZum2W14m7pzWGYMFoOGkZenH3AEKh/pA6sUlCIQMlLYhpJ8qke5D1+bXISc8LhmBFKvSiRbyNQ90w0prr0LD5jEPW6tvw+lotncm/t2NK6vhOirPliKPnm5JWWEjaWSnvNpwyi7MwDv4QKVdVNTcziddf1PbbTZndguRJsF352+uRgX4TDM2KKhhLVs8yNUdjBoyj9vJ+5HiUtKYhDTU5xmhZ+7EtQGc7T/EOGqOop5GSvmhKmrhZ0TRuA+0cEEAo1Bm+IOEwrXlM6CQUwoXb1sLbYzHnkQFSpt2S+kowhOtvZNn79RgXwMWaqYh3fzhYTRfTO0hAZoQubFOcmePWFMbUM6l91ZS0wkKSit444bB7WOBbwf7acgtY2OFr9SNkvpfLgZvnlkbUdHrUIqJWbEelCU3ddxqjBfmQxu0Lshj2MT2bdJru1sTZ2LxCIVx4SEUhujviaw2LU43O+lZjCL5dCnHQabEtSDgkXlMjm4vbPlbUoP3ymuHFXEvRAbT9d+v8SKq45f2sMZr9jagVyQMGwoVDavVqf8VdayNroRA85wxmo/DhtRdZlU9J+m1fC4ZwS/TntHx0Ij9LY8qfGb7BBzBTWAJ5hR3OtFaoazVR4H4mNZuT0JgmF4fyXmKH7H3dlDRxuy1rLuAlFmKwzXx5HbXvj2WdbDK+BzWfijE6l/fRcRRTC0ZNJH3flNREUwtGTSTvAwAA///2y1mvAAAABklEQVQDALNzu4AFm6hAAAAAAElFTkSuQmCC"}}
  local function fn34(arg1_38, arg2_22, arg3_14, arg4_7, arg5_3, arg6_2)
    local v62 = fn33(arg1_38, arg2_22, arg3_14, arg4_7, arg5_3)
    task.spawn(function()
      local v63 = qT(tbl22[1], tbl22[2])
      if v63 then
        if not (arg1_38.Parent) then
          return
        end
      else
        return
      end
      arg6_2.Parent = arg1_38
      arg6_2.Image = v63
      fn9(arg6_2)
      v62:Destroy()
    end)
  end
  local function fn35(arg1_39, arg2_23, arg3_15)
    local v64 = reg.slot6
    local v65, v66 = v64({Parent = arg1_39, AnchorPoint = v7, Position = v9, Size = fn2(arg2_23, arg3_15), BackgroundTransparency = 0.84, fn12()}), reg.slot6
    local v67 = v66({Parent = v65, Size = v4, fn12(), fn14(tbl2.a1, tbl2.a2)})
    v66, v64 = {Parent = v65, AnchorPoint = new3(0, 0.5)}, reg.getHumanoid
    v66.Position = v64(0, 3, 0.5, 0)
    v66.Size = fn2(arg3_15 - 6, arg3_15 - 6)
    v66.ZIndex = 2
    vm:yT(v66, 0, fn12(), fn13(0.6, fromRGB(0, 0, 0)))
    local v68 = v18(v66)
    local function fn36(arg1_40, arg2_24)
      local v69 = (arg2_24 and 0) or 0.26
      fn18(v67, {BackgroundTransparency = (arg1_40 and 0) or 1}, v69)
      local tbl23, v70 = {}, reg.getHumanoid
      tbl23.Position = v70(0, (arg1_40 and ((arg2_23 - arg3_15) + 3)) or 3, 0.5, 0)
      fn18(v68, tbl23, v69)
    end
    return fn36
  end
  local function fn37(arg1_41, arg2_25, arg3_16, arg4_8, arg5_4)
    fn4(arg1_41.Focused, function()
      fn18(arg2_25, {Transparency = arg3_16, Color = tbl2.a1}, 0.2)
    end)
    fn4(arg1_41.FocusLost, function()
      fn18(arg2_25, {Transparency = arg4_8, Color = tbl2.wh}, 0.25)
      if arg5_4 then
        arg5_4()
      end
    end)
  end
  local function fn38(arg1_42, arg2_26)
    local v71 = fn13(0.86)
    arg1_42.BackgroundTransparency = arg1_42.BackgroundTransparency or 0.92
    arg1_42[1] = fn12(9)
    arg1_42[2] = v71
    local tbl24, v72 = {}, reg.getHumanoid
    tbl24.Position = v72(0, 10, 0.5, -9)
    tbl24.Size = fn2(18, 18)
    tbl24.Image = "search"
    tbl24.ImageTransparency = 0.3
    arg1_42[3] = fn9(tbl24)
    arg1_42.ClipsDescendants = true
    v72, tbl24 = {}, reg.slot6
    v72.Parent = tbl24(arg1_42)
    v72.Position = fn2(35, 0)
    tbl24 = reg.getHumanoid
    v72.Size = tbl24(1, -43, 1, 0)
    v72.PlaceholderText = arg2_26
    v72.TextSize = 14
    v72.ClipsDescendants = true
    tbl24 = v21(v72)
    fn37(tbl24, v71, 0.55, 0.86)
    return tbl24
  end
  local tbl25, tbl26 = {ok = tbl2.mint, warn = tbl2.gold, err = tbl2.red}, {ok = "ok", err = "x", warn = "warn"}
  local function fn39(arg1_43)
    return tbl25[arg1_43] or tbl2.sky, tbl26[arg1_43] or "info"
  end
  local function fn40(arg1_44)
    for index4, child in ipairs(arg1_44:GetChildren()) do
      if child:IsA("GuiObject") then
        child:Destroy()
      end
    end
  end
  local function fn41(arg1_45)
    return {Set = function(arg1_46, arg2_27, arg3_17)
      arg1_46 = arg1_45[arg2_27]
      if arg1_46 then
        if arg1_46.Text ~= arg3_17 then
          arg1_46.Text = arg3_17
        end
      end
    end, Icon = function(arg1_47, arg2_28, arg3_18)
      arg1_47 = arg1_45[arg2_28] and arg1_45[arg2_28].Parent:FindFirstChildOfClass("ImageLabel")
      if arg1_47 then
        if arg1_47.Image ~= arg3_18 then
          arg1_47.Image = arg3_18
        end
      end
    end}
  end
  local function fn42(arg1_48, arg2_29, arg3_19, arg4_9, arg5_5)
    local tbl27, v73 = {Parent = arg1_48}, reg.getHumanoid
    tbl27.Position = v73(arg3_19 / arg4_9, (arg3_19 * 8) / arg4_9, 0, 0)
    arg3_19 = reg.getHumanoid
    tbl27.Size = arg3_19(1 / arg4_9, (8 / arg4_9) - 8, 1, 0)
    tbl27.BackgroundTransparency = (arg5_5 and 0) or 0.92
    arg3_19, arg1_48 = fn12(13), arg5_5 and fn14(tbl2.a1, tbl2.a2, 90)
    v73, arg4_9 = arg1_48 or fn13(0.84), arg5_5 and fn13(0.55, tbl2.a1:Lerp(tbl2.wh, 0.5))
    local v74, tbl28 = arg4_9 or nil, {Size = v4, Text = arg2_29, FontFace = new5, TextSize = 16}
    tbl28.TextColor3, tbl28.TextXAlignment = (arg5_5 and tbl2.on) or tbl2.wh, center
    vm:yT(tbl27, 0, arg3_19, v73, v74, v20(tbl28))
    arg5_5 = v19(tbl27)
    fn27(arg5_5)
    return arg5_5
  end
  local tbl29 = {}
  tbl29.__index = tbl29
  local function fn43(arg1_49)
    if arg1_49.bq then
      return
    elseif arg1_49.done == #arg1_49.list then
      return
    end
    arg1_49.bq = true
    task.defer(function()
      arg1_49.bq = false
      local tbl30, clone, tbl31 = {0, 0}, table.clone(arg1_49.list), {}
      table.sort(clone, function(arg1_50, arg2_30)
        return arg1_50.card.AbsoluteSize.Y > arg2_30.card.AbsoluteSize.Y
      end)
      local flag, flag2 = true, true
      for index5, item6 in ipairs(clone) do
        index5 = item6.side or (((tbl30[1] <= tbl30[2]) and 1) or 2)
        if flag then
          local side = item6.side
          flag = if side then item6.side == 3 else not side
        else
        end
        tbl31[item6] = index5
        if index5 < 3 then
          tbl30[index5] = tbl30[index5] + (item6.card.AbsoluteSize.Y + 16)
        end
        flag2 = flag2 and (item6.card.AbsoluteSize.Y > 40)
      end
      flag = flag and (tbl31[arg1_49.list[1]] == 2)
      for key3, item7 in next, tbl31, nil do
        item7 = ((flag and (item7 < 3)) and (3 - item7)) or item7
        if key3.card.Parent ~= arg1_49.cols[item7] then
          key3.card.Parent = arg1_49.cols[item7]
        end
      end
      if flag2 then
        arg1_49.done = #arg1_49.list
      end
    end)
  end
  reg.slot5 = function(arg1_51)
    if not (pcall(function()
      arg1_51.Parent = gethui()
    end)) then
      arg1_51.Parent = fn("CoreGui")
    end
  end
  local qT2 = vm:QT(3, 4, {[2] = reg, [3] = reg, [4] = reg, [5] = reg, [6] = reg, [7] = reg, [8] = reg, [9] = reg}, vm2, vm3, nil)
  reg.slot2.Window = function(arg1_52, arg2_31)
    arg2_31 = arg2_31 or {}
    local tbl32 = {Tabs = {}}
    local key4, v75 = arg2_31.Key
    if key4 then
      v75 = key4
    else
      arg1_52 = reg.slot4
      v75 = arg1_52.KeyCode.RightControl
    end
    tbl32.Key = v75
    tbl32.us = 1
    tbl32.open = true
    local v76 = qT2(tbl32, tostring(arg2_31.Id or "Venyx"))
    tbl32.Gui = v76
    local num3, num4, v77 = 832, 510, reg.slot6
    tbl32.dim = v77({Parent = v76, Size = v4, BackgroundColor3 = fromRGB(0, 0, 0)})
    pcall(function()
      tbl32.dim.Interactable = false
    end)
    tbl32.dz = 0.6
    v77 = reg.slot6
    local v78 = v77({Parent = v76, Active = true, ZIndex = 3, AnchorPoint = v6, Position = v5, Size = fn2(num3, num4)})
    tbl32.Main = v78
    key4 = reg.slot3
    local v79, v80 = key4("UIScale", {Parent = v78}), reg.slot3
    key4, arg1_52 = {Parent = v78, Position = fn2(-3, -3)}, reg.getHumanoid
    key4.Size = arg1_52(1, 6, 1, 6)
    key4.BackgroundTransparency = 1
    key4.Visible = false
    local v81, v82 = v80("CanvasGroup", key4), reg.slot6
    local v83, v84 = v82({Parent = v78, Size = v4}), reg.slot6
    tbl32.bg = v84({Parent = v83, Size = v4, BackgroundTransparency = 0.05, fn12(16), fn14(tbl2.w1, tbl2.w2, 90)})
    v82 = reg.slot6
    tbl32.tone = v82({Parent = v83, Size = v4, BackgroundColor3 = fromRGB(0, 0, 0), fn12(16)})
    tbl32.Tint = function(arg1_53)
      arg1_53 = reg.slot11
      local v85 = (arg1_53.Theme == "Black") and fromRGB(0, 0, 0)
      tbl32.bg:FindFirstChildOfClass("UIGradient").Color = ColorSequence.new(v85 or tbl2.w1, v85 or tbl2.w2)
    end
    tbl32.Tone = function(arg1_54, arg2_32)
      tbl32.tone.BackgroundColor3 = ((arg2_32 < 0) and tbl2.wh) or fromRGB(0, 0, 0)
      tbl32.tone.BackgroundTransparency = 1 - ((math.abs(arg2_32) / 100) * (((arg2_32 < 0) and 0.22) or 0.65))
    end
    tbl32:Tone(70)
    v82, v84 = {Parent = v83}, reg.getHumanoid
    v82.Size = v84(1, 0, 0.55, 0)
    vm:yT(v82, 0, fn12(16), fn15(90, {0, 0.86}, {1, 1}))
    v18(v82)
    v75, v84 = {Parent = v83, Position = fn2(20, 1)}, reg.getHumanoid
    v75.Size = v84(1, -40, 0, 1)
    vm:yT(v75, 0, fn15(0, {0, 1}, {0.5, 0.3}, {1, 1}))
    v18(v75)
    v82, key4 = fn13(0.7), reg.slot6
    key4({Parent = v83, Size = v4, ZIndex = 5, fn12(16), v82})
    local function fn44()
      local viewportSize, v86 = workspace.CurrentCamera.ViewportSize, ((userInputService.TouchEnabled and not userInputService.KeyboardEnabled) and 0.88) or 1
      return (math.clamp(math.min((viewportSize.X - 60) / num3, (viewportSize.Y - 20) / num4), 0.55, 1.3) * tbl32.us) * v86
    end
    local function fn45()
      if tbl32.open then
        fn18(v79, {Scale = fn44()}, 0.3)
      end
    end
    fn4(workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), fn45)
    tbl32.SetScale = function(arg1_55, arg2_33)
      tbl32.us = arg2_33
      fn45()
    end
    v80, key4 = {Parent = v76, AnchorPoint = v6}, reg.getHumanoid
    v80.Position = key4(0, 44, 0, 100 + (tbl32.slot * 60))
    v80.Size = fn2(50, 50)
    v80.BackgroundTransparency = 0.12
    v80.BackgroundColor3 = tbl2.bg
    v80.Visible = false
    vm:yT(v80, 0, fn12(18), fn13(0.75))
    local v87, v88 = v19(v80), reg.slot3
    local v89 = v88("UIScale", {Parent = v87, Scale = 0})
    arg1_52, v75 = {AnchorPoint = v6, Position = v5, Size = fn2(29, 28)}, reg.slot4
    arg1_52.ScaleType = v75.ScaleType.Fit
    arg1_52.ImageColor3 = tbl2.tx
    fn34(v87, 24, 30, v5, v6, arg1_52)
    local v91 = fn28(new3(), function(arg1_56)
      local v90 = reg.getHumanoid
      v78.Position = v90(0.5, arg1_56.X, 0.5, arg1_56.Y)
    end)
    local v93 = fn28(new3(44, 100 + (tbl32.slot * 60)), function(arg1_57)
      local v92 = reg.getHumanoid
      v87.Position = v92(0, arg1_57.X, 0, arg1_57.Y)
    end)
    local v94, v95, v96 = fn5(), reg.slot19, reg.slot4
    key4, v80 = v96.RenderPriority.Camera.Value, function(arg1_58)
      fn29(v91, arg1_58)
      if v87.Visible then
        fn29(v93, arg1_58)
      end
    end
    v95:BindToRenderStep(v94, key4 + 1, v80)
    v77, v95 = {Parent = v83}, reg.getHumanoid
    v77.Size = v95(1, 0, 0, num)
    v77.ClipsDescendants = true
    v88, v80, v95 = reg.slot6, {}, reg.getHumanoid
    v80.Size = v95(1, 0, 1, 16)
    v80.BackgroundTransparency = 0.95
    vm:yT(v80, 0, fn12(16))
    vm:yT(v77, 0, v88(v80))
    v82 = v19(v77)
    fn17(v83, fn2(0, num), reg.getHumanoid(1, 0, 0, 1))
    v77 = reg.getHumanoid
    v75, v84, v88 = v77(0, num2 / 2, 0.5, 0), {AnchorPoint = v6}, reg.getHumanoid
    v84.Position = v88(0, num2 / 2, 0.5, 0)
    v84.Size = fn2(25, 24)
    v95 = reg.slot4
    v84.ScaleType = v95.ScaleType.Fit
    v84.ImageColor3 = tbl2.tx
    fn34(v82, 21, 26, v75, v6, v84)
    key4, v88, v75 = reg.slot6, {Parent = v82, Position = fn2(num2 + 6, 0)}, reg.getHumanoid
    v88.Size = v75(1, -num2 - 190, 1, 0)
    v88.ClipsDescendants = true
    v96 = reg.slot9
    vm:yT(v88, 0, v96(10, nil, center3, horizontal))
    v96 = key4(v88)
    v77, v88 = {Parent = v96}, reg.getHumanoid
    v77.Size = v88(0, 0, 1, 0)
    v77.AutomaticSize = x
    v77.Text = (arg2_31.Title or "Venyx"):upper()
    v84 = nil
    v84, v77.FontFace = reg.slot4, Font.new("rbxasset://fonts/families/Montserrat.json", reg.slot4.FontWeight.Heavy)
    v77.TextSize = 22
    v20(v77)
    v80, v84 = {Parent = v96, LayoutOrder = 1}, reg.getHumanoid
    v80.Size = v84(0, 0, 1, 0)
    v80.AutomaticSize = x
    v80.Text = "/"
    v80.TextSize = 13
    v80.TextTransparency = 0.6
    v20(v80)
    v84, arg1_52 = {Parent = v96, LayoutOrder = 2}, reg.getHumanoid
    v84.Size = arg1_52(0, 0, 1, 0)
    v84.AutomaticSize = x
    v84.Text = arg2_31.Game or ""
    v84.TextSize = 13
    v84.TextTransparency = 0.3
    v84.TextTruncate = atEnd
    key4 = reg.slot3
    vm:yT(v84, 0, key4("UISizeConstraint", {MaxSize = new3(170, 99)}))
    local v97 = v20(v84)
    if arg2_31.Version then
      v20({Parent = v96, LayoutOrder = 3, Size = fn2(0, 20), AutomaticSize = x, Text = arg2_31.Version, FontFace = new5, TextSize = 11, TextTransparency = 0.25, TextXAlignment = center, BackgroundTransparency = 0.9, fn12(), fn16(0, 8)})
    end
    local v98 = v18({Size = fn2(7, 7), BackgroundColor3 = tbl2.sky, fn12()})
    v84, v88 = {Size = fn2(0, 22), AutomaticSize = x, TextSize = 11, FontFace = new5, TextColor3 = tbl2.val, LayoutOrder = 1, TextTruncate = atEnd}, reg.slot3
    vm:yT(v84, 0, v88("UISizeConstraint", {MaxSize = new3(270, 99)}))
    local v99, v100 = v20(v84), reg.slot6
    v84, v80 = {Parent = v96, LayoutOrder = 4, Size = fn2(0, 22), AutomaticSize = x, Visible = false, BackgroundTransparency = 0.9, BackgroundColor3 = tbl2.sky}, reg.slot9
    vm:yT(v84, 0, fn12(), fn16(0, 10), v80(6, nil, center3, horizontal), v98, v99)
    local v101 = v100(v84)
    tbl32.Status = function(arg1_59, arg2_34, arg3_20)
      arg1_59 = fn39(arg3_20)
      v101.Visible = (arg2_34 ~= nil) and (arg2_34 ~= "")
      if v99.Text == arg2_34 then
        if v98.BackgroundColor3 == arg1_59 then
          return
        end
      end
      v99.Text = arg2_34 or ""
      v98.BackgroundColor3 = arg1_59
      v101.BackgroundColor3 = arg1_59
    end
    if not (arg2_31.Game) then
      task.spawn(function()
        local v102, v103, v104 = reg.localPlayer, pcall(fn("MarketplaceService").GetProductInfo, fn("MarketplaceService"), reg.localPlayer.PlaceId)
        v97.Text = ((v103 and v104) and v104.Name) or ""
      end)
    end
    v88, key4 = {Parent = v82, AnchorPoint = v7}, reg.getHumanoid
    v88.Position = key4(1, -10, 0.5, 0)
    v88.Size = fn2(26, 26)
    v88.BackgroundTransparency = 0.92
    vm:yT(v88, 0, fn12(9), fn13(0.86), fn10("minus", 18))
    v75 = v19(v88)
    fn27(v75)
    arg1_52, key4 = {Parent = v82, AnchorPoint = v7}, reg.getHumanoid
    arg1_52.Position = key4(1, -44, 0.5, 0)
    arg1_52.Size = fn2(128, 26)
    local v105, v106 = fn38(arg1_52, "Search"), reg.slot6
    arg1_52, v77 = {Parent = v83, Position = fn2(0, num + 1)}, reg.getHumanoid
    arg1_52.Size = v77(0, num2, 1, -num - 1)
    arg1_52.ClipsDescendants = true
    v84, v95, v100 = reg.slot6, {Position = fn2(0, -16)}, reg.getHumanoid
    v95.Size = v100(1, 16, 1, 16)
    v95.BackgroundTransparency = 0.95
    vm:yT(v95, 0, fn12(16))
    vm:yT(arg1_52, 0, v84(v95))
    v95, v84 = v106(arg1_52), reg.getHumanoid
    fn17(v95, v84(1, -1, 0, 0), reg.getHumanoid(0, 1, 1, 0))
    v106, v96, v100 = reg.slot6, {Parent = v95, AnchorPoint = v6}, reg.getHumanoid
    v96.Position = v100(0.5, 0, 0, 29)
    v96.Size = fn2(38, 38)
    v96.BackgroundTransparency = 0.82
    vm:yT(v96, 0, fn12(12), fn13(0.68))
    local v107, v108 = v106(v96), reg.slot3
    local v109 = v108("UIScale", {Parent = v107})
    v108, v88 = {Parent = v95, ZIndex = 2, Position = fn2(0, 8)}, reg.getHumanoid
    v108.Size = v88(1, 0, 1, -60)
    v108.ScrollBarThickness = 0
    arg1_52 = reg.slot9
    vm:yT(v108, 0, fn16(2, 0), arg1_52(4, center2))
    local v110 = v22(v108)
    v108, v84 = {Parent = v95, AnchorPoint = new3(0.5, 1)}, reg.getHumanoid
    v108.Position = v84(0.5, 0, 1, -10)
    v108.Size = fn2(32, 32)
    v108.Image = fn11(48)
    v108.BackgroundTransparency = 0
    v108.BackgroundColor3 = tbl2.a2
    vm:yT(v108, 0, fn12())
    fn9(v108)
    v108, v80 = {Parent = v83, Position = fn2(num2 + 18, num + 9)}, reg.getHumanoid
    v108.Size = v80(1, -num2 - 36, 0, 26)
    v108.FontFace = new5
    v108.TextSize = 20
    local v111, v112 = v20(v108), reg.slot6
    v84, v95 = {Parent = v83, Position = fn2(num2, num + 41)}, reg.getHumanoid
    v84.Size = v95(1, -num2, 1, -num - 49)
    v84.ClipsDescendants = true
    local v113 = v112(v84)
    fn30(v82, v91, function(arg1_60)
      local viewportSize2, absoluteSize2 = workspace.CurrentCamera.ViewportSize, v78.AbsoluteSize
      local v114, v115 = ((viewportSize2.X / 2) + (absoluteSize2.X / 2)) - 90, ((viewportSize2.Y / 2) + (absoluteSize2.Y / 2)) - 60
      return new3(math.clamp(arg1_60.X, -v114, v114), math.clamp(arg1_60.Y, -v115, v115))
    end)
    local v116 = fn30(v87, v93, function(arg1_61)
      local viewportSize3 = workspace.CurrentCamera.ViewportSize
      return new3(math.clamp(arg1_61.X, 30, viewportSize3.X - 30), math.clamp(arg1_61.Y, 30, viewportSize3.Y - 30))
    end)
    v84, v95 = {Parent = v83, AnchorPoint = new3(1, 1)}, reg.getHumanoid
    v84.Position = v95(1, -3, 1, -3)
    v84.Size = fn2(22, 22)
    v84.ZIndex = 6
    v96, v100 = v19(v84), {{14, 11}, {7, 16}}
    for index6, item8 in ipairs(v100) do
      v18({Parent = v96, AnchorPoint = v6, Position = fn2(item8[2], item8[2]), Size = fn2(item8[1], 2), Rotation = -45, BackgroundTransparency = 0.4, ZIndex = 6, fn12()})
    end
    fn4(v96.InputBegan, function(arg1_62)
      if not (fn23(arg1_62)) then
        return
      end
      local position2 = arg1_62.Position
      local v117 = new3(v78.Size.X.Offset, v78.Size.Y.Offset)
      local scale, v118 = v79.Scale
      local v119, v120 = v91.p - ((v117 * scale) / 2)
      v120, v78.AnchorPoint, v78.Position = reg.getHumanoid, new3(), reg.getHumanoid(0.5, v119.X, 0.5, v119.Y)
      local function fn46(arg1_63)
        if arg1_63 ~= arg1_62 then
          local v121 = reg.slot4
          if arg1_63.UserInputType ~= v121.UserInputType.MouseMovement then
            return
          end
        end
        local v122, v123 = (arg1_63.Position - position2) / scale, workspace.CurrentCamera.ViewportSize / scale
        v78.Size = fn2(math.clamp(v117.X + v122.X, num3, math.max(num3, v123.X - 40)), math.clamp(v117.Y + v122.Y, num4, math.max(num4, v123.Y - 20)))
      end
      local conn = userInputService.InputChanged:Connect(fn46)
      local function fn47(arg1_64)
        local cond, v124 = arg1_64 == arg1_62
        if cond then
          v124 = cond
        else
          local v125
          v125, v124 = reg.slot4, arg1_64.UserInputType == reg.slot4.UserInputType.MouseButton1
        end
        if v124 then
          conn:Disconnect()
          v118:Disconnect()
          cond = v119 + ((new3(v78.Size.X.Offset, v78.Size.Y.Offset) * scale) / 2)
          v78.AnchorPoint = v6
          v91.t = cond
          v91.p = cond
          v91.a(cond)
        end
      end
      v118 = userInputService.InputEnded:Connect(fn47)
    end)
    local num5 = 0
    tbl32.Show = function(arg1_65, arg2_35)
      tbl32.open = arg2_35
      num5 += 1
      local v126 = num5
      arg1_65 = fn44()
      if v83.Parent ~= v81 then
        local v127
        v127, v83.Position, v83.Size = reg.getHumanoid, fn2(3, 3), reg.getHumanoid(1, -6, 1, -6)
        v83.Parent = v81
        v81.GroupTransparency = (arg2_35 and 1) or 0
      end
      v79.Scale = arg1_65
      v81.Visible = true
      v78.Visible = true
      local dim, tbl33 = tbl32.dim, {}
      tbl33.BackgroundTransparency = (arg2_35 and (1 - tbl32.dz)) or 1
      fn18(dim, tbl33, 0.3)
      dim, arg1_65 = reg.slot4, reg.slot4
      fn18(v81, {GroupTransparency = (arg2_35 and 0) or 1}, (arg2_35 and 0.28) or 0.18, reg.slot4.EasingStyle.Sine, reg.slot4.EasingDirection.Out)
      task.delay((arg2_35 and 0.3) or 0.2, function()
        if num5 ~= v126 then
          return
        end
        v81.Visible = false
        local v128 = reg.getHumanoid
        v83.Position = v128()
        v83.Size = v4
        v83.Parent = v78
        if not (arg2_35) then
          v78.Visible = false
        end
      end)
      if v87.Visible then
        v89.Scale = 0.85
        fn18(v89, {Scale = 1}, 0.3, back)
      else
        v87.Visible = true
        v89.Scale = 0
        fn18(v89, {Scale = 1}, 0.4, back)
      end
    end
    fn25(v75, function()
      tbl32:Show(false)
    end)
    fn25(v87, function()
      if not (v116()) then
        tbl32:Show(not tbl32.open)
      end
    end)
    fn4(userInputService.InputBegan, function(arg1_66, arg2_36)
      if not (arg2_36) then
        if arg1_66.KeyCode == tbl32.Key then
          tbl32:Show(not tbl32.open)
        end
      end
    end)
    local v129 = v19({Parent = v83, Size = v4, BackgroundColor3 = fromRGB(5, 6, 16), ZIndex = 20, Visible = false, ClipsDescendants = true, fn12(16)})
    v77, v75 = {Parent = v129}, reg.slot7
    v77.AnchorPoint = v75
    v100 = reg.getHumanoid
    v77.Position = v100(1, 420, 0, 6)
    v95 = reg.getHumanoid
    v77.Size = v95(0, 390, 1, -12)
    v77.BackgroundTransparency = 0.02
    v77.BackgroundColor3 = tbl2.pn
    vm:yT(v77, 0, fn12(14), fn13(0.84))
    local v130 = v19(v77)
    v106, v95 = {Parent = v130, Position = fn2(18, 14)}, reg.getHumanoid
    v106.Size = v95(1, -80, 0, 20)
    v106.FontFace = new5
    v106.TextSize = 15
    local v131 = v20(v106)
    key4, v100 = {Parent = v130, Position = fn2(18, 34)}, reg.getHumanoid
    key4.Size = v100(1, -80, 0, 14)
    key4.TextSize = 11
    key4.TextTransparency = 0.32
    local v132, tbl34, v133 = v20(key4), {Parent = v130}, reg.slot7
    tbl34.AnchorPoint = v133
    v82 = reg.getHumanoid
    tbl34.Position = v82(1, -12, 0, 10)
    tbl34.Size = fn2(40, 40)
    tbl34.BackgroundTransparency = 0.92
    vm:yT(tbl34, 0, fn12(12), fn10("x", 22))
    v88, v82, v95 = v19(tbl34), {Parent = v130, Position = fn2(14, 60)}, reg.getHumanoid
    v82.Size = v95(1, -28, 0, 40)
    v82.BackgroundTransparency = 0.93
    local v134 = fn38(v82, "Filter")
    v84, v112, v100, v77, v82 = {Parent = v130, Position = fn2(12, 108)}, fn16(3), reg.slot3, {}, reg.getHumanoid
    v77.CellSize = v82(0.5, -5, 0, 44)
    v77.CellPadding = fn2(8, 8)
    v95 = reg.slot4
    v77.SortOrder = v95.SortOrder.LayoutOrder
    vm:yT(v84, 0, v112, v100("UIGridLayout", v77))
    local v135, v136 = v22(v84), reg.slot6
    key4, v95 = {Parent = v130, AnchorPoint = new3(0, 1)}, reg.getHumanoid
    key4.Position = v95(0, 14, 1, -14)
    v75 = reg.getHumanoid
    key4.Size = v75(1, -28, 0, 44)
    local v137 = v136(key4)
    v133, v95, v108 = fn42(v137, "Default", 0, 3), fn42(v137, "Clear", 1, 3), fn42(v137, "Select all", 2, 3, true)
    tbl32.Dialog = function(arg1_67, arg2_37)
      local v138 = arg2_37 or {}
      if tbl32.dlg then
        tbl32.dlg.Close()
      end
      if not (tbl32.open) then
        tbl32:Show(true)
      end
      local v139, v140 = fn39(v138.Kind)
      arg1_67 = reg.slot3
      local v141 = arg1_67("UIScale", {Scale = 0.9})
      local v142 = v19({Parent = v83, Size = v4, BackgroundColor3 = fromRGB(5, 6, 16), ZIndex = 30, fn12(16)})
      local tbl35, v143, v144, v145, v146 = {Parent = v142, AnchorPoint = v6, Position = v5, Size = fn2(400, 0), AutomaticSize = y, BackgroundTransparency = 0.02, BackgroundColor3 = tbl2.pn}, fn12(18), fn13(0.8), fn16(22), reg.slot9
      local v147, v148, tbl36, v149 = v146(16), reg.slot6, {}, reg.getHumanoid
      tbl36.Size = v149(1, 0, 0, 46)
      v149 = reg.slot6
      local v150, tbl37, v151 = v149({Size = fn2(46, 46), BackgroundTransparency = 0.8, BackgroundColor3 = v139, fn12(14), fn10(v138.Icon or v140, 24, v139)}), {Position = fn2(60, 0)}, reg.getHumanoid
      tbl37.Size = v151(1, -60, 1, 0)
      tbl37.Text = v138.Title or ""
      tbl37.FontFace = new5
      tbl37.TextSize = 17
      tbl37.TextWrapped = true
      vm:yT(tbl36, 0, v150, v20(tbl37))
      vm:yT(tbl35, 0, v143, v144, v145, v147, v141, v148(tbl36))
      local v152 = v19(tbl35)
      if v138.Text then
        v20({Parent = v152, LayoutOrder = 1, Size = v8, AutomaticSize = y, Text = v138.Text, TextSize = 13, TextTransparency = 0.25, TextWrapped = true})
      end
      v143, v144, v151 = reg.slot6, {Parent = v152, LayoutOrder = 2}, reg.getHumanoid
      v144.Size = v151(1, 0, 0, 42)
      v149 = v143(v144)
      local v153
      v153 = {Close = function(arg1_68)
        if tbl32.dlg == v153 then
          tbl32.dlg = nil
        end
        fn18(v141, {Scale = 0.92}, 0.18)
        local v154, fn48 = fn18(v142, {BackgroundTransparency = 1}, 0.2), function()
          v142:Destroy()
        end
        v154.Completed:Connect(fn48)
        v152.Visible = false
        fn22(arg1_68)
      end}
      v145 = v138.Buttons or {{"OK"}}
      for index7, item9 in ipairs(v145) do
        tbl36, v150, v140 = item9[1], index7 - 1, #v145
        v148, arg1_67 = fn42(v149, tbl36, v150, v140, item9[3]), function()
          if fn24() then
            v153.Close(item9[2])
          end
        end
        v148.Activated:Connect(arg1_67)
      end
      local function fn49()
        if v138.Cancel ~= false then
          v153.Close(v138.Cancel)
        end
      end
      v142.Activated:Connect(fn49)
      tbl32.dlg = v153
      fn18(v142, {BackgroundTransparency = 0.45}, 0.2)
      fn18(v141, {Scale = 1}, 0.35, back)
      return v153
    end
    local function fn50(arg1_69, arg2_38, arg3_21, arg4_10, arg5_6, arg6_3)
      tbl32:Dialog({Title = arg1_69, Text = arg2_38, Kind = arg3_21, Buttons = {{arg6_3 or "Cancel"}, {arg4_10, arg5_6, true}}})
    end
    local function fn51()
      local v155 = reg.slot2
      v155:Save()
      local v156, v157 = reg.slot2, reg.slot11
      v156:Notify("Config saved", v157.Active, "ok")
    end
    local function fn52(arg1_70, arg2_39)
      local v158 = reg.slot2
      v158:Notify(arg2_39, arg1_70 or "", (pcall(setclipboard, arg1_70) and "ok") or "err")
    end
    fn27(v88)
    local tbl38 = {bt = {}, sel = {}}
    local function fn53()
      tbl38.open = false
      fn18(v129, {BackgroundTransparency = 1}, 0.22)
      local tbl39, v159 = {}, reg.getHumanoid
      tbl39.Position = v159(1, 540, 0, 6)
      v159 = reg.slot4
      fn20(fn18(v130, tbl39, 0.28, quint, v159.EasingDirection.In), v129, function()
        return tbl38.open
      end)
    end
    local function fn54()
      for key5, item10 in next, tbl38.bt, nil do
        local cond2 = tbl38.sel[key5] ~= nil
        fn18(item10[1], {BackgroundTransparency = (cond2 and 0.72) or 0.93, BackgroundColor3 = (cond2 and tbl2.a1) or tbl2.wh}, 0.18)
        fn18(item10[2], {Transparency = (cond2 and 0.2) or 0.82, Color = (cond2 and tbl2.a1:Lerp(tbl2.wh, 0.35)) or tbl2.wh}, 0.18)
        local v160, tbl40 = item10[3], {}
        tbl40.ImageTransparency = (cond2 and 0) or 1
        fn18(v160, tbl40, 0.18)
      end
    end
    local function fn55()
      fn54()
      local tbl41 = {}
      for index8, item11 in ipairs(tbl38.o) do
        if tbl38.sel[item11] then
          tbl41[#tbl41 + 1] = item11
        end
      end
      fn22(tbl38.d, tbl41)
    end
    tbl32.Sync = function(arg1_71, arg2_40)
      if tbl38.open then
        if not (tbl38.ob == arg2_40) then
          return
        end
      else
        return
      end
      tbl38.sel = {}
      for index9, item12 in ipairs((arg2_40.Multi and arg2_40.Value) or {arg2_40.Value}) do
        tbl38.sel[item12] = true
      end
      fn54()
    end
    tbl32.Pick = function(arg1_72, arg2_41, arg3_22, arg4_11, arg5_7, arg6_4, arg7, arg8)
      tbl38.ob = arg8
      v131.Text = arg2_41
      v132.Text = (arg5_7 and "Pick any") or "Pick one"
      v134.Text = ""
      fn40(v135)
      arg1_72 = arg7 or {}
      tbl38.bt = {}
      tbl38.sel = {}
      tbl38.d = arg6_4
      tbl38.o = {}
      tbl38.def = arg1_72
      for index10, item13 in ipairs((arg5_7 and arg4_11) or {arg4_11}) do
        tbl38.sel[item13] = true
      end
      arg2_41, arg8 = type(arg3_22[1]) == "table"
      arg8, v135:FindFirstChildOfClass("UIGridLayout").CellSize = reg.getHumanoid, reg.getHumanoid(0.5, -5, 0, (arg2_41 and 54) or 44)
      arg7 = reg.getHumanoid
      v130.Size = arg7(0, (arg2_41 and 500) or 390, 1, -12)
      arg8 = ipairs
      for it1, it2 in arg8(arg3_22) do
        local v161 = (arg2_41 and it2.v) or it2
        tbl38.o[it1] = v161
        arg4_11, arg1_72 = fn13(0.82), reg.slot6
        arg7 = arg1_72({Parent = v135, LayoutOrder = it1})
        it1 = v19({Parent = arg7, AnchorPoint = v6, Position = v5, Size = v4, BackgroundTransparency = 0.93, fn12(13), arg4_11})
        if arg2_41 then
          local v162, tbl42, v163, v164, tbl43, v165 = reg.slot6, {Parent = it1, Position = fn2(5, 5), Size = fn2(44, 44), BackgroundTransparency = 0.72, BackgroundColor3 = it2.col or tbl2.a1}, fn12(12), fn13(0.6, it2.col), {AnchorPoint = v6, Position = v5}, reg.getHumanoid
          tbl43.Size = v165(1, 2, 1, 2)
          tbl43.Image = it2.img or ""
          v165 = reg.slot4
          tbl43.ScaleType = v165.ScaleType.Fit
          vm:yT(tbl42, 0, v163, v164, v23(tbl43))
          v162(tbl42)
          v164, tbl43 = {Parent = it1, Position = fn2(56, 3)}, reg.getHumanoid
          v164.Size = tbl43(1, -60, 0, 28)
          v164.Text = it2.t or tostring(v161)
          v164.FontFace = new6
          v164.TextSize = 17
          v164.TextTruncate = atEnd
          v20(v164)
          v165, tbl42, v163 = reg.slot6, {Parent = it1, Position = fn2(57, 32)}, reg.getHumanoid
          tbl42.Size = v163(1, -90, 0, 17)
          tbl42.ClipsDescendants = true
          tbl43 = reg.slot9
          vm:yT(tbl42, 0, tbl43(6, nil, center3, horizontal))
          v163 = v165(tbl42)
          tbl43, v162 = {Parent = v163}, reg.getHumanoid
          tbl43.Size = v162(0, 0, 1, 0)
          tbl43.AutomaticSize = x
          tbl43.Text = (it2.sub or ""):upper()
          tbl43.FontFace = new8
          tbl43.TextSize = 12.5
          tbl43.TextColor3 = ((it2.grad and tbl2.wh) or it2.col) or tbl2.val
          v164 = reg.slot3
          vm:yT(tbl43, 0, v164("UIStroke", {Thickness = 1.2, Color = fromRGB(0, 0, 0)}))
          local v166 = v20(tbl43)
          if it2.grad then
            it2.grad:Clone().Parent = v166
          end
          if it2.note then
            v162, v164 = {Parent = v163, LayoutOrder = 1}, reg.getHumanoid
            v162.Size = v164(1, -6, 1, 0)
            v162.Text = it2.note
            v162.FontFace = new5
            v162.TextSize = 12.5
            v162.RichText = true
            v162.TextTruncate = atEnd
            tbl42 = reg.slot3
            vm:yT(v162, 0, tbl42("UIStroke", {Thickness = 1.2, Color = fromRGB(0, 0, 0)}))
            local v167 = v20(v162)
            local function fn56()
              local v168 = reg.getHumanoid
              v167.Size = v168(1, -v166.AbsoluteSize.X - 6, 1, 0)
            end
            v166:GetPropertyChangedSignal("AbsoluteSize"):Connect(fn56)
            fn56()
          end
        else
          local tbl44, v169 = {Parent = it1, Position = fn2(14, 0)}, reg.getHumanoid
          tbl44.Size = v169(1, -40, 1, 0)
          tbl44.Text = tostring(v161)
          tbl44.FontFace = new5
          tbl44.TextSize = 12
          tbl44.TextWrapped = true
          tbl44.LineHeight = 0.95
          v20(tbl44)
        end
        local bt, v170, v171, v172 = tbl38.bt, {}, {Parent = it1, AnchorPoint = (arg2_41 and new3(1, 1)) or v7}
        if arg2_41 then
          local v173 = reg.getHumanoid
          v172 = (v173(1, -9, 1, -8))
        else
          v172 = arg2_41
        end
        local v174
        if v172 then
          v174 = v172
        else
          local v175 = reg.getHumanoid
          v174 = (v175(1, -12, 0.5, 0))
        end
        v171.Position = v174
        v171.Size = fn2(18, 18)
        v171.Image = "check"
        v171.ImageTransparency = 1
        vm:yT(v170, 0, it1, arg4_11, fn9(v171), arg7, (tostring(v161) .. (" " .. ((arg2_41 and ((it2.t or "") .. (" " .. ((it2.sub or "") .. (" " .. (it2.note or "")))))) or ""))):lower())
        bt[v161] = v170
        fn27(it1, 0.95)
        fn25(it1, function()
          if arg5_7 then
            local sel, v176 = tbl38.sel, tbl38.sel[v161]
            sel[v161] = if v176 then nil else not v176
            fn55()
          else
            tbl38.sel = {[v161] = true}
            fn54()
            fn53()
            fn22(arg6_4, v161)
          end
        end)
      end
      v137.Visible = arg5_7 == true
      arg1_72 = reg.getHumanoid
      v135.Size = arg1_72(1, -24, 1, (arg5_7 and -176) or -120)
      fn54()
      tbl38.open = true
      v129.Visible = true
      fn18(v129, {BackgroundTransparency = 0.45}, 0.25)
      arg2_41, arg8 = {}, reg.getHumanoid
      arg2_41.Position = arg8(1, -6, 0, 6)
      fn18(v130, arg2_41, 0.45)
    end
    fn4(v134:GetPropertyChangedSignal("Text"), function()
      local lower = v134.Text:lower()
      for key6, item14 in next, tbl38.bt, nil do
        item14[4].Visible = item14[5]:find(lower, 1, true) ~= nil
      end
    end)
    fn25(v88, fn53)
    fn25(v129, fn53)
    local function fn57(arg1_73)
      tbl38.sel = {}
      for index11, item15 in ipairs(arg1_73) do
        tbl38.sel[item15] = true
      end
      fn55()
    end
    fn25(v133, function()
      fn57(tbl38.def)
    end)
    fn25(v95, function()
      fn57({})
    end)
    fn25(v108, function()
      fn57(tbl38.o)
    end)
    local function fn58(arg1_74)
      return (29 + ((arg1_74.i - 1) * 42)) - v110.CanvasPosition.Y
    end
    fn4(v110:GetPropertyChangedSignal("CanvasPosition"), function()
      if tbl32.Cur then
        local v177 = reg.getHumanoid
        v107.Position = v177(0.5, 0, 0, fn58(tbl32.Cur))
      end
    end)
    local function fn59(arg1_75, arg2_42, arg3_23)
      local v178, tbl45, v179 = reg.slot6, {Parent = arg2_42, LayoutOrder = arg3_23, Size = v8, AutomaticSize = y}, reg.slot9
      vm:yT(tbl45, 0, v179(16))
      v179, arg3_23 = v178(tbl45), reg.slot6
      tbl45, v178 = {Parent = v179, LayoutOrder = 1, Size = v8, AutomaticSize = y}, reg.slot9
      vm:yT(tbl45, 0, v178(16, nil, nil, horizontal))
      arg2_42 = arg3_23(tbl45)
      arg1_75.cols = {}
      arg1_75.list = {}
      arg1_75.crow = v179
      for i3 = 1, 2, 1 do
        local cols, v180, v181, v182, v183 = arg1_75.cols, reg.slot6, {Parent = arg2_42, LayoutOrder = i3}, reg.getHumanoid
        v181.Size, v181.AutomaticSize, v183 = reg.getHumanoid(0.5, -8, 0, 0), y, reg.slot9
        vm:yT(v181, 0, reg.slot9(16))
        cols[i3] = reg.slot6(v181)
      end
      local cols2, v184, v185, v186, v187 = arg1_75.cols, reg.slot6, {Parent = v179, LayoutOrder = 2}, reg.getHumanoid
      v185.Size, v185.AutomaticSize, v185.Visible, v187 = reg.getHumanoid(0.5, -8, 0, 0), y, false, reg.slot9
      vm:yT(v185, 0, reg.slot9(16))
      cols2[3] = reg.slot6(v185)
      arg2_42, v187, arg3_23, tbl45 = arg1_75.cols, reg.slot6, {Parent = v179, LayoutOrder = 0, Size = v8, AutomaticSize = y, Visible = false}, reg.slot9
      vm:yT(arg3_23, 0, reg.slot9(16))
      arg2_42[4] = reg.slot6(arg3_23)
    end
    local function fn60(arg1_76, arg2_43)
      local v188 = arg1_76.on and arg1_76.on.chip
      if v188 then
        if v188.AbsoluteSize.X == 0 then
          return
        end
      else
        return
      end
      local tbl46 = {Position = fn2((v188.AbsolutePosition.X - arg1_76.row.AbsolutePosition.X) / v79.Scale, 0), Size = fn2(v188.AbsoluteSize.X / v79.Scale, 24)}
      if arg2_43 then
        arg1_76.hl.Position, arg1_76.hl.Size = tbl46.Position, tbl46.Size
      else
        fn18(arg1_76.hl, tbl46, 0.38)
      end
    end
    local function fn61(arg1_77, arg2_44)
      if arg1_77.on == arg2_44 then
        return
      end
      arg1_77.on = arg2_44
      for index12, item16 in ipairs(arg1_77.subs) do
        local chip, tbl47 = item16.chip, {}
        tbl47.TextTransparency = ((item16 == arg2_44) and 0) or 0.5
        fn18(chip, tbl47, 0.2)
      end
      fn60(arg1_77)
    end
    local function fn62(arg1_78)
      if os.clock() < (arg1_78.lock or 0) then
        return
      end
      local scale2, y2, v189, v190 = v79.Scale, arg1_78.sc.AbsolutePosition.Y, arg1_78.sc.AbsoluteCanvasSize.Y - arg1_78.sc.AbsoluteWindowSize.Y, arg1_78.subs[1]
      for index13, item17 in ipairs(arg1_78.subs) do
        v190 = if (item17.g.AbsolutePosition.Y - y2) <= (40 * scale2) then item17 else v190
      end
      fn61(arg1_78, if v189 > 0 then if arg1_78.sc.CanvasPosition.Y >= (v189 - 2) then arg1_78.subs[#arg1_78.subs] else v190 else v190)
    end
    local function fn63(arg1_79, arg2_45, arg3_24)
      local v191 = ((arg1_79.CanvasPosition.Y + arg2_45.AbsolutePosition.Y) - arg1_79.AbsolutePosition.Y) - (arg3_24 * v79.Scale)
      fn18(arg1_79, {CanvasPosition = new3(0, math.clamp(v191, 0, math.max(0, arg1_79.AbsoluteCanvasSize.Y - arg1_79.AbsoluteWindowSize.Y)))}, 0.45)
    end
    local function fn64(arg1_80, arg2_46)
      arg1_80.lock = os.clock() + 0.5
      fn63(arg1_80.sc, arg2_46.g, 4)
      fn61(arg1_80, arg2_46)
    end
    tbl32.Select = function(arg1_81, arg2_47)
      local cur = tbl32.Cur
      if cur == arg2_47 then
        return
      end
      v105.Text = ""
      tbl32.Cur = arg2_47
      for index14, item18 in ipairs(arg2_47.subs or {}) do
        fn43(item18)
      end
      if arg2_47.list then
        fn43(arg2_47)
      end
      for index15, item19 in ipairs(tbl32.Tabs) do
        if item19.bar then
          item19.bar.Visible = item19 == arg2_47
          task.defer(fn60, item19, true)
        end
        arg1_81, index15 = item19.im, {}
        index15.ImageTransparency = ((item19 == arg2_47) and 0) or 0.45
        fn18(arg1_81, index15, 0.3)
      end
      local tbl48, v192 = {}, reg.getHumanoid
      tbl48.Position = v192(0.5, 0, 0, fn58(arg2_47))
      fn18(v107, tbl48, 0.42)
      v109.Scale = 0.86
      fn18(v109, {Scale = 1}, 0.5, back)
      v192 = (cur and (((cur.i > arg2_47.i) and -1) or 1)) or 0
      if cur then
        cur.k = cur.k + 1
        local k = cur.k
        local fr, tbl49, v193 = cur.fr, {}, reg.getHumanoid
        tbl49.Position = reg.getHumanoid(-v192, 0, 0, 0)
        fn20(fn18(fr, tbl49, 0.5), cur.fr, function()
          return (cur.k ~= k) or (tbl32.Cur == cur)
        end)
      end
      arg2_47.k = arg2_47.k + 1
      if not (arg2_47.fr.Visible) then
        arg1_81 = nil
        arg1_81, arg2_47.fr.Position = reg.getHumanoid, reg.getHumanoid(v192, 0, 0, 0)
      end
      arg2_47.fr.Visible = true
      local fr2, tbl50, v194 = arg2_47.fr, {}, reg.getHumanoid
      tbl50.Position = reg.getHumanoid()
      fn18(fr2, tbl50, 0.5)
      v111.Text = arg2_47.Title or arg2_47.Name
      v111.Position = fn2((num2 + 18) + (v192 * 24), num + 9)
      v111.TextTransparency = 0.7
      fn18(v111, {Position = fn2(num2 + 18, num + 9), TextTransparency = 0}, 0.45)
    end
    tbl32.nest = {}
    tbl32.Grip = function(arg1_82, arg2_48, arg3_25)
      local function fn65()
        return arg2_48.AbsoluteCanvasSize.Y / math.max(arg2_48.AbsoluteWindowSize.Y, 1)
      end
      local tbl51, v195 = {Parent = arg3_25}, reg.slot7
      tbl51.AnchorPoint = v195
      v195 = reg.getHumanoid
      tbl51.Position = v195(1, 0, 0, 0)
      v195 = reg.getHumanoid
      tbl51.Size = v195(0, 14, 1, 0)
      tbl51.ZIndex = 8
      tbl51.Visible = not userInputService.TouchEnabled
      arg1_82, arg3_25, v195 = v19(tbl51), setmetatable, {__index = function()
        return new3(0, arg2_48.CanvasPosition.Y / fn65())
      end, __newindex = function(arg1_83, arg2_49, arg3_26)
        tbl32.goal = math.clamp(arg3_26.Y * fn65(), 0, math.max(0, arg2_48.AbsoluteCanvasSize.Y - arg2_48.AbsoluteWindowSize.Y))
        tbl32.gf = arg2_48
        arg2_48.CanvasPosition = new3(0, tbl32.goal)
      end}
      fn30(arg1_82, arg3_25({}, v195), function(arg1_84)
        return arg1_84
      end)
    end
    tbl32.Tab = function(arg1_85, arg2_50, arg3_27, arg4_12)
      local tbl52 = {Name = arg2_50, W = tbl32, Secs = {}, i = #tbl32.Tabs + 1, k = 0}
      tbl52.top = tbl52
      arg1_85 = reg.slot6
      tbl52.fr = arg1_85({Parent = v113, Size = v4, Visible = false})
      if arg4_12 then
        arg1_85 = reg.slot6
        tbl52.sc = arg1_85({Parent = tbl52.fr, Size = v4, fn16(6, 16, 6)})
      else
        local tbl53, v196 = {Parent = tbl52.fr, Size = v4, ScrollingEnabled = userInputService.TouchEnabled, ScrollBarThickness = 3, ScrollBarImageColor3 = tbl2.wh, ScrollBarImageTransparency = 0.7}, reg.slot4
        tbl53.ElasticBehavior = v196.ElasticBehavior.Always
        v196 = reg.slot9
        vm:yT(tbl53, 0, fn16(4, 0, 12), v196(12, center2))
        tbl52.sc = v22(tbl53)
        local v197, tbl54, v198 = reg.slot6, {Parent = tbl52.sc}, reg.getHumanoid
        tbl54.Size = v198(1, -36, 0, 0)
        tbl54.AutomaticSize = y
        tbl52.g = v197(tbl54)
        fn4(tbl52.sc.InputChanged, function(arg1_86)
          local v199 = reg.slot4
          if arg1_86.UserInputType == v199.UserInputType.MouseWheel then
            tbl32:Wheel(arg1_86.Position.Z)
          end
        end)
        tbl32:Grip(tbl52.sc, tbl52.fr)
        fn4(tbl52.sc.MouseWheelForward, function()
          tbl32:Wheel(1)
        end)
        fn4(tbl52.sc.MouseWheelBackward, function()
          tbl32:Wheel(-1)
        end)
        fn59(tbl52, tbl52.g, 0)
        tbl52.subs = {}
      end
      arg4_12 = v19({Parent = v110, Size = fn2(38, 38), LayoutOrder = tbl52.i})
      tbl52.im = fn9({Parent = arg4_12, AnchorPoint = v6, Position = v5, Size = fn2(24, 24), Image = arg3_27 or "grid", ImageTransparency = 0.45})
      fn27(tbl52.im, 0.8, arg4_12, function(arg1_87)
        if tbl32.Cur == tbl52 then
          fn18(v109, {Scale = (arg1_87 and 0.9) or 1}, (arg1_87 and 0.12) or 0.45, (arg1_87 and quint) or back)
        end
      end)
      fn25(arg4_12, function()
        tbl32:Select(tbl52)
      end)
      tbl32.Tabs[tbl52.i] = tbl52
      tbl52.Section = function(arg1_88, arg2_51, arg3_28, arg4_13)
        return tbl29.new(tbl52, arg2_51, arg3_28, arg4_13)
      end
      tbl52.Arrange = function(arg1_89, arg2_52)
        for index16, item20 in ipairs(arg2_52) do
          for index17, item21 in ipairs(item20) do
            for index18, item22 in ipairs(arg1_89.Secs) do
              if item22.name == item21 then
                item22.side, item22.card.LayoutOrder = index16, index17
              end
            end
          end
        end
        arg1_89.done = -1
        fn43(arg1_89)
      end
      tbl52.Sub = function(arg1_90, arg2_53)
        local tbl55 = {Name = arg2_50 .. (" / " .. arg2_53), W = tbl32, Secs = tbl52.Secs, i = #tbl52.subs + 1, sc = tbl52.sc, top = tbl52}
        if #tbl52.subs == 0 then
          tbl52.g.Visible = #tbl52.Secs > 0
          local v200, tbl56, v201 = reg.slot6, {Parent = v83}, reg.slot7
          tbl56.AnchorPoint = v201
          v201 = reg.getHumanoid
          tbl56.Position = v201(1, -18, 0, num + 7)
          tbl56.Size = fn2(0, 30)
          tbl56.AutomaticSize = x
          tbl56.Visible = tbl32.Cur == tbl52
          tbl56.BackgroundTransparency = 0.95
          vm:yT(tbl56, 0, fn12(), fn13(0.88), fn16(3))
          tbl52.bar = v200(tbl56)
          v201 = reg.slot6
          tbl52.hl = v201({Parent = tbl52.bar, Size = fn2(0, 24), BackgroundTransparency = 0.84, fn12()})
          v201, arg1_90, tbl56 = reg.slot6, {Parent = tbl52.bar, Size = fn2(0, 24), AutomaticSize = x, ZIndex = 2}, reg.slot9
          vm:yT(arg1_90, 0, tbl56(4, nil, center3, horizontal))
          tbl52.row = v201(arg1_90)
          fn4(tbl52.row:GetPropertyChangedSignal("AbsoluteSize"), function()
            fn60(tbl52, true)
          end)
          fn4(tbl52.sc:GetPropertyChangedSignal("CanvasPosition"), function()
            fn62(tbl52)
          end)
        end
        local tbl57, v202 = {}, reg.getHumanoid
        tbl57.Size = v202(1, 0, 0, 18)
        local tbl58, v203 = {}, reg.getHumanoid
        tbl58.Size = v203(1, -30, 1, 0)
        tbl58.Text = arg2_53:upper()
        tbl58.FontFace = new6
        tbl58.TextSize = 12
        tbl58.TextTransparency = 0.35
        vm:yT(tbl57, 0, v20(tbl58))
        v203 = v19(tbl57)
        tbl57, v202 = {Parent = v203, AnchorPoint = v6}, reg.getHumanoid
        tbl57.Position = v202(1, -9, 0.5, 0)
        tbl57.Size = fn2(13, 13)
        tbl57.Image = "down"
        tbl57.ImageTransparency = 0.55
        local v204, v205 = fn9(tbl57), reg.slot6
        v202, arg1_90 = {Parent = tbl52.sc, LayoutOrder = tbl55.i}, reg.getHumanoid
        v202.Size = arg1_90(1, -36, 0, 0)
        v202.AutomaticSize = y
        tbl57 = reg.slot9
        vm:yT(v202, 0, tbl57(12), v203)
        tbl55.g = v205(v202)
        fn59(tbl55, tbl55.g, 1)
        fn25(v203, function()
          tbl55.crow.Visible = not tbl55.crow.Visible
          fn18(v204, {Rotation = (tbl55.crow.Visible and 0) or -90}, 0.25)
        end)
        tbl55.chip = v19({Parent = tbl52.row, LayoutOrder = tbl55.i, Size = fn2(0, 24), AutomaticSize = x, Text = arg2_53, FontFace = new5, TextSize = 12, TextColor3 = tbl2.wh, TextTransparency = 0.5, BackgroundTransparency = 1, fn12(), fn16(0, 12)})
        fn25(tbl55.chip, function()
          fn64(tbl52, tbl55)
        end)
        tbl55.Go = function(arg1_91)
          if not (tbl32.open) then
            tbl32:Show(true)
          end
          tbl32:Select(tbl52)
          task.delay(0.15, fn64, tbl52, tbl55)
        end
        tbl52.subs[tbl55.i] = tbl55
        tbl55.Section = function(arg1_92, arg2_54, arg3_29, arg4_14)
          return tbl29.new(tbl55, arg2_54, arg3_29, arg4_14)
        end
        tbl55.Arrange = tbl52.Arrange
        if tbl55.i == 1 then
          fn61(tbl52, tbl55)
        end
        return tbl55
      end
      if not (tbl32.Cur) then
        tbl32:Select(tbl52)
      end
      return tbl52
    end
    tbl32.All = {}
    v96, v88, v82 = reg.slot6, {Parent = v83}, reg.slot7
    v88.AnchorPoint = v82
    v136 = reg.getHumanoid
    v88.Position = v136(1, -44, 0, num - 4)
    v88.Size = fn2(300, 0)
    v88.AutomaticSize = y
    v88.Visible = false
    v88.ZIndex = 15
    v88.BackgroundTransparency = 0.02
    v88.BackgroundColor3 = tbl2.pn
    tbl34 = reg.slot9
    vm:yT(v88, 0, fn12(12), fn13(0.82), fn16(6), tbl34(2))
    local v206 = v96(v88)
    local function fn66(arg1_93)
      v105.Text = ""
      tbl32:Select(arg1_93.tab)
      task.delay(0.55, function()
        fn63(arg1_93.tab.sc, arg1_93.r, 40)
        arg1_93.r.BackgroundTransparency = 0.8
        fn18(arg1_93.r, {BackgroundTransparency = 1}, 1.4)
      end)
    end
    fn4(v105:GetPropertyChangedSignal("Text"), function()
      local lower2 = v105.Text:lower()
      fn40(v206)
      v206.Visible = lower2 ~= ""
      if lower2 == "" then
        return
      end
      local v207, all, num6 = ipairs, tbl32.All, 0
      for it1_2, it2_2 in v207(all) do
        if num6 < 8 then
          if it2_2.n:find(lower2, 1, true) then
            it1_2 = num6 + 1
            local tbl59, v208 = {Parent = v206, LayoutOrder = it1_2}, reg.getHumanoid
            tbl59.Size = v208(1, 0, 0, 42)
            local v209, tbl60, v210 = fn12(9), {Position = fn2(10, 4)}, reg.getHumanoid
            tbl60.Size = v210(1, -20, 0, 18)
            tbl60.Text = it2_2.title
            tbl60.FontFace = new5
            tbl60.TextTruncate = atEnd
            local v211, tbl61, v212 = v20(tbl60), {Position = fn2(10, 22)}, reg.getHumanoid
            tbl61.Size = v212(1, -20, 0, 15)
            tbl61.Text = it2_2.path
            tbl61.TextSize = 11
            tbl61.TextTransparency = 0.45
            tbl61.TextTruncate = atEnd
            vm:yT(tbl59, 0, v209, v211, v20(tbl61))
            v212 = v19(tbl59)
            fn19(v212, 0.92)
            local function fn67()
              if fn24() then
                fn66(it2_2)
              end
            end
            v212.Activated:Connect(fn67)
            num6 = it1_2
          else
          end
        else
        end
      end
      if num6 == 0 then
        all, lower2 = {Parent = v206}, reg.getHumanoid
        all.Size = lower2(1, 0, 0, 32)
        all.Text = "No results"
        all.TextTransparency = 0.45
        all.TextXAlignment = center
        v20(all)
      end
    end)
    tbl32.Home = function(arg1_94, arg2_55)
      local v213 = arg2_55 or {}
      arg1_94 = tbl32:Tab(v213.Name or "Home", v213.Icon or "home", true)
      arg1_94.Title = v213.Title or "Dashboard"
      local v214, tbl62, v215 = reg.slot6, {Parent = arg1_94.sc, Position = fn2(-6, -6)}, reg.getHumanoid
      tbl62.Size = v215(1, 12, 1, 12)
      local v216 = v214(tbl62)
      local function fn68(arg1_95, arg2_56, arg3_30, arg4_15, arg5_8, arg6_5, arg7_2)
        local v217, tbl63, v218 = reg.slot6, {Parent = v216}, reg.getHumanoid
        tbl63.Position = v218(arg1_95, 6, arg2_56, 6)
        v218 = reg.getHumanoid
        tbl63.Size = v218(arg3_30, -12, arg4_15, -12)
        tbl63.BackgroundTransparency = arg5_8 or 0.93
        tbl63.BackgroundColor3 = arg6_5 or tbl2.wh
        vm:yT(tbl63, 0, fn12(18), fn13(arg7_2 or 0.86, arg6_5 and arg6_5:Lerp(tbl2.wh, 0.5)))
        return v217(tbl63)
      end
      local function fn69(arg1_96, arg2_57, arg3_31, arg4_16)
        fn9({Parent = arg1_96, Position = fn2(14, 13), Size = fn2(14, 14), Image = arg3_31, ImageColor3 = arg4_16})
        arg3_31, arg4_16 = {Parent = arg1_96, Position = fn2(34, 12)}, reg.getHumanoid
        arg3_31.Size = arg4_16(1, -48, 0, 16)
        arg3_31.Text = arg2_57:upper()
        arg3_31.FontFace = new6
        arg3_31.TextSize = 11.5
        arg3_31.TextTransparency = 0.15
        return v20(arg3_31)
      end
      v215 = fn68(0, 0, 0.6666666666666666, 0.3, 0.55)
      fn14(fromRGB(255, 196, 120), fromRGB(150, 110, 255)).Parent = v215
      v214, tbl62 = {Parent = v215}, reg.getHumanoid
      v214.Position = tbl62(0, 16, 0.5, -28)
      v214.Size = fn2(56, 56)
      v214.Image = fn11(150)
      v214.BackgroundTransparency = 0
      v214.BackgroundColor3 = tbl2.a2
      vm:yT(v214, 0, fn12(), fn13(0.4))
      fn9(v214)
      tbl62, arg1_94 = {Parent = v215}, reg.getHumanoid
      tbl62.Position = arg1_94(0, 86, 0.5, -34)
      arg1_94 = reg.getHumanoid
      tbl62.Size = arg1_94(1, -100, 0, 14)
      tbl62.Text = "Welcome back"
      tbl62.TextSize = 11
      tbl62.TextTransparency = 0.25
      v20(tbl62)
      arg1_94, tbl62 = {Parent = v215}, reg.getHumanoid
      arg1_94.Position = tbl62(0, 86, 0.5, -19)
      v214 = reg.getHumanoid
      arg1_94.Size = v214(1, -100, 0, 24)
      arg1_94.Text = localPlayer.DisplayName
      arg1_94.FontFace = new5
      arg1_94.TextSize = 21
      arg1_94.TextTruncate = atEnd
      v20(arg1_94)
      arg1_94, tbl62, v214 = reg.slot6, {Parent = v215}, reg.getHumanoid
      tbl62.Position = v214(0, 86, 0.5, 10)
      v215 = reg.getHumanoid
      tbl62.Size = v215(1, -100, 0, 20)
      v214 = reg.slot9
      vm:yT(tbl62, 0, v214(6, nil, nil, horizontal))
      local v219, v220, v221 = arg1_94(tbl62), v213.Executor or (identifyexecutor and select(2, pcall(identifyexecutor))), ipairs
      v215 = {{v213.Game}, {(type(v220) == "string") and v220}, {v213.Key, tbl2.mint}}
      for it1_3, it2_3 in v221(v215) do
        if it2_3[1] then
          v214, arg1_94 = {Parent = v219, LayoutOrder = it1_3}, reg.getHumanoid
          v214.Size = arg1_94(0, 0, 1, 0)
          v214.AutomaticSize = x
          v214.Text = tostring(it2_3[1])
          v214.TextSize = 11
          v214.TextColor3 = it2_3[2] and it2_3[2]:Lerp(tbl2.wh, 0.6)
          v214.BackgroundTransparency = (it2_3[2] and 0.8) or 0.75
          v214.BackgroundColor3 = it2_3[2] or fromRGB(0, 0, 0)
          v214.TextXAlignment = center
          vm:yT(v214, 0, fn12(), fn16(0, 10))
          v20(v214)
        end
      end
      v221 = v213.Notice
      v219 = fn68(0.6666666666666666, 0, 0.3333333333333333, 0.3, 0.78, (v221 and tbl2.a1) or tbl2.dc, 0.55)
      v18({Parent = v219, Position = fn2(14, 14), Size = fn2(36, 36), BackgroundColor3 = (v221 and tbl2.a1) or tbl2.dc, fn12(11), fn10((v221 and "sparkles") or "discord", 22)})
      v220, arg1_94 = {Parent = v219, Position = fn2(60, 15)}, reg.getHumanoid
      v220.Size = arg1_94(1, -72, 0, 17)
      v220.Text = ((v221 and v221[1]) or v213.Community) or "Community"
      v220.FontFace = new5
      v220.TextSize = 14
      v220.TextTruncate = atEnd
      v20(v220)
      if v221 then
        v215, arg1_94 = {Parent = v219, Position = fn2(14, 58)}, reg.getHumanoid
        v215.Size = arg1_94(1, -28, 1, -70)
        v215.Text = v221[2]
        v215.TextSize = 11
        v215.TextTransparency = 0.22
        v215.TextWrapped = true
        tbl62 = reg.slot4
        v215.TextYAlignment = tbl62.TextYAlignment.Top
        v20(v215)
      else
        v214, v220 = {Parent = v219, Position = fn2(60, 33)}, reg.getHumanoid
        v214.Size = v220(1, -72, 0, 14)
        v214.Text = "Updates, keys, support"
        v214.TextSize = 11
        v214.TextTransparency = 0.22
        v20(v214)
        local tbl64, v222 = {Parent = v219, AnchorPoint = new3(0, 1)}, reg.getHumanoid
        tbl64.Position = v222(0, 14, 1, -12)
        v222 = reg.getHumanoid
        tbl64.Size = v222(1, -28, 0, 32)
        tbl64.BackgroundTransparency = 0
        tbl64.BackgroundColor3 = tbl2.dc
        tbl64.Text = "Copy invite"
        tbl64.FontFace = new5
        tbl64.TextSize = 12
        tbl64.TextColor3 = tbl2.wh
        vm:yT(tbl64, 0, fn12(10))
        v222 = v19(tbl64)
        fn27(v222)
        fn25(v222, function()
          fn52(v213.Discord, "Invite copied")
        end)
      end
      local teleportService = fn("TeleportService")
      arg1_94, v219 = v213.Actions
      if arg1_94 then
        v219 = arg1_94
      else
        v221, v220, tbl62, v215, v214 = {}, {"Rejoin", "refresh", function()
          fn50("Rejoin this server?", "You leave and join this same server again.", "warn", "Rejoin", function()
            local v223 = reg.localPlayer
            teleportService:TeleportToPlaceInstance(v223.PlaceId, reg.localPlayer.JobId, localPlayer)
          end)
        end}, {"Server hop", "server", function()
          fn50("Hop to another server?", "You leave this server and join a different one.", "warn", "Hop", function()
            if v213.Hop then
              v213.Hop()
            else
              local v224 = reg.localPlayer
              teleportService:Teleport(v224.PlaceId, localPlayer)
            end
          end)
        end}, {"Copy Job ID", "copy", function()
          local v225 = reg.localPlayer
          fn52(v225.JobId, "Job ID copied")
        end}, v213.Unload
        local v226, v227 = (v214 and {"Unload hub", "trash", v213.Unload}) or {"Save config", "save", fn51}, v213.Switch or (v213.Discord and {"Discord", "discord", function()
          fn52(v213.Discord, "Discord invite copied")
        end})
        vm:yT(v221, 0, v220, tbl62, v215, v226, v227 or {"Hide UI", "eye", function()
          tbl32:Show(false)
        end})
        v219 = v221
      end
      v220, tbl62, v221 = reg.slot6, {Parent = v216}, reg.getHumanoid
      tbl62.Position = v221(0, 6, 0.3, 6)
      arg1_94 = reg.getHumanoid
      tbl62.Size = arg1_94(1, -12, 0.16, -12)
      arg1_94 = reg.slot9
      vm:yT(tbl62, 0, arg1_94(12, nil, nil, horizontal))
      v221, v214 = v220(tbl62), ipairs
      for it1_4, it2_4 in v214(v219) do
        v220, v215, arg1_94, tbl62 = tbl4[((it1_4 - 1) % 5) + 1], reg.slot6, {Parent = v221, LayoutOrder = it1_4}, reg.getHumanoid
        arg1_94.Size = tbl62(1 / #v219, (12 / #v219) - 12, 1, 0)
        local tbl65, v228, v229, v230, tbl66, v231 = {Parent = v215(arg1_94), AnchorPoint = v6, Position = v5, Size = v4, BackgroundTransparency = 0.94}, fn12(14), fn13(0.88), reg.slot6, {}, reg.getHumanoid
        tbl66.Position = v231(0, 10, 0.5, -15)
        tbl66.Size = fn2(30, 30)
        tbl66.BackgroundTransparency = 0.82
        tbl66.BackgroundColor3 = v220
        vm:yT(tbl66, 0, fn12(9), fn10(it2_4[2], 16, v220))
        local v232, tbl67, v233 = v230(tbl66), {Position = fn2(48, 0)}, reg.getHumanoid
        tbl67.Size = v233(1, -54, 1, 0)
        tbl67.Text = it2_4[1]
        tbl67.TextSize = 12
        tbl67.TextWrapped = true
        vm:yT(tbl65, 0, v228, v229, v232, v20(tbl67))
        tbl67 = v19(tbl65)
        fn27(tbl67, 0.95)
        fn25(tbl67, function()
          fn22(it2_4[3])
        end)
      end
      local v234 = fn68(0, 0.46, 0.6666666666666666, 0.54)
      local v235 = fn69(v234, "Session", "clock", tbl2.gold)
      arg1_94 = fn68(0.6666666666666666, 0.46, 0.3333333333333333, 0.54)
      fn69(arg1_94, "What's new", "sparkles", tbl2.pink)
      v219, v214 = {Parent = arg1_94, Position = fn2(14, 40)}, reg.getHumanoid
      v219.Size = v214(1, -24, 1, -50)
      v214 = reg.slot9
      vm:yT(v219, 0, fn16(1, 4, 4, 1), v214(10))
      local v236, tbl68 = v22(v219), {}
      local function fn70(arg1_97)
        local max, tbl69 = math.max(os.time() - arg1_97, 0), {{86400, "day"}, {3600, "hour"}, {60, "minute"}}
        for index19, item23 in ipairs(tbl69) do
          arg1_97 = max // item23[1]
          if arg1_97 >= 1 then
            return ("%d %s%s ago"):format(arg1_97, item23[2], ((arg1_97 > 1) and "s") or "")
          end
        end
        return "just now"
      end
      tbl68.News = function(arg1_98, arg2_58)
        tbl68.list = arg2_58
        fn40(v236)
        arg1_98 = ipairs
        for it1_5, it2_5 in arg1_98(arg2_58) do
          local v237, tbl70, v238 = reg.slot6, {Position = fn2(44, 0)}, reg.getHumanoid
          tbl70.Size = v238(1, -44, 0, 0)
          tbl70.AutomaticSize = y
          v238 = reg.slot9
          vm:yT(tbl70, 0, v238(2), v20({Size = v8, AutomaticSize = y, Text = it2_5[2], TextSize = 12, TextWrapped = true}))
          v238 = v237(tbl70)
          if it2_5[3] or it2_5[4] then
            local v239, tbl71, v240 = reg.slot6, {Parent = v238, LayoutOrder = 1}, reg.getHumanoid
            tbl71.Size = v240(1, 0, 0, 14)
            tbl70 = reg.slot9
            vm:yT(tbl71, 0, tbl70(5, nil, center3, horizontal))
            v240 = v239(tbl71)
            if it2_5[3] then
              v237, tbl71 = {Parent = v240}, reg.getHumanoid
              v237.Size = tbl71(0, 0, 1, 0)
              v237.AutomaticSize = x
              v237.Text = it2_5[3]
              v237.FontFace = new7
              v237.TextSize = 10
              v237.TextTransparency = 0.4
              v20(v237)
            end
            if it2_5[4] then
              local v241, tbl72, v242 = reg.slot6, {Parent = v240, LayoutOrder = 1}, reg.getHumanoid
              tbl72.Size = v242(0, 0, 1, 0)
              tbl72.AutomaticSize = x
              tbl72.BackgroundTransparency = 0.9
              v239 = reg.slot9
              vm:yT(tbl72, 0, fn12(), fn16(0, 6), v239(3, nil, center3, horizontal))
              v242 = v241(tbl72)
              fn9({Parent = v242, Size = fn2(10, 10), Image = "clock", ImageTransparency = 0.3})
              tbl72, tbl71 = {Parent = v242, LayoutOrder = 1}, reg.getHumanoid
              tbl72.Size = tbl71(0, 0, 1, 0)
              tbl72.AutomaticSize = x
              tbl72.Text = fn70(it2_5[4])
              tbl72.FontFace = new7
              tbl72.TextSize = 10
              tbl72.TextTransparency = 0.3
              v20(tbl72)
            end
          end
          tbl70 = reg.slot6
          tbl70({Parent = v236, LayoutOrder = it1_5, Size = v8, AutomaticSize = y, v238, v20({Size = fn2(0, 18), AutomaticSize = x, Text = it2_5[1], FontFace = new7, TextSize = 9, TextColor3 = fromRGB(16, 20, 42), BackgroundTransparency = 0, BackgroundColor3 = ({NEW = tbl2.mint, FIX = tbl2.sky, IMP = tbl2.gold, UPD = tbl2.red})[it2_5[1]] or tbl2.vio, TextXAlignment = center, fn12(5), fn16(0, 6)})})
        end
      end
      tbl68.Stats = function(arg1_99, arg2_59, arg3_32)
        v235.Text = arg2_59:upper()
        local v243, tbl73, v244 = reg.slot6, {Parent = v234, Position = fn2(12, 38)}, reg.getHumanoid
        tbl73.Size = v244(1, -24, 1, -48)
        arg1_99, v244, arg2_59 = reg.slot3, {}, reg.getHumanoid
        v244.CellSize = arg2_59(0.3333333333333333, -7, 0.333, -6)
        v244.CellPadding = fn2(10, 8)
        arg2_59 = reg.slot4
        v244.SortOrder = arg2_59.SortOrder.LayoutOrder
        vm:yT(tbl73, 0, arg1_99("UIGridLayout", v244))
        arg1_99, arg2_59, v244 = v243(tbl73), {}, ipairs
        for it1_6, it2_6 in v244(arg3_32) do
          tbl73 = reg.slot6
          v243 = tbl73({Parent = arg1_99, LayoutOrder = it1_6, BackgroundTransparency = 0.94, fn12(12)})
          if it2_6[2] then
            local tbl74, v245 = {Parent = v243, AnchorPoint = new3(0, 0.5)}, reg.getHumanoid
            tbl74.Position = v245(0, 8, 0.5, 0)
            tbl74.Size = fn2(30, 30)
            tbl74.Image = it2_6[2]
            v245 = reg.slot4
            tbl74.ScaleType = v245.ScaleType.Fit
            tbl74.ImageColor3 = (tbl6[it2_6[2]] and tbl2.a1) or nil
            fn9(tbl74)
          end
          local v246, tbl75, v247 = (it2_6[2] and 44) or 10, {Parent = v243}, reg.getHumanoid
          tbl75.Position = v247(0, v246, 0.5, -17)
          v247 = reg.getHumanoid
          tbl75.Size = v247(1, -v246 - 6, 0, 13)
          tbl75.Text = it2_6[1]:upper()
          tbl75.FontFace = new6
          tbl75.TextSize = 9.5
          tbl75.TextTransparency = 0.38
          v20(tbl75)
          v247, it1_6, tbl75 = it2_6[1], {Parent = v243}, reg.getHumanoid
          it1_6.Position = tbl75(0, v246, 0.5, -2)
          tbl75 = reg.getHumanoid
          it1_6.Size = tbl75(1, -v246 - 6, 0, 18)
          it1_6.Text = "--"
          it1_6.FontFace = new7
          it1_6.TextSize = 13.5
          it1_6.TextTruncate = atEnd
          arg2_59[v247] = v20(it1_6)
          if it2_6[3] then
            v247, it1_6 = {Parent = v243, AnchorPoint = new3(1, 0)}, reg.getHumanoid
            v247.Position = it1_6(1, -8, 0, 8)
            v247.Size = fn2(40, 16)
            v247.Text = "OPEN"
            v247.FontFace = new6
            v247.TextSize = 9
            v247.TextColor3 = tbl2.wh
            v247.BackgroundTransparency = 0.82
            v247.BackgroundColor3 = tbl2.wh
            vm:yT(v247, 0, fn12(), fn13(0.7))
            tbl75 = v19(v247)
            fn27(tbl75, 0.92)
            fn25(tbl75, function()
              fn22(it2_6[3])
            end)
          end
        end
        return fn41(arg2_59)
      end
      if v213.News then
        tbl68:News(v213.News)
      end
      return tbl68
    end
    local function fn71(arg1_100, arg2_60, arg3_33)
      return ((type(arg1_100) == "table") and arg1_100) or tbl32:Tab(arg1_100 or arg2_60, arg3_33)
    end
    tbl32.Settings = function(arg1_101, arg2_61)
      arg1_101 = fn71(arg2_61, "Settings", "settings")
      arg2_61 = arg1_101:Section("Interface", "sliders")
      arg2_61:Slider("UI scale", 60, 140, 100, function(arg1_102)
        tbl32:SetScale(arg1_102 / 100)
      end, "%", 5)
      local function fn72(arg1_103)
        tbl32.Key = arg1_103
      end
      arg2_61:Key("Show / hide UI", tbl32.Key, nil, fn72)
      arg2_61:Slider("Opacity", 50, 100, 95, function(arg1_104)
        tbl32.bg.BackgroundTransparency = 1 - (arg1_104 / 100)
      end, "%")
      arg2_61:Slider("Tone", -100, 100, 70, function(arg1_105)
        tbl32:Tone(arg1_105)
      end, "", 5)
      arg2_61:Slider("Dim the game", 0, 80, 60, function(arg1_106)
        tbl32.dz = arg1_106 / 100
        if tbl32.open then
          tbl32.dim.BackgroundTransparency = 1 - tbl32.dz
        end
      end, "%", 5)
      arg2_61, fn72 = arg1_101:Section("Theme", "palette"), reg.slot6
      local tbl76, v248, v249, tbl77, v250 = {Parent = arg2_61.f, LayoutOrder = 2, Name = "VenyxThemes", Size = v8, AutomaticSize = y}, fn16(2, 14, 14), reg.slot3, {}, reg.getHumanoid
      tbl77.CellSize = v250(0.25, -8, 0, 62)
      tbl77.CellPadding = fn2(10, 10)
      v250 = reg.slot4
      tbl77.SortOrder = v250.SortOrder.LayoutOrder
      vm:yT(tbl76, 0, v248, v249("UIGridLayout", tbl77))
      v250 = fn72(tbl76)
      arg2_61.n = arg2_61.n + 1
      arg2_61, v248 = {}, ipairs
      for it1_7, it2_7 in v248(tbl3) do
        local v251, tbl78, v252, v253, tbl79, v254 = fn13(0.86), {Parent = v250, LayoutOrder = it1_7, BackgroundTransparency = 0.95}, fn12(12), reg.slot6, {Position = fn2(6, 6)}, reg.getHumanoid
        tbl79.Size = v254(1, -12, 0, 30)
        tbl79.BackgroundTransparency = 0
        fn72, tbl76, tbl77, v249, v254 = fn12(8), fn14(it2_7[2], it2_7[4], 20), reg.slot6, {AnchorPoint = new3(0, 1)}, reg.getHumanoid
        v249.Position = v254(0, 6, 1, -5)
        it1_7 = reg.getHumanoid
        v249.Size = it1_7(0.45, 0, 0, 6)
        v249.BackgroundTransparency = 0
        v249.BackgroundColor3 = it2_7[5]
        vm:yT(v249, 0, fn12())
        vm:yT(tbl79, 0, fn72, tbl76, tbl77(v249))
        local v255, tbl80, v256 = v253(tbl79), {Position = fn2(8, 40)}, reg.getHumanoid
        tbl80.Size = v256(1, -26, 0, 16)
        tbl80.Text = it2_7[1]
        tbl80.FontFace = new5
        tbl80.TextSize = 11
        tbl80.TextTruncate = atEnd
        vm:yT(tbl78, 0, v252, v251, v255, v20(tbl80))
        tbl80, it1_7, tbl79 = v19(tbl78), it2_7[1], {}
        v254, v255 = {Parent = tbl80, AnchorPoint = v7}, reg.getHumanoid
        v254.Position = v255(1, -8, 0, 48)
        v254.Size = fn2(12, 12)
        v254.Image = "check"
        v254.ImageColor3 = it2_7[5]
        v254.ImageTransparency = 1
        vm:yT(tbl79, 0, v251, fn9(v254))
        arg2_61[it1_7] = tbl79
        fn27(tbl80, 0.95)
        fn25(tbl80, function()
          local v257 = reg.slot2
          v257:Theme(it2_7[1])
        end)
      end
      tbl32.marks = arg2_61
      v249 = arg1_101:Section("Defaults", "refresh")
      v249:Button("Reset to defaults", "Reset", function()
        fn50("Reset every option?", "All options go back to their built-in values and your active config is saved that way.", "warn", "Reset", function()
          local v258 = reg.slot2
          v258:Reset()
          v258 = reg.slot2
          v258:Notify("Reset", "Every option is back to its default", "ok")
        end)
      end, "danger")
      v249:Button("Turn off all toggles", "Turn off", function()
        local v259, v260 = reg.slot2, reg.slot2
        v259:Notify("Toggles off", v260:Off() .. " switched off", "ok")
      end)
      return arg1_101
    end
    tbl32.Config = function(arg1_107, arg2_62)
      arg1_107 = fn71(arg2_62, "Config", "save")
      arg2_62 = arg1_107:Section("Config", "folder")
      local stats = arg2_62:Stats({"Active", "Saved configs"})
      local v261
      local function fn73()
        local v262 = reg.slot11
        stats:Set("Active", v262.Active)
        stats:Set("Saved configs", tostring(#reg.slot2:Configs()))
        if v261 then
          v261:Set(reg.slot11.Active, true)
        end
      end
      local function fn74(arg1_108, arg2_63, arg3_34, arg4_17)
        local dropdown = arg1_108:Dropdown(arg2_63, function()
          local v263 = reg.slot2
          return v263:Configs()
        end, nil, function(arg1_109)
          if arg1_109 then
            if arg3_34 then
              arg3_34(arg1_109)
            end
          end
        end, arg4_17)
        dropdown.Skip = true
        return dropdown
      end
      v261 = fn74(arg2_62, "Config", function(arg1_110)
        local v264 = reg.slot11
        if arg1_110 ~= v264.Active then
          local v265 = reg.slot2
          v265:Notify("Config picked", arg1_110 .. " - press Set active to load it", "info")
        end
      end)
      arg2_62:Button("Set as active config", "Set active", function()
        local value = v261.Value
        if not (value) then
          local v266 = reg.slot2
          return v266:Notify("Nothing picked", "Choose a config first", "warn")
        end
        local v267 = reg.slot2
        if v267:Load(value) then
          fn73()
          local v268 = reg.slot2
          v268:Notify("Active config", value, "ok")
        end
      end, "gold")
      arg2_62:Button("Save changes", "Save", fn51)
      local v269 = reg.slot11
      arg2_62:Toggle("Auto load", v269.AutoLoad, function(arg1_111)
        local v270 = reg.slot11
        if v270.AutoLoad ~= arg1_111 then
          local v271, v272, v273 = reg.slot2, "Auto load " .. ((arg1_111 and "on") or "off")
          if arg1_111 then
            local v274 = reg.slot11
            v273 = v274.Active .. " loads every time Venyx starts"
          else
            v273 = arg1_111
          end
          v271:Notify(v272, v273 or "Venyx starts with its default options", "info")
        end
        v270 = reg.slot11
        v270.AutoLoad = arg1_111
        v270 = reg.slot2
        v270:Persist()
      end).Skip = true
      v269 = reg.slot11
      arg2_62:Toggle("Auto save", v269.AutoSave, function(arg1_112)
        local v275 = reg.slot11
        if v275.AutoSave == arg1_112 then
          return
        end
        v275 = reg.slot11
        v275.AutoSave = arg1_112
        v275 = reg.slot2
        v275:Persist()
        if arg1_112 then
          v275 = reg.slot2
          v275:Save()
        end
        local v276, v277, v278 = reg.slot2, "Auto save " .. ((arg1_112 and "on") or "off")
        if arg1_112 then
          v275 = reg.slot11
          v278 = "Every change is saved to " .. v275.Active
        else
          v278 = arg1_112
        end
        v276:Notify(v277, v278 or "Press Save changes to keep your options", "info")
      end).Skip = true
      v269 = arg1_107:Section("Profiles", "copy")
      local input = v269:Input("New config name", "Auto if empty")
      input.Skip = true
      v269:Button("Create config", "Create", function()
        local v279 = reg.slot2
        local name, v280 = v279:Name(input.Value)
        if not (name) then
          v279 = reg.slot2
          return v279:Notify("Config not created", v280, "err")
        end
        v280 = reg.slot2
        v280:Save(name)
        v280 = reg.slot11
        v280.Active = name
        v280 = reg.slot2
        v280:Persist()
        input:Set("", true)
        fn73()
        v279 = reg.slot2
        v279:Notify("Config created", name .. " is now the active config", "ok")
      end, "gold")
      local v281 = fn74(v269, "Pick to delete", nil, true)
      v269:Button("Delete picked", "Delete", function()
        local tbl81, flag3 = {}, false
        for index20, item24 in ipairs(v281.Value) do
          if item24:lower() == "default" then
            flag3 = true
          else
            tbl81[#tbl81 + 1] = item24
          end
        end
        if #tbl81 == 0 then
          local v282 = reg.slot2
          return v282:Notify("Nothing to delete", "Pick configs other than Default", "warn")
        end
        fn50("Delete " .. (#tbl81 .. " config(s)?"), table.concat(tbl81, ", ") .. ((flag3 and "\nDefault is kept.") or ""), "err", "Delete", function()
          local v283 = ipairs
          for it1_8, it2_8 in v283(tbl81) do
            it1_8 = reg.slot2
            it1_8:Delete(it2_8)
          end
          v281:Set({}, true)
          fn73()
          v283 = reg.slot2
          v283:Notify(#tbl81 .. " config(s) deleted", table.concat(tbl81, ", "), "ok")
        end)
      end, "danger")
      local v284
      v284 = v269:Dropdown("Restore deleted", function()
        local v285 = reg.slot2
        return v285:Trash()
      end, nil, function(arg1_113)
        if not (arg1_113) then
          return
        end
        local v286 = reg.slot2
        local restore = v286:Restore(arg1_113)
        v284:Set(nil, true)
        fn73()
        v286 = reg.slot2
        v286:Notify((restore and "Config restored") or "Restore failed", restore or arg1_113, (restore and "ok") or "err")
      end)
      v284.Skip = true
      fn74(v269, "Export config", function(arg1_114)
        local v287, result, v288 = reg.slot2, pcall(setclipboard, reg.slot2:Export(arg1_114)), reg.slot2
        v288:Notify((result and "Config copied") or "Copy failed", (result and (arg1_114 .. " is on your clipboard")) or "This executor cannot copy text", (result and "ok") or "err")
        tbl32:Dialog({Title = (result and "Config copied") or "Copy failed", Kind = (result and "ok") or "err", Text = (result and (arg1_114 .. " is on your clipboard. Paste it to share it, then load it with Import config.")) or "This executor cannot copy text."})
      end)
      local input2 = v269:Input("Import text", "Paste config text")
      input2.Skip = true
      v269:Button("Import config", "Import", function()
        local v289 = reg.slot2
        local import, v290 = v289:Import(input2.Value)
        if not import then
          v289 = reg.slot2
          return v289:Notify("Import failed", v290, "err")
        end
        input2:Set("", true)
        fn50("Config imported", import .. " was added to your configs. Apply it now?", "ok", "Apply now", function()
          local v291 = reg.slot2
          v291:Load(import)
          fn73()
          v291 = reg.slot2
          v291:Notify("Config loaded", import, "ok")
        end, "Later")
        v290 = reg.slot2
        v290:Notify("Config imported", import .. " was added to your configs", "ok")
      end, "gold")
      fn73()
      return arg1_107
    end
    tbl32.Quick = function(arg1_115, arg2_64, arg3_35)
      local tbl82, v292, v293, v294, v295, v296, v297, v298 = {pins = {}, keys = {}, at = {}, fold = {}}, {show = false, keys = true, size = 1}, {Value = ""}, {}, {}, {}
      local num7, v299 = 0
      local function fn75(arg1_116)
        local tr = v299.tr
        v299.o:Set(v299.o.From(math.clamp((arg1_116.Position.X - tr.AbsolutePosition.X) / tr.AbsoluteSize.X, 0, 1)), false, true)
      end
      local function fn76(arg1_117)
        local v300 = reg.slot2
        return v300.Keys[arg1_117].Name
      end
      local function fn77(arg1_118)
        local tbl83, v301, str3 = {}, -#fn76(arg1_118) - 2, ""
        for it1_9 in arg1_118:sub(1, v301):gmatch("[^/]+") do
          it1_9 = it1_9:match("^%s*(.-)%s*$")
          if it1_9:lower() ~= str3 then
            str3, tbl83[#tbl83 + 1] = it1_9:lower(), it1_9
          else
          end
        end
        return table.concat(tbl83, "  /  ")
      end
      local function fn78(arg1_119)
        local v302 = tbl82.keys[arg1_119]
        return v302 and (tbl5[v302] or v302)
      end
      local function fn79(arg1_120, arg2_65, arg3_36)
        local v303
        if arg2_65 then
          local v304 = reg.slot3
          v303 = v304("UIScale", {Parent = arg1_120})
        else
          v303 = arg2_65
        end
        local backgroundTransparency = arg1_120.BackgroundTransparency
        local function fn80(arg1_121)
          if fn23(arg1_121) then
            fn18(v303 or arg1_120, (v303 and {Scale = arg2_65}) or {BackgroundTransparency = backgroundTransparency - 0.06}, 0.12)
          end
        end
        arg1_120.InputBegan:Connect(fn80)
        local function fn81(arg1_122)
          if fn23(arg1_122) then
            fn18(v303 or arg1_120, (v303 and {Scale = 1}) or {BackgroundTransparency = backgroundTransparency}, 0.35)
          end
        end
        arg1_120.InputEnded:Connect(fn81)
        local function fn82()
          if fn24() then
            arg3_36()
          end
        end
        arg1_120.Activated:Connect(fn82)
      end
      local function fn83(arg1_123, arg2_66, arg3_37)
        local list = arg1_123:GetDescendants()
        list[#list + 1] = arg1_123
        local v305 = ipairs
        for it1_10, it2_9 in v305(list) do
          it1_10 = {}
          if it2_9:IsA("GuiObject") then
            it1_10.BackgroundTransparency = it2_9.BackgroundTransparency
          end
          if it2_9:IsA("TextLabel") then
            it1_10.TextTransparency = it2_9.TextTransparency
          elseif it2_9:IsA("TextButton") then
            it1_10.TextTransparency = it2_9.TextTransparency
          elseif it2_9:IsA("TextBox") then
            it1_10.TextTransparency = it2_9.TextTransparency
          end
          if it2_9:IsA("ImageLabel") then
            it1_10.ImageTransparency = it2_9.ImageTransparency
          end
          if it2_9:IsA("UIStroke") then
            it1_10.Transparency = it2_9.Transparency
          end
          local tbl84 = {}
          for key7 in next, it1_10, nil do
            tbl84[key7] = 1
          end
          if arg2_66 then
            for key8 in next, it1_10, nil do
              it2_9[key8] = 1
            end
            fn18(it2_9, it1_10, 0.3, nil, nil, arg3_37)
          else
            local v306 = reg.slot4
            fn18(it2_9, tbl84, 0.26, quint, v306.EasingDirection.In, arg3_37)
          end
        end
        if not (arg2_66) then
          arg1_123.Active = false
          fn18(arg1_123, {Position = arg1_123.Position + fn2(0, 26)}, 0.3, quint, reg.slot4.EasingDirection.In, arg3_37)
          task.delay(0.32 + arg3_37, arg1_123.Destroy, arg1_123)
        end
      end
      local function fn84()
        for index21, item25 in ipairs(tbl32.All) do
          local sub = item25.k:sub(1, -#item25.title - 2)
          v296[sub], v296[item25.k] = v296[sub] or index21, v296[item25.k] or index21
        end
        local tbl85, v307 = {}, reg.slot2
        for key9, item26 in next, v307.Keys, nil do
          if item26.Kind then
            tbl85[#tbl85 + 1] = key9
          end
        end
        table.sort(tbl85, function(arg1_124, arg2_67)
          local v308, v309 = ((v296[arg1_124:sub(1, -#fn76(arg1_124) - 2)] or 1000000000) * 10000) + (v296[arg1_124] or 0), ((v296[arg2_67:sub(1, -#fn76(arg2_67) - 2)] or 1000000000) * 10000) + (v296[arg2_67] or 0)
          if v308 == v309 then
            return arg1_124 < arg2_67
          end
          return v308 < v309
        end)
        return tbl85
      end
      local function fn85()
        local v310 = reg.slot10
        v293:Set(v310:JSONEncode(tbl82), true)
      end
      local function fn86()
        tbl82 = {pins = {}, keys = {}, at = {}, fold = {}}
        local v311, v312 = ipairs, vm[53](fn84())
        for it1_11, it2_10 in v311(vm:uT(v312)) do
          local v313, v314 = ipairs, arg3_35 or {}
          for it1_12, it2_11 in v313(v314) do
            if it2_10:sub(-#it2_11) == it2_11 then
              tbl82.pins[it2_10] = 1
            end
          end
        end
      end
      local function fn87()
        for index22, item27 in ipairs(v295) do
          index22 = table.find(item27[1].ls, item27[2])
          if index22 then
            table.remove(item27[1].ls, index22)
          end
        end
        table.clear(v295)
        for index23, item28 in ipairs(v294) do
          fn83(item28.f, false, (index23 - 1) * 0.05)
        end
        table.clear(v294)
        if v298 then
          v298()
        end
        if not (v292.show) then
          return
        end
        local viewportSize4, v315, num8 = workspace.CurrentCamera.ViewportSize, fn84(), 220
        local v316, num9 = math.clamp(viewportSize4.Y / 720, 0.75, 1.2) * v292.size, 0
        for i4 = 1, 5, 1 do
          local tbl86, str4 = {}, tostring(i4)
          for index24, item29 in ipairs(v315) do
            if tbl82.pins[item29] == i4 then
              tbl86[#tbl86 + 1] = item29
            end
          end
          if #tbl86 > 0 then
            num9 += 1
            local v317 = reg.slot3
            local v318, v319 = v317("UIScale", {Scale = v316}), reg.slot9
            local v320, v321 = v319(5), reg.slot6
            local v322, tbl87, v323 = v321({LayoutOrder = 1, Size = v8, AutomaticSize = y, ClipsDescendants = true, fn16(0, 7, 7), v320}), {AnchorPoint = v6}, reg.getHumanoid
            tbl87.Position = v323(1, -17, 0.5, 0)
            tbl87.Size = fn2(12, 12)
            tbl87.Image = "down"
            tbl87.ImageTransparency = 0.4
            tbl87.Rotation = (tbl82.fold[str4] and -90) or 0
            local v324, tbl88, v325 = fn9(tbl87), {}, reg.getHumanoid
            tbl88.Size = v325(1, 0, 0, 34)
            v325, v317, v323 = fn9({Position = fn2(12, 10), Size = fn2(14, 14), Image = "zap", ImageColor3 = tbl4[i4]}), {Position = fn2(33, 0)}, reg.getHumanoid
            v317.Size = v323(1, -90, 1, 0)
            v317.Text = "QUICK BAR " .. i4
            v317.FontFace = new6
            v317.TextSize = 11
            v323, tbl87, v321 = v20(v317), {AnchorPoint = v7}, reg.getHumanoid
            tbl87.Position = v321(1, -32, 0.5, 0)
            tbl87.Size = fn2(0, 16)
            tbl87.AutomaticSize = x
            tbl87.Text = #tbl86
            tbl87.FontFace = new5
            tbl87.TextSize = 9.5
            tbl87.TextXAlignment = center
            tbl87.BackgroundTransparency = 0.88
            vm:yT(tbl87, 0, fn12(), fn16(0, 6))
            vm:yT(tbl88, 0, v324, v325, v323, v20(tbl87))
            v317, v323, v321, v319 = v19(tbl88), reg.slot6, {Parent = tbl32.Gui, AnchorPoint = new3(0.5, 0), Size = fn2(num8, 0), AutomaticSize = y, BackgroundTransparency = 0.06, Active = true, ZIndex = 2}, reg.slot9
            vm:yT(v321, 0, fn12(16), fn14(tbl2.w1, tbl2.w2, 90), fn13(0.74), v318, v319(), v317, v322)
            local v326 = v323(v321)
            local tbl89, v327 = {f = v326, u = v318, id = str4}, num9
            tbl89.place = function(arg1_125, arg2_68)
              local v328 = tbl82.at[str4]
              v328 = (v328 and new3(v328[1], v328[2])) or new3(((arg1_125.X - 18) - ((num8 * arg2_68) / 2)) - ((v327 - 1) * ((num8 * arg2_68) + 12)), math.max(arg1_125.Y * 0.023, 8))
              tbl89.sp.t = new3(math.clamp(v328.X, 40, arg1_125.X - 40), math.clamp(v328.Y, 0, arg1_125.Y - 40))
              v318.Scale = arg2_68
            end
            tbl89.sp = fn28(new3(), function(arg1_126)
              local v329 = reg.getHumanoid
              v326.Position = v329(0, arg1_126.X, 0, arg1_126.Y)
            end)
            tbl89.place(viewportSize4, v316)
            tbl89.sp.p = tbl89.sp.t + new3(0, 14)
            v294[#v294 + 1] = tbl89
            if tbl82.fold[str4] then
              v325 = reg.slot4
              v322.AutomaticSize = v325.AutomaticSize.None
              v322.Size = v8
            end
            v317.InputBegan:Connect(function(arg1_127)
              if fn23(arg1_127) then
                v297 = v297 or {b = tbl89, i = arg1_127, s = new3(arg1_127.Position.X, arg1_127.Position.Y), p = tbl89.sp.t}
              end
            end)
            fn79(v317, nil, function()
              local fold, v330 = tbl82.fold, tbl82.fold[str4]
              fold[str4] = if v330 then nil else not v330
              local v331, v332, v333, v334 = tbl82.fold[str4], (v320.AbsoluteContentSize.Y / math.max(v326.AbsoluteSize.X / num8, 0.01)) + 7, reg.slot4
              v334, v322.AutomaticSize, v322.Size = reg.getHumanoid, v333.AutomaticSize.None, reg.getHumanoid(1, 0, 0, (v331 and v332) or 0)
              fn18(v324, {Rotation = (v331 and -90) or 0}, 0.3)
              v333, v330 = {}, reg.getHumanoid
              v333.Size = v330(1, 0, 0, (v331 and 0) or v332)
              fn18(v322, v333, 0.32).Completed:Connect(function()
                if not (tbl82.fold[str4]) then
                  v322.AutomaticSize = y
                end
              end)
              fn85()
            end)
            v319 = ipairs
            for it1_13, it2_12 in v319(tbl86) do
              v325 = reg.slot2
              local v335 = v325.Keys[it2_12]
              tbl88 = fn78(it2_12)
              local v336
              tbl87, v317, v323 = v335.Kind, {Parent = v322, LayoutOrder = it1_13}, reg.getHumanoid
              v317.Size = v323(1, 0, 0, ((tbl87 == "slider") and 46) or 34)
              v317.BackgroundTransparency = 0.93
              vm:yT(v317, 0, fn12(11))
              v321, it1_13 = v19(v317), reg.slot6
              local v337, v338, tbl90, v339 = it1_13({Parent = v321, Size = v4, fn12(11), fn14(tbl2.a1, tbl2.a2)}), reg.slot6, {Parent = v321}, reg.slot7
              tbl90.AnchorPoint = v339
              v339 = reg.getHumanoid
              tbl90.Position = v339(1, -9, 0, 6)
              tbl90.Size = fn2(160, 22)
              tbl90.ZIndex = 2
              v339, it1_13 = reg.slot9, reg.slot4
              vm:yT(tbl90, 0, v339(6, it1_13.HorizontalAlignment.Right, center3, horizontal))
              local v340, tbl91, v341 = v338(tbl90), {Parent = v321, Position = fn2(11, 6)}, reg.getHumanoid
              tbl91.Size = v341(1, -((((tbl87 == "button") and 96) or ((tbl87 == "input") and 132)) or 60) - ((tbl88 and 44) or 0), 0, 22)
              tbl91.Text = fn76(it2_12)
              tbl91.FontFace = new5
              tbl91.TextSize = 12.5
              tbl91.TextTruncate = atEnd
              tbl91.ZIndex = 2
              v20(tbl91)
              if tbl88 then
                v20({Parent = v340, Size = fn2(0, 18), AutomaticSize = x, Text = tbl88, FontFace = new7, TextSize = 10, TextXAlignment = center, BackgroundTransparency = 0.86, fn12(6), fn16(0, 6)})
              end
              if tbl87 == "toggle" then
                tbl91 = reg.slot6
                local v342 = fn35(tbl91({Parent = v340, LayoutOrder = 1, Size = fn2(38, 20)}), 38, 20)
                v336 = function(arg1_128, arg2_69)
                  v342(arg1_128, arg2_69)
                  fn18(v337, {BackgroundTransparency = (arg1_128 and 0.78) or 1}, (arg2_69 and 0) or 0.25)
                end
                fn79(v321, nil, function()
                  local v343 = reg.slot2
                  v343.qb = true
                  v335:Set(not v335.Value)
                  v343 = reg.slot2
                  v343.qb = nil
                end)
              else
                if tbl87 == "button" then
                  local v344 = v20({Parent = v340, LayoutOrder = 1, Size = fn2(0, 22), AutomaticSize = x, Text = v335.Text, FontFace = new5, TextSize = 11, TextColor3 = v335.Col:Lerp(tbl2.wh, 0.55), BackgroundTransparency = 0.85, BackgroundColor3 = v335.Col, fn12(8), fn16(0, 10), fn13(0.5, v335.Col)})
                  fn79(v321, nil, function()
                    v335.Fire()
                    v344.BackgroundTransparency = 0.5
                    fn18(v344, {BackgroundTransparency = 0.85}, 0.5)
                  end)
                else
                  if tbl87 == "input" then
                    local v345 = v21({Parent = v340, LayoutOrder = 1, Size = fn2(116, 24), BackgroundTransparency = 0.7, BackgroundColor3 = fromRGB(0, 0, 0), PlaceholderText = "Type here", TextSize = 11.5, TextTruncate = atEnd, ClipsDescendants = true, fn12(7), fn16(0, 7), fn13(0.8)})
                    local function fn88()
                      v335:Set(v345.Text)
                    end
                    v345.FocusLost:Connect(fn88)
                    v336 = function(arg1_129)
                      if not (v345:IsFocused()) then
                        v345.Text = tostring(arg1_129 or "")
                      end
                    end
                  else
                    local v346, v347, tbl92, v348 = v20({Parent = v340, LayoutOrder = 1, Size = fn2(0, 22), AutomaticSize = x, FontFace = new7, TextSize = 11, TextColor3 = tbl2.val}), reg.slot6, {Parent = v321}, reg.getHumanoid
                    tbl92.Position = v348(0, 11, 1, -13)
                    v339 = reg.getHumanoid
                    tbl92.Size = v339(1, -22, 0, 5)
                    tbl92.BackgroundTransparency = 0.86
                    tbl92.ZIndex = 2
                    vm:yT(tbl92, 0, fn12())
                    local v349 = v347(tbl92)
                    v338, v348 = {Parent = v349}, reg.getHumanoid
                    v338.Size = v348(0, 0, 1, 0)
                    vm:yT(v338, 0, fn12(), fn14(tbl2.a1, tbl2.a2))
                    local v350, tbl93, v351 = v18(v338), {Parent = v349, AnchorPoint = v6}, reg.getHumanoid
                    tbl93.Position = v351(0, 0, 0.5, 0)
                    tbl93.Size = fn2(13, 13)
                    tbl93.ZIndex = 3
                    vm:yT(tbl93, 0, fn12(), fn13(0.65, fromRGB(0, 0, 0)))
                    local v352 = v18(tbl93)
                    v336 = function(arg1_130, arg2_70)
                      local clamp, tbl94, v353 = math.clamp(v335.Frac(arg1_130), 0, 1), {}, reg.getHumanoid
                      tbl94.Size = v353(clamp, 0, 1, 0)
                      fn18(v350, tbl94, (arg2_70 and 0) or 0.1)
                      v353, tbl94 = {}, reg.getHumanoid
                      v353.Position = tbl94(clamp, 0, 0.5, 0)
                      fn18(v352, v353, (arg2_70 and 0) or 0.1)
                      v346.Text = v335.Txt(arg1_130)
                    end
                    v321.InputBegan:Connect(function(arg1_131)
                      if fn23(arg1_131) then
                        v299 = {o = v335, tr = v349, i = arg1_131}
                        tbl19.s = true
                        fn75(arg1_131)
                      end
                    end)
                  end
                end
              end
              if v336 then
                v336(v335.Value, true)
                v335.ls[#v335.ls + 1] = v336
                v295[#v295 + 1] = {v335, v336}
              end
            end
            tbl89.sp.a(tbl89.sp.p)
            fn83(v326, true, (num9 - 1) * 0.06)
          else
          end
        end
      end
      local function fn89()
        num7 += 1
        local v354 = num7
        task.delay(0.15, function()
          if v354 == num7 then
            fn87()
          end
        end)
      end
      arg1_115 = reg.slot19
      fn4(arg1_115.Heartbeat, function(arg1_132)
        for index25, item30 in ipairs(v294) do
          fn29(item30.sp, arg1_132)
        end
      end)
      fn4(workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"), function()
        local viewportSize5 = workspace.CurrentCamera.ViewportSize
        if viewportSize5.X < 300 then
          return
        elseif viewportSize5.Y < 200 then
          return
        end
        for index26, item31 in ipairs(v294) do
          item31.place(viewportSize5, math.clamp(viewportSize5.Y / 720, 0.75, 1.2) * v292.size)
        end
      end)
      fn4(userInputService.InputChanged, function(arg1_133)
        if v299 then
          if arg1_133 == v299.i then
            fn75(arg1_133)
          else
            local v355 = reg.slot4
            if v299.i.UserInputType == v355.UserInputType.MouseButton1 then
              local v356 = reg.slot4
              if arg1_133.UserInputType == v356.UserInputType.MouseMovement then
                fn75(arg1_133)
              end
            end
          end
        end
        if v297 then
          if arg1_133 ~= v297.i then
            local v357 = reg.slot4
            if arg1_133.UserInputType ~= v357.UserInputType.MouseMovement then
              return
            end
          end
        else
          return
        end
        local v358, v359 = new3(arg1_133.Position.X, arg1_133.Position.Y) - v297.s, v297
        v359.mv = v359.mv or (v358.Magnitude > 6)
        if v297.mv then
          arg1_133, v359 = workspace.CurrentCamera.ViewportSize, v297.p + v358
          v297.b.sp.t = new3(math.clamp(v359.X, 40, arg1_133.X - 40), math.clamp(v359.Y, 0, arg1_133.Y - 40))
        end
      end)
      fn4(userInputService.InputEnded, function(arg1_134)
        if v299 then
          if arg1_134 == v299.i then
            v299 = nil
          else
            local v360 = reg.slot4
            if arg1_134.UserInputType == v360.UserInputType.MouseButton1 then
              v299 = nil
            end
          end
        end
        if v297 then
          if arg1_134 ~= v297.i then
            local v361 = reg.slot4
            if arg1_134.UserInputType ~= v361.UserInputType.MouseButton1 then
              return
            end
          end
        else
          return
        end
        arg1_134 = v297
        v297 = nil
        if arg1_134.mv then
          tbl82.at[arg1_134.b.id] = {arg1_134.b.sp.t.X, arg1_134.b.sp.t.Y}
          fn85()
        end
      end)
      local function fn90(arg1_135, arg2_71)
        if arg2_71 then
          if tbl32.Key then
            if arg2_71 == tbl32.Key.Name then
              local v362, str5 = reg.slot2, (tbl5[arg2_71] or arg2_71) .. " already shows and hides the menu"
              return v362:Notify("Key not set", str5, "warn")
            end
          end
        end
        local v363, keys = next, tbl82.keys
        for key10, item32 in v363, keys, nil do
          if arg2_71 then
            if item32 == arg2_71 then
              if key10 ~= arg1_135 then
                tbl82.keys[key10] = nil
                local v364 = reg.slot2
                v364:Notify("Key moved", (tbl5[arg2_71] or arg2_71) .. (" now toggles " .. (fn76(arg1_135) .. (" instead of " .. fn76(key10)))), "info")
              end
            end
          end
        end
        tbl82.keys[arg1_135] = arg2_71
        fn85()
        fn87()
      end
      function tbl32.Pin(arg1_136, arg2_72)
        arg1_136 = reg.slot3
        local v365, v366, v367, v368, v369 = arg1_136("UIScale", {Scale = 0.9}), false
        local v370 = v19({Parent = v83, Size = v4, BackgroundColor3 = fromRGB(5, 6, 16), ZIndex = 30, fn12(16)})
        local tbl95, v371, v372, v373, v374 = {Parent = v370, AnchorPoint = v6, Position = v5, Size = fn2(390, 0), AutomaticSize = y, BackgroundTransparency = 0.02, BackgroundColor3 = tbl2.pn}, fn12(18), fn13(0.8), fn16(20), reg.slot9
        local v375, v376, tbl96, v377 = v374(10), reg.slot6, {}, reg.getHumanoid
        tbl96.Size = v377(1, 0, 0, 46)
        v377 = reg.slot6
        local v378, tbl97, v379 = v377({Size = fn2(46, 46), BackgroundTransparency = 0.8, BackgroundColor3 = tbl2.a1, fn12(14), fn10("pin", 22, tbl2.a1)}), {Position = fn2(60, 3)}, reg.getHumanoid
        tbl97.Size = v379(1, -60, 0, 22)
        tbl97.Text = fn76(arg2_72)
        tbl97.FontFace = new5
        tbl97.TextSize = 17
        tbl97.TextTruncate = atEnd
        arg1_136, v379, v374 = v20(tbl97), {Position = fn2(60, 26)}, reg.getHumanoid
        v379.Size = v374(1, -60, 0, 16)
        v379.Text = fn77(arg2_72)
        v379.TextSize = 11.5
        v379.TextTransparency = 0.42
        v379.TextTruncate = atEnd
        vm:yT(tbl96, 0, v378, arg1_136, v20(v379))
        vm:yT(tbl95, 0, v371, v372, v373, v375, v365, v376(tbl96))
        local v380 = v19(tbl95)
        local function fn91(arg1_137, arg2_73)
          local tbl98, v381 = {Parent = v380, LayoutOrder = arg1_137}, reg.getHumanoid
          tbl98.Size = v381(1, 0, 0, 22)
          tbl98.Text = arg2_73
          tbl98.FontFace = new6
          tbl98.TextSize = 10
          tbl98.TextTransparency = 0.45
          arg2_73 = reg.slot4
          tbl98.TextYAlignment = arg2_73.TextYAlignment.Bottom
          v20(tbl98)
        end
        fn91(1, "SHOW ON QUICK BAR")
        v375, v372, v373 = reg.slot6, {Parent = v380, LayoutOrder = 2}, reg.getHumanoid
        v372.Size = v373(1, 0, 0, 40)
        tbl96, v378, v373 = reg.slot3, {}, reg.getHumanoid
        v378.CellSize = v373(0.16666666666666666, -7, 1, 0)
        v378.CellPadding = fn2(8, 0)
        v374 = reg.slot4
        v378.SortOrder = v374.SortOrder.LayoutOrder
        vm:yT(v372, 0, tbl96("UIGridLayout", v378))
        local v382, tbl99 = v375(v372), {}
        local function fn92(arg1_138)
          for key11, item33 in next, tbl99, nil do
            local cond3, v383, tbl100 = (tbl82.pins[arg2_72] or 0) == key11, item33[1], {}
            tbl100.BackgroundTransparency = (cond3 and 0) or 1
            fn18(v383, tbl100, (arg1_138 and 0) or 0.2)
            fn18(item33[2], {Transparency = (cond3 and 0.45) or 0.84, Color = (cond3 and tbl2.a1) or tbl2.wh}, (arg1_138 and 0) or 0.2)
            item33[3].TextColor3 = (cond3 and tbl2.on) or tbl2.wh
          end
        end
        for i5 = 0, 5, 1 do
          tbl96, tbl95 = fn13(0.84), v20({Size = v4, Text = ((i5 == 0) and "Off") or i5, FontFace = new6, TextSize = 13, TextXAlignment = center, ZIndex = 2})
          v374, v376, v373 = v19({Parent = v382, LayoutOrder = i5, BackgroundTransparency = 0.93, fn12(12), tbl96, tbl95}), {}, reg.slot6
          vm:yT(v376, 0, v373({Parent = v374, Size = v4, fn12(12), fn14(tbl2.a1, tbl2.a2, 90)}), tbl96, tbl95)
          tbl99[i5] = v376
          fn79(v374, 0.9, function()
            tbl82.pins[arg2_72] = ((i5 > 0) and i5) or nil
            fn92()
            fn85()
            fn87()
            if i5 > 0 then
              if not (v292.show) then
                local v384 = reg.slot2
                v384:Notify("Quick bars are hidden", "Turn on Show quick bars to see Quick bar " .. i5, "info")
              end
            end
          end)
        end
        fn92(true)
        local function fn93()
          v368.Text = ((v366 and "Press any key  -  Esc cancels") or fn78(arg2_72)) or "Not set"
          v368.TextTransparency = ((v366 or tbl82.keys[arg2_72]) and 0) or 0.45
          fn18(v369, {Transparency = (v366 and 0.3) or 0.82, Color = (v366 and tbl2.a1) or tbl2.wh}, 0.2)
        end
        v377, v372 = userInputService.KeyboardEnabled
        if v377 then
          v379 = reg.slot2
          tbl95 = v379.Keys[arg2_72].Kind == "toggle"
          if tbl95 then
            v372 = tbl95
          else
            tbl96 = reg.slot2
            v372 = tbl96.Keys[arg2_72].Kind == "button"
          end
        else
          v372 = v377
        end
        local v385
        if v372 then
          fn91(3, "KEYBIND")
          v369 = fn13(0.82)
          tbl96, v376, tbl97 = reg.slot6, {Parent = v380, LayoutOrder = 4}, reg.getHumanoid
          v376.Size = tbl97(1, 0, 0, 40)
          v379 = tbl96(v376)
          v378, v374 = {Parent = v379}, reg.getHumanoid
          v378.Size = v374(1, -98, 1, 0)
          v378.BackgroundTransparency = 0.92
          vm:yT(v378, 0, fn12(12), v369)
          v375 = v19(v378)
          v368 = v20({Parent = v375, Size = v4, FontFace = new7, TextSize = 14, TextXAlignment = center})
          fn79(v375, 0.96, function()
            local v386 = reg.slot2
            v366 = true
            v386.kw = true
            fn93()
          end)
          v377, arg1_136 = {Parent = v379}, reg.slot7
          v377.AnchorPoint = arg1_136
          v371 = reg.getHumanoid
          v377.Position = v371(1, 0, 0, 0)
          v382 = reg.getHumanoid
          v377.Size = v382(0, 88, 1, 0)
          v377.BackgroundTransparency = 0.92
          vm:yT(v377, 0, fn12(12), fn13(0.84), v20({Size = v4, Text = "Clear", FontFace = new5, TextSize = 13, TextXAlignment = center}))
          fn79(v19(v377), 0.92, function()
            local v387 = reg.slot2
            v366 = false
            v387.kw = nil
            fn90(arg2_72)
            fn93()
          end)
          v367 = userInputService.InputBegan:Connect(function(arg1_139)
            if v366 then
              local v388 = reg.slot4
              if arg1_139.UserInputType ~= v388.UserInputType.Keyboard then
                return
              end
            else
              return
            end
            v366 = false
            task.defer(function()
              local v389 = reg.slot2
              v389.kw = nil
            end)
            local v390 = reg.slot4
            if arg1_139.KeyCode ~= v390.KeyCode.Escape then
              fn90(arg2_72, arg1_139.KeyCode.Name)
            end
            fn93()
          end)
          fn93()
          v385 = v367
        else
          v385 = v367
        end
        local function fn94()
          if v385 then
            v385:Disconnect()
          end
          if v366 then
            local v391 = reg.slot2
            v391.kw = nil
          end
          fn18(v365, {Scale = 0.92}, 0.18)
          local v392, fn95 = fn18(v370, {BackgroundTransparency = 1}, 0.2), function()
            v370:Destroy()
          end
          v392.Completed:Connect(fn95)
          v380.Visible = false
        end
        v375, v377, fn91 = reg.slot6, {Parent = v380, LayoutOrder = 5}, reg.getHumanoid
        v377.Size = fn91(1, 0, 0, 52)
        vm:yT(v377, 0, fn16(10, 0, 0))
        fn91, arg1_136 = fn42(v375(v377), "Done", 0, 1, true), function()
          if fn24() then
            fn94()
          end
        end
        fn91.Activated:Connect(arg1_136)
        v370.Activated:Connect(fn94)
        fn18(v370, {BackgroundTransparency = 0.45}, 0.2)
        fn18(v365, {Scale = 1}, 0.35, back)
      end
      arg1_115 = arg2_64:Section("Quick bars", "zap")
      arg1_115:Toggle("Show quick bars", true, function(arg1_140)
        v292.show = arg1_140
        fn89()
      end)
      arg1_115:Toggle("Keybinds", true, function(arg1_141)
        v292.keys = arg1_141
      end)
      arg1_115:Slider("Bar size", 60, 160, 100, function(arg1_142)
        v292.size = arg1_142 / 100
        for index27, item34 in ipairs(v294) do
          item34.u.Scale = math.clamp(workspace.CurrentCamera.ViewportSize.Y / 720, 0.75, 1.2) * v292.size
        end
      end, "%", 5)
      v293.Set = function(arg1_143, arg2_74, arg3_38)
        arg1_143.Value = tostring(arg2_74 or "")
        local v393, v394, v395, v396 = reg.slot10, reg.slot10, pcall(reg.slot10.JSONDecode, reg.slot10, arg1_143.Value)
        if (v395 and (type(v396) == "table")) and (type(v396.pins) == "table") then
          arg1_143 = {"keys", "at", "fold"}
          for index28, item35 in ipairs(arg1_143) do
            v396[item35] = ((type(v396[item35]) == "table") and v396[item35]) or {}
          end
          tbl82 = v396
        else
          fn86()
        end
        if not (arg3_38) then
          fn89()
        end
      end
      arg1_115:Reg("Quick bar layout", v293)
      local section = arg2_64:Section("Pins and keybinds", "pin")
      section:Text("Tip: you can also hold any option, or right-click it on PC, to pin it or set a key.")
      local v397, tbl101, v398 = reg.slot6, {Parent = section.f, LayoutOrder = section.n + 1, Size = v8, AutomaticSize = y}, reg.slot9
      vm:yT(tbl101, 0, fn16(4, 14, 12), v398(8))
      v398 = v397(tbl101)
      section:Add(v398, "")
      local v399, tbl102, v400 = reg.slot6, {Parent = v398}, reg.getHumanoid
      tbl102.Size = v400(1, 0, 0, 34)
      v400 = v399(tbl102)
      v399, v397 = {Parent = v400}, reg.getHumanoid
      v399.Size = v397(1, -150, 1, 0)
      local v401, str6, v402, tbl103, v403 = fn38(v399, "Find an option"), "All", reg.slot6, {Parent = v400}, reg.slot7
      tbl103.AnchorPoint = v403
      v397 = reg.getHumanoid
      tbl103.Position = v397(1, 0, 0, 0)
      v400 = reg.getHumanoid
      tbl103.Size = v400(0, 142, 1, 0)
      tbl103.BackgroundTransparency = 0.93
      vm:yT(tbl103, 0, fn12(10), fn13(0.86), fn16(3))
      tbl102 = v402(tbl103)
      tbl101, v402 = {Parent = tbl102}, reg.getHumanoid
      tbl101.Size = v402(0.5, 0, 1, 0)
      vm:yT(tbl101, 0, fn12(8), fn14(tbl2.a1, tbl2.a2, 90))
      local v404, tbl104, v405 = v18(tbl101), {Parent = v398, LayoutOrder = 1}, reg.getHumanoid
      tbl104.Size = v405(1, 0, 0, 300)
      tbl103 = reg.slot9
      vm:yT(tbl104, 0, tbl103(4))
      local v406 = v22(tbl104)
      tbl32.nest[v406] = arg2_64.top or arg2_64
      tbl104, v397 = {Parent = v406}, reg.getHumanoid
      tbl104.Size = v397(1, 0, 0, 60)
      tbl104.TextSize = 12
      tbl104.TextTransparency = 0.45
      tbl104.TextXAlignment = center
      local v407 = v20(tbl104)
      v298 = function()
        for index29, child2 in ipairs(v406:GetChildren()) do
          if child2:IsA("GuiObject") then
            if child2 ~= v407 then
              child2:Destroy()
            end
          end
        end
        local lower3, v408, v409 = v401.Text:lower(), ipairs, vm[53](fn84())
        local v410
        local num10 = 0
        for it1_14, it2_13 in v408(vm:uT(v409)) do
          if ((str6 == "All") or tbl82.pins[it2_13]) or tbl82.keys[it2_13] then
            if it2_13:lower():find(lower3, 1, true) then
              local v411, v412 = tbl82.pins[it2_13], fn78(it2_13)
              it1_14 = nil
              if fn77(it2_13) ~= v410 then
                local v413 = fn77(it2_13)
                it1_14 = num10 + 1
                local tbl105, v414 = {Parent = v406, LayoutOrder = it1_14}, reg.getHumanoid
                tbl105.Size = v414(1, -6, 0, 24)
                tbl105.Text = v413:upper()
                tbl105.FontFace = new6
                tbl105.TextSize = 9.5
                tbl105.TextTransparency = 0.5
                v414 = reg.slot4
                tbl105.TextYAlignment = v414.TextYAlignment.Bottom
                vm:yT(tbl105, 0, fn16(0, 0, 3, 6))
                v20(tbl105)
                v410 = v413
              else
                it1_14 = num10
              end
              local v415, tbl106, v416 = reg.slot6, {AnchorPoint = v7}, reg.getHumanoid
              tbl106.Position = v416(1, -10, 0.5, 0)
              tbl106.Size = fn2(170, 22)
              local v417, v418 = reg.slot9, reg.slot4
              local v419, tbl107, v420, v421, v422, tbl108, v423 = v417(6, v418.HorizontalAlignment.Right, center3, horizontal), {LayoutOrder = 1, Size = fn2(0, 22), AutomaticSize = x, BackgroundTransparency = (v411 and 0) or 0.9}, fn12(), fn16(0, 9), (v411 and fn14(tbl2.a1, tbl2.a2, 90)) or nil, {}, reg.getHumanoid
              tbl108.Size = v423(0, 0, 1, 0)
              tbl108.AutomaticSize = x
              tbl108.Text = (v411 and ("QUICK BAR " .. v411)) or "+ PIN"
              tbl108.FontFace = new6
              tbl108.TextSize = 9.5
              tbl108.TextTransparency = (v411 and 0) or 0.4
              tbl108.TextColor3 = (v411 and tbl2.on) or tbl2.wh
              vm:yT(tbl107, 0, v420, v421, v422, v20(tbl108))
              vm:yT(tbl106, 0, v419, v18(tbl107))
              v423 = v415(tbl106)
              if v412 then
                v20({Parent = v423, Size = fn2(0, 22), AutomaticSize = x, Text = v412, FontFace = new7, TextSize = 10.5, TextXAlignment = center, BackgroundTransparency = 0.88, fn12(7), fn16(0, 7)})
              end
              it1_14 += 1
              tbl107, v416 = {Parent = v406, LayoutOrder = it1_14}, reg.getHumanoid
              tbl107.Size = v416(1, -6, 0, 38)
              tbl107.BackgroundTransparency = 0.955
              v419, v417, v420, tbl108 = fn12(12), fn13(0.9), {Position = fn2(12, 0)}, reg.getHumanoid
              v420.Size = tbl108(1, -190, 1, 0)
              v420.RichText = true
              v421, v418 = fn76(it2_13), reg.slot2
              tbl108, tbl106 = v418.Keys[it2_13].Kind ~= "toggle"
              if tbl108 then
                v411 = reg.slot2
                tbl106 = "  <font transparency=\"0.6\">" .. (v411.Keys[it2_13].Kind .. "</font>")
              else
                tbl106 = tbl108
              end
              v420.Text = v421 .. (tbl106 or "")
              v420.FontFace = new5
              v420.TextSize = 13
              v420.TextTruncate = atEnd
              vm:yT(tbl107, 0, v419, v417, v423, v20(v420))
              fn79(v19(tbl107), 0.97, function()
                tbl32:Pin(it2_13)
              end)
              num10 = it1_14
            else
            end
          else
          end
        end
        v407.Visible, v407.Text = num10 == 0, ((str6 == "All") and "No option matches") or "Nothing pinned or bound yet"
      end
      local tbl109, v424, tbl110 = {}, ipairs, {"All", "Pinned"}
      for it1_15, it2_14 in v424(tbl110) do
        tbl109[it1_15] = v20({Size = v4, Text = it2_14, FontFace = new5, TextSize = 12, TextXAlignment = center, TextColor3 = ((it1_15 == 1) and tbl2.on) or tbl2.wh})
        v405, tbl103 = {Parent = tbl102}, reg.getHumanoid
        v405.Position = tbl103((it1_15 - 1) / 2, 0, 0, 0)
        v399 = reg.getHumanoid
        v405.Size = v399(0.5, 0, 1, 0)
        v405.ZIndex = 2
        vm:yT(v405, 0, tbl109[it1_15])
        fn79(v19(v405), 0.95, function()
          str6 = it2_14
          for index30, item36 in ipairs(tbl109) do
            fn18(item36, {TextColor3 = ((index30 == it1_15) and tbl2.on) or tbl2.wh}, 0.2)
          end
          local tbl111, v425 = {}, reg.getHumanoid
          tbl111.Position = v425((it1_15 - 1) / 2, 0, 0, 0)
          fn18(v404, tbl111, 0.3, back)
          v298()
        end)
      end
      local num11 = 0
      fn4(v401:GetPropertyChangedSignal("Text"), function()
        num11 += 1
        local v426 = num11
        task.delay(0.2, function()
          if v426 == num11 then
            v298()
          end
        end)
      end)
      section:Button("Clear all quick bars", "Clear", function()
        fn50("Clear every quick bar?", "Options keep their state, they just leave the bars.", "warn", "Clear", function()
          tbl82.pins = {}
          fn85()
          fn87()
        end)
      end, "danger")
      section:Button("Clear all keybinds", "Clear", function()
        fn50("Clear every keybind?", "Keys stop toggling options until you set them again.", "warn", "Clear", function()
          tbl82.keys = {}
          fn85()
          fn87()
        end)
      end, "danger")
      fn4(userInputService.InputBegan, function(arg1_144, arg2_75)
        if arg2_75 then
          return
        else
          local v427 = reg.slot2
          if v427.kw then
            return
          elseif v292.keys then
            local v428 = reg.slot4
            if arg1_144.UserInputType ~= v428.UserInputType.Keyboard then
              return
            end
          else
            return
          end
        end
        local v429, keys2 = next, tbl82.keys
        for key12, item37 in v429, keys2, nil do
          arg2_75 = reg.slot2
          local v430 = arg2_75.Keys[key12]
          if v430 then
            if item37 == arg1_144.KeyCode.Name then
              if v430.Kind == "button" then
                v430.Fire()
                local v431 = reg.slot2
                v431:Notify(fn76(key12), "Pressed", "ok", 2)
              else
                local v432 = reg.slot2
                v432.qb = true
                v430:Set(not v430.Value)
                v432 = reg.slot2
                v432.qb = nil
                v432 = reg.slot2
                v432:Notify(fn76(key12), (v430.Value and "Turned on") or "Turned off", (v430.Value and "ok") or "info", 2)
              end
            end
          end
        end
      end)
      fn86()
      fn89()
      return arg1_115
    end
    tbl32.Wheel = function(arg1_145, arg2_76)
      arg1_145 = tbl32.Cur and tbl32.Cur.sc
      if userInputService.TouchEnabled then
        return
      elseif tbl32.open then
        if tbl38.open then
          return
        elseif tbl32.dlg then
          return
        elseif (os.clock() - (tbl32.wt or 0)) < 0.015 then
          return
        elseif arg1_145 then
          if not (arg1_145:IsA("ScrollingFrame")) then
            return
          end
        else
          return
        end
      else
        return
      end
      tbl32.wt = os.clock()
      local v433 = userInputService:GetMouseLocation() - ((tbl32.Gui.IgnoreGuiInset and new3()) or new3(0, 58))
      for key13, item38 in next, tbl32.nest, nil do
        local absolutePosition, absoluteSize3, y3 = key13.AbsolutePosition, key13.AbsoluteSize, key13.CanvasPosition.Y
        arg1_145 = if key13.Parent then if (tbl32.Cur.top or tbl32.Cur) == item38 then if v433.X >= absolutePosition.X then if v433.Y >= absolutePosition.Y then if v433.X <= (absolutePosition.X + absoluteSize3.X) then if v433.Y <= (absolutePosition.Y + absoluteSize3.Y) then if (arg2_76 > 0) and (y3 > 1) then key13 else if arg2_76 < 0 then if y3 < ((key13.AbsoluteCanvasSize.Y - absoluteSize3.Y) - 1) then key13 else arg1_145 else arg1_145 else arg1_145 else arg1_145 else arg1_145 else arg1_145 else arg1_145 else arg1_145
      end
      local max2, goal, y4 = math.max(0, arg1_145.AbsoluteCanvasSize.Y - arg1_145.AbsoluteWindowSize.Y), tbl32.goal, arg1_145.CanvasPosition.Y
      goal = if goal then if tbl32.gf ~= arg1_145 then y4 else if math.abs(goal - y4) > 300 then y4 else goal else y4
      tbl32.goal = math.clamp(goal - (arg2_76 * 120), 0, max2)
      tbl32.gf = arg1_145
      fn18(arg1_145, {CanvasPosition = new3(0, tbl32.goal)}, 0.4)
    end
    fn4(userInputService.InputChanged, function(arg1_146)
      local v434, v435 = tbl32.Cur and tbl32.Cur.sc, reg.slot4
      if arg1_146.UserInputType ~= v435.UserInputType.MouseWheel then
        return
      elseif v434 then
      else
        return
      end
      local v436, absolutePosition2, absoluteSize4 = userInputService:GetMouseLocation() - ((tbl32.Gui.IgnoreGuiInset and new3()) or new3(0, 58)), v434.AbsolutePosition, v434.AbsoluteSize
      if v436.X < absolutePosition2.X then
        return
      elseif v436.Y < absolutePosition2.Y then
        return
      elseif v436.X > (absolutePosition2.X + absoluteSize4.X) then
        return
      elseif v436.Y > (absolutePosition2.Y + absoluteSize4.Y) then
        return
      end
      tbl32:Wheel(arg1_146.Position.Z)
    end)
    tbl32.Destroy = function(arg1_147)
      arg1_147 = tbl10
      for index31, item39 in ipairs(arg1_147) do
        item39:Disconnect()
      end
      tbl10 = {}
      local v437, v438 = reg.slot19, reg.slot19
      pcall(reg.slot19.UnbindFromRenderStep, reg.slot19, v94)
      v76:Destroy()
      arg1_147 = getgenv and getgenv().VenyxWindows
      if arg1_147 then
        if arg1_147[tbl32.Id] == tbl32 then
          arg1_147[tbl32.Id] = nil
        end
      end
    end
    tbl32.Notify = function(arg1_148, ...)
      arg1_148 = reg.slot2
      return arg1_148:Notify(...)
    end
    v88 = reg.slot2
    v88:Boot()
    tbl32:Show(true)
    return tbl32
  end
  tbl29.new = function(arg1_149, arg2_77, arg3_39, arg4_18)
    local v439, tbl112, v440 = setmetatable({t = arg1_149, W = arg1_149.W, n = 0, name = arg2_77, side = arg4_18}, tbl29), {}, reg.getHumanoid
    tbl112.Size = v440(1, 0, 0, 42)
    local v441, tbl113, v442 = fn9({Position = fn2(14, 14), Size = fn2(15, 15), Image = arg3_39 or "grid", ImageColor3 = tbl4[(#arg1_149.Secs % 5) + 1]}), {Position = fn2(37, 12)}, reg.getHumanoid
    tbl113.Size = v442(1, -76, 0, 18)
    tbl113.Text = arg2_77:upper()
    tbl113.FontFace = new6
    tbl113.TextSize = 12
    tbl113.TextTransparency = 0.06
    tbl113.TextTruncate = atEnd
    vm:yT(tbl112, 0, v441, v20(tbl113))
    v439.hd = v19(tbl112)
    v441, v442 = {Parent = v439.hd, AnchorPoint = v6}, reg.getHumanoid
    v441.Position = v442(1, -22, 0, 21)
    v441.Size = fn2(14, 14)
    v441.Image = "down"
    v441.ImageTransparency = 0.5
    v439.ch = fn9(v441)
    arg2_77, tbl112, v440 = reg.slot6, {LayoutOrder = 1, Size = v8, AutomaticSize = y, ClipsDescendants = true}, reg.slot9
    vm:yT(tbl112, 0, v440())
    v439.f = arg2_77(tbl112)
    if arg4_18 then
      if arg4_18 > 2 then
        arg1_149.cols[arg4_18].Visible = true
      end
    end
    v441, v440, arg3_39 = reg.slot6, {Parent = arg1_149.cols[arg4_18 or 1], Size = v8, AutomaticSize = y, BackgroundTransparency = 0.95, LayoutOrder = #arg1_149.Secs + 1}, reg.slot9
    vm:yT(v440, 0, fn12(16), fn13(0.88), arg3_39(), v439.hd, v439.f)
    v439.card = v441(v440)
    fn25(v439.hd, function()
      v439:Collapse(v439.open ~= false)
    end)
    arg1_149.Secs[#arg1_149.Secs + 1] = v439
    arg1_149.list[#arg1_149.list + 1] = v439
    fn4(v439.card:GetPropertyChangedSignal("AbsoluteSize"), function()
      fn43(arg1_149)
    end)
    fn43(arg1_149)
    return v439
  end
  tbl29.Collapse = function(arg1_150, arg2_78)
    arg1_150.open = not arg2_78
    local f = arg1_150.f
    local max3 = math.max(arg1_150.hd.AbsoluteSize.Y / 42, 0.1)
    local v443, v444 = f:FindFirstChildOfClass("UIListLayout").AbsoluteContentSize.Y / max3, reg.getHumanoid
    f.Size = v444(1, 0, 0, f.AbsoluteSize.Y / max3)
    max3 = reg.slot4
    f.AutomaticSize = max3.AutomaticSize.None
    v444, max3 = {}, reg.getHumanoid
    v444.Size = max3(1, 0, 0, (arg2_78 and 0) or v443)
    max3, v443 = fn18(f, v444, 0.35), function()
      if arg1_150.open then
        f.AutomaticSize = y
      end
    end
    max3.Completed:Connect(v443)
    max3, v444 = arg1_150.ch, {}
    v444.Rotation = (arg2_78 and -90) or 0
    fn18(max3, v444, 0.3)
  end
  tbl29.Add = function(arg1_151, arg2_79, arg3_40, arg4_19)
    if arg1_151.n > 0 then
      fn17(arg2_79, fn2(14, 0), reg.getHumanoid(1, -28, 0, 1))
    end
    arg1_151.n = arg1_151.n + 1
    if arg4_19 then
      local all2 = arg1_151.W.All
      local v445, tbl114 = #all2 + 1, {r = arg2_79, n = arg3_40:lower(), title = arg3_40, tab = arg1_151.t.top, path = arg1_151.t.Name .. (" / " .. arg1_151.name)}
      tbl114.k, all2[v445] = arg1_151.t.Name .. ("/" .. (arg1_151.name .. ("/" .. arg3_40))), tbl114
    end
  end
  tbl29.Row = function(arg1_152, arg2_80, arg3_41, arg4_20)
    local v446, tbl115, v447 = (arg3_41 and 48) or 42, {Parent = arg1_152.f}, reg.getHumanoid
    tbl115.Size = v447(1, 0, 0, v446)
    tbl115.LayoutOrder = arg1_152.n + 1
    vm:yT(tbl115, 0, fn12(14))
    local v448 = v19(tbl115)
    arg1_152:Add(v448, arg2_80, true)
    fn19(v448, 0.97)
    fn4(v448.InputBegan, function(arg1_153)
      if fn23(arg1_153) then
        fn18(v448, {BackgroundTransparency = 0.94}, 0.08)
      end
    end)
    fn4(v448.InputEnded, function(arg1_154)
      if fn23(arg1_154) then
        fn18(v448, {BackgroundTransparency = 1}, 0.35)
      end
    end)
    v447, arg1_152, v446 = reg.slot6, {Parent = v448, AnchorPoint = new3(0, 0.5)}, reg.getHumanoid
    arg1_152.Position = v446(0, 14, 0.5, 0)
    tbl115 = reg.getHumanoid
    arg1_152.Size = tbl115(1, -arg4_20 - 42, 0, (arg3_41 and 42) or 21)
    tbl115 = reg.slot9
    local v449, tbl116, v450 = tbl115(0, nil, center3), {}, reg.getHumanoid
    tbl116.Size, tbl116.Text, tbl116.TextSize, tbl116.TextTruncate = reg.getHumanoid(1, 0, 0, 21), arg2_80, 14.5, atEnd
    vm:yT(arg1_152, 0, v449, v20(tbl116))
    tbl116 = v447(arg1_152)
    if arg3_41 then
      v20({Parent = tbl116, LayoutOrder = 1, Size = v8, AutomaticSize = y, Text = arg3_41, TextSize = 12, TextTransparency = 0.3, TextWrapped = true})
    end
    arg3_41, arg1_152, tbl115 = reg.slot6, {Parent = v448, AnchorPoint = v7}, reg.getHumanoid
    arg1_152.Position = tbl115(1, -14, 0.5, 0)
    arg1_152.Size = fn2(arg4_20, 36)
    return v448, arg3_41(arg1_152), tbl116
  end
  tbl29.Reg = function(arg1_155, arg2_81, arg3_42)
    local value2 = arg3_42.Value
    arg3_42.Key, arg3_42.Name, arg3_42.Def = arg1_155.t.Name .. ("/" .. (arg1_155.name .. ("/" .. arg2_81))), arg2_81, ((type(value2) == "table") and table.clone(value2)) or value2
    value2, arg1_155 = reg.slot2
    arg1_155, value2.Opt[arg2_81], reg.slot2.Keys[arg3_42.Key] = reg.slot2, arg3_42, arg3_42
    local set = arg3_42.Set
    arg3_42.Set = function(arg1_156, ...)
      set(arg1_156, ...)
      arg1_156 = reg.slot11
      if arg1_156.AutoSave then
        local v451 = reg.slot2
        if not (v451.busy) then
          if not (arg3_42.Skip) then
            local v452 = reg.slot2
            v452:Dirty()
          end
        end
      end
    end
    return arg3_42
  end
  tbl29.Hold = function(arg1_157, arg2_82, arg3_43)
    local num12 = 0
    fn4(arg2_82.InputEnded, function(arg1_158)
      if fn23(arg1_158) then
        num12 += 1
      end
    end)
    fn4(arg2_82.InputBegan, function(arg1_159)
      local w = arg1_157.W
      if not (w.Pin) then
        return
      end
      local v453 = reg.slot4
      if arg1_159.UserInputType == v453.UserInputType.MouseButton2 then
        local key14 = arg3_43.Key
        return w:Pin(key14)
      end
      if not (fn23(arg1_159)) then
        return
      end
      num12 += 1
      local v454 = num12
      local v455, cond4 = reg.slot4, arg1_159.UserInputType == reg.slot4.UserInputType.MouseButton1
      task.delay(0.6, function()
        local v456, v457 = ((num12 == v454) and (tbl19.m < 14)) and not tbl19.s
        if v456 then
          local v458 = cond4 and userInputService:IsMouseButtonPressed(arg1_159.UserInputType)
          if v458 then
            v457 = v458
          else
            local flag4 = not cond4
            if cond4 then
              v457 = flag4
            else
              local v459
              v459, v457 = reg.slot4, arg1_159.UserInputState ~= reg.slot4.UserInputState.End
            end
          end
        else
          v457 = v456
        end
        if v457 then
          tbl19.s = true
          w:Pin(arg3_43.Key)
        end
      end)
    end)
  end
  tbl29.Toggle = function(arg1_160, arg2_83, arg3_44, arg4_21, arg5_9)
    local row, v460 = arg1_160:Row(arg2_83, arg5_9, 48)
    local v461 = fn35(v460, 46, 24)
    local v462
    v462 = {Value = not not arg3_44, ls = {}, Tab = arg1_160.t.Name, Kind = "toggle", Set = function(arg1_161, arg2_84, arg3_45)
      arg2_84 = not not arg2_84
      v462.Value = arg2_84
      v461(arg2_84)
      for index32, item40 in ipairs(v462.ls) do
        item40(arg2_84)
      end
      if not (arg3_45) then
        fn22(arg4_21, arg2_84)
      end
    end}
    fn25(row, function()
      v462:Set(not v462.Value)
    end)
    arg1_160:Hold(row, v462)
    v461(v462.Value, true)
    if arg3_44 then
      fn22(arg4_21, true)
    end
    return arg1_160:Reg(arg2_83, v462)
  end
  local tbl117 = {K = 1000, M = 1000000, B = 1000000000, T = 1000000000000}
  tbl29.Slider = function(arg1_162, arg2_85, arg3_46, arg4_22, arg5_10, arg6_6, arg7_3, arg8_2, arg9)
    local cond5, v463, v464 = arg7_3 == "log"
    if cond5 then
      arg3_46, arg4_22 = 0, 1000
      v463, v464 = arg3_46, arg4_22
    else
      v463, v464 = arg3_46, arg4_22
    end
    local v465 = arg8_2 or 1
    local row2, v466, v467 = arg1_162:Row(arg2_85, arg9, 200)
    local textLabel = v467:FindFirstChildOfClass("TextLabel")
    textLabel:SetAttribute("nofit", true)
    textLabel.TextSize = 17
    local tbl118 = {w = 0}
    local function fn96()
      local v468 = reg.getHumanoid
      v467.Size = v468(0, tbl118.w, v467.Size.Y.Scale, v467.Size.Y.Offset)
      v468 = reg.getHumanoid
      v466.Size = v468(1, -tbl118.w - 46, 0, 36)
    end
    tbl118[#tbl118 + 1] = fn96
    local function fn97()
      local v469 = textLabel.AbsoluteSize.Y / 21
      if v469 <= 0 then
        return
      elseif textLabel.TextBounds.X <= 0 then
        return
      end
      local max4 = math.max(math.ceil(textLabel.TextBounds.X / v469) + 6, (arg9 and math.min(150, (#arg9 * 6.3) + 6)) or 0)
      if max4 <= tbl118.w then
        return fn96()
      end
      tbl118.w = max4
      for index33, item41 in ipairs(tbl118) do
        item41()
      end
    end
    fn4(textLabel:GetPropertyChangedSignal("TextBounds"), fn97)
    task.defer(fn97)
    local v470, tbl119, v471 = reg.slot6, {Parent = v466}, reg.getHumanoid
    tbl119.Position = v471(0, 8, 0.5, -3)
    v471 = reg.getHumanoid
    tbl119.Size = v471(1, -70, 0, 6)
    tbl119.BackgroundTransparency = 0.88
    vm:yT(tbl119, 0, fn12())
    local v472 = v470(tbl119)
    v471, v470 = {Parent = v472}, reg.getHumanoid
    v471.Size = v470(0, 0, 1, 0)
    vm:yT(v471, 0, fn12(), fn14(tbl2.a1, tbl2.a2))
    local v473, tbl120, v474 = v18(v471), {Parent = v472, AnchorPoint = v6}, reg.getHumanoid
    tbl120.Position = v474(0, 0, 0.5, 0)
    tbl120.Size = fn2(20, 20)
    tbl120.ZIndex = 2
    vm:yT(tbl120, 0, fn12(), fn13(0.65, fromRGB(0, 0, 0)))
    local v475, v476 = v18(tbl120), reg.slot3
    local v477 = v476("UIScale", {Parent = v475})
    v470 = fn13(0.8)
    local v478 = v21({Parent = v466, AnchorPoint = v7, Position = v9, Size = fn2(54, 28), FontFace = new6, TextSize = 13, TextTruncate = atEnd, TextColor3 = tbl2.val, TextXAlignment = center, BackgroundTransparency = 0.72, BackgroundColor3 = fromRGB(0, 0, 0), fn12(8), fn16(4, 4), v470})
    local function fn98(arg1_163)
      if arg1_163 <= 0 then
        return 0
      end
      local v479 = 10 ^ (3 + ((9 * arg1_163) / 1000))
      arg1_163 = 10 ^ (math.floor(math.log10(v479)) - 2)
      return math.floor((v479 / arg1_163) + 0.5) * arg1_163
    end
    local function fn99(arg1_164)
      return (cond5 and (((arg1_164 <= 0) and 0) or math.clamp(((math.log10(arg1_164) - 3) / 9) * 1000, 0, 1000))) or arg1_164
    end
    local function fn100(arg1_165, arg2_86)
      local format, v480 = string.format, ((arg1_165 >= 100) and "%.0f") or ((arg1_165 >= 10) and "%.1f")
      local v481 = format(v480 or "%.2f", arg1_165)
      return ((v481:find("%.") and v481:gsub("0+$", ""):gsub("%.$", "")) or v481) .. arg2_86
    end
    local function fn101(arg1_166, arg2_87)
      if not (cond5) then
        return ((type(arg7_3) == "function") and arg7_3(arg1_166)) or (fn26(arg1_166) .. (arg7_3 or ""))
      end
      if arg1_166 <= 0 then
        return (arg2_87 and "0") or "Off"
      end
      local v482 = (((arg1_166 < 1000000) and 1000) or ((arg1_166 < 1000000000) and 1000000)) or 1000000000
      return fn100(arg1_166 / v482, ((((v482 == 1000) and "K") or ((v482 == 1000000) and "M")) or "B") .. ((arg2_87 and "") or "/s"))
    end
    fn97, tbl119 = {Parent = v466, Position = fn2(-4, -2)}, reg.getHumanoid
    fn97.Size = tbl119(1, -60, 1, 4)
    fn97.ZIndex = 3
    v476 = v19(fn97)
    local v483
    v483 = {ls = {}, Kind = "slider", Set = function(arg1_167, arg2_88, arg3_47, arg4_23)
      if type(arg2_88) ~= "number" then
        local match2, v484 = tostring(arg2_88):upper():match("^([%d%.]+)(%a?)")
        local v485, v486 = tonumber(match2) or 0, tbl117[v484] or ((cond5 and 1000000) or 1)
        arg2_88 = v485 * v486
      else
      end
      arg2_88 = (cond5 and fn98(fn99(arg2_88))) or math.clamp((math.floor(((arg2_88 - v463) / v465) + 0.5) * v465) + v463, v463, v464)
      arg1_167 = arg2_88 ~= v483.Value
      v483.Value = arg2_88
      local v487, tbl121, v488 = (fn99(arg2_88) - v463) / (v464 - v463), {}, reg.getHumanoid
      tbl121.Size = v488(v487, 0, 1, 0)
      fn18(v473, tbl121, (arg4_23 and 0.08) or 0.3)
      v488, tbl121 = {}, reg.getHumanoid
      v488.Position = tbl121(v487, 0, 0.5, 0)
      fn18(v475, v488, (arg4_23 and 0.08) or 0.3)
      if not (v478:IsFocused()) then
        v478.Text = fn101(arg2_88)
      end
      for index34, item42 in ipairs(v483.ls) do
        item42(arg2_88)
      end
      if arg3_47 then
      elseif arg1_167 then
        fn22(arg6_6, arg2_88)
      end
    end}
    local v489
    local function fn102(arg1_168)
      local v490 = v463 + ((v464 - v463) * math.clamp((arg1_168 - v472.AbsolutePosition.X) / v472.AbsoluteSize.X, 0, 1))
      v483:Set((cond5 and fn98(v490)) or v490, false, true)
    end
    local function fn103(arg1_169)
      v489 = arg1_169
      if arg1_162.t.cols then
        if userInputService.TouchEnabled then
          arg1_162.t.sc.ScrollingEnabled = not arg1_169
        end
      end
      fn18(v477, {Scale = (arg1_169 and 1.25) or 1}, 0.22, back)
    end
    fn4(v476.InputBegan, function(arg1_170)
      local v491 = reg.slot2
      local drag = v491.drag
      if fn23(arg1_170) then
        if drag then
          if drag ~= v483 then
            if drag.d then
              v491 = reg.slot4
              if drag.d.UserInputState ~= v491.UserInputState.End then
                return
              end
            end
          end
        end
      else
        return
      end
      drag = reg.slot2
      drag.drag = v483
      v483.d = arg1_170
      tbl19.s = true
      fn103(arg1_170)
      fn102(arg1_170.Position.X)
    end)
    local function fn104()
      local userInputType2, v492 = v489.UserInputType, reg.slot4
      return userInputType2 == v492.UserInputType.MouseButton1
    end
    fn4(userInputService.InputChanged, function(arg1_171)
      local v493, v494 = v489
      if v493 then
        local cond6 = arg1_171 == v489
        if cond6 then
          v494 = cond6
        else
          local v495 = fn104()
          if v495 then
            local v496
            v496, v494 = reg.slot4, arg1_171.UserInputType == reg.slot4.UserInputType.MouseMovement
          else
            v494 = v495
          end
        end
      else
        v494 = v493
      end
      if v494 then
        fn102(arg1_171.Position.X)
      end
    end)
    fn4(userInputService.InputEnded, function(arg1_172)
      local v497, v498 = v489
      if v497 then
        local cond7 = arg1_172 == v489
        if cond7 then
          v498 = cond7
        else
          local v499 = fn104()
          if v499 then
            local v500
            v500, v498 = reg.slot4, arg1_172.UserInputType == reg.slot4.UserInputType.MouseButton1
          else
            v498 = v499
          end
        end
      else
        v498 = v497
      end
      if v498 then
        arg1_172 = reg.slot2
        arg1_172.drag = nil
        fn103(nil)
      end
    end)
    fn4(v478.Focused, function()
      v478.Text = (cond5 and fn101(v483.Value, true)) or tostring(v483.Value)
      fn18(v478, {BackgroundTransparency = 0.75}, 0.15)
    end)
    fn37(v478, v470, 0.5, 0.8, function()
      fn18(v478, {BackgroundTransparency = 0.9}, 0.2)
      local gsub = v478.Text:gsub("[%s,/]", ""):gsub("[sS]$", "")
      gsub = if cond5 then if gsub:lower() == "off" then "0" else gsub else gsub
      if gsub:match("^%-?[%d%.]+%a?$") then
        v483:Set((cond5 and gsub) or tonumber(gsub))
      end
      v478.Text = fn101(v483.Value)
    end)
    v483.Frac = function(arg1_173)
      return (fn99(arg1_173) - v463) / (v464 - v463)
    end
    v483.Txt = fn101
    v483.From = function(arg1_174)
      arg1_174 = v463 + ((v464 - v463) * arg1_174)
      return (cond5 and fn98(arg1_174)) or arg1_174
    end
    arg1_162:Hold(row2, v483)
    v483:Set(arg5_10, true)
    return arg1_162:Reg(arg2_85, v483)
  end
  tbl29.Dropdown = function(arg1_175, arg2_89, arg3_48, arg4_24, arg5_11, arg6_7, arg7_4)
    local row3, v501 = arg1_175:Row(arg2_89, arg7_4, 176)
    local v502, tbl122, v503 = reg.slot6, {Parent = v501, AnchorPoint = new3(0, 0.5)}, reg.getHumanoid
    tbl122.Position = v503(0, 0, 0.5, 0)
    arg7_4 = reg.getHumanoid
    tbl122.Size = arg7_4(1, 0, 0, 32)
    tbl122.BackgroundTransparency = 0.93
    local v504, v505, tbl123, v506 = fn12(10), fn13(0.87), {AnchorPoint = v7}, reg.getHumanoid
    tbl123.Position = v506(1, -8, 0.5, 0)
    tbl123.Size = fn2(13, 13)
    tbl123.Image = "down"
    vm:yT(tbl122, 0, v504, v505, fn9(tbl123))
    v501 = v502(tbl122)
    tbl122, v504 = {Parent = v501, Position = fn2(9, 0)}, reg.getHumanoid
    tbl122.Size = v504(1, -34, 1, 0)
    tbl122.FontFace = new5
    tbl122.TextSize = 14
    tbl122.TextTruncate = atEnd
    local v507, tbl124, v508 = v20(tbl122), {Parent = v501, AnchorPoint = v7}, reg.getHumanoid
    tbl124.Position = v508(1, -26, 0.5, 0)
    tbl124.Size = fn2(0, 18)
    tbl124.AutomaticSize = x
    tbl124.FontFace = new5
    tbl124.TextSize = 11
    tbl124.TextColor3 = fromRGB(226, 229, 255)
    tbl124.BackgroundTransparency = 0.72
    tbl124.BackgroundColor3 = tbl2.a1
    tbl124.TextXAlignment = center
    vm:yT(tbl124, 0, fn12(), fn16(0, 6))
    local v509, tbl125 = v20(tbl124), {Options = arg3_48, Multi = arg6_7}
    local w2 = arg1_175.W
    tbl125.Set = function(arg1_176, arg2_90, arg3_49)
      tbl125.Value = (arg6_7 and (((type(arg2_90) == "table") and arg2_90) or {arg2_90})) or arg2_90
      arg2_90 = (arg6_7 and (type(tbl125.Options) == "table")) and tbl125.Options
      if arg2_90 then
        local tbl126 = {}
        for index35, item43 in ipairs(arg2_90) do
          tbl126[((type(item43) == "table") and item43.v) or item43] = index35
        end
        tbl125.Value = table.clone(tbl125.Value)
        table.sort(tbl125.Value, function(arg1_177, arg2_91)
          return (tbl126[arg1_177] or 1000000000) < (tbl126[arg2_91] or 1000000000)
        end)
      end
      arg1_176 = (arg6_7 and #tbl125.Value) or 0
      v507:SetAttribute("alt", ((arg1_176 > 1) and (tbl125.Value[1] .. "...")) or nil)
      v507.Text = (arg6_7 and (((arg1_176 == 0) and "None") or tostring(tbl125.Value[1]))) or tostring(tbl125.Value or "None")
      v509.Text = "+" .. (arg1_176 - 1)
      v509.Visible = arg1_176 > 1
      arg2_90 = reg.getHumanoid
      v507.Size = arg2_90(1, ((arg1_176 > 1) and -70) or -34, 1, 0)
      v507.TextTransparency = 0.6
      fn18(v507, {TextTransparency = 0}, 0.3)
      w2:Sync(tbl125)
      if not (arg3_49) then
        fn22(arg5_11, tbl125.Value)
      end
    end
    tbl125.Refresh = function(arg1_178, arg2_92)
      tbl125.Options = arg2_92
    end
    fn25(row3, function()
      local v510 = ((type(tbl125.Options) == "function") and tbl125.Options()) or tbl125.Options
      arg1_175.W:Pick(arg2_89, v510, tbl125.Value, arg6_7, function(arg1_179)
        tbl125:Set(arg1_179)
      end, tbl125.Default, tbl125)
    end)
    tbl125.Default = (arg6_7 and table.clone(arg4_24 or {})) or nil
    v502 = arg6_7 and (arg4_24 or {})
    tbl125:Set(v502 or arg4_24, true)
    return arg1_175:Reg(arg2_89, tbl125)
  end
  tbl29.Input = function(arg1_180, arg2_93, arg3_50, arg4_25, arg5_12)
    local row4, v511 = arg1_180:Row(arg2_93, arg5_12, 176)
    local v512, tbl127, v513 = fn13(0.87), {Parent = v511, AnchorPoint = new3(0, 0.5)}, reg.getHumanoid
    tbl127.Position = v513(0, 0, 0.5, 0)
    v511 = reg.getHumanoid
    tbl127.Size = v511(1, 0, 0, 26)
    tbl127.BackgroundTransparency = 0.8
    tbl127.BackgroundColor3 = fromRGB(0, 0, 0)
    tbl127.PlaceholderText = arg3_50 or ""
    tbl127.TextSize = 13
    tbl127.TextTruncate = atEnd
    arg5_12 = reg.slot4
    tbl127.TextXAlignment = arg5_12.TextXAlignment.Left
    tbl127.ClipsDescendants = true
    vm:yT(tbl127, 0, fn12(10), fn16(0, 10), v512)
    local v514 = v21(tbl127)
    local v515
    v515 = {Value = "", ls = {}, Kind = "input", Set = function(arg1_181, arg2_94, arg3_51)
      v515.Value = tostring(arg2_94 or "")
      v514.Text = v515.Value
      for index36, item44 in ipairs(v515.ls) do
        item44(v515.Value)
      end
      if not (arg3_51) then
        fn22(arg4_25, v515.Value)
      end
    end}
    arg1_180:Hold(row4, v515)
    fn37(v514, v512, 0.5, 0.87, function()
      v515:Set(v514.Text)
    end)
    fn25(row4, function()
      v514:CaptureFocus()
    end)
    return arg1_180:Reg(arg2_93, v515)
  end
  tbl29.Key = function(arg1_182, arg2_95, arg3_52, arg4_26, arg5_13, arg6_8)
    local row5, v516 = arg1_182:Row(arg2_95, arg6_8, 60)
    local v517 = fn13(0.82)
    local tbl128, v518 = {Parent = v516, AnchorPoint = v7, Position = v9, Size = fn2(0, 26), AutomaticSize = x, FontFace = new7, TextXAlignment = center, BackgroundTransparency = 0.92}, reg.slot3
    vm:yT(tbl128, 0, fn12(9), fn16(0, 12), v517, v518("UISizeConstraint", {MinSize = new3(36, 26)}))
    local v519, v520, v521 = v20(tbl128), {}
    v520.Set = function(arg1_183, arg2_96, arg3_53)
      v520.Value = arg2_96
      arg1_183 = (arg2_96 and arg2_96.Name) or "None"
      v519.Text = tbl5[arg1_183] or arg1_183
      fn18(v517, {Transparency = 0.82, Color = tbl2.wh}, 0.2)
      if not (arg3_53) then
        fn22(arg5_13, arg2_96)
      end
    end
    fn25(row5, function()
      local v522 = reg.slot2
      v521 = true
      v522.kw = true
      v519.Text = "..."
      fn18(v517, {Transparency = 0.4, Color = tbl2.a1}, 0.2)
    end)
    fn4(userInputService.InputBegan, function(arg1_184, arg2_97)
      local v523, v524 = v521
      if v523 then
        local v525
        v525, v524 = reg.slot4, arg1_184.UserInputType == reg.slot4.UserInputType.Keyboard
      else
        v524 = v523
      end
      if v524 then
        v521 = false
        task.defer(function()
          local v526 = reg.slot2
          v526.kw = nil
        end)
        v520:Set(((arg1_184.KeyCode ~= reg.slot4.KeyCode.Escape) and arg1_184.KeyCode) or nil)
      elseif arg2_97 then
      elseif v520.Value then
        if arg1_184.KeyCode == v520.Value then
          fn22(arg4_26)
        end
      end
    end)
    v520:Set(arg3_52, true)
    return arg1_182:Reg(arg2_95, v520)
  end
  tbl29.Button = function(arg1_185, arg2_98, arg3_54, arg4_27, arg5_14, arg6_9)
    local v527, v528, v529 = ({danger = tbl2.red, gold = tbl2.gold, mint = tbl2.mint, pink = tbl2.pink})[arg5_14] or tbl2.sky, arg1_185:Row(arg2_98, arg6_9, 110)
    local v530 = v20({Parent = v529, AnchorPoint = v7, Position = v9, Size = fn2(0, 26), AutomaticSize = x, Text = arg3_54 or "Run", FontFace = new5, TextSize = 13, TextTransparency = 1, fn16(0, 14)})
    arg6_9, arg5_14 = {Parent = v530, AnchorPoint = v6, Position = v5}, reg.getHumanoid
    arg6_9.Size = arg5_14(1, 28, 1, 0)
    arg6_9.Text = v530.Text
    arg6_9.FontFace = new5
    arg6_9.TextSize = 13
    arg6_9.TextColor3 = v527:Lerp(tbl2.wh, 0.55)
    arg6_9.TextXAlignment = center
    arg6_9.BackgroundTransparency = 0.85
    arg6_9.BackgroundColor3 = v527
    vm:yT(arg6_9, 0, fn12(10), fn13(0.5, v527))
    local v531 = v20(arg6_9)
    fn27(v531, 0.93, v528, function(arg1_186)
      fn18(v531, {BackgroundTransparency = (arg1_186 and 0.7) or 0.85}, 0.2)
    end)
    fn25(v528, function()
      fn22(arg4_27)
    end)
    arg3_54, v529 = {Kind = "button", Skip = true, Text = v530.Text, Col = v527, Name = arg2_98, Key = arg1_185.t.Name .. ("/" .. (arg1_185.name .. ("/" .. arg2_98))), Fire = function()
      fn22(arg4_27)
    end, Set = function(arg1_187, arg2_99)
      v530.Text = arg2_99
      v531.Text = arg2_99
      arg1_187.Text = arg2_99
    end}, reg.slot2
    v529.Keys[arg3_54.Key] = arg3_54
    arg1_185:Hold(v528, arg3_54)
    return arg3_54
  end
  tbl29.Stats = function(arg1_188, arg2_100)
    local v532 = reg.slot6
    local v533, v534 = v532({Parent = arg1_188.f, Size = v8, AutomaticSize = y, LayoutOrder = arg1_188.n + 1}), reg.slot6
    local tbl129, v535, v536, tbl130, v537 = {Parent = v533, Size = v8, AutomaticSize = y}, fn16(8, 14, 10), reg.slot3, {}, reg.getHumanoid
    tbl130.CellSize = v537(0.5, -6, 0, 40)
    tbl130.CellPadding = fn2(12, 6)
    v532 = reg.slot4
    tbl130.SortOrder = v532.SortOrder.LayoutOrder
    vm:yT(tbl129, 0, v535, v536("UIGridLayout", tbl130))
    v532 = v534(tbl129)
    arg1_188:Add(v533, "")
    tbl130, v536 = {}, ipairs
    for it1_16, it2_15 in v536(arg2_100) do
      v533 = (type(it2_15) == "table") and it2_15[2]
      it2_15 = ((type(it2_15) == "table") and it2_15[1]) or it2_15
      v537, tbl129 = (v533 and 40) or 10, reg.slot6
      arg1_188 = tbl129({Parent = v532, LayoutOrder = it1_16, BackgroundTransparency = 0.95, fn12(10)})
      if v533 then
        v535, it1_16 = {Parent = arg1_188, Position = fn2(8, 7), Size = fn2(26, 26), Image = v533}, reg.slot4
        v535.ScaleType = it1_16.ScaleType.Fit
        v535.ImageColor3 = (tbl6[v533] and tbl2.a1) or nil
        fn9(v535)
      end
      it1_16, v534 = {Parent = arg1_188, Position = fn2(v537, 4)}, reg.getHumanoid
      it1_16.Size = v534(1, -v537 - 8, 0, 14)
      it1_16.Text = it2_15:upper()
      it1_16.FontFace = new6
      it1_16.TextSize = 9.5
      it1_16.TextTransparency = 0.38
      v20(it1_16)
      local tbl131, v538 = {Parent = arg1_188, Position = fn2(v537, 19)}, reg.getHumanoid
      tbl131.Size = v538(1, -v537 - 8, 0, 17)
      tbl131.Text = "--"
      tbl131.FontFace = new7
      tbl131.TextSize = 13
      tbl131.TextTruncate = atEnd
      tbl130[it2_15] = v20(tbl131)
    end
    return fn41(tbl130)
  end
  tbl29.List = function(arg1_189, arg2_101, arg3_55)
    local v539, tbl132, v540 = reg.slot6, {Parent = arg1_189.f, LayoutOrder = arg1_189.n + 1}, reg.getHumanoid
    tbl132.Size = v540(1, 0, 0, (arg2_101 * 64) + 12)
    arg2_101 = v539(tbl132)
    arg1_189:Add(arg2_101, "")
    v539, v540 = {Parent = arg2_101, Position = fn2(10, 6)}, reg.getHumanoid
    v539.Size = v540(1, -20, 1, -12)
    v540 = reg.slot9
    vm:yT(v539, 0, v540(6))
    local v541 = v22(v539)
    arg1_189.W.nest[v541] = arg1_189.t.top or arg1_189.t
    local v542, v543, v544, v545 = v20({Parent = arg2_101, Size = v4, Text = arg3_55 or "Nothing here", TextSize = 12, TextTransparency = 0.45, TextXAlignment = center}), {}, {}
    local function fn105(arg1_190)
      local v546 = arg1_190.it and (arg1_190.it.id == v545)
      arg1_190.s.Color = (v546 and tbl2.a1) or tbl2.wh
      arg1_190.s.Transparency = (v546 and 0.3) or 0.9
      arg1_190.r.BackgroundTransparency = (v546 and 0.9) or 0.955
    end
    local function fn106()
      local tbl133, tbl134, v547 = {s = fn13(0.9)}, {Parent = v541}, reg.getHumanoid
      tbl134.Size = v547(1, -6, 0, 58)
      tbl134.BackgroundTransparency = 0.955
      vm:yT(tbl134, 0, fn12(15), tbl133.s)
      tbl133.r = v19(tbl134)
      v547 = reg.slot6
      tbl133.box = v547({Parent = tbl133.r, Position = fn2(8, 8), Size = fn2(42, 42), BackgroundTransparency = 0.8, fn12(13)})
      tbl134, v547 = {Parent = tbl133.box, AnchorPoint = v6, Position = v5, Size = fn2(38, 38)}, reg.slot4
      tbl134.ScaleType = v547.ScaleType.Fit
      tbl133.im = v23(tbl134)
      v547, tbl134 = {Parent = tbl133.r, Position = fn2(60, 5)}, reg.getHumanoid
      v547.Size = tbl134(1, -152, 0, 18)
      v547.FontFace = new5
      v547.TextSize = 13.5
      v547.TextTruncate = atEnd
      tbl133.a = v20(v547)
      local v548, tbl135, v549 = reg.slot6, {Parent = tbl133.r, Position = fn2(60, 24)}, reg.getHumanoid
      tbl135.Size = v549(1, -152, 0, 13)
      v549 = reg.slot9
      vm:yT(tbl135, 0, v549(8, nil, center3, horizontal))
      v549 = v548(tbl135)
      tbl133.rar = v20({Parent = v549, Size = fn2(0, 13), AutomaticSize = x, FontFace = new6, TextSize = 9.5})
      tbl133.tg = v20({Parent = v549, LayoutOrder = 1, Size = fn2(0, 13), AutomaticSize = x, FontFace = new5, TextSize = 9.5, TextColor3 = fromRGB(201, 194, 255)})
      v547, v548, v549 = reg.slot6, {Parent = tbl133.r, Position = fn2(60, 39)}, reg.getHumanoid
      v548.Size = v549(1, -152, 0, 15)
      tbl135 = reg.slot9
      vm:yT(v548, 0, tbl135(8, nil, center3, horizontal))
      tbl135 = v547(v548)
      tbl133.v = v20({Parent = tbl135, Size = fn2(0, 15), AutomaticSize = x, FontFace = new7, TextSize = 12, TextColor3 = tbl2.gv})
      tbl133.b = v20({Parent = tbl135, LayoutOrder = 1, Size = fn2(0, 15), AutomaticSize = x, TextSize = 11, TextTransparency = 0.3})
      tbl134, v547 = {Parent = tbl133.r, AnchorPoint = v7}, reg.getHumanoid
      tbl134.Position = v547(1, -10, 0.5, 0)
      tbl134.Size = fn2(78, 32)
      tbl134.BackgroundTransparency = 0
      vm:yT(tbl134, 0, fn12(11), fn14(tbl2.g1, tbl2.g2), v20({Size = v4, FontFace = new5, TextSize = 12, TextColor3 = tbl2.dk, TextXAlignment = center}))
      tbl133.k = v19(tbl134)
      tbl133.kl = tbl133.k:FindFirstChildOfClass("TextLabel")
      fn27(tbl133.k)
      fn25(tbl133.k, function()
        if tbl133.it then
          if tbl133.it.act then
            fn22(tbl133.it.act, tbl133.it)
          end
        end
      end)
      fn25(tbl133.r, function()
        if not (tbl133.it) then
          return
        end
        v545 = tbl133.it.id
        for key15, item45 in next, v543, nil do
          fn105(item45)
        end
        fn22(tbl133.it.pick, tbl133.it)
      end)
      return tbl133
    end
    v544.Set = function(arg1_191, arg2_102)
      v542.Visible = #arg2_102 == 0
      arg1_191 = {}
      for index37, item46 in ipairs(arg2_102) do
        local v550 = v543[item46.id] or fn106()
        v543[item46.id], arg1_191[item46.id] = v550, true
        v550.it = item46
        v550.r.LayoutOrder = index37
        local tbl136, tbl137 = {a = item46.title, rar = item46.rarity, tg = item46.tags, v = item46.value, b = item46.sub, kl = item46.button}, {"a", "rar", "tg", "v", "b", "kl"}
        for index38, item47 in ipairs(tbl137) do
          index38 = tbl136[item47] or ""
          if v550[item47].Text ~= index38 then
            v550[item47].Text = index38
          end
        end
        v550.k.Visible = item46.button ~= nil
        if v550.g ~= item46.grad then
          tbl137 = v550.rar:FindFirstChildOfClass("UIGradient")
          if tbl137 then
            tbl137:Destroy()
          end
          v550.g = item46.grad
          if item46.grad then
            item46.grad:Clone().Parent = v550.rar
          end
        end
        v550.rar.TextColor3 = ((item46.grad and tbl2.wh) or item46.color) or tbl2.val
        v550.box.BackgroundColor3 = item46.color or tbl2.a1
        if v550.im.Image ~= (item46.image or "") then
          v550.im.Image = item46.image or ""
        end
        fn105(v550)
      end
      for key16, item48 in next, v543, nil do
        if not (arg1_191[key16]) then
          item48.r:Destroy()
          v543[key16] = nil
        end
      end
    end
    v544.Select = function(arg1_192, arg2_103)
      v545 = arg2_103
      for key17, item49 in next, v543, nil do
        fn105(item49)
      end
    end
    return v544
  end
  local function fn107(arg1_193, arg2_104)
    local uIGradient = arg1_193:FindFirstChildOfClass("UIGradient")
    if uIGradient then
      uIGradient:Destroy()
    end
    if arg2_104 then
      arg2_104:Clone().Parent = arg1_193
    end
  end
  local function fn108(arg1_194)
    arg1_194.FontFace, arg1_194.TextColor3 = new8, arg1_194.TextColor3 or tbl2.wh
    arg1_194.TextTruncate = atEnd
    local v551, v552 = v20(arg1_194), reg.slot3
    v552("UIStroke", {Parent = v551, Thickness = math.max(1.2, arg1_194.TextSize / 8), Color = fromRGB(0, 0, 0), Transparency = 0.05})
    return v551
  end
  local new10 = ColorSequenceKeypoint.new
  local tbl138 = {COMMON = {fromRGB(30, 34, 42), fromRGB(104, 114, 132), fromRGB(214, 222, 236)}, UNCOMMON = {fromRGB(6, 44, 22), fromRGB(36, 168, 84), fromRGB(160, 255, 170)}, RARE = {fromRGB(6, 24, 78), fromRGB(36, 112, 255), fromRGB(140, 205, 255)}, EPIC = {fromRGB(34, 8, 74), fromRGB(146, 56, 255), fromRGB(220, 170, 255)}, LEGENDARY = {fromRGB(74, 30, 0), fromRGB(255, 146, 18), fromRGB(255, 228, 130)}, MYTHIC = {fromRGB(72, 0, 22), fromRGB(255, 38, 88), fromRGB(255, 168, 190)}, COSMIC = {fromRGB(22, 0, 40), fromRGB(128, 0, 154), fromRGB(236, 150, 255), fromRGB(92, 0, 190)}, SECRET = {fromRGB(0, 0, 0), fromRGB(52, 52, 64), fromRGB(255, 255, 255), stars = true}, ETERNAL = {fromRGB(4, 20, 56), fromRGB(30, 196, 220), fromRGB(255, 160, 255), fromRGB(196, 80, 255), shine = true}, DIVINE = {fromRGB(84, 54, 0), fromRGB(255, 196, 50), fromRGB(255, 252, 220), fromRGB(255, 236, 150), shine = true, star = fromRGB(255, 255, 255), rays = true}}
  local function fn109(arg1_195)
    local v553, v554, v555 = arg1_195.color or tbl2.a1, tbl138[arg1_195.rarity]
    if v554 then
      v555 = v554
    else
      local tbl139, lerp, wh = {}, v553:Lerp(fromRGB(0, 0, 0), 0.75), tbl2.wh
      vm:yT(tbl139, 0, lerp, v553, v553:Lerp(wh, 0.6))
      v555 = tbl139
    end
    return v555
  end
  local function fn110(arg1_196, arg2_105, arg3_56, arg4_28)
    arg2_105.Parent = arg1_196
    arg2_105.ClipsDescendants = true
    arg1_196 = v18(arg2_105)
    arg2_105 = {f = arg1_196, g = fn14(tbl2.wh, tbl2.wh, 120), h = {}, st = {}, ss = {}, sh = fn15(30, {0, 1}, {0.4, 1}, {0.5, 0.55}, {0.6, 1}, {1, 1})}
    fn12(arg3_56).Parent, arg2_105.g.Parent = arg1_196, arg1_196
    for index39, item50 in ipairs(arg4_28) do
      local h, tbl140 = arg2_105.h, {Parent = arg1_196, AnchorPoint = v6, Position = v5, Size = fn2(item50, item50)}
      tbl140.BackgroundTransparency = 0.96 - (index39 * 0.1)
      vm:yT(tbl140, 0, fn12())
      h[index39] = v18(tbl140)
    end
    local v556, tbl141 = ipairs, {{0.13, 0.28, 13}, {0.87, 0.2, 10}, {0.84, 0.72, 12}}
    for it1_17, it2_16 in v556(tbl141) do
      local v557, ss, tbl142, v558 = fn2((it2_16[3] * arg4_28[1]) / 95, (it2_16[3] * arg4_28[1]) / 95), arg2_105.ss, {Parent = arg1_196, AnchorPoint = v6}, reg.getHumanoid
      tbl142.Position = v558(it2_16[1], 1.5, it2_16[2], 1.5)
      tbl142.Size = v557
      tbl142.Image = "sparkles"
      tbl142.ImageColor3 = fromRGB(90, 50, 0)
      tbl142.ZIndex = 2
      ss[it1_17] = fn9(tbl142)
      tbl142, arg3_56, ss = arg2_105.st, {Parent = arg1_196, AnchorPoint = v6}, reg.getHumanoid
      arg3_56.Position = ss(it2_16[1], 0, it2_16[2], 0)
      arg3_56.Size = v557
      arg3_56.Image = "sparkles"
      arg3_56.ZIndex = 2
      tbl142[it1_17] = fn9(arg3_56)
    end
    arg4_28 = reg.slot6
    arg2_105.sf = arg4_28({Parent = arg1_196, Size = v4, BackgroundColor3 = tbl2.wh, BackgroundTransparency = 0, ZIndex = 4, arg2_105.sh})
    return arg2_105
  end
  local function fn111(arg1_197, arg2_106)
    arg1_197.g.Color = ColorSequence.new({new10(0, arg2_106[2]), new10(0.5, arg2_106[4] or arg2_106[1]:Lerp(arg2_106[2], 0.4)), new10(1, arg2_106[1])})
    for index40, item51 in ipairs(arg1_197.h) do
      item51.BackgroundColor3 = arg2_106[3]
    end
    if arg2_106.rays then
      if not (arg1_197.ry) then
        local tbl143, v559 = {Parent = arg1_197.f, AnchorPoint = v6, Position = v5}, reg.getHumanoid
        tbl143.Size = v559(1.5, 0, 1.5, 0)
        v559 = reg.slot4
        tbl143.SizeConstraint = v559.SizeConstraint.RelativeXX
        tbl143.Image = "rbxassetid://109516122757226"
        tbl143.ImageColor3 = fromRGB(255, 250, 215)
        tbl143.ImageTransparency = 0.3
        v559 = reg.slot4
        tbl143.ScaleType = v559.ScaleType.Fit
        arg1_197.ry = v23(tbl143)
      end
    end
    if arg1_197.ry then
      arg1_197.ry.Visible = arg2_106.rays == true
    end
    arg1_197.sf.Visible = arg1_197.live and (arg2_106.shine == true)
    for index41, item52 in ipairs(arg1_197.st) do
      item52.Visible, item52.ImageColor3 = (arg2_106.shine or arg2_106.stars) or false, arg2_106.star or arg2_106[3]
      item52.ImageTransparency = 0.15
      arg1_197.ss[index41].Visible, arg1_197.ss[index41].ImageTransparency = item52.Visible and (arg2_106.star ~= nil), 0.55
    end
    for index42, item53 in ipairs(arg1_197.tw or {}) do
      item53:Cancel()
    end
    arg1_197.tw = {}
    if arg1_197.live then
      if not (arg2_106.shine) then
        if not (arg2_106.rays) then
          return
        end
      end
    else
      return
    end
    local function fn112(arg1_198, arg2_107, arg3_57, arg4_29, arg5_15)
      local new11, v560 = TweenInfo.new
      if arg4_29 then
        local v561 = reg.slot4
        v560 = v561.EasingStyle.Sine
      else
        v560 = arg4_29
      end
      local v562
      if v560 then
        v562 = v560
      else
        local v563 = reg.slot4
        v562 = v563.EasingStyle.Linear
      end
      v560 = reg.slot4
      local create = tweenService:Create(arg1_198, new11(arg2_107, v562, v560.EasingDirection.InOut, -1, arg4_29 == true, arg5_15 or 0), arg3_57)
      create:Play()
      arg1_197.tw[#arg1_197.tw + 1] = create
    end
    arg1_197.h[#arg1_197.h].BackgroundTransparency = 0.82
    fn112(arg1_197.h[#arg1_197.h], 1.3, {BackgroundTransparency = 0.62}, true)
    if arg2_106.rays then
      arg1_197.ry.Rotation = 0
      fn112(arg1_197.ry, 30, {Rotation = 360})
    end
    if arg2_106.shine then
      arg1_197.sh.Offset = new3(-1, 0)
      fn112(arg1_197.sh, 1.2, {Offset = new3(1, 0)}, false, 2.2)
      for index43, item54 in ipairs(arg1_197.st) do
        item54.ImageTransparency, arg1_197.ss[index43].ImageTransparency = 0.4, 0.95
        fn112(item54, 0.9 + (index43 * 0.25), {ImageTransparency = 0}, true)
        fn112(arg1_197.ss[index43], 0.9 + (index43 * 0.25), {ImageTransparency = 0.55}, true)
      end
    end
  end
  local new12 = ColorSequence.new(fromRGB(26, 255, 0), fromRGB(0, 255, 0))
  local new13 = Font.new(new8.Family, new8.Weight, reg.slot4.FontStyle.Italic)
  local function fn113(arg1_199)
    arg1_199.FontFace = new13
    local v564 = reg.slot3
    v564("UIGradient", {Parent = arg1_199, Color = new12, Rotation = 90})
    return arg1_199
  end
  local function fn114(arg1_200, arg2_108, arg3_58)
    return ColorSequence.new({new10(0, arg1_200), new10(0.5, arg2_108), new10(1, arg3_58)})
  end
  local tbl144 = {GOLDEN = fn114(fromRGB(255, 250, 190), fromRGB(255, 204, 40), fromRGB(255, 140, 0)), SILVER = fn114(fromRGB(255, 255, 255), fromRGB(196, 214, 246), fromRGB(120, 146, 196)), RAINBOW = ColorSequence.new({new10(0, fromRGB(255, 70, 70)), new10(0.25, fromRGB(255, 220, 60)), new10(0.5, fromRGB(80, 255, 110)), new10(0.75, fromRGB(80, 170, 255)), new10(1, fromRGB(220, 90, 255))}), NITRO = fn114(fromRGB(255, 244, 130), fromRGB(255, 150, 30), fromRGB(255, 60, 20)), SCRAMBLED = fn114(fromRGB(240, 205, 255), fromRGB(186, 110, 255), fromRGB(130, 50, 240)), FRACTURED = fn114(fromRGB(255, 196, 186), fromRGB(255, 84, 84), fromRGB(200, 20, 40)), ENCHANTED = fn114(fromRGB(210, 255, 255), fromRGB(80, 225, 255), fromRGB(30, 150, 255)), BLOOM = fn114(fromRGB(255, 228, 244), fromRGB(255, 140, 210), fromRGB(240, 70, 160)), ["SPIRIT BLOOM"] = fn114(fromRGB(230, 255, 210), fromRGB(130, 245, 130), fromRGB(40, 190, 90)), PARASITE = fn114(fromRGB(236, 255, 180), fromRGB(150, 240, 70), fromRGB(70, 180, 30))}
  local function fn115(arg1_201)
    local v565, v566 = arg1_201.c or tbl2.a1, reg.slot3
    return v566("UIGradient", {Color = tbl144[arg1_201.n:gsub("^%+", "")] or fn114(v565:Lerp(tbl2.wh, 0.6), v565, v565:Lerp(fromRGB(0, 0, 0), 0.25)), Rotation = ((arg1_201.n == "RAINBOW") and 0) or 90})
  end
  local function fn116(arg1_202, arg2_109, arg3_59, arg4_30)
    for index44, child3 in ipairs(arg1_202:GetChildren()) do
      if child3:IsA("GuiObject") then
        child3:Destroy()
      end
    end
    for index45, item55 in ipairs(arg2_109 or {}) do
      local v567 = fn108({Parent = arg1_202, LayoutOrder = index45, Size = fn2(0, arg3_59), AutomaticSize = x, TextSize = arg4_30, Text = item55.n})
      v567:FindFirstChildOfClass("UIStroke").Thickness = arg4_30 / 5
      fn115(item55).Parent = v567
    end
  end
  local function fn117(arg1_203, arg2_110)
    local v568 = tbl6[arg2_110]
    arg1_203.ImageRectOffset = new3((v568 % 8) * 64, (v568 // 8) * 64)
  end
  local function fn118(arg1_204, arg2_111, arg3_60, arg4_31, arg5_16)
    local v569, tbl145, v570 = reg.slot6, {Parent = arg1_204, LayoutOrder = arg5_16}, reg.getHumanoid
    tbl145.Size = v570(1, 0, 0, arg3_60)
    arg5_16, arg1_204, v570 = reg.slot3, {}, reg.getHumanoid
    arg1_204.CellSize = v570(1 / arg2_111, ((-arg4_31 * (arg2_111 - 1)) / arg2_111) - 1, 0, arg3_60)
    arg1_204.CellPadding = fn2(arg4_31, arg4_31)
    v570 = reg.slot4
    arg1_204.SortOrder = v570.SortOrder.LayoutOrder
    vm:yT(tbl145, 0, arg5_16("UIGridLayout", arg1_204))
    return v569(tbl145)
  end
  local function fn119(arg1_205, arg2_112)
    local v571 = reg.slot6
    local v572 = v571({Parent = arg1_205, Size = fn2(0, arg2_112 + 8), AutomaticSize = x, BackgroundTransparency = 0.05, fn12(), fn13(0.2), fn16(0, 9)})
    return v572, fn108({Parent = v572, Size = fn2(0, arg2_112 + 8), AutomaticSize = x, TextSize = arg2_112, TextXAlignment = center})
  end
  local function fn120(arg1_206, arg2_113, arg3_61, arg4_32)
    arg1_206.BackgroundColor3 = arg3_61[1]
    arg1_206:FindFirstChildOfClass("UIStroke").Color = arg3_61[2]
    arg2_113.Text = arg4_32.rarity or ""
    fn107(arg2_113, arg4_32.grad)
    arg2_113.TextColor3 = ((arg4_32.grad and tbl2.wh) or arg4_32.color) or tbl2.tx
  end
  local function fn121(arg1_207, arg2_114)
    local keypoints = arg1_207.Keypoints
    for i6 = 2, #keypoints, 1 do
      if arg2_114 <= keypoints[i6].Time then
        local value3, value4, v573 = keypoints[i6 - 1].Value, keypoints[i6].Value, (arg2_114 - keypoints[i6 - 1].Time) / math.max(keypoints[i6].Time - keypoints[i6 - 1].Time, 0.0001)
        return value3:Lerp(value4, v573)
      end
    end
    return keypoints[#keypoints].Value
  end
  local tbl146 = {}
  local function fn122(arg1_208, arg2_115)
    local v574 = ((arg2_115.rarity == "ETERNAL") or (arg2_115.rarity == "DIVINE")) and arg2_115.grad
    if v574 then
      if math.abs(v574.Rotation) == 90 then
        if not (tbl146[v574]) then
          local v575, v576, tbl147 = ((v574.Rotation < 0) and 0.53) or 0, ((v574.Rotation < 0) and 1) or 0.5, {}
          for i7 = 0, 8, 1 do
            tbl147[#tbl147 + 1] = new10(i7 / 8, fn121(v574.Color, v575 + (((v576 - v575) * i7) / 8)))
          end
          v575 = reg.slot3
          tbl146[v574] = v575("UIGradient", {Color = ColorSequence.new(tbl147), Rotation = v574.Rotation})
        end
        v574 = tbl146[v574]
      else
      end
    else
    end
    fn107(arg1_208, v574 or nil)
  end
  tbl29.Showcase = function(arg1_209, arg2_116, arg3_62, arg4_33, arg5_17)
    local v577, w3, num13 = arg1_209.t.top or arg1_209.t, arg1_209.W, 364
    local v578, v579 = fn13(0.5), reg.slot6
    local v580 = v579({Parent = arg1_209.f, LayoutOrder = arg1_209.n + 1, Size = v8, AutomaticSize = y})
    arg1_209:Add(v580, "")
    local v581, tbl148, v582 = reg.slot6, {Parent = v580, Size = v8, AutomaticSize = y}, reg.slot9
    vm:yT(tbl148, 0, fn16(2, 14, 6), v582(8))
    v580, arg1_209 = v581(tbl148), reg.slot6
    tbl148, v579 = {Parent = v580}, reg.getHumanoid
    tbl148.Size = v579(1, 0, 0, 30)
    local v583, v584, tbl149, v585 = arg1_209(tbl148), reg.slot6, {Parent = v580, LayoutOrder = 1, Size = v8, AutomaticSize = y}, reg.slot9
    vm:yT(tbl149, 0, v585(14, nil, nil, horizontal))
    v580, arg1_209, tbl148, v585 = v584(tbl149), reg.slot6, {}, reg.slot6
    tbl148.Parent = v585({Parent = v580, Size = fn2(250, 370), fn16(3, 0)})
    tbl148.Size = v4
    tbl148.BackgroundTransparency = 0.45
    v582 = reg.slot9
    vm:yT(tbl148, 0, fn12(20), v578, fn16(9), v582(6, center2))
    local v586, tbl150, tbl151, v587 = arg1_209(tbl148), {}, {}, reg.getHumanoid
    tbl151.Size = v587(1, 0, 0, 145)
    tbl150.a = fn110(v586, tbl151, 14, {170, 126, 84})
    tbl150.a.live = true
    v584, arg1_209 = {Parent = tbl150.a.f, AnchorPoint = v6}, reg.getHumanoid
    v584.Position = arg1_209(0.5, 0, 0.5, 2)
    v584.Size = fn2(138, 138)
    v581 = reg.slot4
    v584.ScaleType = v581.ScaleType.Fit
    v584.ZIndex = 3
    tbl150.im = v23(v584)
    v581, v587, tbl149 = reg.slot6, {Parent = tbl150.a.f}, reg.slot7
    v587.AnchorPoint = tbl149
    v579 = reg.getHumanoid
    v587.Position = v579(1, -8, 0, 7)
    v587.Size = fn2(0, 0)
    arg1_209 = reg.slot4
    v587.AutomaticSize = arg1_209.AutomaticSize.XY
    v587.ZIndex = 5
    tbl148, arg1_209 = reg.slot9, reg.slot4
    vm:yT(v587, 0, tbl148(2, arg1_209.HorizontalAlignment.Right))
    tbl150.mu = v581(v587)
    tbl148, v584 = {Parent = v586, LayoutOrder = 1}, reg.getHumanoid
    tbl148.Size = v584(1, 0, 0, 24)
    tbl148.Text = "Pick an egg"
    tbl148.TextSize = 21
    tbl148.TextXAlignment = center
    tbl150.ti = fn108(tbl148)
    tbl150.rb, tbl150.ra = fn119(v586, 13)
    tbl150.rb.LayoutOrder = 2
    tbl148, v587 = {Parent = v586, LayoutOrder = 3}, reg.getHumanoid
    tbl148.Size = v587(1, 0, 0, 30)
    tbl148.TextSize = 26
    tbl148.TextXAlignment = center
    tbl150.va = fn113(fn108(tbl148))
    local v588, tbl152, v589, tbl153 = fn118(v586, 2, 34, 6, 4), {}, ipairs, {{"gauge", "Size"}, {"gem", "Weight"}}
    for it1_18, it2_17 in v589(tbl153) do
      v585 = reg.slot6
      v579 = v585({Parent = v588, LayoutOrder = it1_18, BackgroundTransparency = 0.55, BackgroundColor3 = fromRGB(0, 0, 0), fn12(10)})
      tbl149, v587 = {Parent = v579, AnchorPoint = new3(0, 0.5)}, reg.getHumanoid
      tbl149.Position = v587(0, 8, 0.5, 0)
      tbl149.Size = fn2(15, 15)
      tbl149.Image = it2_17[1]
      fn9(tbl149)
      v582, arg1_209 = {Parent = v579, Position = fn2(29, 3)}, reg.getHumanoid
      v582.Size = arg1_209(1, -34, 0, 16)
      v582.TextSize = 13
      tbl152[it1_18] = fn108(v582)
      tbl148, v584 = {Parent = v579, Position = fn2(29, 19)}, reg.getHumanoid
      tbl148.Size = v584(1, -34, 0, 11)
      tbl148.Text = it2_17[2]:upper()
      tbl148.FontFace = new6
      tbl148.TextSize = 8
      tbl148.TextTransparency = 0.45
      v20(tbl148)
    end
    tbl149, v585, v579 = reg.slot6, {Parent = v586, LayoutOrder = 5}, reg.getHumanoid
    v585.Size = v579(1, 0, 0, 22)
    v585.BackgroundTransparency = 0.55
    v585.BackgroundColor3 = fromRGB(0, 0, 0)
    v585.ClipsDescendants = true
    vm:yT(v585, 0, fn12(8))
    v584 = tbl149(v585)
    v582, arg1_209 = {Parent = v584, AnchorPoint = new3(0, 0.5)}, reg.getHumanoid
    v582.Position = arg1_209(0, 8, 0.5, 0)
    v582.Size = fn2(14, 14)
    v582.Image = "clock"
    tbl150.si = fn9(v582)
    v582, arg1_209 = {Parent = v584, Position = fn2(28, 0)}, reg.getHumanoid
    v582.Size = arg1_209(1, -36, 1, 0)
    v582.TextSize = 11
    tbl152[3] = fn108(v582)
    v587, v585 = {Parent = v584, AnchorPoint = new3(0, 1)}, reg.getHumanoid
    v587.Position = v585(0, 0, 1, 0)
    v585 = reg.getHumanoid
    v587.Size = v585(0, 0, 0, 3)
    tbl150.bf = v18(v587)
    tbl149, v588, tbl153, v589 = {}, reg.slot6, {Parent = v586, LayoutOrder = 6}, reg.getHumanoid
    tbl153.Size = v589(1, 0, 0, 34)
    tbl149.Parent = v588(tbl153)
    tbl149.Size = v4
    tbl149.BackgroundTransparency = 0
    v587, v589, v584, tbl153, v581 = fn12(12), fn14(tbl2.a1, tbl2.a2, 90), tbl2.a1, tbl2.wh, reg.slot9
    vm:yT(tbl149, 0, v587, v589, fn13(0.55, v584:Lerp(tbl153, 0.5)), v581(7, center2, center3, horizontal))
    local v590 = v19(tbl149)
    local v591 = fn9({Parent = v590, Size = fn2(17, 17), Image = "hand", ImageColor3 = tbl2.on})
    local v592 = v20({Parent = v590, LayoutOrder = 1, Size = fn2(0, 34), AutomaticSize = x, FontFace = new5, TextSize = 15, TextColor3 = tbl2.on})
    fn27(v590)
    local v593
    fn25(v590, function()
      if v593 then
        fn22(arg5_17, v593)
      end
    end)
    tbl149, v589, v585 = reg.slot6, {Parent = v583}, reg.getHumanoid
    v589.Size = v585(1, -128, 1, 0)
    v589.BackgroundTransparency = 0.93
    vm:yT(v589, 0, fn12(), fn13(0.9), fn16(3))
    v587, v579, v585, tbl148 = tbl149(v589), reg.slot6, {Parent = v583}, reg.slot7
    v585.AnchorPoint = tbl148
    v588 = reg.getHumanoid
    v585.Position = v588(1, 0, 0, 0)
    v585.Size = fn2(120, 30)
    v585.BackgroundTransparency = 0.8
    v585.BackgroundColor3 = fromRGB(60, 210, 80)
    v589 = reg.slot9
    vm:yT(v585, 0, fn12(), fn13(0.5, fromRGB(96, 238, 92)), v589(0, center2, center3, horizontal))
    local v594, tbl154, v595 = fn113(fn108({Parent = v579(v585), Size = fn2(0, 30), AutomaticSize = x, Text = "--", TextSize = 14})), {Parent = v587}, reg.getHumanoid
    tbl154.Size = v595(1 / #arg3_62, 0, 1, 0)
    vm:yT(tbl154, 0, fn12(), fn14(tbl2.a1, tbl2.a2))
    local v596, tbl155, num14 = v18(tbl154), {}, 1
    local v597, tbl156, v598 = fn118(v587, #arg3_62, 24, 0), {}, ipairs
    for it1_19, it2_18 in v598(arg3_62) do
      tbl148, v587 = {Parent = v597, LayoutOrder = it1_19}, reg.slot9
      vm:yT(tbl148, 0, v587(5, center2, center3, horizontal))
      tbl153 = v19(tbl148)
      tbl156[it1_19] = fn9({Parent = tbl153, Size = fn2(14, 14), Image = it2_18[2], ImageColor3 = ((it1_19 == 1) and tbl2.dk) or tbl2.tx})
      tbl155[it1_19] = v20({Parent = tbl153, LayoutOrder = 1, Size = fn2(0, 24), AutomaticSize = x, Text = it2_18[1]:upper(), FontFace = new6, TextSize = 10, TextColor3 = ((it1_19 == 1) and tbl2.dk) or tbl2.tx})
      fn25(tbl153, function()
        tbl155[num14].TextColor3, tbl156[num14].ImageColor3 = tbl2.tx, tbl2.tx
        num14 = it1_19
        tbl155[it1_19].TextColor3, tbl156[it1_19].ImageColor3, tbl156[it1_19].Size = tbl2.dk, tbl2.dk, fn2(20, 20)
        fn18(tbl156[it1_19], {Size = fn2(14, 14)}, 0.45, back)
        local tbl157, v599 = {}, reg.getHumanoid
        tbl157.Position = v599((it1_19 - 1) / #arg3_62, 0, 0, 0)
        fn18(v596, tbl157, 0.3)
        fn22(arg4_33, it2_18[1])
      end)
    end
    v584, v585, tbl148 = reg.slot6, {Parent = v580, LayoutOrder = 1}, reg.getHumanoid
    v585.Size = tbl148(1, -264, 0, 370)
    local v600 = v584(v585)
    local v601 = v22({Parent = v600, Size = v4, ScrollingEnabled = userInputService.TouchEnabled, ScrollBarThickness = 3, ScrollBarImageColor3 = tbl2.wh, ScrollBarImageTransparency = 0.6})
    w3.nest[v601] = v577
    w3:Grip(v601, v600)
    local v602 = fn118(v601, arg2_116, 178, 8)
    arg2_116 = nil
    arg2_116, v602.Position, v602.Size = reg.getHumanoid, fn2(3, 3), reg.getHumanoid(1, -16, 0, 0)
    v602.AutomaticSize = y
    fn16(0, 0, 3, 0).Parent = v602
    v577, v582 = {Parent = v601}, reg.getHumanoid
    v577.Size = v582(1, 0, 0, 40)
    v577.Text = "No eggs yet"
    v577.TextSize = 12
    v577.TextTransparency = 0.45
    v577.TextXAlignment = center
    local v603, tbl158, tbl159, tbl160 = v20(v577), {}, {}, {}
    local function fn123(arg1_210)
      local v604 = (v593 ~= arg1_210) and (((if v593 then not arg1_210 else not v593) or (v593.id ~= arg1_210.id)) or (v593.muts ~= arg1_210.muts))
      v593 = arg1_210
      arg1_210 = arg1_210 or {}
      local v605 = fn109(arg1_210)
      if v604 ~= false then
        fn111(tbl150.a, v605)
        fn120(tbl150.rb, tbl150.ra, v605, arg1_210)
        fn122(tbl150.ti, arg1_210)
        v586.BackgroundColor3, v578.Color = v605[1], v605[2]
      end
      if tbl150.m ~= arg1_210.muts then
        tbl150.m = arg1_210.muts
        fn116(tbl150.mu, arg1_210.muts, 20, 13)
      end
      tbl150.im.Image, tbl150.ti.Text, tbl150.va.Text = arg1_210.image or "", arg1_210.title or "Pick an egg", arg1_210.value or "--"
      local v606, tbl161 = ipairs, {arg1_210.size, arg1_210.weight, arg1_210.status}
      for it1_20, it2_19 in v606(tbl161) do
        tbl152[it1_20].Text = it2_19 or "--"
      end
      v606 = (((arg1_210.kind == "Ready") and {"sparkles", tbl2.mint}) or ((arg1_210.kind == "Growing") and {"clock", tbl2.wh})) or {"egg", v605[3]}
      fn117(tbl150.si, v606[1])
      tbl150.si.ImageColor3, tbl152[3].TextColor3 = v606[2], v606[2]
      v606 = nil
      v606, tbl150.bf.Size, tbl150.bf.BackgroundColor3 = reg.getHumanoid, reg.getHumanoid(((arg1_210.kind == "Growing") and arg1_210.pct) or 0, 0, 0, 3), v605[3]
      v590.Parent.Visible, v592.Text = arg1_210.label ~= nil, arg1_210.label or ""
      fn117(v591, ({["Hatch now"] = "sparkles", ["Go to egg"] = "pin"})[arg1_210.label] or "hand")
    end
    local function fn124()
      local y5, y6 = v601.AbsolutePosition.Y, v601.AbsoluteSize.Y
      for key18, item56 in next, tbl158, nil do
        key18 = item56.c.AbsolutePosition.Y - y5
        local v607 = (key18 > (-item56.c.AbsoluteSize.Y - 60)) and (key18 < (y6 + 60))
        if item56.box.Visible ~= v607 then
          item56.box.Visible = v607
        end
      end
    end
    fn4(v601:GetPropertyChangedSignal("CanvasPosition"), fn124)
    fn4(v601:GetPropertyChangedSignal("AbsoluteSize"), fn124)
    local function fn125()
      local remove = table.remove(tbl159)
      if remove then
        remove.c.Visible = true
        return remove
      end
      local tbl162 = {s = fn13(0.1)}
      tbl162.c = v19({Parent = v602, BackgroundTransparency = 0.3, fn12(18), tbl162.s})
      local v608 = reg.slot6
      tbl162.box = v608({Parent = tbl162.c, Size = v4})
      local box, tbl163, v609 = tbl162.box, {Position = fn2(5, 5)}, reg.getHumanoid
      tbl163.Size = v609(1, -10, 0, 108)
      tbl162.a = fn110(box, tbl163, 14, {118, 86, 56})
      v609, v608 = {Parent = tbl162.a.f, AnchorPoint = v6, Position = v5, Size = fn2(96, 96)}, reg.slot4
      v609.ScaleType = v608.ScaleType.Fit
      v609.ZIndex = 3
      tbl162.im = v23(v609)
      tbl162.rk = fn108({Parent = tbl162.a.f, Position = fn2(7, 5), Size = fn2(30, 15), TextSize = 12, ZIndex = 5})
      box, tbl163 = {Parent = tbl162.a.f, AnchorPoint = new3(0, 1)}, reg.getHumanoid
      box.Position = tbl163(0, 7, 1, -6)
      box.Size = fn2(64, 15)
      box.TextSize = 12
      box.ZIndex = 5
      tbl162.tm = fn108(box)
      box, tbl163 = {Parent = tbl162.a.f, AnchorPoint = new3(1, 1)}, reg.getHumanoid
      box.Position = tbl163(1, -7, 1, -6)
      box.Size = fn2(48, 15)
      box.TextSize = 11
      v608 = reg.slot4
      box.TextXAlignment = v608.TextXAlignment.Right
      box.ZIndex = 5
      tbl162.sz = fn108(box)
      v609, tbl163, v608 = reg.slot6, {Parent = tbl162.a.f}, reg.slot7
      tbl163.AnchorPoint = v608
      box = reg.getHumanoid
      tbl163.Position = box(1, -5, 0, 4)
      tbl163.Size = fn2(0, 0)
      v608 = reg.slot4
      tbl163.AutomaticSize = v608.AutomaticSize.XY
      tbl163.ZIndex = 5
      box, v608 = reg.slot9, reg.slot4
      vm:yT(tbl163, 0, box(1, v608.HorizontalAlignment.Right))
      tbl162.mt = v609(tbl163)
      box, v609 = {Parent = tbl162.box, Position = fn2(8, 117)}, reg.getHumanoid
      box.Size = v609(1, -16, 0, 18)
      box.TextSize = 14
      box.TextXAlignment = center
      tbl162.ti = fn108(box)
      v608, tbl163, box = reg.slot6, {Parent = tbl162.box, Position = fn2(8, 137)}, reg.getHumanoid
      tbl163.Size = box(1, -16, 0, 17)
      v609 = reg.slot9
      vm:yT(tbl163, 0, v609(0, center2))
      v609 = v608(tbl163)
      tbl162.rb, tbl162.ra = fn119(v609, 10)
      tbl162.rb.BackgroundTransparency, tbl162.rb:FindFirstChildOfClass("UIStroke").Enabled = 1, false
      tbl162.rb:FindFirstChildOfClass("UIPadding"):Destroy()
      box, tbl163 = {Parent = tbl162.box, Position = fn2(8, 156)}, reg.getHumanoid
      box.Size = tbl163(1, -16, 0, 17)
      box.TextSize = 14
      box.TextXAlignment = center
      tbl162.va = fn113(fn108(box))
      v609, box = {Parent = tbl162.a.f, AnchorPoint = new3(0, 1)}, reg.getHumanoid
      v609.Position = box(0, 0, 1, 0)
      tbl163 = reg.getHumanoid
      v609.Size = tbl163(0, 0, 0, 3)
      v609.ZIndex = 5
      tbl162.bf = v18(v609)
      fn25(tbl162.c, function()
        if not (tbl162.it) then
          return
        end
        tbl160.sel = tbl162.it.id
        for key19, item57 in next, tbl158, nil do
          item57.s.Thickness = ((item57.it.id == tbl160.sel) and 2.5) or 1.2
        end
        fn123(tbl162.it)
      end)
      return tbl162
    end
    tbl160.Set = function(arg1_211, arg2_117, arg3_63, arg4_34)
      v603.Visible, v594.Text = #arg2_117 == 0, arg4_34 or "--"
      for index46, item58 in ipairs(arg3_62) do
        tbl155[index46].Text = item58[1]:upper() .. (((arg3_63 and arg3_63[item58[1]]) and ("  " .. arg3_63[item58[1]])) or "")
      end
      arg3_63, arg1_211, arg4_34 = {}, ipairs
      for it1_21, it2_20 in arg1_211(arg2_117) do
        local v610 = tbl158[it2_20.id] or fn125()
        tbl158[it2_20.id], arg3_63[it2_20.id] = v610, true
        v610.it = it2_20
        v610.c.LayoutOrder = it1_21
        local v611 = fn109(it2_20)
        if v610.p ~= v611 then
          v610.p = v611
          fn111(v610.a, v611)
          fn120(v610.rb, v610.ra, v611, it2_20)
          fn122(v610.ti, it2_20)
          v610.c.BackgroundColor3, v610.s.Color = v611[1], v611[2]
        end
        v610.s.Thickness = ((it2_20.id == tbl160.sel) and 2.5) or 1.2
        if v610.im.Image ~= it2_20.image then
          v610.im.Image = it2_20.image or ""
        end
        v610.rk.Text, v610.ti.Text, v610.va.Text, v610.tm.Text, v610.sz.Text = "#" .. (it2_20.rank or it1_21), it2_20.title, it2_20.value, it2_20.time or "", it2_20.size or ""
        it1_21 = ""
        for index47, item59 in ipairs(it2_20.muts or {}) do
          it1_21 ..= item59.n .. ","
        end
        if v610.mk ~= it1_21 then
          v610.mk = it1_21
          fn116(v610.mt, it2_20.muts, 14, 9)
        end
        it1_21 = nil
        it1_21, v610.bf.Size, v610.bf.BackgroundColor3 = reg.getHumanoid, reg.getHumanoid(it2_20.pct or 0, 0, 0, 3), (it2_20.ready and tbl2.mint) or v611[3]
        arg4_34 = if it2_20.id == tbl160.sel then it2_20 else arg4_34
      end
      for key20, item60 in next, tbl158, nil do
        if not (arg3_63[key20]) then
          item60.c.Visible = false
          item60.it = nil
          item60.p = nil
          item60.mk = nil
          tbl158[key20], tbl159[#tbl159 + 1] = nil, item60
        end
      end
      task.defer(fn124)
      arg4_34 = arg4_34 or arg2_117[1]
      tbl160.sel = arg4_34 and arg4_34.id
      fn123(arg4_34)
    end
    tbl160.Card = function(arg1_212, arg2_118)
      v586.Parent.Visible = arg2_118
      arg1_212 = reg.getHumanoid
      v600.Size = arg1_212(1, (arg2_118 and -264) or 0, 0, num13 + 6)
    end
    fn123(nil)
    return tbl160
  end
  tbl29.Order = function(arg1_213, arg2_119, arg3_64, arg4_35)
    local tbl164, v612 = {Value = table.clone(arg3_64)}, reg.slot6
    local tbl165, v613 = {Parent = arg1_213.f, LayoutOrder = arg1_213.n + 1}, reg.getHumanoid
    tbl165.Size = v613(1, 0, 0, (#arg3_64 * 34) + 12)
    v613 = v612(tbl165)
    arg1_213:Add(v613, arg2_119, true)
    local tbl166 = {}
    v612 = #arg3_64
    for i8 = 1, v612, 1 do
      local v614, tbl167, v615 = reg.slot6, {Parent = v613, Position = fn2(14, 6 + ((i8 - 1) * 34))}, reg.getHumanoid
      tbl167.Size = v615(1, -28, 0, 30)
      tbl167.BackgroundTransparency = 0.95
      vm:yT(tbl167, 0, fn12(9))
      v615 = v614(tbl167)
      v20({Parent = v615, Position = fn2(10, 0), Size = fn2(20, 30), Text = tostring(i8), FontFace = new7, TextSize = 12, TextTransparency = 0.45})
      tbl165, tbl167 = {Parent = v615, Position = fn2(34, 0)}, reg.getHumanoid
      tbl165.Size = tbl167(1, -110, 1, 0)
      tbl165.FontFace = new5
      tbl165.TextSize = 13
      tbl166[i8] = v20(tbl165)
      tbl167, v614 = ipairs, {-1, 1}
      for it1_22, it2_21 in tbl167(v614) do
        local tbl168, v616 = {Parent = v615, AnchorPoint = v7}, reg.getHumanoid
        tbl168.Position = v616(1, ((it1_22 == 1) and -38) or -6, 0.5, 0)
        tbl168.Size = fn2(28, 24)
        tbl168.BackgroundTransparency = 0.9
        vm:yT(tbl168, 0, fn12(7), fn10("down", 14))
        v616 = v19(tbl168)
        v616:FindFirstChildWhichIsA("ImageLabel").Rotation = ((it2_21 < 0) and 180) or 0
        fn27(v616)
        fn25(v616, function()
          local value5, v617 = tbl164.Value, i8 + it2_21
          if v617 < 1 then
            return
          elseif v617 > #value5 then
            return
          end
          value5[i8], value5[v617] = value5[v617], value5[i8]
          tbl164:Set(value5)
        end)
      end
    end
    tbl164.Set = function(arg1_214, arg2_120, arg3_65)
      local tbl169, tbl170 = {}, {}
      for index48, item61 in ipairs(((type(arg2_120) == "table") and arg2_120) or {}) do
        if table.find(arg3_64, item61) then
          if not (tbl169[item61]) then
            tbl169[item61] = true
            tbl170[#tbl170 + 1] = item61
          end
        end
      end
      for index49, item62 in ipairs(arg3_64) do
        if not (tbl169[item62]) then
          arg1_214 = #tbl170 + 1
          for i9 = index49 + 1, #arg3_64, 1 do
            arg2_120 = table.find(tbl170, arg3_64[i9])
            if arg2_120 then
              arg1_214 = arg2_120
              break
            end
          end
          table.insert(tbl170, arg1_214, item62)
        end
      end
      tbl164.Value = tbl170
      for index50, item63 in ipairs(tbl166) do
        item63.Text = tbl170[index50]
      end
      if not (arg3_65) then
        fn22(arg4_35, tbl170)
      end
    end
    tbl164:Set(arg3_64, true)
    return arg1_213:Reg(arg2_119, tbl164)
  end
  tbl29.Text = function(arg1_215, arg2_121)
    local v618 = v20({Size = v8, AutomaticSize = y, Text = arg2_121, TextSize = 12, TextTransparency = 0.22, TextWrapped = true})
    arg1_215.tn = (arg1_215.tn or 0) + 1
    local v619, tbl171, v620 = reg.slot6, {Parent = arg1_215.f, Size = v8, AutomaticSize = y, LayoutOrder = -1000 + arg1_215.tn, Visible = arg2_121 ~= ""}, reg.slot6
    vm:yT(tbl171, 0, v620({Size = v8, AutomaticSize = y, fn16(12, 14), v618}))
    local v621 = v619(tbl171)
    if arg1_215.n >= arg1_215.tn then
      v620 = reg.getHumanoid
      fn17(v621, v620(0, 14, 1, -1), reg.getHumanoid(1, -28, 0, 1))
    end
    arg1_215.n = arg1_215.n + 1
    return {Set = function(arg1_216, arg2_122)
      v618.Text, v621.Visible = arg2_122, arg2_122 ~= ""
    end}
  end
  reg.slot2.Notify = function(arg1_217, arg2_123, arg3_66, arg4_36, arg5_18)
    arg1_217 = reg.slot2
    local w4 = arg1_217.W
    if not (w4) then
      return
    end
    arg5_18 = arg5_18 or 4
    local v622, v623 = fn39(arg4_36)
    arg1_217 = reg.slot6
    local v624, v625 = arg1_217({Parent = w4.nt, Size = v8, AutomaticSize = y}), reg.slot6
    arg1_217, w4 = {Position = fn2(42, 0)}, reg.getHumanoid
    arg1_217.Size = w4(1, -42, 0, 0)
    arg1_217.AutomaticSize = y
    w4 = reg.slot9
    local v626, tbl172, v627 = w4(2), {}, reg.getHumanoid
    tbl172.Size = v627(1, 0, 0, 17)
    tbl172.Text = arg2_123 or ""
    tbl172.FontFace = new5
    vm:yT(arg1_217, 0, v626, v20(tbl172))
    arg4_36 = v625(arg1_217)
    if arg3_66 then
      if arg3_66 ~= "" then
        v20({Parent = arg4_36, LayoutOrder = 1, Size = v8, AutomaticSize = y, Text = arg3_66, TextSize = 12, TextTransparency = 0.3, TextWrapped = true})
      end
    end
    v627, v625, arg2_123 = reg.slot6, {AnchorPoint = new3(0, 1)}, reg.getHumanoid
    v625.Position = arg2_123(0, 0, 1, 10)
    w4 = reg.getHumanoid
    v625.Size = w4(1, 0, 0, 3)
    v625.BackgroundTransparency = 0.2
    v625.BackgroundColor3 = v622
    vm:yT(v625, 0, fn12())
    v626, arg1_217, arg3_66, arg2_123 = v627(v625), reg.slot6, {Parent = v624, Position = fn2(360, 0), Size = v8, AutomaticSize = y, BackgroundTransparency = 0.06, BackgroundColor3 = fromRGB(20, 22, 46)}, reg.slot6
    vm:yT(arg3_66, 0, fn12(16), fn13(0.86), fn16(14, 14, 18), arg4_36, v626, arg2_123({Size = fn2(30, 30), BackgroundTransparency = 0.8, BackgroundColor3 = v622, fn12(10), fn10(v623, 16, v622)}))
    local v628, tbl173, v629 = arg1_217(arg3_66), {}, reg.getHumanoid
    tbl173.Position = v629()
    fn18(v628, tbl173, 0.5)
    fn18(v626, {Size = fn2(0, 3)}, arg5_18, reg.slot4.EasingStyle.Linear)
    task.delay(arg5_18, function()
      fn18(v628, {Position = fn2(360, 0)}, 0.35, quint, reg.slot4.EasingDirection.In)
      task.delay(0.4, v624.Destroy, v624)
    end)
  end
  reg.slot18 = function()
    local v630 = reg.localPlayer
    local cond8, v631 = v630.GameId ~= 0
    if cond8 then
      v630 = reg.localPlayer
      v631 = v630.GameId
    else
      v631 = cond8
    end
    cond8 = nil
    if v631 then
      cond8 = v631
    else
      v630 = reg.localPlayer
      cond8 = v630.PlaceId
    end
    v630 = reg.slot2
    local cond9, v632 = v630.Id ~= "Venyx"
    if cond9 then
      v630 = reg.slot2
      v632 = "/" .. v630.Id
    else
      v632 = cond9
    end
    return "Venyx/" .. (cond8 .. (v632 or ""))
  end
  reg.isBeforeSeparation = function()
    local v633 = reg.slot18
    return v633() .. ("/" .. localPlayer.UserId)
  end
  reg.slot13 = function(arg1_218)
    local v634 = reg.isBeforeSeparation
    return v634() .. ("/" .. (arg1_218 .. ".json"))
  end
  local qT3 = vm:QT(5, 6, {[10] = reg}, vm2, vm3, nil)
  reg.slot15 = qT3
  local qT4 = vm:QT(7, 6, {[10] = reg}, vm2, vm3, nil)
  reg.slot14 = qT4
  reg.slot12 = function(arg1_219)
    if arg1_219 == nil then
      return {z = 1}
    end
    return (((typeof(arg1_219) == "Color3") and {c = arg1_219:ToHex()}) or ((typeof(arg1_219) == "EnumItem") and {k = arg1_219.Name})) or arg1_219
  end
  local function fn126(arg1_220)
    if type(arg1_220) ~= "table" then
      return arg1_220
    end
    if arg1_220.z then
      return nil
    end
    local v635, v636 = arg1_220.c and Color3.fromHex(arg1_220.c)
    if v635 then
      v636 = v635
    else
      local k2 = arg1_220.k
      if k2 then
        local v637 = reg.slot4
        v636 = v637.KeyCode[arg1_220.k]
      else
        v636 = k2
      end
    end
    return v636 or arg1_220
  end
  local function fn127(arg1_221, arg2_124)
    local v638, v639, v640, v641 = reg.slot10, reg.slot12, reg.slot10, reg.slot12
    return v638:JSONEncode(v639(arg1_221)) == v640:JSONEncode(v641(arg2_124))
  end
  reg.getRoot = function(arg1_222)
    local v642 = reg.slot2
    v642.busy = true
    v642 = next
    for key21, item64 in v642, arg1_222, nil do
      local v643 = reg.slot2
      local v644, v645 = v643.Keys[key21]
      if v644 then
        v645 = v644
      else
        v643 = reg.slot2
        v645 = v643.Opt[key21]
      end
      v643 = nil
      if v645 then
        v643 = v645
      else
        v644 = reg.slot2
        v643 = v644.Alias[key21]
      end
      item64 = fn126(item64)
      if v643 then
        if not (v643.Skip) then
          if not (fn127(item64, v643.Value)) then
            pcall(v643.Set, v643, item64)
          end
        end
      end
    end
    arg1_222 = reg.slot2
    arg1_222.busy = false
  end
  reg.slot2.Persist = function(arg1_223)
    local v646, v647 = reg.slot14, reg.isBeforeSeparation
    v646(v647() .. "/_state.json", reg.slot11)
  end
  reg.slot2.Dir = reg.isBeforeSeparation
  reg.slot2.Rd = reg.slot15
  reg.slot2.Wr = reg.slot14
  reg.slot2.Save = vm:QT(8, 9, {[11] = reg, [2] = reg, [12] = reg, [13] = reg, [14] = reg}, vm2, vm3, nil)
  reg.slot2.Load = vm:QT(10, 11, {[15] = reg, [13] = reg, [16] = reg, [11] = reg, [2] = reg}, vm2, vm3, nil)
  reg.slot2.Configs = vm:QT(12, 13, {[17] = reg}, vm2, vm3, nil)
  reg.slot2.Delete = vm:QT(14, 15, {[15] = reg, [13] = reg, [14] = reg, [17] = reg, [11] = reg, [2] = reg}, vm2, vm3, nil)
  reg.slot2.Trash = function(arg1_224)
    local tbl174 = {}
    pcall(function()
      local v648 = reg.isBeforeSeparation
      for index51, item65 in ipairs(listfiles(v648() .. "/_trash")) do
        tbl174[#tbl174 + 1] = item65:match("([^/\\]+)%.json$")
      end
    end)
    table.sort(tbl174)
    return tbl174
  end
  reg.slot2.Restore = vm:QT(16, 17, {[17] = reg, [15] = reg, [2] = reg}, vm2, vm3, nil)
  reg.slot2.Name = function(arg1_225, arg2_125)
    arg2_125 = tostring(arg2_125 or ""):match("^%s*(.-)%s*$")
    if arg2_125 ~= "" then
      if not (arg2_125:match("^[%w _%-]+$")) then
        return nil, "Use letters, numbers, spaces, - or _"
      end
    end
    if #arg2_125 > 32 then
      return nil, "32 characters at most"
    end
    arg1_225 = ((arg2_125 ~= "") and arg2_125) or "Config"
    arg2_125 = if arg2_125 == "" then "Config 1" else arg2_125
    local num15 = 2
    while true do
      local v649, v650 = isfile
      if v649 then
        local v651
        v651, v650 = reg.slot13, isfile(reg.slot13(arg2_125))
      else
        v650 = v649
      end
      if not v650 then
        break
      end
      arg2_125, num15 = arg1_225 .. (" " .. num15), num15 + 1
    end
    return arg2_125
  end
  reg.slot2.Export = vm:QT(18, 19, {[10] = reg, [15] = reg, [13] = reg}, vm2, vm3, nil)
  reg.slot2.Import = vm:QT(20, 21, {[10] = reg, [2] = reg, [13] = reg}, vm2, vm3, nil)
  reg.slot2.Dirty = function(arg1_226)
    local v652, v653 = reg.slot2, reg.slot2
    v652.tok = (v653.tok or 0) + 1
    arg1_226 = reg.slot2
    local tok = arg1_226.tok
    task.delay(1, function()
      local v654 = reg.slot2
      if v654.tok == tok then
        local v655 = reg.slot2
        v655:Save()
      end
    end)
  end
  reg.slot2.Reset = function(arg1_227)
    arg1_227 = reg.slot2
    arg1_227.busy = true
    arg1_227 = reg.slot2
    for key22, item66 in next, arg1_227.Keys, nil do
      if not (item66.Skip) then
        if not (fn127(item66.Def, item66.Value)) then
          pcall(item66.Set, item66, ((type(item66.Def) == "table") and table.clone(item66.Def)) or item66.Def)
        end
      end
    end
    arg1_227 = reg.slot2
    arg1_227.busy = false
    arg1_227 = reg.slot2
    arg1_227:Save()
  end
  reg.slot2.Off = function(arg1_228)
    local v656, num16 = reg.slot2, 0
    for key23, item67 in next, v656.Keys, nil do
      if item67.Kind == "toggle" then
        if item67.Value then
          if item67.Skip then
          else
            item67:Set(false)
            num16 += 1
          end
        else
        end
      else
      end
    end
    return num16
  end
  reg.slot2.Theme = function(arg1_229, arg2_126)
    arg1_229 = nil
    for index52, item68 in ipairs(tbl3) do
      arg1_229 = if item68[1] == arg2_126 then item68 else arg1_229
    end
    if not arg1_229 then
      return
    end
    local v657 = reg.slot2
    local w5, v658 = v657.W, reg.slot2
    if v658.th ~= arg2_126 then
      v657 = reg.slot2
      v657.th = arg2_126
      local tbl175, tbl176, tbl177 = {w1 = arg1_229[2], w2 = arg1_229[3], a1 = arg1_229[4], a2 = arg1_229[5], sky = arg1_229[4]:Lerp(tbl2.wh, 0.2), g1 = arg1_229[5]:Lerp(tbl2.wh, 0.35), g2 = arg1_229[4], val = arg1_229[5]:Lerp(tbl2.wh, 0.7), pn = arg1_229[2]:Lerp(arg1_229[3], 0.55), bg = arg1_229[2]:Lerp(arg1_229[3], 0.75), on = arg1_229[6] or fromRGB(255, 255, 254)}, {}, {0.35, 0.4, 0.5}
      for index53, item69 in ipairs(tbl177) do
        tbl176[tbl2.a1:Lerp(tbl2.wh, item69):ToHex()] = tbl175.a1:Lerp(tbl2.wh, item69)
      end
      tbl176[tbl2.sky:Lerp(tbl2.wh, 0.55):ToHex()] = tbl175.sky:Lerp(tbl2.wh, 0.55)
      for key24, item70 in next, tbl175, nil do
        tbl176[tbl2[key24]:ToHex()] = item70
        tbl2[key24] = item70
      end
      tbl176[tbl2.wh:ToHex()], tbl176[tbl2.tx:ToHex()] = nil, nil
      local function fn128(arg1_230)
        return tbl176[arg1_230:ToHex()]
      end
      tbl177, tbl175 = ipairs, {w5 and w5.Gui, (w5 and w5.nt) and w5.nt.Parent}
      for it1_23, it2_22 in tbl177(tbl175) do
        for index54, child4 in ipairs((it2_22 and it2_22:GetDescendants()) or {}) do
          if not (child4:FindFirstAncestor("VenyxThemes") or (child4.Parent == w5.bg)) then
            if child4:IsA("GuiObject") then
              child4.BackgroundColor3 = fn128(child4.BackgroundColor3) or child4.BackgroundColor3
              if (child4:IsA("TextLabel") or child4:IsA("TextButton")) or child4:IsA("TextBox") then
                child4.TextColor3 = fn128(child4.TextColor3) or child4.TextColor3
              end
              if child4:IsA("ImageLabel") or child4:IsA("ImageButton") then
                child4.ImageColor3 = fn128(child4.ImageColor3) or child4.ImageColor3
              end
            elseif child4:IsA("UIStroke") then
              child4.Color = fn128(child4.Color) or child4.Color
            elseif child4:IsA("UIGradient") then
              index54 = {}
              for index55, item71 in ipairs(child4.Color.Keypoints) do
                index54[index55] = ColorSequenceKeypoint.new(item71.Time, fn128(item71.Value) or item71.Value)
              end
              child4.Color = ColorSequence.new(index54)
            end
          end
        end
      end
    end
    v657 = reg.slot11
    v657.Theme = arg2_126
    if w5 then
      w5:Tint()
    end
    for key25, item72 in next, (w5 and w5.marks) or {}, nil do
      fn18(item72[1], {Transparency = ((key25 == arg2_126) and 0.3) or 0.86, Color = ((key25 == arg2_126) and arg1_229[4]) or tbl2.wh}, 0.2)
      v658, v657 = item72[2], {}
      v657.ImageTransparency = ((key25 == arg2_126) and 0) or 1
      fn18(v658, v657, 0.2)
    end
    w5 = reg.slot2
    w5:Persist()
  end
  reg.slot2.Boot = vm:QT(22, 23, {[15] = reg, [17] = reg, [18] = reg, [14] = reg, [11] = reg, [19] = reg, [13] = reg, [2] = reg}, vm2, vm3, nil)
  return reg.slot2
end)()
-- ===== end UI library =====

local vm2, vm5 = nil, nil -- VM-internal values passed to vm:QT (unused)

local reg = {}
local v2 = game
reg.game = v2
local function fn(arg1_3)
  local v3 = reg.game
  return v3:GetService(arg1_3)
end
local players = fn("Players")
local replicatedStorage = fn("ReplicatedStorage")
local runService = fn("RunService")
reg.runService = runService
local teleportService = fn("TeleportService")
local httpService = fn("HttpService")
reg.httpService = httpService
local localPlayer = players.LocalPlayer
reg.localPlayer = localPlayer
local networking = replicatedStorage:WaitForChild("Packages"):WaitForChild("Networking")
local new = Vector3.new
reg.vec3 = new
local new2 = CFrame.new
reg.cframeNew = new2
local zero = Vector3.zero
reg.zeroVec = zero
local heartbeat = reg.runService.Heartbeat
local v4 = (getgenv and getgenv()) or _G
if v4.VenyxSAE then
  pcall(v4.VenyxSAE)
end
local flag, tbl2, tbl3 = true, {}, {cleanup = {}}
reg.alive = flag
reg.state = tbl3
local function fn2(arg1_4, arg2_3)
  local conn = arg1_4:Connect(arg2_3)
  tbl2[#tbl2 + 1] = conn
  return conn
end
reg.heartbeatWait = function()
  return heartbeat:Wait()
end
local function fn3(arg1_5, arg2_4)
  local instance, v5 = Instance.new(arg1_5), reg.httpService
  instance.Name = v5:GenerateGUID(false):gsub("-", ""):sub(1, 14)
  for key, item in next, arg2_4, nil do
    if key ~= "Parent" then
      instance[key] = item
    end
  end
  instance.Parent = arg2_4.Parent
  return instance
end
local tbl4 = {Egg = "Client.EggState", Assets = "Data.Assets", Mut = "Shared.Modules.Mutations", Save = "Shared.Save", Cycle = "Shared.Util.AreaEggCycle", Wall = "Client.AreaEggResetWall", Plot = "Client.PlotState", Rec = "Shared.Util.EggRecords", Fuse = "Shared.Util.FuseKernel", Bases = "Data.Bases", Tread = "Data.Treadmills", Trails = "Data.Trails", Gears = "Data.Gears", Areas = "Data.Areas", Wisp = "Data.WispQuests", Cat = "Shared.Modules.ButterflyCatalog", Fmt = "Packages.FormatNumber.Simple"}
local v8 = setmetatable({}, {__index = function(arg1_6, arg2_5)
  local v6 = replicatedStorage
  for it1 in tbl4[arg2_5]:gmatch("[^.]+") do
    v6 = v6 and (v6:FindFirstChild(it1))
  end
  local ok, v7 = pcall(require, v6)
  if ok then
    if v7 then
      rawset(arg1_6, arg2_5, v7)
      return v7
    end
  end
end})
reg.modules = v8
reg.invokeRemote = function(arg1_7, ...)
  local findFirstChild = networking:FindFirstChild(arg1_7)
  if not (findFirstChild) then
    return false
  end
  return pcall(findFirstChild.InvokeServer, findFirstChild, ...)
end
local function fn4(arg1_8, ...)
  local findFirstChild2 = networking:FindFirstChild(arg1_8)
  if findFirstChild2 then
    pcall(findFirstChild2.FireServer, findFirstChild2, ...)
  end
end
reg.callModule = function(arg1_9, arg2_6, ...)
  local v9 = reg.modules
  local v10 = v9[arg1_9]
  if v10 then
    if not (v10[arg2_6]) then
      return nil
    end
  else
    return nil
  end
  local ok2, v11, v12 = pcall(v10[arg2_6], ...)
  if ok2 then
    return v11, v12
  end
  return nil
end
reg.getHumanoid = function()
  local v13 = reg.localPlayer
  local character, v14 = v13.Character
  if character then
    v13 = reg.localPlayer
    v14 = v13.Character:FindFirstChildOfClass("Humanoid")
  else
    v14 = character
  end
  return v14
end
reg.getRoot = function()
  local v15 = reg.localPlayer
  local character2, v16 = v15.Character
  if character2 then
    v15 = reg.localPlayer
    v16 = v15.Character:FindFirstChild("HumanoidRootPart")
  else
    v16 = character2
  end
  return v16
end
local function fn5()
  local v17 = reg.getHumanoid
  local v18 = v17()
  local v19, v20 = (v18 ~= nil) and (v18.Health > 0)
  if v19 then
    v17 = reg.getRoot
    v20 = v17() ~= nil
  else
    v20 = v19
  end
  return v20
end
local function fn6()
  return workspace:GetServerTimeNow()
end
reg.getPing = function()
  local v21, v22, v23, v24 = reg.localPlayer, reg.localPlayer, pcall(reg.localPlayer.GetNetworkPing, reg.localPlayer)
  return (v23 and math.clamp(tonumber(v24) or 0.2, 0, 1)) or 0.2
end
local v25
reg.slot14 = v25
reg.setRootCFrame = function(arg1_10)
  local v26 = reg.getRoot
  local v27 = v26()
  if v27 then
    if v27.Anchored then
      v26 = reg.state
      if (v26.hold or 0) == 0 then
        if not (reg.slot14(function()
          local v28 = reg.alive
          return v28
        end)) then
          return
        end
      end
    end
  else
    return
  end
  v26 = reg.getRoot
  local v29 = v26()
  if not v29 then
    return
  end
  pcall(function()
    v29.CFrame = arg1_10
    local v30 = reg.zeroVec
    v29.AssemblyLinearVelocity = v30
    v30 = reg.zeroVec
    v29.AssemblyAngularVelocity = v30
  end)
end
local function fn7()
  local v31 = reg.getHumanoid
  local v32 = v31()
  return math.max((v32 and v32.WalkSpeed) or 16, 16)
end
reg.findInWorld = function(...)
  local tbl5, v33 = {...}, workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
  for index, item2 in ipairs(tbl5) do
    v33 = v33 and (v33:FindFirstChild(item2))
  end
  return v33
end
local v34
reg.getSeparationPos = function()
  if not (v34 and v34.Parent) then
    local v35 = reg.findInWorld
    local v36 = v35("Areas", "SeparationLine")
    v34 = ((v36 and v36:IsA("BasePart")) and v36) or nil
  end
  local v37, v38 = v34 and v34.Position
  if v37 then
    v38 = v37
  else
    local v39 = reg.vec3
    v38 = (v39(552.2, 67.67, 0))
  end
  return v38
end
reg.getRiftPos = function()
  local v40 = reg.findInWorld
  local v41 = v40("Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003")
  local v42, v43 = v41 and (v41:IsA("BasePart"))
  if v42 then
    v40 = nil
    v40, v43 = reg.vec3, v41.CFrame:PointToWorldSpace(reg.vec3(-26.776, 1.75, 18.665))
  else
    v43 = v42
  end
  v40 = nil
  if v43 then
    v40 = v43
  else
    v42 = reg.vec3
    v40 = (v42(528.7, 70.57, -364.11))
  end
  return v40
end
reg.isBeforeSeparation = function(arg1_11)
  local v44, v45 = reg.getSeparationPos, (arg1_11.X < reg.getSeparationPos().X) and (arg1_11.Y < 1000)
  return v45
end
reg.getPlot = function()
  local v46 = reg.callModule
  local v47 = v46("Plot", "ResolvePlot")
  if type(v47) == "table" then
    if v47.PlotFolder then
      return v47
    end
  end
end
local function fn8(arg1_12, arg2_7)
  pcall(firetouchinterest, arg1_12, arg2_7, 0)
  pcall(firetouchinterest, arg1_12, arg2_7, 1)
end
reg.isRagdolled = function()
  local v48, v49 = reg.localPlayer, tonumber(reg.localPlayer:GetAttribute("RagdollEndTime")) or 0
  return v49 > fn6()
end
local function fn9()
  local raceRallyJoinEndsAt = workspace:GetAttribute("RaceRallyJoinEndsAt")
  return ((workspace:GetAttribute("RaceRallyRunning") == true) and (type(raceRallyJoinEndsAt) == "number")) and (fn6() < raceRallyJoinEndsAt)
end
local tbl6 = {}
local function fn10(arg1_13)
  local raceTrack = workspace:FindFirstChild("RaceTrack")
  if not (raceTrack) then
    return false
  end
  local playerLineUpArea = raceTrack:FindFirstChild("PlayerLineUpArea")
  if playerLineUpArea then
    if playerLineUpArea:IsA("BasePart") then
      if (arg1_13 - playerLineUpArea.Position).Magnitude <= 500 then
        return true
      end
    end
  end
  if tbl6.t ~= raceTrack then
    local v50, v51 = reg.vec3, reg.vec3
    local v52, v53 = (v50(1000000000, 1000000000, 1000000000)), (v51(-1000000000, -1000000000, -1000000000))
    for index2, child in ipairs(raceTrack:GetDescendants()) do
      if child:IsA("BasePart") then
        v52, v53 = (v52:Min(child.Position)), v53:Max(child.Position)
      else
      end
    end
    playerLineUpArea, v51 = reg.vec3
    v51, tbl6.t, tbl6.lo, tbl6.hi = reg.vec3, raceTrack, v52 - playerLineUpArea(500, 1000, 500), v53 + reg.vec3(500, 1000, 500)
  end
  return (((((arg1_13.X >= tbl6.lo.X) and (arg1_13.X <= tbl6.hi.X)) and (arg1_13.Y >= tbl6.lo.Y)) and (arg1_13.Y <= tbl6.hi.Y)) and (arg1_13.Z >= tbl6.lo.Z)) and (arg1_13.Z <= tbl6.hi.Z)
end
local function fn11()
  local ok3, v55 = pcall(function()
    local v54 = reg.modules
    return v54.Save.Peek().RaceRally.LastRacedWindow
  end)
  return (ok3 and (v55 ~= nil)) and (v55 == workspace:GetAttribute("RaceRallyWindow"))
end
local function fn12()
  local v56 = reg.localPlayer
  if v56:GetAttribute("RaceId") ~= nil then
    return true
  end
  local raceRallyJoinEndsAt2, v57 = workspace:GetAttribute("RaceRallyJoinEndsAt"), reg.getRoot
  v56 = v57()
  v57 = nil
  if v56 then
    local v58 = reg.localPlayer
    v57 = v58:GetAttribute("RaceHeat") or (((type(raceRallyJoinEndsAt2) == "number") and (fn6() < (raceRallyJoinEndsAt2 + 25))) and not fn11())
  else
    v57 = v56
  end
  return (v57 and fn10(v56.Position)) or false
end
reg.state.inRace = function()
  local v59 = reg.localPlayer
  local cond, v60 = v59:GetAttribute("RaceId") ~= nil
  if cond then
    v60 = cond
  else
    v59 = reg.localPlayer
    v60 = v59:GetAttribute("RaceRallyQueued") == true
  end
  return v60
end
reg.state.free = function(arg1_14)
  local v61, v62 = (arg1_14.ev ~= nil) and arg1_14.ev()
  if v61 then
    arg1_14 = reg.state
    v62 = not arg1_14.inRace()
  else
    v62 = v61
  end
  return v62
end
reg.invokeOk = function(arg1_15, ...)
  local v63 = reg.invokeRemote
  local v64, v65 = v63(arg1_15, ...)
  return v64 and (v65 ~= false)
end
local function fn13(arg1_16)
  arg1_16 = math.max(math.floor(arg1_16), 0)
  return ((arg1_16 >= 3600) and ("%dh %02dm"):format(arg1_16 // 3600, (arg1_16 % 3600) // 60)) or ("%dm %02ds"):format(arg1_16 // 60, arg1_16 % 60)
end
local function fn14(arg1_17)
  local v66, v67, v68 = reg.callModule, reg.callModule, tonumber(reg.callModule("Rec", "GrowthSecondsRemaining", arg1_17, fn6(), reg.callModule("Rec", "GrowthSpeedMultiplier", arg1_17) or 1)) or 0
  return v68
end
local tbl7, tbl8 = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Cosmic", "Secret", "Eternal", "Divine"}, {}
for i = #tbl7, 1, -1 do
  tbl8[#tbl8 + 1] = tbl7[i]
end
local tbl9, tbl10, tbl11 = {"Enchanted Forest", "Light Dark", "Titan Temple", "Cherry Blossom", "Cosmic", "Prehistoric", "Abyss Ocean", "Volcano", "Snow", "Jungle", "Desert", "Lake", "Forest"}, {Scrambled = "Scrambled", Golden = "Golden", Rainbow = "Rainbow", Silver = "Silver", Sakura = "Bloom", GreatBloom = "Spirit Bloom", Boss = "Fractured", Enchanted = "Enchanted", Monstrous = "Parasite", Nitro = "Nitro", Spectral = "Spectral"}, {"K", "M", "B", "T", "Qa", "Qi"}
local function fn15(arg1_18)
  arg1_18 = tonumber(arg1_18) or 0
  local num = 0
  while (arg1_18 >= 1000) and (num < #tbl11) do
    arg1_18, num = arg1_18 / 1000, num + 1
  end
  local v69, v70 = (num == 0) and tostring(math.floor(arg1_18))
  if v69 then
    v70 = v69
  else
    local format, v71 = string.format, ((arg1_18 < 10) and "%.2f") or ((arg1_18 < 100) and "%.1f")
    v70 = format(v71 or "%.0f", arg1_18)
  end
  return v70 .. (tbl11[num] or "")
end
local function fn16(arg1_19)
  local v72 = reg.modules
  local assets = v72.Assets
  return (assets and assets.Directory) and assets.Directory[arg1_19]
end
local function fn17(arg1_20)
  local v73 = fn16(arg1_20)
  arg1_20 = v73 and v73.Rarity
  return (arg1_20 and tonumber(arg1_20.RarityNumber or arg1_20.Rank)) or 0
end
reg.getDisplayName = function(arg1_21)
  local v74 = fn16(arg1_21)
  return (v74 and v74.DisplayName) or tostring(arg1_21)
end
local function fn18(arg1_22)
  local tbl12, tbl13 = {}, {}
  local function fn19(arg1_23)
    if type(arg1_23) == "string" then
      if arg1_23 ~= "" then
        if arg1_23 ~= "Normal" then
          if arg1_23 ~= "None" then
            if not (tbl13[arg1_23]) then
              tbl13[arg1_23] = true
              tbl12[#tbl12 + 1] = arg1_23
            end
          end
        end
      end
    end
  end
  fn19(arg1_22.BaseMutation)
  if type(arg1_22.Mutations) == "table" then
    for key2, item3 in next, arg1_22.Mutations, nil do
      fn19((((type(key2) == "string") and (item3 == true)) and key2) or item3)
    end
  end
  return tbl12, tbl13
end
local function fn20(arg1_24, arg2_8, arg3_3)
  local v75 = fn16(arg1_24)
  if not (v75) then
    return 0
  end
  arg2_8 = tonumber(arg2_8) or 1
  local v76, v77 = ((arg2_8 > 5) and (((arg2_8 / 5) ^ 1.2) * 19.637875755794113)) or (arg2_8 ^ 1.85), reg.modules
  local mut = v77.Mut
  v77, arg1_24 = pcall(function()
    return mut.EarningsFor(arg3_3 or {})
  end)
  return ((tonumber(v75.EarningRate) or 0) * v76) * ((v77 and tonumber(arg1_24)) or 1)
end
local function fn21(arg1_25, arg2_9)
  arg2_9 = (arg2_9 or arg1_25.AssetCategory) or arg1_25.Category
  local v78, v79 = fn18(arg1_25)
  local v80 = arg1_25.AssetScale or arg1_25.Scale
  local tbl14, v81 = {cat = arg2_9, r = fn17(arg2_9), v = fn20(arg2_9, v80, v78), s = tonumber(v80) or 1, m = v78, ms = v79}, reg.getDisplayName
  tbl14.n = v81(arg2_9)
  tbl14.a = arg1_25.AreaId
  return tbl14
end
local tbl15 = {Color3.fromRGB(190, 196, 220), Color3.fromRGB(120, 230, 140), Color3.fromRGB(110, 170, 255), Color3.fromRGB(190, 130, 255), Color3.fromRGB(255, 200, 90), Color3.fromRGB(255, 120, 150), Color3.fromRGB(110, 235, 255), Color3.fromRGB(240, 240, 255), Color3.fromRGB(255, 150, 90), Color3.fromRGB(255, 230, 140)}
local function fn22(arg1_26)
  local v82 = fn16(arg1_26)
  local v83 = (v82 and v82.Rarity) and v82.Rarity.Color
  return (((((typeof(v83) == "Color3") and select(3, v83:ToHSV())) or 0) > 0.55) and v83) or tbl15[math.clamp(fn17(arg1_26), 1, 10)]
end
local tbl16 = {}
local function fn23(arg1_27)
  local v84 = fn16(arg1_27)
  arg1_27 = (v84 and v84.Rarity) and (v84.Rarity._id or v84.Rarity.DisplayName)
  if not arg1_27 then
    return
  end
  if tbl16[arg1_27] == nil then
    v84 = (replicatedStorage:FindFirstChild("Assets") and replicatedStorage.Assets:FindFirstChild("UI")) and replicatedStorage.Assets.UI:FindFirstChild("RarityGradients")
    local v85 = v84 and (v84:FindFirstChild(arg1_27))
    tbl16[arg1_27] = (v85 and ((v85:IsA("UIGradient") and v85) or v85:FindFirstChildWhichIsA("UIGradient", true))) or false
  end
  return tbl16[arg1_27] or nil
end
local tbl17 = {money = "rbxassetid://119640363267627", candy = "rbxassetid://112785428441728", soul = "rbxassetid://83798853441239", night = "rbxassetid://123238464128459", egg = "rbxassetid://97499770821177", pet = "rbxassetid://112223455192501", scrambled = "rbxassetid://91260564167870", tread = "rbxassetid://137134884810647", essence = "rbxassetid://114750647204247", net = "rbxassetid://131116540264095", Golden = "rbxassetid://98126365702697", Purple = "rbxassetid://121235713836098", Blue = "rbxassetid://89995151383384", Green = "rbxassetid://107744695034799", star = "rbxassetid://79133579432887", timer = "rbxassetid://132534369464516", check = "rbxassetid://104873662023098", arrow = "rbxassetid://94178052551280", trap = "rbxassetid://113747761726323", pin = "rbxassetid://74684257299345", wisp = "rbxassetid://115565045229337", wisp3 = "rbxassetid://135449361680117", potion = "rbxassetid://98847011195862", luck = "rbxassetid://108988481469824", x2 = "rbxassetid://128234882192727", medal = "rbxassetid://116272961700800", trophy = "rbxassetid://119210375463488", fractured = "rbxassetid://74755693699202", scramble = "rbxassetid://134710848063255", nitro = "rbxassetid://134287739122547"}
reg.slot59 = function()
  local v86 = reg.modules
  local save = v86.Save
  local ok4, v87 = pcall(function()
    return save.Peek()
  end)
  return ((ok4 and (type(v87) == "table")) and v87) or nil
end
reg.slot19 = function()
  local ok5, v89 = pcall(function()
    local v88 = reg.modules
    return v88.Egg.ReadFieldEggs()
  end)
  return ((ok5 and (type(v89) == "table")) and v89.Records) or {}
end
local function fn24()
  local v90 = reg.localPlayer
  return v90:FindFirstChildOfClass("Backpack")
end
local function fn25()
  local ok6, v93 = pcall(function()
    local v91, v92 = reg.modules, reg.localPlayer
    return v91.Egg.ReadOwnerEggs(v92.UserId)
  end)
  return ((ok6 and (type(v93) == "table")) and v93) or {}
end
local function fn26()
  local v94, v95 = fn6(), reg.callModule
  if v95("Cycle", "IsNightPhase", v94) then
    return 0
  else
    local v96 = reg.callModule
    if v96("Wall", "IsSealed") then
      return 0
    end
  end
  v95 = reg.callModule
  local v97 = v95("Cycle", "NextResetTime", v94)
  return (v97 and ((v97 - 10) - v94)) or 99
end
local function fn27()
  local v98 = reg.callModule
  local v99 = v98("Cycle", "NextResetTime", fn6())
  return (v99 and math.max(v99 - fn6(), 0)) or 0
end
local function fn28(arg1_28)
  local tbl18, tbl19, tbl20, v100, v101 = {}, {}, {}, next, reg.modules
  local areas, v102 = v101.Areas
  if areas then
    v101 = reg.modules
    v102 = v101.Areas.Directory
  else
    v102 = areas
  end
  for key3, item4 in v100, v102 or {}, nil do
    for index3, item5 in ipairs((((type(item4) == "table") and (type(item4.DropTable) == "table")) and item4.DropTable) or {}) do
      index3 = (type(item5) == "table") and (item5[1] or item5.Category)
      if index3 then
        v101 = tonumber(item5[2] or item5.Weight)
        if v101 then
          if v101 > 0 then
            tbl20[index3] = true
          end
        else
          tbl20[index3] = true
        end
      end
    end
  end
  areas, v102 = next, reg.modules
  v101, v100 = v102.Assets
  if v101 then
    v102 = reg.modules
    v100 = v102.Assets.Directory
  else
    v100 = v101
  end
  v102 = v100 or {}
  for key4, item6 in areas, v102, nil do
    v101, v100 = (type(item6) == "table") and item6.Rarity
    if v101 then
      local v103 = (arg1_28 == "all") or (arg1_28 and arg1_28[key4])
      if v103 then
        v100 = v103
      else
        local flag2 = not arg1_28
        if arg1_28 then
          v100 = flag2
        else
          local dontRoll = item6.DontRoll
          v100 = if dontRoll then tbl20[key4] else not dontRoll
        end
      end
    else
      v100 = v101
    end
    if v100 then
      local v104 = reg.getDisplayName
      if not (tbl19[v104(key4)]) then
        local v105 = reg.getDisplayName
        tbl19[v105(key4)] = true
        local v106, tbl21, v107 = #tbl18 + 1, {cat = key4}, reg.getDisplayName
        tbl21.v = v107(key4)
        tbl21.r = fn17(key4)
        tbl21.img = ((type(item6.Icon) == "number") and ("rbxassetid://" .. item6.Icon)) or item6.Icon
        tbl21.sub = item6.Rarity.DisplayName
        tbl21.grad = fn23(key4)
        tbl21.col = fn22(key4)
        tbl18[v106] = tbl21
      end
    end
  end
  table.sort(tbl18, function(arg1_29, arg2_10)
    return (arg1_29.r > arg2_10.r) or ((arg1_29.r == arg2_10.r) and (arg1_29.v < arg2_10.v))
  end)
  return tbl18
end
reg.state.allSp = function()
  return fn28("all")
end
do
  local v108
  local function fn29(arg1_30)
    if not (v108) then
      v108 = {}
      local v109 = reg.modules
      local assets2, v110 = v109.Assets
      if assets2 then
        v109 = reg.modules
        v110 = v109.Assets.Directory
      else
        v110 = assets2
      end
      local v111 = v110 or {}
      local function fn30(arg1_31, arg2_11, arg3_4)
        if arg2_11 > 5 then
          return
        elseif arg3_4[arg1_31] then
          return
        end
        arg3_4[arg1_31] = true
        for key5, item7 in pairs(arg1_31) do
          if type(key5) == "string" then
            if v111[key5] then
              v108[key5] = true
            end
          end
          if type(item7) == "string" then
            if v111[item7] then
              v108[item7] = true
            end
          end
          if type(item7) == "table" then
            fn30(item7, arg2_11 + 1, arg3_4)
          end
        end
      end
      assets2 = {"ScrambleTradeIn", "ScrambleMastery"}
      for index4, item8 in ipairs(assets2) do
        v110, v109 = pcall(function()
          return require(replicatedStorage.Data[item8])
        end)
        if v110 then
          if type(v109) == "table" then
            fn30(v109, 0, {})
          end
        end
      end
    end
    arg1_30 = tostring(arg1_30)
    local v112 = ((v108[arg1_30] == true) or (arg1_30:sub(1, 6) == "Mecha ")) or (arg1_30:find("Experiment", 1, true) ~= nil)
    return v112
  end
  reg.state.eggSp = function()
    local tbl22 = {}
    for index5, item9 in ipairs(fn28("all")) do
      if not (fn29(item9.cat)) then
        if tostring(item9.cat):find("Halloween", 1, true) then
          item9.sub = tostring(item9.cat) .. (" - " .. tostring(item9.sub))
        end
        tbl22[#tbl22 + 1] = item9
      end
    end
    return tbl22
  end
end
local tbl23 = {"None"}
for key6, item10 in next, tbl10, nil do
  tbl23[#tbl23 + 1] = item10
end
table.sort(tbl23, function(arg1_32, arg2_12)
  return (arg1_32 == "None") or ((arg2_12 ~= "None") and (arg1_32 < arg2_12))
end)
local function fn31()
  local tbl24, v113 = {"None"}, reg.callModule
  for index6, item11 in ipairs(v113("Mut", "RollTable") or {}) do
    if type(item11) == "table" then
      index6 = item11[2]
      if index6 then
        if index6 > 0 then
          if tbl10[item11[1]] then
            tbl24[#tbl24 + 1] = tbl10[item11[1]]
          end
        end
      end
    end
  end
  return ((#tbl24 > 1) and tbl24) or {"None", "Golden", "Silver", "Rainbow"}
end
local function fn32(arg1_33, arg2_13)
  if arg1_33 then
    if #arg1_33 == 0 then
      return nil
    end
  else
    return nil
  end
  local tbl25 = {}
  for index7, item12 in ipairs(arg1_33) do
    tbl25[(arg2_13 and arg2_13[item12]) or item12] = true
  end
  return tbl25
end
local tbl26, tbl27 = {}, {None = "None"}
for index8, item13 in ipairs(tbl7) do
  tbl26[item13] = index8
end
for key7, item14 in next, tbl10, nil do
  tbl27[item14] = key7
end
reg.slot63 = function(arg1_34, arg2_14)
  if arg1_34.rar then
    if not (arg1_34.rar[arg2_14.r]) then
      return false
    end
  end
  if arg1_34.sp then
    local sp, v114, v115 = arg1_34.sp, arg2_14.n
    if v114 then
      v115 = v114
    else
      local v116 = reg.getDisplayName
      v115 = v116(arg2_14.cat)
    end
    if not (sp[v115]) then
      return false
    end
  end
  if arg1_34.no then
    local no, v117, v118 = arg1_34.no, arg2_14.n
    if v117 then
      v118 = v117
    else
      local v119 = reg.getDisplayName
      v118 = v119(arg2_14.cat)
    end
    if no[v118] then
      return false
    end
  end
  if arg2_14.v < (arg1_34.minV or 0) then
    return false
  elseif arg1_34.maxV then
    if arg2_14.v >= arg1_34.maxV then
      return false
    end
  end
  if arg1_34.mut then
    if #arg2_14.m == 0 then
      return arg1_34.mut.None == true
    end
    for index9, item15 in ipairs(arg2_14.m) do
      if arg1_34.mut[item15] then
        return true
      end
    end
    return false
  end
  return true
end
local v120
local v121 = vm8
local window, tbl28 = v121:Window({Title = "Venyx", Version = "v1.1.0", Game = "Steal An Egg", Id = "VenyxSAE", Key = Enum.KeyCode.LeftControl}), {}
local function fn33(arg1_35, arg2_15)
  tbl28[arg1_35] = arg2_15
end
fn2(heartbeat, function()
  if next(tbl28) then
    local v122 = tbl28
    tbl28 = {}
    for key8, item16 in next, v122, nil do
      pcall(item16)
    end
  end
end)
reg.state.press = function(arg1_36)
  return (arg1_36.UserInputType == Enum.UserInputType.MouseButton1) or (arg1_36.UserInputType == Enum.UserInputType.Touch)
end
reg.state.drags = function(arg1_37)
  return (arg1_37.UserInputType == Enum.UserInputType.MouseMovement) or (arg1_37.UserInputType == Enum.UserInputType.Touch)
end
reg.slot10 = function(arg1_38, arg2_16)
  local v123 = reg.state
  v123.noteAt = os.clock()
  fn33("status", function()
    window:Status(arg1_38, arg2_16)
  end)
  local v124, v125 = reg.state, reg.state
  v124.warned = v125.warned or {}
  if (arg2_16 == "warn") or (arg2_16 == "err") then
    if not (window.open) then
      v124, v125 = reg.state, os.clock() - (reg.state.warned[arg1_38] or -1000000000)
      if v125 > 60 then
        v123 = reg.state
        v123.warned[arg1_38] = os.clock()
        fn33("w" .. arg1_38, function()
          v121:Notify("Venyx", arg1_38, arg2_16)
        end)
      end
    end
  end
end
local function fn34(arg1_39, arg2_17, arg3_5)
  fn33("t" .. arg1_39, function()
    v121:Notify(arg1_39, arg2_17, arg3_5)
  end)
end
local function fn35(arg1_40, arg2_18)
  return function(arg1_41)
    fn33(arg1_40, function()
      arg2_18:Set(arg1_41)
    end)
  end
end
local function fn36(arg1_42, arg2_19, arg3_6)
  fn33(arg1_42, function()
    for key9, item17 in next, arg3_6, nil do
      arg2_19:Set(key9, item17)
    end
  end)
end
local function fn37()
  local v126 = reg.state
  if v126.poke then
    local v127 = reg.state
    v127.poke()
  end
end
local function fn38(arg1_43, arg2_20, arg3_7)
  local v128 = arg3_7 or {}
  if arg2_20.rar then
    local tbl29 = {}
    for index10, item18 in ipairs(tbl8) do
      if table.find(arg2_20.rar, item18) then
        tbl29[#tbl29 + 1] = item18
      end
    end
    v128.rar = fn32(tbl29, tbl26)
    arg1_43:Dropdown(arg2_20.rarName or "Rarities", tbl8, tbl29, function(arg1_44)
      v128.rar = fn32(arg1_44, tbl26)
      fn37()
    end, true)
  end
  if arg2_20.sp then
    local sp2, list = arg2_20.sp, arg2_20.list
    local v129, fn39 = list or fn28, function(arg1_45)
      v128.sp = fn32(arg1_45)
      fn37()
    end
    arg1_43:Dropdown(sp2, v129, {}, fn39, true)
  end
  if arg2_20.no then
    local no2, list2 = arg2_20.no, arg2_20.list
    local v130, fn40 = list2 or fn28, function(arg1_46)
      v128.no = fn32(arg1_46)
      fn37()
    end
    arg1_43:Dropdown(no2, v130, {}, fn40, true)
  end
  if arg2_20.mut then
    local mut2, wild = arg2_20.mut, arg2_20.wild
    local v131, fn41 = (wild and fn31) or tbl23, function(arg1_47)
      v128.mut = fn32(arg1_47, tbl27)
      fn37()
    end
    arg1_43:Dropdown(mut2, v131, {}, fn41, true)
  end
  if arg2_20.minV then
    local function fn42(arg1_48)
      v128.minV = arg1_48
      fn37()
    end
    arg1_43:Slider(arg2_20.minV, 0, 0, 0, fn42, "log")
  end
  if arg2_20.maxV then
    local function fn43(arg1_49)
      v128.maxV = ((arg1_49 > 0) and arg1_49) or nil
      fn37()
    end
    arg1_43:Slider(arg2_20.maxV, 0, 0, 0, fn43, "log")
  end
  return v128
end
local tbl30 = {}
reg.slot21 = tbl30
local function fn44(arg1_50, arg2_21, arg3_8, arg4_2, arg5_2)
  local v132 = reg.slot21
  v132[arg3_8] = arg4_2 or false
  local function fn45(arg1_51)
    local v133 = reg.slot21
    v133[arg3_8] = arg1_51
    if arg5_2 then
      arg5_2(arg1_51)
    end
    fn37()
  end
  return arg1_50:Toggle(arg2_21, arg4_2, fn45)
end
local function fn46(arg1_52, arg2_22, arg3_9, arg4_3, arg5_3, arg6, arg7, arg8)
  local v134 = reg.slot21
  v134[arg3_9] = arg5_3
  local v135
  v135 = arg1_52:Dropdown(arg2_22, arg4_3, arg5_3, function(arg1_53)
    if not (arg7) then
      if type(arg1_53) == "string" then
        if not (table.find(arg4_3, arg1_53)) then
          return task.defer(function()
            v135:Set(arg5_3)
          end)
        end
      end
    end
    local v136 = reg.slot21
    v136[arg3_9] = arg1_53
    if arg6 then
      arg6(arg1_53)
    end
    fn37()
  end, arg7, arg8)
  return v135
end
local function fn47(arg1_54, arg2_23, arg3_10, arg4_4, arg5_4, arg6_2, arg7_2, arg8_2, arg9)
  local v137 = reg.slot21
  v137[arg3_10] = arg6_2
  local function fn48(arg1_55)
    local v138 = reg.slot21
    v138[arg3_10] = arg1_55
    if arg9 then
      arg9(arg1_55)
    end
  end
  return arg1_54:Slider(arg2_23, arg4_4, arg5_4, arg6_2, fn48, arg7_2, arg8_2)
end
local function fn49(arg1_56)
  task.defer(arg1_56.Collapse, arg1_56, true)
  return arg1_56
end
local tbl31, v139 = {}
reg.slot4 = v139
local function fn50(arg1_57)
  arg1_57.at, arg1_57.tok, arg1_57.i = arg1_57.at or 0, 0, #tbl31 + 1
  tbl31[arg1_57.i] = arg1_57
  return arg1_57
end
reg.state.poke = function()
  for index11, item19 in ipairs(tbl31) do
    if item19.info then
      if not (item19.busy) then
        item19.at = 0
      end
    end
  end
end
local function fn51(arg1_58)
  arg1_58.tok = arg1_58.tok + 1
  arg1_58.at = 0
end
local now = os.clock()
local now2 = os.clock()
fn2(reg.localPlayer.CharacterAdded, function()
  now = os.clock()
  local v140 = reg.state
  v140.treadBad = nil
end)
local tbl32, tbl33 = {on = false}, {last = "-", placed = 0, hatched = 0}
reg.slot36 = tbl33
reg.slot29 = function(arg1_59)
  local on, v141 = tbl32.on
  if on then
    local cond2, v142 = arg1_59 == nil
    if cond2 then
      local v143 = reg.state
      v142 = not v143.rag
    else
      v142 = cond2
    end
    v141 = v142 or (tbl32.uid == arg1_59)
  else
    v141 = on
  end
  return v141
end
task.spawn(function()
  local v144 = reg.modules
  local egg = v144.Egg
  if egg then
    if egg.CarryChanged then
      fn2(egg.CarryChanged, function(arg1_60)
        if type(arg1_60) == "table" then
          tbl32.on = arg1_60.IsCarrying == true
          tbl32.uid = arg1_60.Uid
        end
      end)
    end
  end
end)
reg.slot46 = function(arg1_61, arg2_24, arg3_11)
  local v145 = reg.state
  if v145.ready then
    local v146 = reg.state
    v146.ready(arg2_24)
  end
  arg3_11 = arg3_11 or (fn7() * 0.92)
  local huge, now3, flag3, num2 = math.huge, os.clock(), false, 0.016666666666666666
  while arg2_24() do
    v145 = reg.getRoot
    local v147 = v145()
    if not (v147) then
      return false
    end
    if v147.Anchored then
      if not (reg.slot14(arg2_24)) then
        return false
      end
    end
    local v148 = arg1_61 - v147.Position
    if v148.Magnitude < 3 then
      local v149, v150 = reg.setRootCFrame, reg.cframeNew
      v149(v150(arg1_61) * v147.CFrame.Rotation)
      return true
    end
    if v148.Magnitude < (huge - 3) then
      huge, now3 = v148.Magnitude, os.clock()
    else
      local cond3, v151 = (os.clock() - now3) > 4
      if cond3 then
        local v152 = reg.state
        v151 = v152.respawn
      else
        v151 = cond3
      end
      if v151 then
        cond3 = reg.slot10
        cond3("Stuck in place, resetting the character")
        local v153 = reg.state
        v153.respawn(true)
        return false
      elseif (os.clock() - now3) > 1 then
        if flag3 then
        else
          local v154 = reg.invokeRemote
          v154("RF/Treadmill/AskDoff")
          local v155, v156, v157 = reg.setRootCFrame, reg.cframeNew, reg.getRiftPos
          v155(v156(v157() + reg.vec3(0, 3, 0)))
          flag3 = true
        end
      else
      end
    end
    local v158, v159 = reg.setRootCFrame, reg.cframeNew
    v158(v159(v147.Position + (v148.Unit * math.min(arg3_11 * num2, v148.Magnitude))) * v147.CFrame.Rotation)
    v158 = nil
    v158, num2 = reg.heartbeatWait, math.clamp(reg.heartbeatWait(), 0.004166666666666667, 0.05)
  end
  return false
end
reg.slot14 = function(arg1_62)
  for i2 = 1, 4, 1 do
    i2 = reg.getRoot
    local v160 = i2()
    if not v160 then
      return false
    end
    if not (v160.Anchored) then
      i2 = reg.state
      if not (i2.onAdmin) then
        return true
      end
    end
    i2 = reg.state
    local onAdmin, v161 = i2.onAdmin, reg.invokeRemote
    local v162, v163, v164 = v161("RF/Treadmill/AskDoff")
    i2 = reg.state
    i2.onAdmin = false
    if onAdmin and not v160.Anchored then
      v161 = os.clock() + 0.4
      while (os.clock() < v161) and (arg1_62()) do
        i2 = reg.heartbeatWait
        i2()
      end
      return arg1_62()
    end
    if v162 then
      if v163 == false then
        if not (tostring(v164):lower():find("wait")) then
          pcall(function()
            v160.Anchored = false
          end)
        end
      end
    end
    i2, onAdmin = reg.getPing, (os.clock() + 0.6) + (reg.getPing() * 2)
    while ((v160.Parent and v160.Anchored) and (os.clock() < onAdmin)) and (arg1_62()) do
      v163 = reg.heartbeatWait
      v163()
    end
    if not (arg1_62()) then
      return false
    end
  end
  arg1_62 = reg.getRoot
  local v165 = arg1_62()
  return (v165 ~= nil) and not v165.Anchored
end
reg.slot15 = function(arg1_63, arg2_25)
  local v166 = reg.state
  if v166.inFuse then
    local v167 = reg.state
    if v167.inFuse() then
      local v168 = reg.state
      if not (v168.leaveFuse()) then
        return false
      end
    end
  end
  v166 = reg.localPlayer
  local inEnchantedTree = v166:GetAttribute("InEnchantedTree")
  v166 = nil
  if inEnchantedTree then
    local v169 = reg.state
    v166 = v169.leaveTree
  else
    v166 = inEnchantedTree
  end
  if v166 then
    inEnchantedTree = reg.slot10
    inEnchantedTree("Leaving the Enchanted Tree")
    local v170 = reg.state
    v170.leaveTree()
    v170 = os.clock() + 3
    while true do
      local v171, v172 = (os.clock() < v170) and arg1_63()
      if v171 then
        local v173 = reg.localPlayer
        v172 = (v173:GetAttribute("InEnchantedTree"))
      else
        v172 = v171
      end
      if not v172 then
        break
      end
      v171 = reg.heartbeatWait
      v171()
    end
  end
  inEnchantedTree = reg.getRoot
  local v174, v175 = inEnchantedTree(), reg.getRiftPos
  inEnchantedTree = v175()
  if not (v174) then
    return false
  end
  v166, v175 = not arg2_25
  if arg2_25 then
    v175 = v166
  else
    local v176 = reg.isBeforeSeparation
    v175 = v176(v174.Position)
  end
  if v175 and ((v174.Position - inEnchantedTree).Magnitude > 69) then
    v166 = reg.slot10
    v166("Moving to the safe zone")
    arg2_25 = reg.state
    local v177, v178, v179 = (arg2_25.cs and reg.slot4) and (reg.slot4.name == "Steal"), reg.slot46, reg.vec3
    if not (v178(inEnchantedTree + v179(0, 3, 0), arg1_63, (v177 and 400) or 250)) then
      return false
    end
    v178 = os.clock()
    v179 = nil
    if v177 then
      local v180
      v180, v179 = reg.getPing, math.clamp(0.3 + reg.getPing(), 0.3, 0.5)
    else
      v179 = v177
    end
    v177 = v178 + (v179 or 0.25)
    while (os.clock() < v177) and (arg1_63()) do
      v179 = reg.getRoot
      v174 = v179()
      if v174 then
        v178 = reg.zeroVec
        v174.AssemblyLinearVelocity = v178
      end
      local v181 = reg.heartbeatWait
      v181()
    end
  end
  return true
end
local function fn52(arg1_64, arg2_26)
  if not (reg.slot14(arg2_26)) then
    return false
  end
  local v182 = reg.getRoot
  local v183 = v182()
  if not (v183) then
    return false
  end
  v182 = reg.isBeforeSeparation
  if v182(v183.Position) then
    local v184 = reg.isBeforeSeparation
    if not (v184(arg1_64)) then
      local v185 = reg.slot15
      if not (v185(arg2_26)) then
        return false
      end
    end
  else
    if v183.Position.Y > 1000 then
      local v186 = reg.slot15
      if not (v186(arg2_26)) then
        return false
      end
    else
      local v187 = reg.localPlayer
      if v187:GetAttribute("InEnchantedTree") then
        local v188 = reg.slot15
        if not (v188(arg2_26)) then
          return false
        end
      end
    end
    local v189 = reg.getRoot
    v183 = v189()
    if v183 then
      v189 = reg.isBeforeSeparation
      if not (v189(v183.Position)) then
        local v190 = reg.isBeforeSeparation
        if v190(arg1_64) then
          local v191 = reg.getRiftPos
          local v192, v193 = reg.vec3, v191() + reg.vec3(0, 3, 0)
          if (v183.Position - v193).Magnitude > 1500 then
            if fn26() > 0 then
              v191 = reg.slot29
              if not (v191()) then
                local v194 = reg.state
                if v194.ragTo then
                  local v195 = reg.state
                  v195.ragTo(v193, arg2_26)
                end
              end
            end
          end
          v191 = reg.slot46
          if not (v191(v193, arg2_26, 400)) then
            return false
          end
        end
      end
    end
  end
  v183 = reg.slot46
  return v183(arg1_64, arg2_26)
end
local function fn53()
  local v196, v197 = fn6(), reg.callModule
  if v197("Cycle", "IsNightPhase", v196) then
    local v198 = reg.callModule
    local v199, v200 = v198("Cycle", "NextResetTime", v196), reg.state
    local v201, v202 = v199 and (v199 + 5)
    if v201 then
      v202 = v201
    else
      v199 = reg.state
      v202 = v199.fieldAt
    end
    v200.fieldAt = v202
  end
  v197 = reg.callModule
  if v197("Wall", "IsSealed") then
    local v203 = reg.state
    return math.max((v203.fieldAt or v196) - v196, 0.3)
  end
  v197 = reg.state
  local v204 = (v197.fieldAt or 0) - v196
  return ((v204 > 0) and v204) or 0
end
local function fn54()
  local adminBoostTreadmill = workspace:GetAttribute("AdminBoost_Treadmill")
  if type(adminBoostTreadmill) == "number" then
    if adminBoostTreadmill > 1 then
      return true
    end
  end
  adminBoostTreadmill = reg.localPlayer
  local playerGui = adminBoostTreadmill:FindFirstChild("PlayerGui")
  adminBoostTreadmill = playerGui and (playerGui:FindFirstChild("BottomUI"))
  adminBoostTreadmill = adminBoostTreadmill and (adminBoostTreadmill:FindFirstChild("BottomFrame"))
  adminBoostTreadmill = adminBoostTreadmill and (adminBoostTreadmill:FindFirstChild("Holder"))
  adminBoostTreadmill = adminBoostTreadmill and (adminBoostTreadmill:FindFirstChild("List"))
  adminBoostTreadmill = adminBoostTreadmill and (adminBoostTreadmill:FindFirstChild("AdminTreadmill"))
  return ((adminBoostTreadmill ~= nil) and adminBoostTreadmill:IsA("GuiObject")) and adminBoostTreadmill.Visible
end
reg.slot18 = function(arg1_65, arg2_27, arg3_12)
  local flag4, v205 = false
  while arg1_65() do
    local v206 = fn53()
    if v206 <= 0 then
      if flag4 then
        local v207 = os.clock() + (arg3_12 or 5)
        while os.clock() < v207 do
          if not (arg1_65()) then
            return false
          end
          local v208 = reg.heartbeatWait
          v208()
        end
      end
      return true
    end
    flag4 = true
    local v209 = reg.getRoot
    local v210 = v209()
    if v210 then
      v205 = v205 or v210.Position
      if (v210.Position - v205).Magnitude > 4 then
        local v211, v212 = reg.setRootCFrame, reg.cframeNew
        v211(v212(v205))
      else
        v209 = reg.zeroVec
        v210.AssemblyLinearVelocity = v209
      end
    else
    end
    v210 = reg.slot10
    v210((arg2_27 or "Waiting") .. (" - field opens in " .. (math.ceil(v206) .. "s")))
    v209 = reg.heartbeatWait
    v209()
  end
  return false
end
local function fn55(arg1_66)
  local v213 = reg.findInWorld
  local v214 = v213("Areas", "GuardAreas", tostring(arg1_66), "Guard")
  arg1_66 = v214 and (v214:FindFirstChild("HumanoidRootPart", true))
  return ((arg1_66 and arg1_66:IsA("BasePart")) and arg1_66) or nil
end
local function fn56(arg1_67, arg2_28)
  local v215 = reg.localPlayer
  local str, v216, v217 = "FirstAreaEgg_" .. v215.UserId, pairs, reg.slot19
  v215 = vm[53](v217())
  local v218, v219
  for it1_2, it2 in v216(vm:uT(v215)) do
    v217 = (type(it2) == "table") and (it2.Uid or it1_2)
    it1_2 = (((type(v217) == "string") and not arg2_28[v217]) and (typeof(it2.BottomCFrame) == "CFrame")) and (((it2.State == nil) or (it2.State == "Slot")) or (it2.State == "Dropped"))
    if it1_2 then
      local cond4 = v217:sub(1, #str) == str
      local v220 = if v217:sub(1, 13) == "FirstAreaEgg_" then cond4 and v217:match("_([%w ]+:Slot_%d+)$") else if type(it2.AreaId) == "string" then if type(it2.NestId) == "string" then it2.AreaId .. (":" .. it2.NestId) else nil else nil
      local v221 = v220 and (fn55(it2.AreaId) or (cond4 and fn55("Forest")))
      if v221 then
        local position, v222 = it2.BottomCFrame.Position, reg.vec3
        cond4 = v222(position.X - arg1_67.X, 0, position.Z - arg1_67.Z).Magnitude
        if (cond4 <= 600) and (if v218 then cond4 < v218 else not v218) then
          v218, v219 = cond4, {uid = v217, slot = v220, guard = v221, at = position}
        else
        end
      else
      end
    else
    end
  end
  return v219
end
local function fn57(arg1_68, arg2_29)
  local rEGuardPatrolForestStrike, v223 = networking:FindFirstChild("RE/GuardPatrol/ForestStrike"), reg.getRoot
  local v224 = v223()
  if rEGuardPatrolForestStrike then
    if v224 then
      v223 = reg.modules
      if v223.Egg then
        local v225 = reg.slot29
        if v225() then
          return false
        else
          local v226 = reg.isRagdolled
          if v226() then
            return false
          end
        end
      else
        return false
      end
    else
      return false
    end
  else
    return false
  end
  local v227 = ((type(arg1_68) == "function") and arg1_68) or (function()
    return arg1_68
  end)
  while true do
    v223 = arg2_29()
    local v228
    if v223 then
      local v229
      v229, v228 = reg.state, (os.clock() - (reg.state.dimLeftAt or -99)) < 1
    else
      v228 = v223
    end
    if not v228 then
      break
    end
    v228 = reg.heartbeatWait
    v228()
  end
  if not (reg.slot14(arg2_29)) then
    return false
  end
  local tbl34, v230 = {}, reg.state
  v230.rag = true
  v223 = nil
  for i3 = 1, 3, 1 do
    i3 = reg.getRoot
    v230 = fn56((i3() or v224).Position, tbl34)
    if v230 then
      if not (arg2_29()) then
        break
      end
    else
      break
    end
    i3 = 0
    while true do
      local v231 = reg.slot29
      local v232 = v231(v230.uid)
      if not ((if v232 then not v232 else i3 < 2.5) and arg2_29()) then
        break
      end
      v231 = reg.getRoot
      v232 = v231()
      v231 = nil
      if v232 then
        local anchored = v232.Anchored
        if anchored then
          v231 = anchored
        else
          local v233 = reg.state
          v231 = v233.onAdmin
        end
      else
        v231 = v232
      end
      if v231 then
        if not (reg.slot14(arg2_29)) then
          v232 = reg.state
          v232.rag = false
          return false
        end
      end
      v231, v232 = reg.setRootCFrame, reg.cframeNew
      v231(v232(v230.at + reg.vec3(0, 3, 0)))
      local v234, v235, v236, v237 = reg.modules, pcall(reg.modules.Egg.CarryFieldEgg, v230.uid, v230.slot)
      if v236 ~= true then
        if type(v237) == "string" then
          if v237:lower():find("full") then
            v232 = reg.state
            v232.rag = false
            return false
          end
        end
      end
      if v236 ~= true then
        if type(v237) == "string" then
          if i3 > 0.4 then
            if not (v237:lower():find("closer")) then
              break
            end
          end
        end
      end
      v231 = reg.heartbeatWait
      i3 += v231()
    end
    i3 = reg.slot29
    if i3(v230.uid) then
      v223 = v230
      break
    end
    tbl34[v230.uid] = true
  end
  if not v223 then
    v224 = reg.state
    v224.rag = false
    return false
  end
  local flag5, v238 = false, reg.localPlayer
  local conn2, v243, fireServer, tbl35 = v238:GetAttributeChangedSignal("RagdollEndTime"):Connect(function()
    if flag5 then
      return
    else
      local v239 = reg.isRagdolled
      if not (v239()) then
        return
      end
    end
    local v240 = v227()
    if v240 then
      flag5 = true
      local v241, v242 = reg.setRootCFrame, reg.cframeNew
      v241(v242(v240))
    end
  end), pcall, rEGuardPatrolForestStrike.FireServer, {EggUid = v223.uid}
  tbl35.GuardCFrame = v223.guard.CFrame
  v243(fireServer, rEGuardPatrolForestStrike, tbl35)
  v224 = 0
  while true do
    tbl35 = not flag5 and (v224 < 3)
    if not (tbl35 and arg2_29()) then
      break
    end
    rEGuardPatrolForestStrike = reg.heartbeatWait
    v224 += rEGuardPatrolForestStrike()
  end
  conn2:Disconnect()
  fireServer = reg.slot29
  if fireServer(v223.uid) then
    tbl34 = reg.callModule
    tbl34("Egg", "DropFieldEgg", "PlayerRequest")
  end
  v238 = reg.state
  v238.rag = false
  if flag5 then
    v223 = reg.state
    if v223.burst then
      rEGuardPatrolForestStrike = reg.state
      rEGuardPatrolForestStrike.burst()
    end
    task.spawn(function()
      local v244 = reg.getHumanoid
      local v245, v246, tbl36 = v244(), os.clock() + 1.5, {[Enum.HumanoidStateType.Freefall] = true, [Enum.HumanoidStateType.Physics] = true, [Enum.HumanoidStateType.Ragdoll] = true, [Enum.HumanoidStateType.FallingDown] = true, [Enum.HumanoidStateType.None] = true}
      while (v245 and v245.Parent) and (os.clock() < v246) do
        if tbl36[v245:GetState()] then
          pcall(v245.ChangeState, v245, Enum.HumanoidStateType.GettingUp)
        end
        if v245.PlatformStand then
          if not reg.slot4 then
            v245.PlatformStand = false
          end
        end
        v244 = reg.heartbeatWait
        v244()
      end
    end)
  end
  rEGuardPatrolForestStrike, v224 = v227(), reg.getRoot
  tbl35 = v224()
  fireServer = ((flag5 and (rEGuardPatrolForestStrike ~= nil)) and (tbl35 ~= nil)) and ((tbl35.Position - rEGuardPatrolForestStrike).Magnitude <= 30)
  return fireServer
end
reg.state.ragTo = fn57
local function fn58(arg1_69, arg2_30, arg3_13, arg4_5, arg5_5)
  local v247 = reg.state
  if v247.ready then
    local v248 = reg.state
    v248.ready(arg2_30)
  end
  local v249, huge2, now4, num3 = os.clock() + (arg4_5 or 30), math.huge, os.clock(), 1
  while arg2_30() and (os.clock() < v249) do
    v247 = reg.getRoot
    arg4_5 = v247()
    if not arg4_5 then
      return false
    end
    if arg4_5.Anchored then
      if not (reg.slot14(arg2_30)) then
        return false
      end
    end
    local v250 = reg.vec3
    local v251 = v250(arg1_69.X - arg4_5.Position.X, 0, arg1_69.Z - arg4_5.Position.Z)
    if v251.Magnitude <= (arg3_13 or 6) then
      v250 = reg.zeroVec
      arg4_5.AssemblyLinearVelocity = v250
      return true
    end
    if arg4_5.Anchored then
      reg.slot14(arg2_30)
    end
    if v251.Magnitude < (huge2 - 5) then
      huge2, now4 = v251.Magnitude, os.clock()
    else
    end
    v250 = v251.Unit
    if (os.clock() - now4) > 2 then
      local v252 = reg.getHumanoid
      local v253 = v252()
      if v253 then
        v253.Jump = true
      end
      v252 = reg.vec3
      v250 = (v250 + (v252(-v250.Z, 0, v250.X) * num3)).Unit
      if (os.clock() - now4) > 3.5 then
        now4, num3 = (os.clock()), -num3
      else
      end
    else
    end
    local v254
    v254, arg4_5.AssemblyLinearVelocity = reg.vec3, (v250 * math.min(fn7() * (arg5_5 or 0.95), v251.Magnitude / 0.05)) + reg.vec3(0, arg4_5.AssemblyLinearVelocity.Y, 0)
    v251 = reg.heartbeatWait
    v251()
  end
  v249 = reg.getRoot
  arg2_30 = v249()
  if arg2_30 then
    v247 = reg.zeroVec
    arg2_30.AssemblyLinearVelocity = v247
  end
  return false
end
local tbl37 = {}
local function fn59(arg1_70, arg2_31, arg3_14)
  if tbl37[arg1_70] then
    tbl37[arg1_70]:Disconnect()
    tbl37[arg1_70] = nil
  end
  if arg2_31 then
    tbl37[arg1_70] = fn2(arg2_31, arg3_14)
  end
end
local home = window:Home({Game = "Steal An Egg", Key = "Venyx SAE", Discord = "https://discord.gg/Gen7QdXVs6", Community = "Venyx Discord", Hop = function()
  local v255 = reg.state
  v255.hop("Least players")
end, Switch = {"Chilli Hub", "flame", function()
  window:Dialog({Title = "Switch to Chilli Hub", Kind = "warn", Text = "Venyx closes completely and Chilli Hub loads. You stay in this server.", Buttons = {{"Cancel"}, {"Switch", function()
    pcall(function()
      teleportService:SetTeleportSetting("__VenyxAutoLoad", false)
    end)
    if v4.VenyxSAE then
      pcall(v4.VenyxSAE)
    end
    local v256, v257, v258, v259 = reg.game, reg.game, pcall(reg.game.HttpGet, reg.game, "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua")
    local v260 = v258 and loadstring(v259)
    if v260 then
      v260()
    end
  end, true}}})
end}, Unload = function()
  window:Dialog({Title = "Unload Venyx", Kind = "warn", Text = "Every feature stops and the menu closes. You stay in this server.", Buttons = {{"Cancel"}, {"Unload", function()
    task.defer(function()
      if v4.VenyxSAE then
        v4.VenyxSAE()
      end
    end)
  end, true}}})
end, News = {{"NEW", "v1.1.0: Halloween tasks follow Task order, Walk speed for monsters, pumpkins and ghosts, Use weapons picks every weapon, Lab and Race shop removed", "Venyx", 1792275372}, {"NEW", "Halloween: Dimension eggs, monsters, Ghost Dog quest, fishing, Phantom Express and Cursed Island Wars", "Venyx", 1792260000}, {"NEW", "Admin abuse works like Chilli: admin treadmill, Capture the egg, minigame eggs and Instant steal", "Venyx", 1792250000}, {"FIX", "Fixed lag back with the Tween delivery method", "Venyx", 1792163916}, {"NEW", "Welcome to Venyx 1.0.4! Join our Discord for updates and support", "Venyx", 1792080000}}})
do
  local num4, str2 = 666, "https://raw.githubusercontent.com/tienkhanh1/spicy/main/VenyxSAE.version"
  task.spawn(function()
    while true do
      local v261 = reg.alive
      if not v261 then
        break
      end
      local v262, v263, v264, v265 = reg.game, reg.game, pcall(reg.game.HttpGet, reg.game, str2 .. ("?t=" .. os.time()))
      v261 = v264 and tonumber(tostring(v265):match("^%s*(%d+)%s*$"))
      if v261 and (v261 > num4) then
        local tbl38 = {{"UPD", "Update available: re-execute Venyx to get the new version", "Venyx", os.time()}}
        for index12, item20 in ipairs(home.list or {}) do
          tbl38[#tbl38 + 1] = item20
        end
        fn33("upd", function()
          home:News(tbl38)
        end)
        fn34("Update available", "Re-execute Venyx to get the new version", "warn")
        return
      end
      task.wait(300)
    end
  end)
end
local tbl39, tbl40, tbl41 = {}, {}, {{"Steal", "egg", {"Auto Steal", "Egg Predictor"}}, {"Farm", "farm", {"Pen", "Treadmill", "Mutate", "Sell", "Fuse", "Priority"}}, {"Event", "sparkles", {"Halloween", "Star", "Butterfly", "AA"}}, {"Player", "user", {"ESP", "Move", "Combat"}}, {"System", "settings", {"Server", "Webhook", "Optimizer", "Interface", "Config"}}}
for index13, item21 in ipairs(tbl41) do
  index13 = window:Tab(item21[1], item21[2])
  tbl40[item21[1]] = index13
  for index14, item22 in ipairs(item21[3]) do
    tbl39[item22] = index13:Sub(item22)
  end
end
local function fn60(arg1_71)
  return window.open and (window.Cur == tbl40[arg1_71])
end
local tbl42 = {links = {}, rig = 0, body = 0, at = 0}
reg.slot3 = tbl42
local tbl43 = {[Enum.HumanoidStateType.Running] = true, [Enum.HumanoidStateType.RunningNoPhysics] = true, [Enum.HumanoidStateType.Landed] = true}
reg.slot5 = tbl43
local tbl44 = {Enum.HumanoidStateType.FallingDown, Enum.HumanoidStateType.Ragdoll, Enum.HumanoidStateType.Physics}
reg.slot6 = function(arg1_72)
  workspace.CurrentCamera.CameraSubject = arg1_72
  pcall(function()
    local v266
    v266, require(reg.localPlayer.PlayerScripts.PlayerModule):GetControls().humanoid = reg.localPlayer, arg1_72
  end)
  local v267 = reg.localPlayer
  local character3, v268 = v267.Character
  if character3 then
    v267 = reg.localPlayer
    v268 = v267.Character:FindFirstChild("Animate")
  else
    v268 = character3
  end
  if v268 then
    task.spawn(function()
      v268.Enabled = false
      task.wait()
      v268.Enabled = true
    end)
  end
end
reg.slot7 = function()
  local v269 = reg.slot3
  for index15, item23 in ipairs(v269.links) do
    item23:Disconnect()
  end
  table.clear(reg.slot3.links)
  local v270, v271 = reg.slot3, reg.slot3
  v270.o = nil
  v271.c = nil
end
reg.slot2 = function()
  local v272 = reg.slot3
  local cond5, v273 = v272.c ~= nil
  if cond5 then
    local v274, v275 = reg.slot3
    v275, v273 = reg.localPlayer, v274.c.Parent == reg.localPlayer.Character
  else
    v273 = cond5
  end
  return v273
end
local function fn61()
  local v276 = reg.slot3
  local o, v277 = v276.o, reg.slot3
  local c, v278 = v277.c, reg.localPlayer
  v276, v277 = v278.Character, reg.slot7
  v277()
  if o then
    if c then
      if v276 then
        if c.Parent == v276 then
          o.Parent = v276
          v277 = reg.slot6
          v277(o)
          c:Destroy()
        end
      end
    end
  end
end
local qT = vm:QT(1, 2, {[1] = reg, [2] = reg, [3] = reg, [4] = reg, [5] = reg, [6] = reg, [7] = reg}, vm2, vm5, nil)
local function fn62(arg1_73)
  local v279 = ipairs
  for it1_3, it2_2 in v279(tbl44) do
    local v280, setStateEnabled, v281 = pcall, arg1_73.SetStateEnabled, reg.slot21
    local god, v282 = v281.god
    if god then
      v282 = god
    else
      it1_3 = reg.state
      v282 = it1_3.godHunt
    end
    v280(setStateEnabled, arg1_73, it2_2, not v282)
  end
  v279 = reg.slot21
  if v279.god then
    if arg1_73.Health > 0 then
      if arg1_73.Health < arg1_73.MaxHealth then
        arg1_73.Health = arg1_73.MaxHealth
      end
    end
  end
end
do
  local flag6, flag7 = false, false
  local function fn63(arg1_74)
    flag6 = false
    if not (arg1_74) then
      return
    end
    local function fn64(arg1_75)
      if arg1_75:IsA("Humanoid") then
        arg1_75.Died:Once(function()
          flag6 = true
        end)
      end
    end
    for index16, child2 in ipairs(arg1_74:GetChildren()) do
      fn64(child2)
    end
    arg1_74.ChildAdded:Connect(fn64)
  end
  fn63(reg.localPlayer.Character)
  fn2(reg.localPlayer.CharacterRemoving, function()
    flag7 = not flag6
  end)
  fn2(reg.localPlayer.CharacterAdded, function(arg1_76)
    local v283 = reg.slot7
    v283()
    fn63(arg1_76)
    local v284, v285, v286, v287 = reg.slot3, reg.slot3, reg.slot3, flag7
    v284.gate, v285.body, v286.at = v287, os.clock(), os.clock() + 1
    flag7 = false
  end)
  tbl41 = networking:FindFirstChild("RE/RigSync/Refresh")
  if tbl41 then
    fn2(tbl41.OnClientEvent, function()
      local v288 = reg.slot3
      v288.rig = os.clock()
    end)
  end
end
local function fn65()
  local v289 = reg.state
  local invisBusy, v290 = v289.invisBusy
  if invisBusy then
    v290 = invisBusy
  else
    v289 = fn12()
    if v289 then
      local v291, v292 = reg.slot4
      if v291 then
        local v293 = reg.state
        v292 = v293.free(reg.slot4)
      else
        v292 = v291
      end
      v290 = not v292
    else
      v290 = v289
    end
  end
  invisBusy = nil
  if v290 then
    invisBusy = v290
  else
    v289 = reg.state
    local cond6 = v289.realHum ~= nil
    if cond6 then
      local v294 = reg.state
      invisBusy = v294.realHum()
    else
      invisBusy = cond6
    end
  end
  return invisBusy
end
reg.state.ready = function(arg1_77, arg2_32)
  local v295 = os.clock() + (arg2_32 or 1.5)
  while true do
    arg2_32 = reg.slot2
    local v296 = arg2_32()
    if not (((if v296 then not v296 else not fn65()) and (os.clock() < v295)) and arg1_77()) then
      break
    end
    qT()
    v296 = reg.slot2
    if v296() then
      return true
    end
    v296 = reg.heartbeatWait
    v296()
  end
  return true
end
local v297 = fn50({name = "Shield", gap = 0.25})
v297.on = function()
  return true
end
v297.fn = function()
  local v298 = reg.state
  if v298.agBusy then
    return
  end
  fn33("swap", function()
    if fn65() then
      local v299 = reg.slot2
      if v299() then
        fn61()
      end
    else
      qT()
    end
    local v300 = reg.getHumanoid
    local v301 = v300()
    if v301 then
      fn62(v301)
    end
  end)
end
local v303 = fn50({name = "Steal", mover = true, gap = 0.5, pri = 2, ev = function()
  local v302 = reg.state
  return v302.mgUid ~= nil
end})
v303.on = function()
  local v304 = reg.slot21
  local steal, v305 = v304.steal
  if steal then
    v305 = steal
  else
    v304 = reg.state
    local cond7 = v304.wispSteals ~= nil
    if cond7 then
      local v306 = reg.state
      v305 = v306.wispSteals()
    else
      v305 = cond7
    end
  end
  return v305
end
do
  local num5 = 0
  reg.slot38 = num5
  tbl41 = networking:FindFirstChild("RE/EggWorld/FieldEggRedeemVerdict")
  if tbl41 then
    fn2(tbl41.OnClientEvent, function(arg1_78)
      reg.slot38 = os.clock()
      if v303.cv then
        local v307 = reg.slot36
        if v303.cv > (v307.best or 0) then
          local v308, v309 = reg.slot36, reg.slot36
          v308.best, v309.bestCat = v303.cv, ((type(arg1_78) == "table") and arg1_78.AssetCategory) or nil
        end
      end
      local v310, v311, v312 = reg.slot36, type(arg1_78) == "table"
      if v311 then
        local displayName = arg1_78.DisplayName
        if displayName then
          v312 = displayName
        else
          local v313 = reg.getDisplayName
          v312 = v313(arg1_78.AssetCategory)
        end
      else
        v312 = v311
      end
      v310.last = v312 or "Egg"
      v312 = reg.slot36
      v312.lastCat = ((type(arg1_78) == "table") and arg1_78.AssetCategory) or nil
      v311, v312 = reg.state, reg.state
      v311.lastEgg, v312.lastEggAt = "field", os.clock()
      v311 = reg.state
      if v311.onSteal then
        v310 = reg.state
        v310.onSteal(arg1_78)
      end
    end)
  end
  reg.slot21.runK = 0.95
  local section = tbl39["Auto Steal"]:Section("Auto steal", "zap", 1)
  reg.state.stealSec = section
  reg.state.stopSteal = function()
    local v314 = reg.state
    if v314.curUid then
      local v315, v316 = reg.state
      v316, v315.skip[reg.state.curUid] = reg.state, true
    end
    fn51(v303)
    v314 = reg.state
    v314.curUid = nil
  end
  reg.state.retarget = function()
    local v317 = reg.state
    v317.fresh()
    v317 = reg.state
    if v317.curUid then
      local v318 = reg.slot29
      if not (v318()) then
        fn51(v303)
        local v319 = reg.state
        v319.curUid = nil
      end
    end
  end
  reg.state.unVis = function()
    local v320 = reg.state
    if v320.stealVis then
      local v321, v322 = reg.state, reg.state
      v321.stealVis = false
      v322.visibleUntil = 0
    end
  end
  reg.state.autoSteal = fn44(section, "Auto steal", "steal", false, function(arg1_79)
    if not (arg1_79) then
      fn51(v303)
      local v323 = reg.state
      v323.curUid = nil
      table.clear(reg.state.pick)
      v323 = reg.state
      v323.unVis()
    end
    arg1_79 = reg.state
    if arg1_79.hud then
      local v324 = reg.state
      v324.hud.Sync()
      v324 = reg.state
      v324.hud.Refresh()
    end
  end)
  local v325
  fn46(section, "Go to egg", "goMode", {"Tween", "Teleport to egg", "Light Dark zone", "Fast tween to egg"}, "Tween", function()
    v325()
  end)
  fn46(section, "Delivery method", "carryMode", {"Tween", "Instant steps"}, "Tween", function()
    v325()
  end)
  reg.slot12 = function()
    local v326 = reg.slot21
    return v326.goMode
  end
  local function fn66()
    local v327 = reg.slot12
    return v327() ~= "Tween"
  end
  reg.state.cmode = function()
    local v328, v329 = fn66() and "Fast tween"
    if v328 then
      v329 = v328
    else
      local v330 = reg.slot21
      v329 = v330.carryMode
    end
    return v329
  end
  reg.state.tpz = function(arg1_80)
    if arg1_80 then
    else
      local v331 = reg.slot12
      arg1_80 = (v331())
    end
    return (arg1_80 == "Teleport to egg") or (arg1_80 == "Fast tween to egg")
  end
  local v332 = fn32({"Enchanted Forest", "Light Dark", "Titan Temple"})
  reg.slot13 = v332
  do
    local tbl45 = {"Enchanted Forest", "Light Dark", "Titan Temple", "Cherry Blossom", "Cosmic", "Prehistoric"}
    reg.slot21.tpZones = table.clone(reg.slot13)
    local v333
    local tpZones = reg.slot21.tpZones
    v333 = section:Dropdown("Teleport zones", tbl45, {"Enchanted Forest", "Light Dark", "Titan Temple"}, function(arg1_81)
      local v334, flag8 = ipairs, false
      for it1_4, it2_3 in v334(arg1_81) do
        if flag8 then
        else
          it1_4 = v121.busy
          local flag9, v335 = not it1_4
          if it1_4 then
            v335 = flag9
          else
            local v336 = reg.slot13
            v335 = not v336[it2_3]
          end
          flag8 = v335 and not tpZones[it2_3]
        end
      end
      local v337, v338 = tpZones, reg.slot21
      local v339, v340 = fn32(arg1_81) or {}, fn32(arg1_81) or {}
      v338.tpZones = v339
      tpZones = v340
      if flag8 then
        local function fn67()
          local tbl46 = {}
          for index17, item24 in ipairs(tbl45) do
            if v337[item24] then
              tbl46[#tbl46 + 1] = item24
            end
          end
          v333:Set(tbl46)
        end
        window:Dialog({Title = "Teleport zones", Kind = "warn", Text = "Teleport to egg is made for the 3 far zones. In Cherry Blossom, Cosmic and Prehistoric it may bug (landing off the egg, eggs sent back to the nest).", Buttons = {{"Cancel", fn67}, {"Use anyway", nil, true}}, Cancel = fn67})
      end
    end, true)
  end
  section:Slider("Tween speed", 70, 110, 95, function(arg1_82)
    local v341 = reg.slot21
    v341.runK = arg1_82 / 100
  end, "%", 5)
  reg.slot21.pullSpd = 3300
  local slider = section:Slider("Delivery speed", 3000, 4500, 3300, function(arg1_83)
    local v342 = reg.slot21
    v342.pullSpd = arg1_83
  end, "", 50, "Change if steal fails")
  v121.Alias[slider.Key:gsub("[^/]+$", "Fast tween speed")] = slider
  fn47(section, "Instant steps", "stepsN", 1, 6, 3)
  v325 = function()
    local tbl47, v343 = {["Delivery method"] = not fn66()}, reg.state
    tbl47["Teleport zones"] = v343.tpz()
    tbl47["Tween speed"] = not fn66()
    tbl47["Delivery speed"] = fn66()
    v343 = fn66()
    local flag10, v344 = not v343
    if v343 then
      v344 = flag10
    else
      local v345 = reg.slot21
      v344 = v345.carryMode == "Instant steps"
    end
    tbl47["Instant steps"] = v344
    for index18, item25 in ipairs(v121.W.All) do
      if tbl47[item25.title] ~= nil then
        if item25.path:find("Auto Steal / Auto steal$") then
          item25.r.Visible = tbl47[item25.title]
        end
      end
    end
  end
  task.defer(v325)
  fn44(section, "Steal missing index eggs", "index", false)
  slider = fn44(section, "Steal from other players", "thief", true)
  v121.Alias[slider.Key:gsub("[^/]+$", "Steal back from players")] = slider
  section = tbl39.AA:Section("Admin abuse", "crown")
  reg.state.adminSec = section
  local v346 = fn35("adm", section:Text("No admin boost right now"))
  slider = fn44(section, "Instant steal", "adminSteal", true)
  v121.Alias[slider.Key:gsub("[^/]+$", "Instant steal (Admin Treadmill)")] = slider
  local v347 = fn50({name = "AdminInfo", gap = 2})
  v347.on = function()
    return fn60("Event")
  end
  v347.fn = function()
    local tbl48, v348, v349, v350 = {}, next, workspace:GetAttributes()
    for key10, item26 in v348, v349, v350 do
      if key10:find("^AdminBoost_") then
        if type(item26) == "number" then
          if item26 > 1 then
            tbl48[#tbl48 + 1] = key10:sub(12) .. (" x" .. item26)
          end
        end
      end
    end
    table.sort(tbl48)
    v346(((#tbl48 > 0) and ("Live: " .. table.concat(tbl48, ", "))) or "No admin boost right now")
  end
  reg.slot39 = function()
    local v351 = reg.slot21
    return v351.dropSafe == true
  end
  reg.state.openBag = function(arg1_84)
    local v352 = reg.localPlayer
    local hUD = v352.PlayerGui:FindFirstChild("HUD")
    v352 = ((hUD and hUD:FindFirstChild("GameHUD")) and hUD.GameHUD:FindFirstChild("RightButtons")) and hUD.GameHUD.RightButtons:FindFirstChild(arg1_84)
    if not v352 then
      return fn34("Inventory", "The game's button is not there right now", "warn")
    end
    window:Show(false)
    for index19, item27 in ipairs((getconnections and getconnections(v352.Activated)) or {}) do
      pcall(item27.Fire, item27)
    end
  end
  local tbl49, tbl50, tbl51, tbl52, tbl53, tbl54, tbl55, tbl56, tbl57, luck = {}, {"Candy Corn", tbl17.candy}, {"Last egg", tbl17.scrambled}, {"Placed", tbl17.check}, {"Money /s", tbl17.money}, {"Night in", tbl17.night}, {"Session time", tbl17.timer}, {"Best steal", tbl17.trophy}, {}, tbl17.luck
  vm:yT(tbl57, 0, "Egg bag", luck, function()
    local v353 = reg.state
    v353.openBag("EggsButton")
  end)
  luck, section = {}, tbl17.pet
  vm:yT(luck, 0, "Pet bag", section, function()
    local v354 = reg.state
    v354.openBag("PetsButton")
  end)
  vm:yT(tbl49, 0, tbl50, tbl51, tbl52, tbl53, tbl54, tbl55, tbl56, tbl57, luck)
  reg.state.stats = home:Stats("Session", tbl49)
  tbl49 = tbl39["Auto Steal"]:Section("Filter", "target", 2)
  local function fn68(arg1_85)
    local v355 = reg.slot21
    v355.zones = nil
    v355 = ipairs
    for it1_5, it2_4 in v355(arg1_85) do
      local v356, v357 = reg.slot21, reg.slot21
      v356.zones = v357.zones or {}
      v357 = reg.slot21
      v357.zones[it2_4:gsub("%s", "")] = true
    end
  end
  tbl49:Dropdown("Zones", tbl9, {}, fn68, true)
  fn46(tbl49, "Steal first", "order", {"Best value", "Lowest value", "Best rarity", "Best mutation", "Biggest", "Closest"}, "Best value")
  local v358 = fn38(tbl49, {mut = "Mutations", wild = true})
  fn38(tbl49, {rar = tbl7, sp = "Only these eggs", minV = "Min value /s"}, v358)
  reg.state.stealFilter = v358
  fn44(tbl49, "Sell cheapest egg when bag is full", "bagSell", false, function(arg1_86)
    if arg1_86 then
      local v359 = reg.state
      if v359.bagCheck then
        task.defer(reg.state.bagCheck)
      end
    end
  end)
  tbl49:Slider("Only below /s", 0, 0, 0, function(arg1_87)
    local v360 = reg.slot21
    v360.bagMax = ((arg1_87 > 0) and arg1_87) or nil
  end, "log")
  local function fn69(arg1_88)
    local v361 = reg.getSeparationPos
    return math.max(v361().Y + 43.35, arg1_88 or 0)
  end
  reg.slot24 = function(arg1_89, arg2_33)
    local v362 = reg.state
    v362.ready(arg2_33)
    local v363, huge3, now5, flag11 = os.clock() + 60, math.huge, os.clock(), false
    while arg2_33() and (os.clock() < v363) do
      v362 = reg.getRoot
      local v364, v365 = v362(), reg.getHumanoid
      local v366 = v365()
      if not (v364) then
        return false
      end
      if v364.Anchored then
        if not (reg.slot14(arg2_33)) then
          return false
        end
      end
      v365 = reg.vec3
      local v367 = v365(arg1_89.X - v364.Position.X, 0, arg1_89.Z - v364.Position.Z)
      v365 = v367.Magnitude
      if v365 < (huge3 - 5) then
        huge3, now5 = v365, os.clock()
      else
        if if flag11 then not flag11 else (os.clock() - now5) > 0.8 then
          now5 = os.clock()
          local v368 = reg.invokeRemote
          v368("RF/Treadmill/AskDoff")
          flag11 = true
        else
          if (os.clock() - now5) > 3 then
            local v369 = reg.state
            if v369.respawn then
              local v370 = reg.slot10
              v370("Stuck in place, resetting the character")
              v370 = reg.state
              v370.respawn(true)
              return false
            end
          end
        end
      end
      if v365 <= 2.5 then
        if (v364.Position.Y - arg1_89.Y) < 4 then
          local v371 = reg.zeroVec
          v364.AssemblyLinearVelocity = v371
          return true
        end
      end
      local y = arg1_89.Y
      if math.abs(v364.Position.Y - y) > 2 then
        local v372, v373, v374 = reg.localPlayer, reg.localPlayer, reg.cframeNew
        pcall(reg.localPlayer.Character.PivotTo, reg.localPlayer.Character, reg.cframeNew(v364.Position.X, y, v364.Position.Z) * v364.CFrame.Rotation)
      end
      local cond8, v375 = v365 > 0.01
      if cond8 then
        y = nil
        y, v375 = reg.slot21, v367.Unit * math.min(fn7() * reg.slot21.runK, v365 / 0.05)
      else
        v375 = cond8
      end
      cond8 = nil
      if v375 then
        cond8 = v375
      else
        y = reg.zeroVec
        cond8 = y
      end
      v364.AssemblyLinearVelocity = cond8
      if v366 then
        cond8, v375 = (v365 > 0.01) and v367.Unit
        if cond8 then
          v375 = cond8
        else
          v364 = reg.zeroVec
          v375 = v364
        end
        v366:Move(v375, false)
      end
      cond8 = reg.heartbeatWait
      cond8()
    end
    return false
  end
  reg.slot45 = function(arg1_90)
    if arg1_90 then
      if arg1_90.done then
        return
      end
    else
      return
    end
    arg1_90.done = true
    local v376, v377 = reg.runService, reg.runService
    pcall(reg.runService.UnbindFromRenderStep, reg.runService, arg1_90.n)
    if arg1_90.c then
      pcall(arg1_90.c.Destroy, arg1_90.c)
    end
    local currentCamera, v378 = workspace.CurrentCamera, reg.getHumanoid
    arg1_90 = v378()
    if currentCamera then
      currentCamera.CameraType = Enum.CameraType.Custom
      if arg1_90 then
        currentCamera.CameraSubject = arg1_90
      end
    end
  end
  reg.slot43 = function(arg1_91, arg2_34)
    local currentCamera2, v379 = workspace.CurrentCamera, reg.localPlayer
    local character4, v380 = v379.Character, reg.getRoot
    local v381 = v380()
    if currentCamera2 and character4 then
      if not (v381) then
        return
      end
    else
      return
    end
    local tbl58, v382 = {}, reg.httpService
    tbl58.n = v382:GenerateGUID(false)
    tbl58.t = os.clock() + 15
    pcall(function()
      local archivable = character4.Archivable
      character4.Archivable = true
      local clone = character4:Clone()
      character4.Archivable = archivable
      for index20, child3 in ipairs(clone:GetDescendants()) do
        if child3:IsA("LuaSourceContainer") then
          child3:Destroy()
        elseif child3:IsA("ForceField") then
          child3:Destroy()
        elseif child3:IsA("Tool") then
          child3:Destroy()
        elseif child3:IsA("BasePart") then
          child3.Anchored = true
          child3.CanCollide = false
          child3.CanQuery = false
          child3.CanTouch = false
        end
      end
      archivable = clone:FindFirstChildOfClass("Humanoid")
      if archivable then
        archivable.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
      end
      tbl58.h = archivable
      clone.Name = tbl58.n
      archivable = nil
      if arg1_91 then
        local v383
        if arg2_34 then
          local v384
          v384, v383 = reg.vec3, CFrame.lookAt(arg1_91, reg.vec3(arg2_34.X, arg1_91.Y, arg2_34.Z))
        else
          v383 = arg2_34
        end
        if v383 then
          archivable = v383
        else
          local v385 = reg.cframeNew
          archivable = v385(arg1_91) * v381.CFrame.Rotation
        end
      else
        archivable = arg1_91
      end
      clone:PivotTo(archivable or v381.CFrame)
      clone.Parent = workspace
      tbl58.c = clone
    end)
    v380, v379 = reg.runService, reg.runService
    pcall(reg.runService.BindToRenderStep, reg.runService, tbl58.n, Enum.RenderPriority.Last.Value + 50, function()
      if os.clock() > tbl58.t then
        local v386 = reg.slot45
        return v386(tbl58)
      end
      if tbl58.h then
        if currentCamera2.CameraSubject ~= tbl58.h then
          currentCamera2.CameraSubject = tbl58.h
        end
      end
    end)
    return tbl58
  end
  local function fn70()
    local v387 = reg.findInWorld
    local v388 = v387("Build")
    local v389, v390 = v388 and (v388:FindFirstChild("FuseBiomeLanePortals")), v388 and (v388:FindFirstChild("FuseBiomeZone"))
    return v389 and (v389:FindFirstChildWhichIsA("BasePart")), v390 and (v390:FindFirstChild("ExitPart", true))
  end
  local function fn71(arg1_92)
    pcall(function()
      firetouchinterest(reg.getRoot(), arg1_92, 0)
      firetouchinterest(reg.getRoot(), arg1_92, 1)
    end)
  end
  local function fn72()
    local v391 = reg.localPlayer
    local cond9, v392 = v391:GetAttribute("InEnchantedTree") == true
    if cond9 then
      v392 = cond9
    else
      v391 = reg.localPlayer
      v392 = v391:GetAttribute("InBossArena") == true
    end
    v391 = nil
    if v392 then
      v391 = v392
    else
      cond9 = reg.state
      local cond10 = cond9.highOk ~= nil
      if cond10 then
        local v393 = reg.state
        v391 = v393.highOk()
      else
        v391 = cond10
      end
    end
    return v391
  end
  reg.slot9 = function()
    local v394 = reg.getRoot
    local v395 = v394()
    v394 = nil
    if v395 then
      local v396 = reg.getRoot
      v394 = v396().Position.Y > 1000
    else
      v394 = v395
    end
    return v394 and not fn72()
  end
  reg.slot11 = function(arg1_93)
    local v397, v398 = fn70()
    local v399 = reg.localPlayer
    local character5, v400 = v399.Character, os.clock() + 12
    while true do
      local v401, v402 = v398 and reg.alive
      if v401 then
        v399 = reg.localPlayer
        v402 = v399.Character == character5
      else
        v402 = v401
      end
      local v403, v404 = v402 and (os.clock() < v400)
      if v403 then
        v402 = reg.slot9
        v404 = (v402())
      else
        v404 = v403
      end
      if not v404 then
        break
      end
      v404, v403 = reg.setRootCFrame, reg.cframeNew
      v404(v403(v398.Position))
      fn71(v398)
      task.wait(arg1_93 or 0.1)
    end
    v399 = reg.slot9
    return not v399()
  end
  reg.state.inFuse = reg.slot9
  reg.state.leaveFuse = reg.slot11
  local v405 = fn50({name = "FuseGuard", gap = 0.3})
  local v406
  v405.on = function()
    return true
  end
  v405.fn = function()
    local v407 = reg.slot9
    if v407() and reg.slot4 then
      v406 = v406 or os.clock()
      local v408, v409 = reg.state, ((os.clock() - v406) > ((reg.state.fuseBusy and 6) or 1)) and not fn12()
      if v409 then
        local v410 = reg.state
        if not (v410.fuseBusy) then
          fn51(reg.slot4)
          local v411 = os.clock() + 3
          while true do
            local v412 = reg.slot4 and reg.slot4.busy
            if not (v412 and (os.clock() < v411)) then
              break
            end
            task.wait()
          end
        end
        v410 = reg.slot10
        v410("Leaving the portal zone")
        v410 = reg.slot11
        v410()
      end
      return
    end
    v406 = nil
  end
  local v413 = fn50({name = "NightHome", mover = true, soft = true, pri = 40, gap = 1})
  v413.on = function()
    local v414 = reg.slot21
    local steal2, v415 = v414.steal
    if steal2 then
      v415 = steal2
    else
      v414 = reg.slot21
      v415 = v414.bloom
    end
    v414 = nil
    if v415 then
      v414 = v415
    else
      steal2 = reg.slot21
      v414 = steal2.star
    end
    steal2 = nil
    if v414 then
      steal2 = v414
    else
      v415 = reg.slot21
      steal2 = v415.wisp
    end
    return steal2 and (fn26() <= 0)
  end
  v413.want = function()
    local v416 = reg.getRoot
    local v417, v418 = v416(), reg.callModule
    if v413.night == v418("Cycle", "NextResetTime", fn6()) then
      return
    elseif v417 then
      v416 = reg.slot29
      if v416() then
        return
      else
        local v419 = reg.isBeforeSeparation
        if v419(v417.Position) then
          return
        elseif fn72() then
          return
        end
      end
    else
      return
    end
    v416, v417 = reg.getRiftPos, reg.vec3
    return v416() + v417(0, 3, 0)
  end
  v413.run = function(arg1_94, arg2_35)
    local v420 = reg.callModule
    v413.night = v420("Cycle", "NextResetTime", fn6())
    v420 = reg.slot10
    v420("Night, back to the safe zone")
    fn52(arg1_94, arg2_35)
  end
  local function fn73(arg1_95, arg2_36)
    local v421 = reg.state
    v421.ready(arg2_36)
    v421 = 0.016666666666666666
    while arg2_36() do
      local v422 = reg.getRoot
      local v423 = v422()
      if not (v423) then
        return false
      end
      v422 = v423.Position
      if math.abs(arg1_95.X - v422.X) <= 4 then
        return true
      end
      local v424, v425, v426, v427 = reg.slot21, v422.X + (math.sign(arg1_95.X - v422.X) * math.min(reg.slot21.pullSpd * v421, 75, math.abs(arg1_95.X - v422.X))), reg.setRootCFrame, reg.cframeNew
      v426(v427(v425, fn69(arg1_95.Y), v422.Z + ((arg1_95.Z - v422.Z) * 0.1)))
      v425 = reg.heartbeatWait
      v421 = (v425())
    end
    return false
  end
  reg.slot25 = function(arg1_96, arg2_37)
    local v428 = reg.state
    v428.ready(arg2_37)
    local v429, v430 = fn70()
    v428 = reg.getRoot
    local v431 = v428()
    if v429 then
      if v430 then
        if firetouchinterest then
          if not (v431) then
            return nil
          end
        else
          return nil
        end
      else
        return nil
      end
    else
      return nil
    end
    local function fn74(arg1_97)
      local v432 = reg.vec3
      return v432(arg1_96.X - arg1_97.X, 0, arg1_96.Z - arg1_97.Z).Magnitude
    end
    v428 = reg.isBeforeSeparation
    if not (v428(v431.Position)) then
      if fn74(v431.Position) < fn74(v429.Position) then
        local v433 = reg.slot24
        return v433(arg1_96, arg2_37)
      end
    end
    v428 = reg.getRiftPos
    local v434, v435, v436 = reg.vec3, v428() + reg.vec3(0, 3, 0), reg.isBeforeSeparation
    if v436(v431.Position) and ((v431.Position - v435).Magnitude > 69) then
      v428 = reg.slot10
      v428("Moving to the safe zone")
      fn74 = reg.slot46
      if not (fn74(v435, arg2_37, 400)) then
        return false
      end
      local v437, v438 = reg.getPing, os.clock() + math.clamp(0.3 + reg.getPing(), 0.3, 0.5)
      while (os.clock() < v438) and (arg2_37()) do
        local v439, v440 = reg.setRootCFrame, reg.cframeNew
        v439(v440(v435) * reg.getRoot().CFrame.Rotation)
        v439 = reg.heartbeatWait
        v439()
      end
      if not (arg2_37()) then
        return false
      end
    end
    v435, v436 = reg.slot43, reg.vec3
    fn74, v428 = v435(v436(v429.Position.X + 40, 71, -363), arg1_96), reg.localPlayer
    v435, v436 = v428.Character, reg.state
    v436.fuseBusy = true
    for i4 = 1, 3, 1 do
      if arg2_37() then
        v436 = reg.localPlayer
        if v436.Character ~= v435 then
          break
        end
      else
        break
      end
      v428 = reg.slot10
      v428("Touching the lane portal (try " .. (i4 .. ")"))
      i4 = os.clock() + 5
      while true do
        local v441, v442 = (os.clock() < i4) and arg2_37()
        if v441 then
          local v443 = reg.localPlayer
          v442 = v443.Character == v435
        else
          v442 = v441
        end
        v441 = nil
        if v442 then
          local v444 = reg.slot9
          v441 = not v444()
        else
          v441 = v442
        end
        if not v441 then
          break
        end
        v442 = reg.getRoot
        if v442() then
          local v445, v446 = reg.setRootCFrame, reg.cframeNew
          v445(v446(v429.Position))
          fn71(v429)
        end
        v442 = reg.heartbeatWait
        v442()
      end
      i4 = reg.slot9
      if i4() then
        local v447 = reg.slot10
        v447("Inside the Fuse Biome, touching its exit")
        v447 = reg.slot11
        v447(0.25)
        v447 = reg.getRoot
        v431 = v447()
        if v431 then
          if (v431.Position - v429.Position).Magnitude < 200 then
            v447 = reg.state
            v447.fuseBusy = false
            task.delay(0.2, reg.slot45, fn74)
            local v448 = reg.slot24
            return v448(arg1_96, arg2_37)
          end
        end
      else
        for i5 = 1, 6, 1 do
          i5 = reg.getRoot
          if i5() then
            fn71(v430)
          end
          task.wait(0.1)
        end
        task.wait(0.5)
      end
    end
    v429 = reg.state
    v429.fuseBusy = false
    v436 = reg.slot45
    v436(fn74)
    fn74 = arg2_37()
    v429 = nil
    if fn74 then
      v428 = reg.localPlayer
      v429 = v428.Character == v435
    else
      v429 = fn74
    end
    return (v429 and nil) or false
  end
  reg.slot26 = function(arg1_98, arg2_38, arg3_15)
    local v449 = reg.state
    v449.ready(arg2_38)
    local v450, v451 = fn70()
    if v450 and v451 then
      if not (firetouchinterest) then
        return nil
      end
    else
      return nil
    end
    if arg3_15 then
      if not (fn73(arg1_98, arg2_38)) then
        return false
      end
    end
    arg3_15 = reg.slot43
    local v452 = arg3_15(arg1_98)
    local rEFuseBiomePortalTransition = networking:FindFirstChild("RE/FuseBiome/PortalTransition")
    local function fn75(arg1_99)
      local v453 = reg.state
      v453.fuseBusy = true
      v453 = reg.getHumanoid
      local v454 = v453()
      if arg1_99 then
        if v454 then
          v454.PlatformStand = true
        end
        local v455, v456 = os.clock() + 3
        while arg2_38() and (os.clock() < v455) do
          v453 = reg.getRoot
          local v457 = v453()
          if not (v457) then
            break
          end
          if (v457.Position - arg1_99).Magnitude > 15 then
            local v458, v459 = reg.setRootCFrame, reg.cframeNew
            v458(v459(arg1_99))
            v456 = nil
          else
            v456 = v456 or os.clock()
            if (os.clock() - v456) > 0.15 then
              break
            end
          end
          v457 = reg.heartbeatWait
          v457()
        end
        v455 = 0
        while (v455 < 0.05) and (arg2_38()) do
          local v460 = reg.heartbeatWait
          v455 += v460()
        end
      end
      local flag12 = false
      local v461, v462, num6 = rEFuseBiomePortalTransition and rEFuseBiomePortalTransition.OnClientEvent:Once(function()
        flag12 = true
      end), os.clock() + 4, 0
      while true do
        local v463, v464 = (os.clock() < v462) and arg2_38()
        if v463 then
          v453 = reg.getRoot
          v464 = (v453())
        else
          v464 = v463
        end
        v463 = nil
        if v464 then
          local v465 = reg.slot9
          v463 = not v465()
        else
          v463 = v464
        end
        if not v463 then
          break
        end
        if not flag12 then
          v463, v464 = not arg1_99
          if arg1_99 then
            local v466 = reg.getRoot
            v464 = (v466().Position - arg1_99).Magnitude > 15
          else
            v464 = v463
          end
          if v464 then
            local v467, v468 = reg.setRootCFrame, reg.cframeNew
            v467(v468(arg1_99 or v450.Position))
          end
          if if arg1_99 then os.clock() >= num6 else v463 then
            num6 = os.clock() + 0.1
            fn71(v450)
          else
          end
        else
        end
        v464 = reg.heartbeatWait
        v464()
      end
      if v461 then
        v461:Disconnect()
      end
      if v454 then
        pcall(function()
          v454.PlatformStand = false
        end)
      end
      arg1_99 = os.clock() + 2
      while true do
        v453 = nil
        if flag12 then
          v462 = reg.slot9
          v453 = not v462()
        else
          v453 = flag12
        end
        v461 = v453 and reg.alive
        if not (v461 and (os.clock() < arg1_99)) then
          break
        end
        local v469 = reg.heartbeatWait
        v469()
      end
      v461 = reg.slot11
      v461()
      v453 = reg.slot45
      v453(v452)
      v462 = reg.state
      v462.fuseBusy = false
      v453 = reg.getRoot
      v461 = v453()
      v462, v453 = arg2_38() and v461
      if v462 then
        arg1_99 = reg.slot9
        v453 = not arg1_99()
      else
        v453 = v462
      end
      return v453 and v461
    end
    arg3_15 = fn75(arg1_98)
    v449 = arg3_15 and ((arg3_15.Position - arg1_98).Magnitude <= 60)
    if arg3_15 then
      if v449 then
      else
        local magnitude, v470, v471 = (arg3_15.Position - arg1_98).Magnitude
        if magnitude <= 600 then
          v470 = fn58(arg1_98, arg2_38, 6, (magnitude / fn7()) + 2, 0.95)
          v471 = arg3_15
        else
          v451 = reg.slot10
          v451("Landed off the egg, trying again")
          v471 = fn75(arg1_98)
          v470 = v471 and ((v471.Position - arg1_98).Magnitude <= 60)
        end
        if v471 then
          if v470 then
            v449 = v470
          else
            magnitude = reg.slot10
            magnitude("Landed off the egg, going through the portal")
            local v472 = fn75(nil)
            if v472 then
              local v473 = reg.slot24
              v449 = (v473(arg1_98, arg2_38))
            else
              v449 = v472
            end
          end
        else
          v449 = v470
        end
      end
    else
    end
    return v449 or false
  end
  local qT2 = vm:QT(3, 4, {[8] = reg, [9] = reg, [10] = reg, [11] = reg, [12] = reg, [13] = reg, [14] = reg, [15] = reg, [16] = reg, [17] = reg, [18] = reg, [19] = reg, [20] = reg, [21] = reg, [22] = reg, [23] = reg, [24] = reg, [25] = reg, [26] = reg, [27] = reg}, vm2, vm5, nil)
  reg.slot35 = function(arg1_100)
    local v474, v475, v476, v477 = ipairs, vm[53](workspace:GetChildren()), 12
    for it1_6, it2_5 in v474(vm:uT(v475)) do
      local v478, v479 = ((it2_5.Name == "SmartPromptPart") and it2_5:IsA("BasePart")) and it2_5:FindFirstChild("CarryAreaEgg")
      if v478 then
        it1_6 = reg.vec3
        v479 = it1_6(it2_5.Position.X - arg1_100.X, 0, it2_5.Position.Z - arg1_100.Z).Magnitude
      else
        v479 = v478
      end
      if v479 then
        if v479 < v476 then
          v476, v477 = v479, v478
        else
        end
      else
      end
    end
    return v477
  end
  local qT3 = vm:QT(5, 6, {[28] = reg, [29] = reg, [30] = reg, [23] = reg, [16] = reg, [31] = reg, [21] = reg, [32] = reg, [33] = reg, [20] = reg, [1] = reg, [34] = reg, [35] = reg, [8] = reg}, vm2, vm5, nil)
  reg.state.stepTo = function(arg1_101, arg2_39)
    local v480 = reg.getRoot
    local v481 = v480()
    if not (v481) then
      return false
    end
    local max, v482 = math.max(fn7() * 1.515, 40), reg.vec3
    v480 = v482(v481.Position.X, math.max(v481.Position.Y, arg1_101.Y) + 42, v481.Position.Z)
    while arg2_39() do
      v481 = reg.vec3
      v482 = v481(arg1_101.X - v480.X, 0, arg1_101.Z - v480.Z)
      if v482.Magnitude <= max then
        break
      end
      v480 += v482.Unit * max
      local num7 = 0
      while (num7 < 0.1) and (arg2_39()) do
        local v483, v484 = reg.setRootCFrame, reg.cframeNew
        v483(v484(v480))
        v483 = reg.heartbeatWait
        num7 += v483()
      end
    end
    if not (arg2_39()) then
      return false
    end
    v481, v480, max = reg.setRootCFrame, reg.cframeNew, reg.vec3
    v481(v480(arg1_101 + max(0, 3, 0)))
    return true
  end
  reg.slot41 = function(arg1_102, arg2_40, arg3_16, arg4_6, arg5_6, arg6_3)
    local v485
    if arg6_3 then
      v485 = arg6_3
    else
      local v486 = reg.state
      v485 = v486.cmode()
    end
    local cond11, v487 = v485 == "Tween"
    if cond11 then
      arg6_3 = reg.state
      local agBusy = arg6_3.agBusy
      if agBusy then
        v487 = agBusy
      else
        local v488
        v488, v487 = reg.state, (os.clock() - (reg.state.agAt or -99)) < 3
      end
    else
      v487 = cond11
    end
    while true do
      arg6_3 = reg.state
      local agBusy2, v489 = arg6_3.agBusy
      if agBusy2 then
        cond11 = reg.slot29
        v489 = (cond11(arg1_102))
      else
        v489 = agBusy2
      end
      if not (v489 and (arg2_40())) then
        break
      end
      agBusy2 = reg.heartbeatWait
      agBusy2()
    end
    arg6_3 = reg.getRoot
    local v490, num8 = arg6_3(), 0
    if not (v490) then
      return
    end
    cond11, arg6_3 = reg.state, reg.state
    local flyY, v491 = arg6_3.flyY
    if flyY then
      v491 = flyY
    else
      local cond12, v492 = v485 == "Tween"
      if cond12 then
        arg6_3 = reg.getSeparationPos
        v492 = arg6_3().Y
      else
        v492 = cond12
      end
      v491 = v492 or (v490.Position.Y - 3)
    end
    cond11.flyY = v491
    v491 = reg.state
    flyY = v491.flyY
    if v487 then
      v491, arg6_3 = 0, 0
      while true do
        local cond13, v493 = v491 < 10
        if cond13 then
          cond11 = reg.slot29
          v493 = (cond11(arg1_102))
        else
          v493 = cond13
        end
        if not (v493 and (arg2_40())) then
          break
        end
        v493 = reg.isRagdolled
        cond13 = v493()
        v493 = nil
        if cond13 then
          v493 = cond13
        else
          local v494 = reg.state
          v493 = v494.agBusy
        end
        if v493 then
          cond13 = reg.heartbeatWait
          arg6_3, v491 = 0, v491 + cond13()
        else
          local v495 = reg.heartbeatWait
          arg6_3 += v495()
          if arg6_3 >= 0.3 then
            break
          end
        end
      end
      local v496, num9 = flyY + 3, 0
      while true do
        local cond14, v497 = num9 < 0.8
        if cond14 then
          local v498 = reg.slot29
          v497 = (v498(arg1_102))
        else
          v497 = cond14
        end
        if not (v497 and (arg2_40())) then
          break
        end
        cond14 = reg.getRoot
        v490 = cond14()
        if not (v490) then
          return
        end
        v497, cond14 = v496 - v490.Position.Y, reg.vec3
        v490.AssemblyLinearVelocity = cond14(0, ((num9 < 0.6) and math.clamp(v497 / math.max(0.6 - num9, 0.1), -120, 120)) or math.clamp(v497 / 0.2, -30, 30), 0)
        cond14 = reg.heartbeatWait
        num9 = num9 + cond14()
      end
      num8 = os.clock() + 1
    else
    end
    arg6_3 = arg4_6
    if v485 == "Instant steps" then
      arg4_6 = math.clamp(v490.Position.Z, -415, -305)
      local x, v499, max2, v500, max3, tbl59 = v490.Position.X, v490.Position.Y + 42, math.max(fn7() * 1.515, 40), reg.slot21, math.max(reg.slot21.stepsN or 3, 1), {}
      for i6 = 1, max3 - 1, 1 do
        tbl59[i6] = x - (((x - arg3_16.X) * i6) / max3)
      end
      max3 = 1
      while true do
        cond11 = reg.slot29
        if not ((cond11(arg1_102) and (arg2_40())) and ((x - max2) > arg3_16.X)) then
          break
        end
        x -= max2
        if tbl59[max3] then
          if x <= tbl59[max3] then
            local v501, v502, v503 = max3 + 1, reg.setRootCFrame, reg.cframeNew
            v502(v503(x, arg3_16.Y, arg4_6) * arg5_6)
            v491 = 0
            while true do
              v502 = reg.getPing
              local cond15, v504 = v491 < (0.19 + v502())
              if cond15 then
                v503 = reg.slot29
                v504 = (v503(arg1_102))
              else
                v504 = cond15
              end
              if not v504 then
                break
              end
              cond15 = reg.heartbeatWait
              v491 += cond15()
            end
            v503 = reg.callModule
            v503("Egg", "DropFieldEgg", "PlayerRequest")
            v491 = 0
            while true do
              v503 = reg.slot29
              if not (v503(arg1_102) and (v491 < 1.5)) then
                break
              end
              v502 = reg.heartbeatWait
              v491 += v502()
            end
            v503 = reg.slot29
            if not (v503(arg1_102)) then
              v502 = reg.state
              if not (v502.stealChase(arg1_102, arg2_40)) then
                return
              end
            end
            v502 = reg.getRoot
            v503 = v502()
            x, v491 = if v503 then v503.Position.X else x, 0
            while v491 < 0.1 do
              v503 = reg.heartbeatWait
              v491 += v503()
            end
            max3 = v501
          else
          end
        else
        end
        local v505 = reg.cframeNew
        local v506, num10 = v505(x, v499, arg4_6) * arg5_6, 0
        while true do
          local cond16, v507 = num10 < 0.1
          if cond16 then
            v505 = reg.slot29
            v507 = (v505(arg1_102))
          else
            v507 = cond16
          end
          if not v507 then
            break
          end
          v507 = reg.setRootCFrame
          v507(v506)
          cond16 = reg.heartbeatWait
          num10 += cond16()
        end
      end
      v499 = reg.slot29
      if v499(arg1_102) then
        tbl59, max3 = reg.setRootCFrame, reg.cframeNew
        tbl59(max3(arg3_16) * arg5_6)
      end
      return
    end
    arg4_6 = if v485 ~= "Fast tween" then math.clamp(v490.Position.Z, -415, -305) else arg6_3
    v491 = 0.016666666666666666
    while true do
      cond11 = reg.slot29
      if not (cond11(arg1_102) and (arg2_40())) then
        break
      end
      arg6_3 = reg.getRoot
      v490 = arg6_3()
      if not (v490) then
        return
      end
      local v508 = reg.state
      if v508.agBusy then
        local v509 = reg.heartbeatWait
        v509()
      else
        if v485 == "Tween" then
          if (v490.Position.X - arg3_16.X) <= 36 then
            break
          end
          local v510 = flyY + 3
          if math.abs(v490.Position.Y - v510) > 2 then
            local v511, v512, v513 = reg.localPlayer, reg.localPlayer, reg.cframeNew
            pcall(reg.localPlayer.Character.PivotTo, reg.localPlayer.Character, reg.cframeNew(v490.Position.X, v510, v490.Position.Z) * v490.CFrame.Rotation)
          end
          local v514, v515 = reg.vec3
          v515, v490.AssemblyLinearVelocity = reg.slot21, ((v514(-1, 0, math.clamp((arg4_6 - v490.Position.Z) * 0.03, -0.3, 0.3)).Unit * fn7()) * reg.slot21.runK) * (((os.clock() < num8) and 0.6) or 1)
          v514 = reg.heartbeatWait
          v514()
        else
          local position2 = v490.Position
          if (position2.X - arg3_16.X) <= 36 then
            break
          end
          local v516, v517, v518, v519 = reg.slot21, position2.X - math.min(reg.slot21.pullSpd * v491, 75, position2.X - arg3_16.X), reg.setRootCFrame, reg.cframeNew
          v518(v519(v517, flyY, position2.Z + ((arg4_6 - position2.Z) * 0.03)) * arg5_6)
          v517 = reg.heartbeatWait
          v491 = (v517())
        end
      end
    end
    if v485 == "Tween" then
      if v490 then
        arg2_40 = reg.zeroVec
        v490.AssemblyLinearVelocity = arg2_40
      end
    end
  end
  reg.slot42 = function(arg1_103, arg2_41)
    local v520 = reg.localPlayer
    local character6, v521, num11 = v520.Character, os.clock() + 10, 0
    while true do
      v520 = arg2_41()
      local v522
      if v520 then
        local v523 = reg.localPlayer
        v522 = v523.Character == character6
      else
        v522 = v520
      end
      local v524, v525 = v522 and (os.clock() < v521)
      if v524 then
        v522 = reg.slot29
        v525 = not v522(arg1_103)
      else
        v525 = v524
      end
      if not v525 then
        break
      end
      v522, v525 = workspace:FindFirstChild(arg1_103), reg.getRoot
      v524 = v525()
      if v522 then
        if v522:IsA("Model") then
          if not v524 then
            return false
          end
        else
          return false
        end
      else
        return false
      end
      local position3, v526 = v522:GetPivot().Position, reg.vec3
      v525 = v526(position3.X - v524.Position.X, 0, position3.Z - v524.Position.Z)
      if v525.Magnitude > 600 then
        return false
      end
      if v525.Magnitude > 2 then
        position3 = reg.state
        if not (position3.agBusy) then
          v522 = nil
          v522, v524.AssemblyLinearVelocity = reg.vec3, (v525.Unit * math.min(fn7() * 0.95, v525.Magnitude / 0.05)) + reg.vec3(0, v524.AssemblyLinearVelocity.Y, 0)
        end
      end
      if (v525.Magnitude < 12) and (num11 < 2) then
        num11 += 1
        task.spawn(function()
          local v527 = reg.callModule
          v527("Egg", "CarryFieldEgg", arg1_103)
          num11 -= 1
        end)
      else
      end
      v522 = reg.heartbeatWait
      v522()
    end
    v521 = reg.slot29
    return v521(arg1_103)
  end
  reg.state.stealChase = reg.slot42
  local v528
  reg.slot44 = v528
  local qT4 = vm:QT(7, 8, {[10] = reg, [36] = reg, [32] = reg, [33] = reg, [37] = reg, [20] = reg, [24] = reg, [29] = reg, [27] = reg, [38] = reg, [23] = reg}, vm2, vm5, nil)
  reg.slot40 = qT4
  local qT5 = vm:QT(9, 10, {[28] = reg, [29] = reg, [23] = reg, [1] = reg, [31] = reg, [16] = reg, [37] = reg, [20] = reg, [39] = reg, [17] = reg, [40] = reg, [10] = reg, [36] = reg, [41] = reg, [32] = reg, [33] = reg, [42] = reg, [27] = reg, [30] = reg, [43] = reg, [44] = reg, [45] = reg}, vm2, vm5, nil)
  local function fn76(arg1_104)
    local v529 = reg.slot19
    for key11, item28 in pairs(v529()) do
      if type(item28) == "table" then
        if item28.Uid == arg1_104 then
          return item28.State == "Slot"
        end
      end
    end
    return false
  end
  reg.slot44 = function(arg1_105, arg2_42, arg3_17, arg4_7, arg5_7, arg6_4)
    if fn76(arg1_105) then
      return false, "Egg went back to its nest"
    end
    local v530
    if arg6_4 then
      v530 = arg6_4
    else
      local v531 = reg.state
      v530 = v531.cmode()
    end
    local v532, v533 = ((v530 ~= "Instant steps") and 10) or 0
    for i7 = 1, v532, 1 do
      i7 = reg.getPlot
      v530 = i7()
      v533 = v530 and v530.PlotFolder:FindFirstChild("TreadmillBottom")
      if v533 then
        break
      end
      i7 = reg.heartbeatWait
      i7()
    end
    if v533 then
      arg6_4 = reg.slot10
      arg6_4("Resetting carry")
      v530, v532 = reg.setRootCFrame, reg.cframeNew
      v530(v532(v533.Position.X, 72, v533.Position.Z))
      local v534, v535 = reg.state, reg.state
      v534.hold = (v535.hold or 0) + 1
      local flag13 = false
      v535, v534 = os.clock(), reg.state
      local cs, v536 = v534.cs
      if cs then
        v534 = nil
        v534, v536 = reg.getPing, math.min(2 + (reg.getPing() * 3), 4)
      else
        v536 = cs
      end
      v534 = nil
      if v536 then
        v534 = v536
      else
        cs = nil
        cs, v534 = reg.getPing, math.min(1 + (reg.getPing() * 2), 2)
      end
      local v537, num12 = v535 + v534, 0
      v534 = 0
      while true do
        v535, cs = (os.clock() < v537) and arg2_42()
        if v535 then
          v536 = reg.getRoot
          local v538 = v536()
          local v539
          if v538 then
            local v540 = reg.getRoot
            v539 = v540().Anchored
          else
            v539 = v538
          end
          cs = not v539
        else
          cs = v535
        end
        if not cs then
          break
        end
        if (num12 < 3) and (os.clock() >= v534) then
          num12 += 1
          v534 = os.clock() + 0.05
          task.spawn(function()
            local v541 = reg.invokeRemote
            local v542, v543, v544 = v541("RF/Treadmill/AskWearStill")
            num12 -= 1
            if v542 then
              if v543 == true then
                flag13 = true
              elseif type(v544) == "string" then
                if v544:lower():find("already") then
                  flag13 = true
                end
              end
            end
          end)
        else
        end
        local v545 = reg.heartbeatWait
        v545()
      end
      v535 = reg.getRoot
      v536 = v535()
      cs = nil
      if v536 then
        v535 = reg.getRoot
        cs = v535().Anchored
      else
        cs = v536
      end
      v537 = os.clock() + 0.3
      while true do
        v536, v535 = flag13 and (os.clock() < v537)
        if v536 then
          v534 = reg.getRoot
          v535 = (v534())
        else
          v535 = v536
        end
        local v546
        if v535 then
          local v547 = reg.getRoot
          v546 = not v547().Anchored
        else
          v546 = v535
        end
        if not v546 then
          break
        end
        v546 = reg.heartbeatWait
        v546()
      end
      v534 = nil
      v534, v537 = reg.getPing, (os.clock() + 1) + (reg.getPing() * 3)
      while true do
        v534 = num12 > 0
        if not (v534 and (os.clock() < v537)) then
          break
        end
        v536 = reg.heartbeatWait
        v536()
      end
      cs = flag13 or cs
      if not cs then
        if arg2_42() then
          v535 = reg.state
          v535.treadBad = true
        end
      end
      cs = reg.state
      cs.hold = cs.hold - 1
      reg.slot14(arg2_42)
    end
    v530 = reg.slot10
    v530("Taking the egg back")
    local v548, v549, num13, num14, num15, v550 = os.clock() + 25, os.clock() + 1, 0, 0, 0, arg4_7
    v532 = 0
    while true do
      arg6_4 = reg.slot29
      v530 = arg6_4(arg1_105)
      if not ((if v530 then not v530 else os.clock() < v548) and arg2_42()) then
        break
      end
      local v551 = reg.localPlayer
      if v551.Character ~= arg3_17 then
        return false
      end
      v551 = workspace:FindFirstChild(arg1_105)
      if v551 then
        if v551:IsA("Model") then
          local ok7, v552, v553 = pcall(v551.GetBoundingBox, v551)
          if ok7 then
            local v554 = reg.vec3
            v550 = v554(v552.X, v552.Y - (v553.Y / 2), v552.Z)
          else
          end
        else
        end
      else
      end
      v551 = reg.vec3
      if v551(v550.X - arg4_7.X, 0, v550.Z - arg4_7.Z).Magnitude > 400 then
        return false, "Egg went back to its nest"
      end
      v551 = reg.getRoot
      local v555 = v551()
      if v555 and v555.Anchored then
        reg.slot14(arg2_42)
      else
        if (num15 > 0) and ((os.clock() - num15) > 0.6) then
          num15 = 0
          fn58(v550, function()
            local v556 = arg2_42()
            local v557
            if v556 then
              local v558 = reg.slot29
              v557 = not v558(arg1_105)
            else
              v557 = v556
            end
            return v557
          end, 3, 3, 0.95)
        else
          if v555 then
            v551 = reg.getHumanoid
            local v559, v560, v561, v562 = v551(), reg.setRootCFrame, reg.cframeNew, reg.vec3
            v560(v561(v550 + v562(0, ((v559 and v559.HipHeight) or 2) + 1, 0)) * arg5_7)
          end
        end
      end
      if os.clock() >= v532 then
        v532 = os.clock() + 0.15
        local v563, v564 = fireproximityprompt
        if v563 then
          v555 = reg.slot35
          v564 = (v555(v550))
        else
          v564 = v563
        end
        if v564 then
          pcall(function()
            v564.HoldDuration = 0
            fireproximityprompt(v564)
          end)
        end
      else
      end
      if num13 < 3 then
        num13 += 1
        task.spawn(function()
          local v565 = reg.callModule
          local v566, v567 = v565("Egg", "CarryFieldEgg", arg1_105)
          num13 -= 1
          v567 = ((type(v567) == "string") and v567:lower()) or ""
          if v567:find("gameplay area") then
            if num15 == 0 then
              num15 = os.clock()
            end
          else
            num15 = 0
          end
          if v567:find("trusted") or v567:find("closer") then
            if num14 == 0 then
              num14 = os.clock()
            end
          else
            num14 = 0
          end
        end)
      else
      end
      if num14 > 0 then
        if (os.clock() - num14) > 4 then
          return false, "Server pulled you back"
        end
      end
      if os.clock() >= v549 then
        v549 = os.clock() + 1
        v551, v555 = reg.slot19, false
        for key12, item29 in pairs(v551()) do
          v555 = if type(item29) == "table" then if item29.Uid == arg1_105 then item29.State ~= "Slot" else v555 else v555
        end
        if not v555 then
          return false, "Egg went back to its nest"
        end
      else
      end
      v555 = reg.heartbeatWait
      v555()
    end
    v532 = reg.slot29
    if not (v532(arg1_105)) then
      return false
    end
    v530 = reg.slot10
    v530("Crossing into base")
    for i8 = 1, 2, 1 do
      v532, v530, i8, arg3_17 = os.clock(), reg.setRootCFrame, reg.cframeNew, reg.getRiftPos
      v530(i8(arg3_17()) * arg5_7)
      while true do
        v548, i8, arg6_4 = reg.getPing, ((os.clock() - v532) < (1.5 + (reg.getPing() * 3))) and (reg.slot38 < v532)
        if i8 then
          v550 = reg.slot29
          arg6_4 = (v550(arg1_105))
        else
          arg6_4 = i8
        end
        if not arg6_4 then
          break
        end
        local v568 = reg.heartbeatWait
        v568()
      end
      if reg.slot38 >= v532 then
        return true
      end
      i8 = reg.slot29
      if not (i8(arg1_105)) then
        return nil
      end
      i8 = reg.slot10
      i8("Not counted yet, crossing again")
      local v569, v570 = reg.setRootCFrame, reg.cframeNew
      v569(v570(arg4_7) * arg5_7)
      v570 = 0
      while true do
        i8 = reg.getPing
        if not (v570 < (0.3 + i8())) then
          break
        end
        v569 = reg.heartbeatWait
        v570 += v569()
      end
    end
    return false
  end
  local qT6, tbl60, tbl61, num16, tbl62, num17, flag14 = vm:QT(11, 12, {[1] = reg, [16] = reg, [28] = reg, [17] = reg, [14] = reg, [9] = reg, [11] = reg, [10] = reg, [32] = reg, [33] = reg, [23] = reg, [20] = reg, [46] = reg, [47] = reg, [29] = reg, [30] = reg, [22] = reg}, vm2, vm5, nil), {}, {}, 0, {}, 0, false
  local function fn77()
    if os.clock() < num17 then
      local v571 = tbl62
      return v571
    end
    num17, tbl62 = os.clock() + 5, {}
    local v572 = reg.slot59
    local v573 = v572()
    if not (v573) then
      v572 = tbl62
      return v572
    end
    local v574, tbl63, tbl64 = ((type(v573.Index) == "table") and v573.Index) or {}, {}, {"Inventory", "EggInventory"}
    for index21, item30 in ipairs(tbl64) do
      for key13, item31 in next, ((type(v573[item30]) == "table") and v573[item30]) or {}, nil do
        if type(item31) == "table" then
          tbl63[(item31.Category or item31.AssetCategory) or ""] = true
        end
      end
    end
    v573 = reg.modules
    tbl64, v572 = v573.Areas, next
    v573 = ((type(tbl64) == "table") and tbl64.Directory) or {}
    for key14, item32 in v572, v573, nil do
      tbl64, key14 = ipairs, (((type(item32) == "table") and (type(item32.DropTable) == "table")) and item32.DropTable) or {}
      for it1_7, it2_6 in tbl64(key14) do
        it1_7 = (type(it2_6) == "table") and (it2_6[1] or it2_6.Category)
        local v575 = it1_7 and (fn16(it1_7))
        local v576, v577 = v575 and ((tonumber(it2_6[2] or it2_6.Weight) or 1) > 0)
        if v576 then
          it2_6 = v575.DontRoll
          v577 = if it2_6 then item32.IndexIncludeDontRoll else not it2_6
        else
          v577 = v576
        end
        if v577 then
          if v574[it1_7] ~= true then
            if not (tbl63[it1_7]) then
              tbl62[it1_7] = true
            end
          end
        end
      end
    end
    v573 = tbl62
    return v573
  end
  reg.state.pick = {}
  reg.state.skip = {}
  local tbl65, tbl66 = {["Lowest value"] = "lo", ["Best rarity"] = "r", ["Best mutation"] = "mv", Biggest = "s", Closest = "near"}, {}
  local areaEggSlotsClient = workspace:FindFirstChild("AreaEggSlotsClient")
  local function fn78(arg1_106)
    if (arg1_106.State == "Dropped") or (arg1_106.State == "Carried") then
      local v578 = workspace:FindFirstChild(arg1_106.Uid) or (areaEggSlotsClient and areaEggSlotsClient:FindFirstChild(arg1_106.Uid))
      local ok8, v579 = pcall(function()
        return v578:GetPivot().Position
      end)
      if ok8 then
        if v579 then
          return v579
        end
      end
    end
    return arg1_106.BottomCFrame.Position
  end
  local function fn79(arg1_107, arg2_43, arg3_18, arg4_8, arg5_8, arg6_5)
    local v580 = tbl66[arg2_43]
    if if v580 then v580.r ~= arg1_107 else not v580 then
      v580 = {r = arg1_107, e = fn21(arg1_107)}
      tbl66[arg2_43] = v580
    else
    end
    local e, v581, find = v580.e, reg.state, table.find(reg.state.pick, arg2_43)
    local v582, v583 = ((find and "pick") or ((arg3_18 and arg3_18[e.cat]) and "index")) or (arg4_8 and (arg4_8(e)))
    if v582 then
      v583 = v582
    else
      arg4_8 = reg.slot63
      v583 = arg4_8(v358, e) and "filter"
    end
    v582, arg4_8 = find ~= nil
    if v582 then
      arg4_8 = v582
    else
      arg3_18 = reg.state
      local v584 = arg3_18.skip[arg2_43]
      local v585 = if v584 then not v584 else v583
      if v585 then
        v584 = reg.slot21
        local zones = v584.zones
        local flag15 = not zones
        if zones then
          local v586 = reg.slot21
          arg4_8 = v586.zones[tostring(arg1_107.AreaId):gsub("%s", "")]
        else
          arg4_8 = flag15
        end
      else
        arg4_8 = v585
      end
    end
    e.tg = arg4_8 or false
    e.kind = (e.tg and v583) or nil
    arg3_18, v582 = (arg1_107.State == "Carried") and tonumber(arg1_107.CarrierUserId)
    if arg3_18 then
      arg4_8 = reg.localPlayer
      v582 = arg3_18 ~= arg4_8.UserId
    else
      v582 = arg3_18
    end
    e.held = (v582 and players:GetPlayerByUserId(arg3_18)) or nil
    local v587, v588, v589, v590 = fn78(arg1_107), e.n, e.tg
    if v589 then
      arg3_18 = reg.state
      v590 = ((100 - (arg3_18.rank["Steal:" .. v583] or 9)) * 1000) - (find or 0)
    else
      v590 = v589
    end
    arg3_18, v582 = v590 or 0, -e.v
    e.Uid = arg2_43
    e.Pos = v587
    e.Name = v588
    e.b = arg3_18
    e.lo = v582
    if arg5_8 == "near" then
      v583 = nil
      if arg6_5 then
        find = reg.vec3
        v583 = -find(e.Pos.X - arg6_5.X, 0, e.Pos.Z - arg6_5.Z).Magnitude
      else
        v583 = arg6_5
      end
      e.near = v583 or 0
    end
    if arg5_8 == "mv" then
      if not (e.mv) then
        e.mv = ((#e.m > 0) and (e.v / math.max(fn20(e.cat, e.s, {}), 1))) or 1
      end
    end
    return e
  end
  local function fn80(arg1_108, arg2_44)
    local tbl67, now6 = {}, os.clock()
    if if arg1_108 then not arg1_108 else fn26() <= 0 then
      num16 = now6
      local v591 = flag14
      local flag16, v592 = not v591
      if v591 then
        v592 = flag16
      else
        local v593 = reg.callModule
        v592 = v593("Cycle", "IsNightPhase", fn6())
      end
      if v592 then
        flag14, tbl61 = true, {}
        v591, flag16 = pairs, reg.slot19
        local v594 = vm[53](flag16())
        for it1_8, it2_7 in v591(vm:uT(v594)) do
          if type(it2_7) == "table" then
            if it2_7.Uid then
              it1_8 = tbl61
              it1_8[it2_7.Uid] = true
            end
          end
        end
      end
      if not (arg2_44) then
        return tbl67
      end
    end
    if (now6 - num16) > 8 then
      flag14 = false
    end
    local v595 = reg.slot21
    local v596, v597 = v595.index and fn77(), reg.state
    local wantEgg, v598 = v597.wantEgg, reg.slot21
    local v599 = tbl65[v598.order] or "v"
    v595, v597, v598 = (now6 - num16) > 8, {}, reg.getRoot
    local v600 = v598()
    v598 = nil
    if v600 then
      local v601 = reg.getRoot
      v598 = v601().Position
    else
      v598 = v600
    end
    local v602, v603 = pairs, reg.slot19
    local v604, num18 = vm[53](v603()), 0
    for it1_9, it2_8 in v602(vm:uT(v604)) do
      v603 = (type(it2_8) == "table") and it2_8.Uid
      v600, it1_9 = type(v603) == "string"
      if v600 then
        local v605, v606 = (it2_8.State == "Slot") or (it2_8.State == "Dropped")
        if v605 then
          v606 = v605
        else
          local v607 = reg.state
          v606 = ((v603 == v607.mgUid) and (it2_8.State ~= "Carried")) and (it2_8.State ~= "Claimed")
        end
        v605 = nil
        if v606 then
          v605 = v606
        else
          local v608
          if arg1_108 then
            local v609 = reg.state
            v608 = v603 == v609.curUid
          else
            v608 = arg1_108
          end
          v605 = v608 and (it2_8.State == "Carried")
        end
        if v605 then
          it1_9 = v605
        else
          local cond17, v610 = it2_8.State == "Carried"
          if cond17 then
            v606 = tonumber(it2_8.CarrierUserId)
            local v611
            if v606 then
              v611 = v606
            else
              local v612 = reg.localPlayer
              v611 = v612.UserId
            end
            local v613 = reg.localPlayer
            v610 = v611 ~= v613.UserId
          else
            v610 = cond17
          end
          if v610 then
            cond17 = nil
            if arg1_108 then
              cond17 = arg1_108
            else
              local v614 = reg.slot21
              cond17 = v614.thief
            end
            if cond17 then
              it1_9 = cond17
            else
              local v615
              v615, it1_9 = reg.state, table.find(reg.state.pick, v603)
            end
          else
            it1_9 = v610
          end
        end
      else
        it1_9 = v600
      end
      if it1_9 then
        if v603:find("^FirstAreaEgg") then
        else
          if typeof(it2_8.BottomCFrame) == "CFrame" then
            v597[v603] = true
            num18 = if tbl61[v603] then num18 + 1 else num18
            local v616
            if arg1_108 then
              v616 = arg1_108
            else
              local cond18 = (tbl60[v603] or 0) < now6
              if cond18 then
                local v617 = v595 or not tbl61[v603]
                if v617 then
                  v616 = v617
                else
                  local v618
                  v618, v616 = reg.state, table.find(reg.state.pick, v603)
                end
              else
                v616 = cond18
              end
            end
            if v616 then
              local v619 = fn79(it2_8, v603, v596, wantEgg, v599, v598)
              if arg1_108 then
                tbl67[#tbl67 + 1] = v619
              elseif v619.tg then
                local v620 = reg.slot21
                if v620.steal then
                  tbl67[#tbl67 + 1] = v619
                elseif v619.kind == "wisp" then
                  tbl67[#tbl67 + 1] = v619
                elseif v619.kind == "pick" then
                  tbl67[#tbl67 + 1] = v619
                end
              end
            end
          else
          end
        end
      else
      end
    end
    if arg2_44 then
      wantEgg = reg.state
      wantEgg.fieldFresh = num18 <= 2
    end
    for key15 in next, tbl66, nil do
      if not (v597[key15]) then
        tbl66[key15] = nil
      end
    end
    v595 = reg.state
    now6 = #v595.pick
    for i9 = now6, 1, -1 do
      v603 = reg.state
      if not (v597[v603.pick[i9]]) then
        table.remove(reg.state.pick, i9)
      end
    end
    v600, wantEgg = next, reg.state
    v595 = wantEgg.skip
    for key16 in v600, v595, nil do
      if not (v597[key16]) then
        v603 = reg.state
        v603.skip[key16] = nil
      end
    end
    table.sort(tbl67, function(arg1_109, arg2_45)
      if arg1_109.b ~= arg2_45.b then
        return arg1_109.b > arg2_45.b
      end
      if arg1_109[v599] ~= arg2_45[v599] then
        return arg1_109[v599] > arg2_45[v599]
      end
      return arg1_109.v > arg2_45.v
    end)
    return tbl67
  end
  reg.state.sortKey = function()
    local v621 = reg.slot21
    return tbl65[v621.order] or "v"
  end
  local v622
  local num19 = 0
  local function fn81()
    if v622 then
      if (os.clock() - num19) < 0.3 then
        local v623 = v622
        return v623
      end
    end
    local v624, v625, v626 = fn80(false), os
    v626, v622 = v625.clock(), v624
    num19 = v626
    v624 = v622
    return v624
  end
  reg.state.fresh = function()
    v622 = nil
  end
  reg.state.targets = fn81
  reg.state.targetsSoon = function()
    return fn80(false, true)
  end
  reg.state.allEggs = function()
    return fn80(true)
  end
  reg.state.reach = qT2
  local num20 = 115
  pcall(function()
    num20 = tonumber(require(replicatedStorage.Shared.Types.Eggs).MAX_INVENTORY) or num20
  end)
  reg.state.bagMax = num20
  local num21 = 0
  local function fn82()
    local num22 = 0
    for key17 in pairs(fn25()) do
      num22 += 1
    end
    local v627 = num20
    return num22 >= v627
  end
  local function fn83(arg1_110)
    if (os.clock() - num21) < 1 then
      return true
    end
    local v628, v629 = pairs, vm[53](fn25())
    local v630
    for it1_10, it2_9 in v628(vm:uT(v629)) do
      if type(it2_9) == "table" then
        if it2_9.Placement then
        else
          local v631 = reg.state
          if v631.reserved[it1_10] then
          else
            local v632 = reg.state
            local protect, v633 = v632.protect
            if protect then
              v632 = reg.state
              v633 = v632.protect(it1_10, it2_9)
            else
              v633 = protect
            end
            if v633 then
            else
              protect = fn21(it2_9)
              if #protect.m == 0 then
                if protect.v < arg1_110 then
                  v632 = reg.slot21
                  if protect.v < (v632.bagMax or math.huge) then
                    local v634 = protect.v
                    arg1_110, v630 = v634, it1_10
                  else
                  end
                else
                end
              else
              end
            end
          end
        end
      else
      end
    end
    if not (v630) then
      return false
    end
    fn4("RE/PetSatchel/SellSelection", {Eggs = {v630}, Assets = {}})
    num21 = os.clock()
    v628 = reg.slot10
    v628("Sold a cheap egg to make room", "ok")
    return true
  end
  local v635
  reg.state.bagCheck = function()
    v635 = nil
    local v636 = reg.slot21
    if v636.bagSell then
      if fn82() then
        fn83(math.huge)
      end
    end
  end
  if reg.modules.Egg then
    if reg.modules.Egg.OwnerRefreshed then
      fn2(reg.modules.Egg.OwnerRefreshed, function(arg1_111)
        local v637 = reg.localPlayer
        if arg1_111 == v637.UserId then
          local v638 = reg.slot21
          if v638.bagSell then
            if not (v635) then
              v635 = true
              task.defer(reg.state.bagCheck)
            end
          end
        end
      end)
    end
  end
  v303.want = function()
    local v639, v640 = fn26(), reg.state
    v640.curUid = nil
    v640 = reg.state
    local hwBest, v641 = v640.hwBest
    if hwBest then
      v640 = reg.state
      v641 = v640.hwBest()
    else
      v641 = hwBest
    end
    if ((os.clock() - now) < 1.5) or (v639 <= 0) then
      if v639 <= 0 then
        v640 = reg.state
        v640.unVis()
        fn81()
        if not (v641) then
          hwBest = reg.slot10
          hwBest("Waiting for daytime")
        end
      end
      return v641
    end
    if (v303.full or 0) > os.clock() then
      hwBest = reg.slot10
      return hwBest(v303.fullTx or "Bag full, retrying soon", "warn")
    end
    v639 = fn81()
    v303.empty = ((#v639 == 0) and (v303.empty or os.clock())) or nil
    if #v639 == 0 then
      v640 = reg.state
      v640.unVis()
      if not (v641) then
        hwBest = reg.slot10
        hwBest("No egg matches your targets")
      end
      return v641
    end
    local v642, v643, v644 = ipairs
    for it1_11, it2_10 in v642(v639) do
      v640 = it2_10.held
      it1_11, hwBest = not v640
      if v640 then
        local v645 = reg.state
        hwBest = v645.bat()
      else
        hwBest = it1_11
      end
      if hwBest then
        v643 = v643 or it2_10
        v644 = if v303.again then if it2_10.Uid == v303.again.uid then if v303.again.n < 3 then if it2_10.b >= v643.b then it2_10 else v644 else v644 else v644 else v644
      else
      end
    end
    v643 = v644 or v643
    if not (v643) then
      v640 = reg.slot10
      return v640("Matching eggs are in other players' hands")
    end
    if fn82() then
      v640 = reg.slot21
      if v640.bagSell then
        if fn83(v643.v) then
          return
        end
      end
      v303.full = os.clock() + 30
      v639, hwBest = reg.slot10, reg.slot21
      return v639((hwBest.bagSell and "Bag is full, no cheaper egg to sell") or "Bag full, place or sell eggs", "warn")
    end
    if v641 then
      hwBest = reg.state
      if hwBest.hwBeats(v641.r, v641.v, v643) then
        v642 = reg.state
        if not (table.find(v642.pick, v643.Uid)) then
          return v641
        end
      end
    end
    hwBest = reg.state
    local v646, v647, tbl68, tbl69, v648 = hwBest.rank["Steal:" .. v643.kind], ipairs, {}, {}, reg.state
    vm:yT(tbl69, 0, "Star", v648.starWants, "Shooting Star")
    v639, v642 = {}, reg.state
    vm:yT(v639, 0, "Bloom", v642.bloomWants, "Butterfly")
    vm:yT(tbl68, 0, tbl69, v639)
    for it1_12, it2_11 in v647(tbl68) do
      if v646 then
        if it2_11[2] then
          v648 = reg.state
          if (v648.rank[it2_11[1]] or 99) < v646 then
            if it2_11[2]() then
              it1_12 = reg.slot10
              return it1_12(it2_11[3] .. " goes first (Task order)")
            end
          end
        end
      end
    end
    if v646 then
      v641 = reg.state
      if v646 ~= v641.rank.Steal then
        v639 = reg.state
        v639.rank.Steal = v646
        tbl69 = reg.state
        tbl69.order()
      end
    end
    v646 = reg.state
    if v646.stealVis then
      if not (v643.held) then
        v647 = reg.state
        v647.unVis()
      end
    end
    return v643
  end
  local function fn84(arg1_112)
    local v649 = reg.slot19
    local v650 = v649()
    if type(v650[arg1_112]) == "table" then
      return v650[arg1_112]
    end
    for key18, item33 in pairs(v650) do
      if type(item33) == "table" then
        if item33.Uid == arg1_112 then
          return item33
        end
      end
    end
  end
  local function fn85(arg1_113)
    local v651 = fn84(arg1_113)
    local v652, v653 = (v651 and (v651.State == "Carried")) and players:GetPlayerByUserId(tonumber(v651.CarrierUserId) or 0)
    if v652 then
      v651 = reg.localPlayer
      v653 = v652 ~= v651
    else
      v653 = v652
    end
    v651 = (v653 and v652.Character) and v652.Character:FindFirstChild("HumanoidRootPart")
    if v651 then
      return v651, v652
    end
    v651 = workspace:FindFirstChild(arg1_113)
    if not v651 then
      return
    end
    v652, arg1_113 = ipairs, vm[53](v651:GetDescendants())
    for it1_13, it2_12 in v652(vm:uT(arg1_113)) do
      if (it2_12:IsA("JointInstance") or it2_12:IsA("WeldConstraint")) or it2_12:IsA("RigidConstraint") then
        it1_13, v653 = ipairs, {it2_12.Part0, it2_12.Part1}
        for it1_14, it2_13 in it1_13(v653) do
          local v654, v655 = (it2_13 and not it2_13:IsDescendantOf(v651)) and it2_13:FindFirstAncestorOfClass("Model")
          if v654 then
            it1_14 = reg.localPlayer
            v655 = v654 ~= it1_14.Character
          else
            v655 = v654
          end
          it1_14 = v655 and (players:GetPlayerFromCharacter(v654))
          if it1_14 then
            return v654:FindFirstChild("HumanoidRootPart") or it2_13, it1_14
          end
        end
      end
    end
    v653 = v651:FindFirstChild("Hitbox", true)
    local v656, v657, v658, v659, v660 = (v653 and v653.Position) or v651:GetPivot().Position, ipairs, vm[53](players:GetPlayers()), 40
    for it1_15, it2_14 in v657(vm:uT(v658)) do
      v651 = reg.localPlayer
      v653 = ((it2_14 ~= v651) and it2_14.Character) and it2_14.Character:FindFirstChild("HumanoidRootPart")
      if v653 then
        if (v653.Position - v656).Magnitude < v659 then
          arg1_113 = (v653.Position - v656).Magnitude
          v659, v660 = arg1_113, it2_14
        else
        end
      else
      end
    end
    if v660 then
      return v660.Character.HumanoidRootPart, v660
    end
  end
  local function fn86(arg1_114)
    local v661 = fn84(arg1_114)
    local v662, v663 = v661 and (v661.State == "Carried")
    if v662 then
      arg1_114 = nil
      arg1_114, v663 = reg.localPlayer, (tonumber(v661.CarrierUserId) or 0) ~= reg.localPlayer.UserId
    else
      v663 = v662
    end
    return v663
  end
  local tbl70 = {}
  local function fn87(arg1_115, arg2_46, arg3_19)
    local uid, v664 = arg1_115.Uid, reg.localPlayer
    local character7, v665 = v664.Character, reg.getHumanoid
    local v666, v667 = v665(), reg.slot21
    if v667.thief or (arg1_115.kind == "pick") then
      v665 = reg.state
      if v665.bat() then
        if (tbl70[uid] or 0) > os.clock() then
          return false, "Taken by someone"
        end
      else
        return false, "Taken by someone"
      end
    else
      return false, "Taken by someone"
    end
    v665 = reg.localPlayer
    if v665.Character then
      v667 = reg.localPlayer
      if v667.Character:GetAttribute("InvisApplied") then
        v664 = reg.slot10
        v664("Turning visible to take " .. (arg1_115.Name .. " back"))
        local v668, v669 = reg.state, reg.state
        v668.stealVis, v669.visibleUntil = true, math.huge
        v669 = reg.state
        if v669.respawn then
          v668 = reg.state
          v668.respawn(true)
        end
        return false, "visible"
      end
    end
    if reg.slot14(arg2_46) then
      v664 = reg.slot15
      if not (v664(arg2_46)) then
        return false, "Stuck on treadmill"
      end
    else
      return false, "Stuck on treadmill"
    end
    v664, v665 = fn85(uid), reg.getRoot
    v667 = v665()
    local v670, v671 = v664 and v667
    if v670 then
      v665 = reg.state
      v671 = v665.cmode() == "Fast tween"
    else
      v671 = v670
    end
    if v671 and ((v664.Position - v667.Position).Magnitude > 300) then
      v665 = reg.slot10
      v665("Ragdoll jump to the carrier")
      fn57(function()
        local v672 = fn85(uid)
        local v673
        if v672 then
          local v674
          v674, v673 = reg.vec3, v672.Position + reg.vec3(0, 3, 0)
        else
          v673 = v672
        end
        return v673
      end, arg2_46)
    elseif v664 and v667 then
      local function fn88()
        local v675, v676 = fn85(uid), reg.getRoot
        local v677 = v676()
        return (v675 and v677) and ((v675.Position - v677.Position).Magnitude < 60)
      end
      v670 = os.clock() + 30
      while (arg2_46() and not fn88()) and (os.clock() < v670) do
        local v678 = fn85(uid)
        if v678 then
          local v679 = reg.isBeforeSeparation
          if v679(v678.Position) then
            break
          end
        else
          break
        end
        local position4, v680 = v678.Position, reg.slot10
        v680("Flying to the carrier")
        v678, v680 = reg.slot24, reg.vec3
        v678(position4 + v680(0, 3, 0), function()
          local v681 = fn85(uid)
          return ((arg2_46() and v681) and ((v681.Position - position4).Magnitude < 40)) and not fn88()
        end)
        v678 = reg.heartbeatWait
        v678()
      end
    end
    v670 = reg.state
    v670.godHunt = true
    local v682
    v665 = reg.runService
    local function fn89(arg1_116)
      if v682 then
        pcall(reg.state.huntStep, v682[1], v682[2], arg1_116)
      end
    end
    v671, v670, v667 = v665.PreSimulation:Connect(fn89), os.clock(), false
    v665, fn89 = 0, 0
    while true do
      local v683 = arg2_46()
      local v684
      if v683 then
        local v685 = reg.localPlayer
        v684 = v685.Character == character7
      else
        v684 = v683
      end
      if not (v684 and ((os.clock() - v670) < 90)) then
        break
      end
      v683, v684 = reg.slot29, v667
      if v683(uid) then
        v667 = true
        break
      end
      v683 = fn84(uid)
      if if v683 then v683.State ~= "Carried" else not v683 then
        v667 = (v683 ~= nil) and ((v683.State == "Slot") or (v683.State == "Dropped"))
        break
      end
      local v686, v687 = fn85(uid)
      local v688, v689 = v686 and v687
      if v688 then
        v683 = reg.isBeforeSeparation
        v689 = not v683(v686.Position)
      else
        v689 = v688
      end
      v682 = (v689 and {v687, v686}) or nil
      if not v682 and v666 then
        v666.PlatformStand = false
      end
      v665 = (v686 and 0) or v665
      v689 = reg.slot10
      v689((v686 and ((v682 and ("Chasing %s for %s"):format(v687.DisplayName, arg1_115.Name)) or "The carrier reached their base")) or "Looking for the egg carrier")
      v687 = reg.heartbeatWait
      v688 = v687()
      if v686 then
      else
        v665 += v688
        if v665 >= 3 then
          v667, v664 = v684, v686
          break
        end
      end
      fn89 = ((v686 and not v682) and (fn89 + v688)) or 0
      if fn89 > 1.5 then
        tbl70[uid] = os.clock() + 60
        v667, v664 = v684, v686
        break
      end
      v664 = v686
    end
    v682 = nil
    v671:Disconnect()
    v664 = reg.state
    v664.godHunt = false
    if v666 then
      v666.PlatformStand = false
    end
    v671, v665 = v667 and (arg2_46())
    if v671 then
      fn89 = reg.localPlayer
      v665 = fn89.Character == character7
    else
      v665 = v671
    end
    if v665 then
      local function fn90(arg1_117)
        local v690 = reg.slot10
        v690(arg1_115.Name .. " went back to its nest, going for it")
        arg1_115.Pos = arg1_117.BottomCFrame.Position
        arg1_117, v690 = qT2(arg1_115, arg2_46)
        if arg1_117 then
          return qT3(uid, arg2_46, arg1_115.Pos)
        end
        return arg1_117, v690
      end
      v666 = reg.slot29
      fn89, v671 = v666(uid), fn84(uid)
      if (if fn89 then not fn89 else v671) and (v671.State == "Slot") then
        fn89 = (fn90(v671))
      else
        if fn89 then
        else
          if v671 then
            character7 = reg.slot10
            character7("The egg fell, taking it")
            local v691, v692, v693, v694 = fn78(v671), reg.setRootCFrame, reg.cframeNew, reg.vec3
            v692(v693(v691 + v694(0, 3, 0)))
            fn89 = (qT3(uid, arg2_46, v691))
          else
          end
        end
        if fn89 then
          v670 = reg.callModule
          v670("Egg", "DropFieldEgg", "PlayerRequest")
          v664 = 0
          while true do
            local v695 = reg.heartbeatWait
            v664 += v695()
            v671 = fn84(uid)
            v695 = reg.getPing
            if ((v664 > (1 + v695())) or not v671) or (v671.State ~= "Carried") then
              break
            end
          end
          if v671 then
            if v671.State == "Dropped" then
              local v696
              fn89, v696 = qT3(uid, arg2_46, fn78(v671)), fn84(uid)
              v671 = v696
            else
            end
          else
          end
          local v697 = reg.slot29
          fn89 = if v697(uid) then fn89 else if v671 then if v671.State == "Slot" then fn90(v671) else fn89 else fn89
        else
        end
      end
      if fn89 then
        local v698, v699 = qT5(uid, arg2_46)
        if not (v698) then
          if arg2_46() then
            if (arg3_19 or 0) < 4 then
              if fn86(uid) then
                return fn87(arg1_115, arg2_46, (arg3_19 or 0) + 1)
              end
            end
          end
        end
        return v698, v699
      end
    end
    tbl70[uid] = math.max(tbl70[uid] or 0, os.clock() + 8)
    return false, (v667 and "Could not take the fallen egg") or "The carrier got away with the egg"
  end
  v303.run = function(arg1_118, arg2_47)
    if arg1_118.hw then
      local v700 = reg.state
      return v700.hwSteal(arg1_118, arg2_47)
    end
    local v701 = reg.state
    v701.flyY = nil
    local v702, v703 = reg.state, fn66()
    v701 = nil
    if v703 then
      local v704 = reg.slot13
      v701 = v704[tostring(arg1_118.a)] == true
    else
      v701 = v703
    end
    v702.cs = v701
    v303.cv = arg1_118.v
    v703, v702 = reg.state, reg.state
    v703.curUid, v702.stealKind = arg1_118.Uid, arg1_118.kind
    v702 = reg.state
    if v702.hud then
      v701 = reg.state
      v701.hud.Refresh()
    end
    v701 = reg.slot29
    v702 = v701()
    v703 = nil
    if v702 then
      v701 = reg.slot29
      v703 = not v701(arg1_118.Uid)
    else
      v703 = v702
    end
    if v703 then
      v702 = reg.callModule
      v702("Egg", "DropFieldEgg", "PlayerRequest")
      v701 = 0
      while true do
        local v705 = reg.slot29
        if not (v705() and (v701 < 1.5)) then
          break
        end
        v705 = reg.heartbeatWait
        v701 += v705()
      end
    end
    v703 = reg.slot36
    v703.cur = arg1_118.Name
    v703 = reg.state
    if v703.greenLight then
      v702 = reg.state
      v702.greenLight(arg1_118.Uid, arg2_47)
    end
    v703 = reg.localPlayer
    local character8, v706, v707, v708, v709 = v703.Character, arg2_47, false
    v702 = reg.slot21
    v703, v701 = v702.adminSteal
    if v703 then
      v701 = v703
    else
      v702 = nil
      v702, v701 = reg.state, arg1_118.Uid == reg.state.mgUid
    end
    v702, v703 = v701 and (fn54())
    if v702 then
      v701 = reg.slot39
      v703 = not v701()
    else
      v703 = v702
    end
    if v703 then
      v708 = qT6(arg1_118, arg2_47)
      if v708 then
        v701 = reg.slot10
        v701("Stole " .. arg1_118.Name, "ok")
        return
      end
      v702 = reg.slot29
      if v702() then
        local v710 = reg.callModule
        v710("Egg", "DropFieldEgg", "PlayerRequest")
      end
      if arg2_47() then
        local v711 = reg.localPlayer
        if v711.Character ~= character8 then
          return
        end
      else
        return
      end
    else
      local v712 = reg.slot21
      if v712.adminSteal then
        local v713 = reg.slot39
        if v713() then
        else
          local function fn91()
            local v714 = reg.slot29
            if not (v714()) then
              if fn54() then
                v707 = true
                return false
              end
            end
            return v706()
          end
          arg2_47 = fn91
        end
      else
      end
    end
    if arg1_118.held then
      v709 = "Taken by someone"
    else
      for i10 = 1, 2, 1 do
        v701, v703 = qT2(arg1_118, arg2_47)
        if v701 then
          v708, v709 = v701, v703
          break
        else
          v702 = reg.localPlayer
          if v702.Character ~= character8 then
            v708, v709 = v701, v703
            break
          elseif arg2_47() then
            i10 = reg.isRagdolled
            if not (i10()) then
              v708, v709 = v701, v703
              break
            end
          else
            v708, v709 = v701, v703
            break
          end
        end
        i10 = reg.slot10
        i10("Knocked down, trying again")
        i10 = os.clock() + 6
        while true do
          local v715 = reg.isRagdolled
          if not (v715() and (os.clock() < i10)) then
            break
          end
          v715 = reg.heartbeatWait
          v715()
        end
        v708, v709 = v701, v703
      end
      if v708 then
        local v716 = reg.slot19
        for key19, item34 in pairs(v716()) do
          if type(item34) == "table" then
            if item34.Uid == arg1_118.Uid then
              if item34.State ~= "Slot" then
                if item34.State ~= "Dropped" then
                  local flag17, str3 = false, "Taken by someone"
                  v708, v709 = flag17, str3
                else
                end
              else
              end
            else
            end
          else
          end
        end
      else
      end
    end
    if v709 == "Taken by someone" then
      v708, v709 = fn87(arg1_118, arg2_47)
    else
      if v708 then
        v703, v701 = qT3(arg1_118.Uid, arg2_47, arg1_118.Pos, true)
        if v703 then
          v708, v709 = qT5(arg1_118.Uid, arg2_47)
        else
          v708, v709 = v703, v701
        end
        if v708 then
        else
          if arg2_47() then
            v702 = reg.slot21
            if v702.thief then
              if fn86(arg1_118.Uid) then
                v708, v709 = fn87(arg1_118, arg2_47)
              else
              end
            else
            end
          else
          end
        end
      else
      end
    end
    v703 = nil
    if v707 then
      v701 = reg.slot29
      v703 = not v701()
    else
      v703 = v707
    end
    if v703 then
      if v706() then
        v702 = reg.localPlayer
        if v702.Character == character8 then
          v701 = reg.slot10
          v701("Admin treadmill is up, switching to Instant steal")
          return v303.run(arg1_118, v706)
        end
      end
    end
    v703 = reg.slot29
    if v703() then
      v702 = reg.localPlayer
      if v702.Character == character8 then
        if not (v708) then
          v701 = reg.slot39
          if not (v701()) then
            local v717 = reg.callModule
            v717("Egg", "DropFieldEgg", "PlayerRequest")
          end
        end
      end
    end
    if v709 == "visible" then
      return
    end
    v702, v701 = ((v303.again and (v303.again.uid == arg1_118.Uid)) and v303.again.n) or 0, v709 == "Egg went back to its nest"
    v303.again = (((v708 == false) or (v709 ~= nil)) and {uid = arg1_118.Uid, n = (v701 and 0) or (v702 + 1)}) or nil
    local v718, find2 = reg.state, table.find(reg.state.pick, arg1_118.Uid)
    if v708 then
      if find2 then
        table.remove(reg.state.pick, find2)
      end
      local v719, v720 = reg.slot10, reg.slot39
      v719((v720() and ("Dropped " .. (arg1_118.Name .. " at the safe zone"))) or ("Stole " .. arg1_118.Name), "ok")
      v720 = reg.slot39
      if v720() then
        tbl60[arg1_118.Uid] = os.clock() + 300
      end
    elseif (v709 == nil) and (v708 == nil) then
      v703 = reg.slot10
      v703("Sent " .. (arg1_118.Name .. " home"), "ok")
    else
      local v721 = arg2_47()
      local v722
      if v721 then
        local v723 = reg.localPlayer
        v722 = v723.Character == character8
      else
        v722 = v721
      end
      if v722 and (fn5()) then
        if ((((if find2 then not find2 else not v701) and (((v702 + 1) >= 3) or (v709 == "Taken by someone"))) or (v709 == "Bag is full")) or (v709 == "Pet bag is full")) or (v709 == "Egg is gone") then
          tbl60[arg1_118.Uid] = os.clock() + 20
          v303.again = nil
        end
        v303.fullTx = nil
        if v709 == "Pet bag is full" then
          v303.full = os.clock() + 30
          v303.fullTx = "Pet bag is full, sell or fuse pets to steal again"
        elseif v709 == "Bag is full" then
          v721 = reg.slot21
          if v721.bagSell and fn83(arg1_118.v) then
            tbl60[arg1_118.Uid] = nil
          else
            v303.full = os.clock() + 30
          end
        end
        local v724 = reg.slot10
        v724((v709 or "Steal failed") .. (" - " .. arg1_118.Name), "warn")
        if v701 and (os.clock() >= (v303.pingAt or 0)) then
          v724 = 0
          for i11 = 1, 10, 1 do
            i11 = reg.heartbeatWait
            v724 += i11()
          end
          local v725, v726, v727 = 10 / math.max(v724, 0.001), pcall(function()
            return fn("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
          end)
          local v728 = v726 and v727
          if v728 then
            v727 = v728
          else
            v726 = reg.getPing
            v727 = v726() * 1000
          end
          if v727 > 300 then
            v303.pingAt = os.clock() + 60
            fn34("High ping: egg went back to nest", ("Your ping is %d ms. Hop to a server with lower ping."):format(v727), "err")
          elseif v725 < 15 then
            v303.pingAt = os.clock() + 60
            fn34("Low FPS: egg went back to nest", ("You run at %d FPS. Turn on Low graphics or close other apps."):format(v725), "err")
          end
        end
      end
    end
    v702 = reg.state
    if v702.treadBad then
      find2 = reg.localPlayer
      if find2.Character == character8 then
        if fn5() then
          v701 = reg.state
          v701.treadBad = nil
          v703 = reg.slot10
          v703("Treadmill did not take you, resetting", "warn")
          arg1_118 = reg.state
          arg1_118.respawn(true)
        end
      end
    end
  end
end
do
  tbl41 = reg.state.stealSec
  fn44(tbl41, "Anti guard", "antiGuard", false)
  local v729
  v729 = fn44(tbl41, "Drop eggs at safe zone", "dropSafe", false, function(arg1_119)
    if arg1_119 then
      if v121.busy then
        return
      elseif v121.qb then
        return
      end
    else
      return
    end
    window:Dialog({Title = "Drop eggs at safe zone", Kind = "warn", Cancel = function()
      v729:Set(false)
    end, Text = "Eggs will be dropped in front of the safe zone. They will NOT be stolen into your base.", Buttons = {{"Cancel", function()
      v729:Set(false)
    end}, {"Turn on", nil, true}}})
  end)
  local function fn92(arg1_120)
    return ((arg1_120 > 0) and (((math.random() * 2) - 1) * arg1_120)) or 0
  end
  local tbl71 = {off = reg.zeroVec, freeze = true, hop = 0.085, hold = 0.395, steps = {}, rel = 1.52, busy = 2.5}
  for i12 = 1, 25, 1 do
    tbl71.steps[i12] = {0.05 * (i12 - 1)}
  end
  tbl71.steps[26] = {1.27, true}
  local tbl72, tbl73 = {line = true, off = reg.vec3(-90, 45, -35), limp = true, hop = 0, hold = 0, steps = {{0.1}, {0.33}, {0.56}, {0.75, true}}, rel = 0.8, busy = 2.5}, {since = 0}
  reg.slot53 = function()
    local v730, tbl74, tbl75, v731 = ipairs, {}, {}, reg.vec3
    vm:yT(tbl75, 0, "GearGiver_Slap", "Podium", v731(-16.415, 21.072, -6.106))
    local tbl76, v732 = {}, reg.vec3
    vm:yT(tbl76, 0, "World", "Machines", "RiftMachine", "Rift", "Meshes/VoidPortal_Cube.003", v732(-26.776, 1.75, 18.665))
    vm:yT(tbl74, 0, tbl75, tbl76)
    for it1_16, it2_15 in v730(tbl74) do
      tbl76 = workspace
      for i13 = 1, #it2_15 - 1, 1 do
        tbl76 = tbl76 and tbl76:FindFirstChild(it2_15[i13])
      end
      if tbl76 then
        if tbl76:IsA("BasePart") then
          return tbl76.CFrame:PointToWorldSpace(it2_15[#it2_15])
        end
      end
    end
    tbl76 = reg.vec3
    return tbl76(528.7, 70.57, -364.11)
  end
  reg.slot52 = function(arg1_121)
    local v733 = reg.findInWorld
    local v734 = v733("Areas", "SeparationLine")
    if v734 then
      if not (v734:IsA("BasePart")) then
        return
      end
    else
      return
    end
    local cFrame, v735 = v734.CFrame, reg.vec3
    local v736, v737 = reg.vec3, v735(0, 1, 0):Cross(((v734.Size.X >= v734.Size.Z) and cFrame.RightVector) or cFrame.LookVector) * reg.vec3(1, 0, 1)
    if v737.Magnitude <= 0.001 then
      return
    end
    v737 = v737.Unit
    v734, v733 = cFrame.Position + (((((arg1_121 - cFrame.Position):Dot(v737) >= 0) and -v737) or v737) * 8), reg.vec3
    return v733(v734.X, arg1_121.Y + 0.5, v734.Z)
  end
  reg.slot50 = function()
    local area, v738 = tbl73.area
    if area then
      v738 = area
    else
      local v739 = reg.localPlayer
      v738 = (v739:GetAttribute("AreaId"))
    end
    return (((type(v738) == "string") and (v738:gsub("[^%a]", ""):lower() == "lightdark")) and tbl72) or tbl71
  end
  reg.slot51 = function(arg1_122)
    if arg1_122.hop <= 0 then
      if arg1_122.hold <= 0 then
        return arg1_122.steps, arg1_122.rel
      end
    end
    local tbl77, num23, num24 = {}, 0, 0
    for index22, item35 in ipairs(arg1_122.steps) do
      num23, num24 = math.max((num23 + math.max(item35[1] - num24, 0)) + fn92((item35[2] and arg1_122.hold) or arg1_122.hop), 0), item35[1]
      tbl77[index22] = {num23, item35[2]}
    end
    return tbl77, num23 + math.max(arg1_122.rel - num24, 0)
  end
  reg.slot57 = function(arg1_123, arg2_48, arg3_20, arg4_9)
    pcall(arg1_123.PivotTo, arg1_123, reg.cframeNew(arg3_20))
    if (arg2_48.Position - arg3_20).Magnitude > 3 then
      pcall(function()
        local v740 = reg.cframeNew
        arg2_48.CFrame = v740(arg3_20)
      end)
    end
    if not (arg4_9) then
      return
    end
    local v741, v742 = ipairs, vm[53](arg1_123:GetDescendants())
    for it1_17, it2_16 in v741(vm:uT(v742)) do
      if it2_16:IsA("BasePart") then
        pcall(function()
          local v743, v744 = reg.zeroVec, reg.zeroVec
          it2_16.AssemblyLinearVelocity = v743
          it2_16.AssemblyAngularVelocity = v744
        end)
      end
    end
  end
  local function fn93()
    local v745 = reg.getRoot
    local v746 = v745()
    for index23, child4 in ipairs((v746 and workspace:GetChildren()) or {}) do
      if child4:IsA("Model") and child4:FindFirstChild("Hitbox") then
        for index24, child5 in ipairs(child4:GetDescendants()) do
          if (child5:IsA("JointInstance") or child5:IsA("WeldConstraint")) or child5:IsA("RigidConstraint") then
            if child5.Part0 == v746 then
              return child4
            elseif child5.Part1 == v746 then
              return child4
            end
          end
        end
      end
    end
  end
  local tbl78 = {"LuaSourceContainer", "Sound", "ForceField", "JointInstance", "Constraint", "WeldConstraint", "BodyMover", "ProximityPrompt", "BillboardGui"}
  local function fn94(arg1_124, arg2_49)
    local tbl79 = {}
    for index25, child6 in ipairs(arg1_124:GetDescendants()) do
      tbl79[child6] = child6.Archivable
      child6.Archivable = true
    end
    local archivable2 = arg1_124.Archivable
    arg1_124.Archivable = true
    local ok9, v747 = pcall(arg1_124.Clone, arg1_124)
    arg1_124.Archivable = archivable2
    for key20, item36 in next, tbl79, nil do
      pcall(function()
        key20.Archivable = item36
      end)
    end
    if ok9 then
      if not (v747) then
        return
      end
    else
      return
    end
    for index26, child7 in ipairs(v747:GetDescendants()) do
      tbl79 = false
      for index27, item37 in ipairs(tbl78) do
        tbl79 = tbl79 or (child7:IsA(item37))
      end
      if tbl79 then
        pcall(child7.Destroy, child7)
      elseif child7:IsA("BasePart") then
        child7.Anchored = true
        child7.CanCollide = false
        child7.CanQuery = false
        child7.CanTouch = false
      elseif child7:IsA("Humanoid") then
        child7.DisplayDistanceType, child7.HealthDisplayType = Enum.HumanoidDisplayDistanceType.None, Enum.HumanoidHealthDisplayType.AlwaysOff
      end
    end
    v747.Parent = arg2_49
    return v747
  end
  local function fn95()
    local dis = tbl73.dis
    if not dis then
      return
    end
    tbl73.dis = nil
    local v748, v749 = reg.runService, reg.runService
    pcall(reg.runService.UnbindFromRenderStep, reg.runService, "VenyxAG")
    dis.beat:Disconnect()
    for index28, item38 in ipairs(dis.hidden) do
      pcall(function()
        item38.LocalTransparencyModifier = 0
      end)
    end
    pcall(function()
      dis.cam.CameraType = dis.type
    end)
    for index29, item39 in ipairs(dis.copies) do
      pcall(item39.Destroy, item39)
    end
  end
  reg.slot56 = function(arg1_125)
    local currentCamera3 = workspace.CurrentCamera
    if arg1_125 then
      if not currentCamera3 then
        return
      elseif tbl73.dis then
        return
      end
    else
      return
    end
    local tbl80 = {cam = currentCamera3, type = currentCamera3.CameraType, cf = currentCamera3.CFrame, copies = {}, hidden = {}}
    tbl73.dis = tbl80
    local tbl81 = {arg1_125, fn93()}
    for index30, item40 in ipairs(tbl81) do
      for index31, child8 in ipairs(item40:GetDescendants()) do
        if child8:IsA("BasePart") then
          tbl80.hidden[#tbl80.hidden + 1] = child8
        elseif child8:IsA("Decal") then
          tbl80.hidden[#tbl80.hidden + 1] = child8
        elseif child8:IsA("Texture") then
          tbl80.hidden[#tbl80.hidden + 1] = child8
        end
      end
    end
    local function fn96()
      for index32, item41 in ipairs(tbl80.hidden) do
        pcall(function()
          item41.LocalTransparencyModifier = 1
        end)
      end
      pcall(function()
        currentCamera3.CameraType = Enum.CameraType.Scriptable
        currentCamera3.CFrame = tbl80.cf
      end)
    end
    fn96()
    local v750, v751 = reg.runService, reg.runService
    pcall(reg.runService.BindToRenderStep, reg.runService, "VenyxAG", Enum.RenderPriority.Last.Value + 1, fn96)
    arg1_125 = reg.runService
    tbl80.beat = arg1_125.Heartbeat:Connect(fn96)
    for index33, item42 in ipairs(tbl81) do
      tbl80.copies[#tbl80.copies + 1] = fn94(item42, currentCamera3)
    end
  end
  reg.slot48 = function()
    fn95()
    local v752 = reg.getHumanoid
    local v753 = v752()
    if v753 and v753.PlatformStand then
      pcall(function()
        v753.PlatformStand = false
      end)
    end
    v752 = reg.state
    v752.agBusy = false
  end
  local qT7, flag18, flag19, flag20 = vm:QT(13, 14, {[1] = reg, [16] = reg, [8] = reg, [48] = reg, [49] = reg, [50] = reg, [51] = reg, [52] = reg, [53] = reg, [54] = reg, [55] = reg, [56] = reg, [57] = reg}, vm2, vm5, nil), false, false, false
  local function fn97()
    local v754 = flag20
    flag20 = flag18 or flag19
    if flag20 then
      if not (v754) then
        local v755 = reg.slot21
        if v755.antiGuard then
          local v756 = reg.state
          if not (v756.agBusy) then
            local v757 = reg.state
            if not (v757.rag) then
              local v758, v759 = reg.slot4
              if v758 then
                local cond19 = reg.slot4.name ~= "Steal"
                if cond19 then
                  v759 = cond19
                else
                  local v760 = reg.state
                  v759 = v760.cmode() ~= "Tween"
                end
              else
                v759 = v758
              end
              if not (v759) then
                local v761, v762 = reg.state, reg.state
                v761.agBusy, tbl73.since, v762.agAt = true, os.clock(), os.clock()
                task.spawn(function()
                  if not (pcall(qT7, os.clock())) then
                    local v763 = reg.slot48
                    v763()
                  end
                end)
              end
            end
          end
        end
      end
    end
  end
  task.spawn(function()
    local v764 = reg.modules
    local egg2 = v764.Egg
    if egg2 then
      if not (egg2.CarryChanged) then
        return
      end
    else
      return
    end
    fn2(egg2.CarryChanged, function(arg1_126)
      flag18 = ((type(arg1_126) == "table") and (arg1_126.IsCarrying == true)) and (arg1_126.GuardDisabled ~= true)
      tbl73.area = ((flag18 and (type(arg1_126.AreaId) == "string")) and arg1_126.AreaId) or nil
      fn97()
    end)
  end)
  local num25 = 0
  fn2(reg.runService.Heartbeat, function(arg1_127)
    local v765 = reg.state
    if v765.agBusy then
      local v766, v767, v768, max4 = os.clock() - tbl73.since, reg.slot50, reg.slot50, math.max(reg.slot50().busy, reg.slot50().rel + 1)
      if v766 > max4 then
        local v769 = reg.slot48
        v769()
      end
    end
    num25 += arg1_127
    v765 = reg.slot21
    if v765.antiGuard then
      if num25 < 0.03 then
        return
      end
    else
      return
    end
    num25 = 0
    arg1_127 = fn93() ~= nil
    if arg1_127 ~= flag19 then
      flag19 = arg1_127
      fn97()
    end
  end)
  table.insert(reg.state.cleanup, reg.slot48)
end
local tbl82 = {Golden = Color3.fromRGB(255, 206, 84), Silver = Color3.fromRGB(205, 216, 236), Rainbow = Color3.fromRGB(255, 120, 220), Scrambled = Color3.fromRGB(186, 120, 255), Boss = Color3.fromRGB(255, 104, 104), Enchanted = Color3.fromRGB(104, 236, 255), Sakura = Color3.fromRGB(255, 166, 214), GreatBloom = Color3.fromRGB(176, 255, 166), Monstrous = Color3.fromRGB(150, 255, 110), Nitro = Color3.fromRGB(255, 150, 64), Spectral = Color3.fromRGB(110, 235, 220)}
local function fn98(arg1_128)
  local tbl83 = {}
  for index34, item43 in ipairs(arg1_128.m) do
    tbl83[#tbl83 + 1] = {n = (tbl10[item43] or item43):upper(), c = tbl82[item43]}
  end
  return tbl83
end
local function fn99(arg1_129)
  local icon = (fn16(arg1_129) or {}).Icon
  return (((type(icon) == "number") and ("rbxassetid://" .. icon)) or icon) or ""
end
local function fn100(arg1_130)
  local v770, num26 = reg.callModule, tonumber(reg.callModule("Rec", "WeightKgForScale", arg1_130.cat, arg1_130.s))
  return {id = arg1_130.Uid or arg1_130.uid, title = arg1_130.n, rarity = (tbl7[arg1_130.r] or "?"):upper(), grad = fn23(arg1_130.cat), color = fn22(arg1_130.cat), image = fn99(arg1_130.cat), value = "$" .. (fn15(arg1_130.v) .. "/s"), size = ("x%.2f"):format(arg1_130.s), weight = num26 and (fn15(num26) .. " kg"), kg = num26 or 0, muts = fn98(arg1_130)}
end
fn44(tbl39.Interface:Section("Game HUD", "star"), "Steal panel button on game HUD", "panelBtn", true, function(arg1_131)
  local v771 = reg.state
  v771.hud.Dock(arg1_131)
end)
task.defer(function()
  local v772 = reg.state
  v772.hud.Dock(reg.slot21.panelBtn)
end)
do
  local tweenService = game:GetService("TweenService")
  local userInputService = game:GetService("UserInputService")
  local fromRGB = Color3.fromRGB
  local tbl84, tbl85, tbl86, tbl87 = {on = {fromRGB(60, 255, 0), fromRGB(136, 255, 0), fromRGB(11, 72, 0), fromRGB(190, 255, 180)}, off = {fromRGB(214, 17, 17), fromRGB(253, 20, 20), fromRGB(72, 0, 0), fromRGB(255, 103, 103)}, vx = {fromRGB(122, 162, 255), fromRGB(185, 139, 255), fromRGB(34, 18, 90), fromRGB(214, 200, 255)}, gold = {fromRGB(255, 196, 60), fromRGB(255, 150, 40), fromRGB(80, 40, 0), fromRGB(255, 230, 160)}}, {STOP = "off", CANCEL = "gold", STEAL = "on", CHASE = "vx"}, {"Best value", "Best rarity", "Best mutation", "Biggest", "Lowest value", "Closest"}, {["Best value"] = "Value", ["Best rarity"] = "Rarity", ["Best mutation"] = "Mutation", Biggest = "Weight", ["Lowest value"] = "Cheap", Closest = "Distance"}
  local function fn101()
    local stealAutoStealFilterStealFir = v121.Keys["Steal / Auto Steal/Filter/Steal first"]
    if stealAutoStealFilterStealFir then
      stealAutoStealFilterStealFir:Set(tbl86[((table.find(tbl86, reg.slot21.order) or 0) % #tbl86) + 1])
    end
  end
  local function fn102(arg1_132, arg2_50, arg3_21, arg4_10, arg5_9)
    tweenService:Create(arg1_132, TweenInfo.new(arg3_21, arg4_10 or Enum.EasingStyle.Quad, arg5_9 or Enum.EasingDirection.Out), arg2_50):Play()
  end
  local function fn103(arg1_133, arg2_51)
    local v773, uIGradient = tbl84[arg2_51], arg1_133:FindFirstChildOfClass("UIGradient")
    if uIGradient then
      uIGradient.Color = ColorSequence.new(v773[1], v773[2])
    end
    for index35, child9 in ipairs(arg1_133:GetChildren()) do
      if child9:IsA("UIStroke") then
        child9.Color = ((child9.Name == "UIStrokeClr") and v773[4]) or v773[3]
      end
    end
  end
  local function fn104(arg1_134)
    return arg1_134:FindFirstChild("Label") or arg1_134:FindFirstChild("TextLabel")
  end
  local function fn105(arg1_135, arg2_52)
    pcall(function()
      arg1_135.Active = true
      arg1_135.Interactable = true
    end)
    for index36, child10 in ipairs(arg1_135:GetDescendants()) do
      if child10:IsA("GuiObject") then
        child10.Active = false
      end
    end
    local v774 = arg1_135:FindFirstChildOfClass("UIScale") or fn3("UIScale", {Parent = arg1_135})
    local function fn106()
      fn102(v774, {Scale = 1.06}, 0.16)
    end
    arg1_135.MouseEnter:Connect(fn106)
    local function fn107()
      fn102(v774, {Scale = 1}, 0.16)
    end
    arg1_135.MouseLeave:Connect(fn107)
    local function fn108()
      v774.Scale = 0.92
      fn102(v774, {Scale = 1}, 0.25, Enum.EasingStyle.Back)
      arg2_52()
    end
    arg1_135.Activated:Connect(fn108)
  end
  local function fn109(arg1_136, arg2_53)
    local x2, y2 = arg1_136.AbsoluteSize.X, arg1_136.AbsoluteSize.Y
    if x2 <= 0 then
      return
    end
    local v775 = (y2 * 0.44) / x2
    arg1_136.Up.AnchorPoint, arg1_136.Up.Position, arg1_136.Up.Size = Vector2.new(1, 0.5), UDim2.fromScale(0.718, 0.27), UDim2.fromScale(v775, 0.44)
    arg1_136.Down.AnchorPoint, arg1_136.Down.Position, arg1_136.Down.Size = Vector2.new(1, 0.5), UDim2.fromScale(0.718, 0.73), UDim2.fromScale(v775, 0.44)
    y2, x2 = (arg2_53 and (0.706 - v775)) or 0.718, {"TextLabel", "SizeTag", "MoneyTag"}
    for index37, item44 in ipairs(x2) do
      arg2_53 = arg1_136[item44]
      arg2_53.Size = UDim2.fromScale(y2 - arg2_53.Position.X.Scale, arg2_53.Size.Y.Scale)
    end
  end
  local function fn110(arg1_137, arg2_54)
    for index38, child11 in ipairs(arg1_137:GetDescendants()) do
      index38 = child11:IsA("UIStroke") and child11:GetAttribute("r")
      if index38 then
        child11.Thickness = index38 * arg2_54
      end
    end
  end
  local function fn111(arg1_138)
    local header, close = arg1_138:FindFirstChild("Header"), arg1_138:FindFirstChild("Close")
    for index39, child12 in ipairs(arg1_138:GetDescendants()) do
      if child12:IsA("UIStroke") then
        local parent, v776 = child12.Parent
        if child12.Name == "UIStrokeClr" then
          v776 = 0.00406
        else
          if child12.Name == "InnerUIStroke" then
            v776 = 0.00406
          else
            if parent:IsA("TextLabel") then
              v776 = (((parent.Parent == header) and 0.00507) or (((parent.Parent == close) or parent.Parent:IsA("GuiButton")) and 0.00609)) or 0.00406
            else
              if parent == close then
                v776 = 0.00609
              else
                if parent:IsA("GuiButton") then
                  v776 = ((parent.Parent == header) and 0.00812) or 0.00913
                else
                  index39 = true
                  for index40, child13 in ipairs(parent:GetChildren()) do
                    index39 = if child13 ~= child12 then if child13:IsA("UIStroke") then if child13.Name == child12.Name then if child13.Thickness > child12.Thickness then false else index39 else index39 else index39 else index39
                  end
                  v776 = (index39 and (((parent.Name == "Spacer") and 0.00913) or 0.00812)) or 0.00406
                end
              end
            end
          end
        end
        child12.StrokeSizingMode = Enum.StrokeSizingMode.FixedSize
        child12:SetAttribute("r", v776)
      end
    end
  end
  local tbl88, v777, v778 = {open = false}, {"ActivePets", "GrowingEggs"}
  reg.state.hud = tbl88
  local v779, v780, v781, v782, v783, v784
  local num27, tbl89, tbl90, tbl91, str4 = 0, {}, {}, {}, "<font transparency=\"1\">"
  local function fn112(arg1_139)
    local clone2, keypoints, tbl92, cond20, color3 = arg1_139:Clone(), arg1_139.Color.Keypoints, {}, math.abs((arg1_139.Rotation % 180) - 90) < 1, Color3.new(1, 1, 1)
    arg1_139 = (cond20 and 0.5) or 1
    for index41, item45 in ipairs(keypoints) do
      tbl92[#tbl92 + 1] = ColorSequenceKeypoint.new(item45.Time * arg1_139, item45.Value:Lerp(color3, 0.27))
    end
    if arg1_139 < 1 then
      tbl92[#tbl92 + 1] = ColorSequenceKeypoint.new(1, keypoints[#keypoints].Value:Lerp(color3, 0.27))
    end
    clone2.Color = ColorSequence.new(tbl92)
    return clone2
  end
  local function fn113(arg1_140, arg2_55, ...)
    local tbl93 = {...}
    for index42, item46 in ipairs((((#tbl93 > 0) and getconnections) and getconnections(arg1_140)) or {}) do
      local ok10, v785 = pcall(getconstants or debug.getconstants, item46.Function)
      if ok10 and (type(v785) == "table") then
        index42 = true
        for index43, item47 in ipairs(tbl93) do
          index42 = index42 and (table.find(v785, item47) ~= nil)
        end
        if index42 then
          pcall(item46.Disconnect, item46)
        end
      end
    end
    tbl91[#tbl91 + 1] = fn2(arg1_140, arg2_55)
  end
  local function fn114()
    if not reg.alive then
      return false
    end
    if v779 then
      if v779.Parent then
        return true
      end
    end
    local v786 = reg.localPlayer
    local playerGui2 = v786:FindFirstChild("PlayerGui")
    local v787, v788 = playerGui2 and (playerGui2:FindFirstChild("ActivePets")), playerGui2 and (playerGui2:FindFirstChild("HUD"))
    v782 = (v788 and v788:FindFirstChild("GameHUD")) and v788.GameHUD:FindFirstChild("RightButtons")
    if v787 then
      if v787:FindFirstChild("Frame") then
        if not (v782) then
          return false
        end
      else
        return false
      end
    else
      return false
    end
    for index44, child14 in ipairs((((gethui and pcall(gethui)) and gethui()) or playerGui2):GetChildren()) do
      if child14:IsA("ScreenGui") then
        if child14:FindFirstChild("EggsButton") then
          child14:Destroy()
        elseif child14.DisplayOrder == 34 then
          if child14:FindFirstChild("Frame") then
            if child14.Frame:FindFirstChild("Close") then
              child14:Destroy()
            end
          end
        end
      end
    end
    if v782:GetAttribute("vx") then
      v786 = v782
      v786.Position = UDim2.fromScale(1, 0.5)
      v782:SetAttribute("vx", nil)
    end
    v786 = userInputService.MouseEnabled
    local flag21 = not v786
    v779 = fn3("ScreenGui", {IgnoreGuiInset = v787.IgnoreGuiInset, ScreenInsets = v787.ScreenInsets, ZIndexBehavior = v787.ZIndexBehavior, DisplayOrder = 34, ResetOnSpawn = false, Enabled = false})
    if not (pcall(function()
      local v789 = v779
      v789.Parent = gethui()
    end)) then
      v779.Parent = playerGui2
    end
    v780 = v787.Frame:Clone()
    fn111(v780)
    v787 = v780
    for index45, child15 in ipairs(v787:GetDescendants()) do
      if child15:IsA("LuaSourceContainer") then
        child15:Destroy()
      end
    end
    v787 = v780
    for index46, child16 in ipairs(v787:GetChildren()) do
      if child16:IsA("GuiObject") then
        if child16.Name ~= "Header" then
          if child16.Name ~= "Close" then
            if child16.Name ~= "ScrollingFrame" then
              child16:Destroy()
            end
          end
        end
      end
    end
    local scrollingFrame, header2, close2 = v780.ScrollingFrame, v780.Header, v780.Close
    scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    v781 = scrollingFrame.Template
    v781.Parent = nil
    v787 = v781.Spacer:FindFirstChild("Unequip", true)
    if v787 then
      if v787.Parent ~= v781.Spacer then
        local parent2 = v787.Parent
        v787.Parent, v787.AnchorPoint = v781.Spacer, Vector2.new(1, 0.5)
        parent2:Destroy()
      end
    end
    for index47, child17 in ipairs(scrollingFrame:GetChildren()) do
      if child17:IsA("GuiObject") then
        if child17.Name ~= "EmptyLast" then
          child17:Destroy()
        end
      end
    end
    v787 = v780:FindFirstChildOfClass("UIAspectRatioConstraint") or fn3("UIAspectRatioConstraint", {Parent = v780})
    local v790 = 0.92 / v787.AspectRatio
    v787.AspectRatio, v787.AspectType = 0.92, Enum.AspectType.FitWithinMaxSize
    local v791, v792, uDim2, v793 = v780, v780, UDim2.fromScale((if v786 then flag21 else 0.4) or 0.28, (if v786 then flag21 else 0.86) or 0.66), fromRGB(205, 200, 255)
    v791.Size = uDim2
    v792.ImageColor3 = v793
    header2.Size = UDim2.new(header2.Size.X.Scale, 0, header2.Size.Y.Scale * v790, 0)
    header2.Position = UDim2.new(header2.Position.X.Scale, 0, header2.Position.Y.Scale * v790, 0)
    close2.Size = UDim2.new(close2.Size.X.Scale, 0, close2.Size.Y.Scale * v790, 0)
    v790, v793 = header2.Position.Y.Scale + (header2.Size.Y.Scale * (1 - header2.AnchorPoint.Y)), scrollingFrame.Size.X.Scale * v781.Spacer.Size.X.Scale
    v787 = fn3("Frame", {Parent = v780, BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(scrollingFrame.Position.X.Scale, v790 + 0.0297), Size = UDim2.fromScale(v793, 0.075)})
    fn3("UIListLayout", {Parent = v787, FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Center, VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0.03, 0)})
    v786 = v790 + 0.125
    scrollingFrame.AnchorPoint, scrollingFrame.Position, scrollingFrame.Size = Vector2.new(0.5, 0), UDim2.fromScale(0.5, v786), UDim2.fromScale(scrollingFrame.Size.X.Scale, 0.975 - v786)
    flag21 = header2:FindFirstChildOfClass("UIGradient")
    if flag21 then
      flag21.Color = ColorSequence.new(tbl84.vx[1], tbl84.vx[2])
    end
    v791 = header2.Title
    v791.Text, v791.TextScaled, v791.TextXAlignment = "Steal Panel", true, Enum.TextXAlignment.Left
    v791.AnchorPoint, v791.Position, v791.Size = Vector2.new(0, 0.5), UDim2.fromScale(0.045, 0.5), UDim2.fromScale(0.75, 0.56)
    for index48, child18 in ipairs(v791:GetChildren()) do
      if child18:IsA("UITextSizeConstraint") then
        child18:Destroy()
      end
    end
    v790 = header2.PlusEquip
    v790.AnchorPoint, v790.Position, v790.Size = Vector2.new(1, 0.5), UDim2.fromScale(0.975, 0.5), UDim2.fromScale(0.15, 0.68)
    fn104(v790).Text = ""
    fn103(v790, "vx")
    fn3("ImageLabel", {Parent = v790, BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.88, 0.88), SizeConstraint = Enum.SizeConstraint.RelativeYY, Image = "rbxasset://textures/ui/Settings/MenuBarIcons/GameSettingsTab.png", ScaleType = Enum.ScaleType.Fit})
    fn105(v790, function()
      tbl39["Auto Steal"]:Go()
    end)
    uDim2 = header2:FindFirstChild("Stroke")
    if uDim2 then
      uDim2:Destroy()
    end
    for index49, child19 in ipairs(close2:GetDescendants()) do
      if child19:IsA("ImageLabel") then
        child19:Destroy()
      elseif child19:IsA("ImageButton") then
        child19:Destroy()
      end
    end
    v790 = fn104(close2)
    if v790 then
      v790.Visible = true
      v790.Text = ">"
      v790.TextTransparency = 0
    end
    fn105(close2, function()
      tbl88.Show(false)
    end)
    flag21, uDim2 = v781.Spacer.Unequip, {{"steal", "Auto Steal", function()
      local v794 = reg.state
      if v794.autoSteal then
        local v795 = reg.state
        v795.autoSteal:Set(not reg.slot21.steal)
      end
    end}, {"hwEggs", "Halloween", function()
      local v796 = reg.state
      if v796.hwEggsT then
        local v797 = reg.state
        v797.hwEggsT:Set(not reg.slot21.hwEggs)
      end
    end}, {"hwmode", nil, function()
      tbl88.hw = ((((tbl88.hw or "All") == "All") and "Halloween") or ((tbl88.hw == "Halloween") and "Field")) or "All"
    end}}
    for index50, item48 in ipairs(uDim2) do
      v786 = flag21:Clone()
      v786.AnchorPoint, v786.Size = Vector2.new(0.5, 0.5), UDim2.fromScale(0.31, 1)
      v786.LayoutOrder = index50
      v786.Parent = v787
      fn105(v786, function()
        item48[3]()
        tbl88.Sync()
        tbl88.Refresh()
      end)
      tbl89[index50] = {v786, item48[1], item48[2]}
    end
    v784 = fn104(v781.Spacer):Clone()
    local v798, v799, v800, v801, v802, v803, vector2, uDim2_2, uDim2_3, v804 = v784, v784, v784, v784, v784, v784, Vector2.new(0.5, 0.5), UDim2.fromScale(0.5, 0.45), UDim2.fromScale(0.8, 0.08), v780
    v798.AnchorPoint = vector2
    v799.Position = uDim2_2
    v800.Size = uDim2_3
    v801.Text = "No eggs to show right now"
    v802.Visible = false
    v803.Parent = v804
    scrollingFrame = v784:FindFirstChildOfClass("UIGradient")
    if scrollingFrame then
      scrollingFrame:Destroy()
    end
    scrollingFrame = v781.Spacer
    scrollingFrame.Icon.AnchorPoint, scrollingFrame.Icon.Position, scrollingFrame.Icon.Size = Vector2.new(0.5, 0.5), UDim2.fromScale(0.1, 0.5), UDim2.fromScale(0.17, 1.15)
    v793 = scrollingFrame.TextLabel
    v793.AnchorPoint, v793.Position, v793.Size = Vector2.new(0, 0.5), UDim2.fromScale(0.223, 0.5), UDim2.fromScale(0.44, 0.62)
    v793.RichText = true
    v786 = v793:Clone()
    for index51, child20 in ipairs(v786:GetChildren()) do
      if child20:IsA("UIGradient") then
        child20:Destroy()
      elseif child20:IsA("UIStroke") then
        child20:Destroy()
      end
    end
    v786.Name, v786.TextColor3, v786.ZIndex = "SizeTag", Color3.new(1, 1, 1), v793.ZIndex + 1
    v786.Parent = scrollingFrame
    v787 = v786:Clone()
    v787.Name = "MoneyTag"
    v787.Parent = scrollingFrame
    uDim2_3 = v786:Clone()
    uDim2_3.Name, uDim2_3.Parent, uDim2_3.AnchorPoint, uDim2_3.Position, uDim2_3.Size, uDim2_3.TextXAlignment = "Queue", scrollingFrame, Vector2.new(0, 0), UDim2.fromScale(0.025, 0.06), UDim2.fromScale(0.16, 0.26), Enum.TextXAlignment.Left
    uDim2_3.Text = ""
    v800 = scrollingFrame.Unequip
    v800.AnchorPoint, v800.Position, v800.Size = Vector2.new(1, 0.5), UDim2.fromScale(0.97, 0.5), UDim2.fromScale(0.24, 0.62)
    fn104(v800).Text = "STEAL"
    fn103(v800, "on")
    v786 = {"Up", "Down"}
    for index52, item49 in ipairs(v786) do
      v798 = v800:Clone()
      v798.Name = item49
      v798.Visible = false
      fn104(v798).Text = ""
      fn103(v798, "gold")
      fn3("ImageLabel", {Name = "Arrow", Parent = v798, BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.72, 0.72), Image = tbl17.arrow, ScaleType = Enum.ScaleType.Fit, Rotation = ((index52 == 1) and -90) or 90, ZIndex = v798.ZIndex + 2})
      v798.Parent = scrollingFrame
    end
    v791.Size = UDim2.fromScale(0.56, 0.56)
    scrollingFrame = flag21:Clone()
    scrollingFrame.AnchorPoint, scrollingFrame.Position, scrollingFrame.Size = Vector2.new(1, 0.5), UDim2.fromScale(0.81, 0.5), UDim2.fromScale(0.19, 0.62)
    scrollingFrame.Parent = header2
    fn103(scrollingFrame, "gold")
    fn105(scrollingFrame, function()
      fn101()
      tbl88.Sync()
      tbl88.Refresh()
    end)
    tbl88.sort = scrollingFrame
    scrollingFrame = v781
    scrollingFrame.Size = UDim2.new(1, 0, 0.23, 0)
    v780.Parent = v779
    v780:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
      fn110(v780, v780.AbsoluteSize.X)
    end)
    fn110(v780, ((v780.AbsoluteSize.X > 0) and v780.AbsoluteSize.X) or 556)
    if not (tbl88.cl) then
      tbl88.cl = true
      table.insert(reg.state.cleanup, function()
        if tbl88.open then
          tbl88.Show(false)
        end
        tbl88.open = false
        for index53, item50 in ipairs(tbl91) do
          item50:Disconnect()
        end
        if v782 then
          if v782:GetAttribute("vx") then
            local v805 = v782
            v805.Position = UDim2.fromScale(1, 0.5)
            v782:SetAttribute("vx", nil)
          end
        end
        if v779 then
          v779:Destroy()
        end
        if v783 then
          v783.Parent:Destroy()
        end
      end)
    end
    for index54, item51 in ipairs(tbl91) do
      item51:Disconnect()
    end
    table.clear(tbl91)
    v803 = v782:FindFirstAncestorOfClass("ScreenGui") or v788
    local v806 = fn3("ScreenGui", {IgnoreGuiInset = v803.IgnoreGuiInset, ScreenInsets = v803.ScreenInsets, DisplayOrder = v803.DisplayOrder, ResetOnSpawn = false, Enabled = false})
    tbl88.bh = nil
    if not (pcall(function()
      v806.Parent = gethui()
    end)) then
      v806.Parent = playerGui2
    end
    v783 = v782:FindFirstChild("EggsButton") and v782.EggsButton:Clone()
    if v783 then
      v804 = v783
      for index55, child21 in ipairs(v804:GetChildren()) do
        if (child21:IsA("GuiObject") and (child21.Name ~= "Pattern")) and (child21.Name ~= "ImageLabel") then
          child21:Destroy()
        elseif child21:IsA("LuaSourceContainer") then
          child21:Destroy()
        end
      end
      v783.ImageLabel.Image = tbl17.money
      fn103(v783, "vx")
      v801, vector2 = v783, v783
      v801.AnchorPoint = Vector2.new(0.5, 0.5)
      vector2.Parent = v806
      fn105(v783, function()
        tbl88.Show(not tbl88.open)
      end)
      v788 = reg.runService
      fn113(v788.RenderStepped, function()
        if v783.Visible then
          v778()
        end
      end)
      fn113(v782:GetPropertyChangedSignal("Position"), function()
        if reg.alive then
          if tbl88.open then
            if not (tbl88.sliding) then
              if v782.Position.X.Offset < (((tbl88.home and tbl88.home.X.Offset) or 0) + (num27 * 0.95)) then
                tbl88.Column(true)
              end
            end
          end
        end
      end, "open", "Offset")
      for index56, item52 in ipairs(v777) do
        local findFirstChild3 = playerGui2:FindFirstChild(item52)
        if findFirstChild3 then
          fn113(findFirstChild3:GetPropertyChangedSignal("Enabled"), function()
            if findFirstChild3.Enabled then
              if tbl88.open then
                tbl88.Show(false, true)
              end
            end
          end, "Show", "open", "Enabled")
        end
      end
      v799 = false
      for index57, item53 in ipairs(v777) do
        v799 = v799 or (playerGui2:FindFirstChild(item53) and playerGui2[item53].Enabled)
      end
      if not v799 then
        if v782.Position.X.Offset > 0 then
          v803 = v782
          v803.Position = UDim2.fromScale(1, 0.5)
        end
      end
    end
    return true
  end
  tbl88.Sync = function()
    if not (v780) then
      return
    end
    local v807 = ipairs
    for it1_18, it2_17 in v807(tbl89) do
      if it2_17[2] == "hwmode" then
        fn103(it2_17[1], ((tbl88.hw == "Halloween") and "gold") or "vx")
        fn104(it2_17[1]).Text = "Eggs: " .. (tbl88.hw or "All")
      else
        it1_18 = reg.slot21
        local cond21 = it1_18[it2_17[2]] == true
        fn103(it2_17[1], (cond21 and "on") or "off")
        fn104(it2_17[1]).Text = it2_17[3] .. ((cond21 and ": ON") or ": OFF")
      end
    end
    if tbl88.sort then
      v807 = nil
      v807, fn104(tbl88.sort).Text = reg.slot21, tbl87[reg.slot21.order] or "Value"
    end
  end
  v778 = function()
    local findFirstAncestorOfClass, eggsButton, petsButton = v782:FindFirstAncestorOfClass("ScreenGui"), v782:FindFirstChild("EggsButton"), v782:FindFirstChild("PetsButton")
    if findFirstAncestorOfClass then
      if findFirstAncestorOfClass.Enabled then
        if eggsButton then
          if petsButton then
            if v782.Visible then
              if eggsButton.Visible then
                if eggsButton.AbsoluteSize.X > 0 then
                  local uIScale = eggsButton:FindFirstChildOfClass("UIScale")
                  local v808, v809, absolutePosition = ((uIScale and (uIScale.Scale > 0)) and uIScale.Scale) or 1, (eggsButton.AbsolutePosition + (eggsButton.AbsoluteSize / 2)) - Vector2.new((tbl88.home and (v782.Position.X.Offset - tbl88.home.X.Offset)) or 0, 0), v783.Parent.AbsolutePosition
                  tbl88.bh, tbl88.bs = UDim2.fromOffset(v809.X - absolutePosition.X, ((2 * v809.Y) - (petsButton.AbsolutePosition.Y + (petsButton.AbsoluteSize.Y / 2))) - absolutePosition.Y), UDim2.fromOffset(eggsButton.AbsoluteSize.X / v808, eggsButton.AbsoluteSize.Y / v808)
                end
              end
            end
          end
        end
      end
    end
    petsButton = tbl88.bh and ((v783.Position ~= tbl88.bh) or (v783.Size ~= tbl88.bs))
    if petsButton then
      local v810, v811, bh, bs = v783, v783, tbl88.bh, tbl88.bs
      v810.Position = bh
      v811.Size = bs
    end
    v783.Parent.Enabled = tbl88.bh ~= nil
  end
  tbl88.Column = function(arg1_141)
    tbl88.sliding = true
    num27 = math.ceil(v782.AbsoluteSize.X * 1.03)
    if arg1_141 and not tbl88.home then
      tbl88.home = v782.Position
    end
    local v812 = tbl88.home or UDim2.fromScale(1, 0.5)
    local create = tweenService:Create(v782, TweenInfo.new((arg1_141 and 0.22) or 0.3, (arg1_141 and Enum.EasingStyle.Quad) or Enum.EasingStyle.Back, (arg1_141 and Enum.EasingDirection.In) or Enum.EasingDirection.Out), {Position = (arg1_141 and (v812 + UDim2.fromOffset(num27, 0))) or v812})
    local function fn115()
      tbl88.sliding = false
      if not (arg1_141) then
        tbl88.home = nil
      end
    end
    create.Completed:Connect(fn115)
    create:Play()
  end
  local function fn116()
    local v813 = ipairs
    for it1_19, it2_18 in v813(v777) do
      it1_19 = reg.localPlayer
      local findFirstChild4 = it1_19.PlayerGui:FindFirstChild(it2_18)
      if findFirstChild4 and findFirstChild4.Enabled then
        it1_19 = findFirstChild4:FindFirstChild("Frame") and findFirstChild4.Frame:FindFirstChild("Close")
        for index58, item54 in ipairs((it1_19 and getconnections(it1_19.Activated)) or {}) do
          pcall(item54.Fire, item54)
        end
        return true
      end
    end
  end
  tbl88.Show = function(arg1_142, arg2_56)
    if not (fn114()) then
      return
    end
    tbl88.open = arg1_142
    if arg1_142 then
      if fn116() then
        task.delay(0.27, function()
          if tbl88.open then
            tbl88.Show(true)
          end
        end)
        return
      end
    end
    local uDim2_4 = UDim2.new(0.985, (v780.AbsoluteSize.X * 1.4) + 60, 0.5, 0)
    v782:SetAttribute("vx", arg1_142 or nil)
    if arg1_142 then
      local v814
      v814, v779.Enabled = v780, true
      v814.Position = uDim2_4
      tbl88.Sync()
      tbl88.Refresh()
      local v815, tbl94 = v780, {}
      tbl94.Position = UDim2.fromScale(0.985, 0.5)
      fn102(v815, tbl94, 0.3, Enum.EasingStyle.Back)
      tbl88.Column(true)
    else
      fn102(v780, {Position = uDim2_4}, 0.24, nil, Enum.EasingDirection.In)
      if not (arg2_56) then
        tbl88.Column(false)
      end
      task.delay(0.25, function()
        if not (tbl88.open) then
          v779.Enabled = false
        end
      end)
    end
  end
  tbl88.Dock = function(arg1_143, arg2_57)
    task.spawn(function()
      for i14 = 1, (arg2_57 and 1) or 30, 1 do
        if fn114() then
          break
        end
        task.wait(1)
      end
      if v783 then
        v783.Visible = arg1_143
        if arg1_143 then
          v778()
        end
      end
    end)
  end
  local tbl95, tbl96, tbl97 = {}, {}, {}
  local function fn117(arg1_144)
    if not (arg1_144) then
      return
    end
    if arg1_144.hw then
      local v816 = reg.state
      if v816.hwPick == arg1_144.Uid then
        local v817 = reg.state
        v817.hwPick = nil
        fn34("Halloween", "Removed " .. (arg1_144.n .. " from the queue"), "info")
      else
        local v818 = reg.state
        v818.hwPick = arg1_144.Uid
        v818 = reg.slot21
        if not (v818.hwEggs) then
          local v819 = reg.state
          if v819.hwEggsT then
            local v820 = reg.state
            v820.hwEggsT:Set(true)
          end
        end
        fn34("Halloween", "Stealing now: " .. arg1_144.n, "info")
      end
      return tbl88.Refresh()
    end
    local v821, v822, find3 = tbl96[arg1_144.Uid], reg.state, table.find(reg.state.pick, arg1_144.Uid)
    if v821 == "STOP" then
      local v823 = reg.state
      v823.stopSteal()
      fn34("Steal", "Stopped " .. (arg1_144.n .. ", moving to the next egg"), "info")
    elseif v821 == "CANCEL" then
      if find3 then
        table.remove(reg.state.pick, find3)
      end
      tbl97[arg1_144.Uid] = nil
      fn34("Steal", "Removed " .. (arg1_144.n .. " from the queue"), "info")
    else
      local v824 = reg.state
      v824.skip[arg1_144.Uid] = nil
      tbl97[arg1_144.Uid] = true
      if find3 then
        table.remove(reg.state.pick, find3)
      end
      table.insert(reg.state.pick, 1, arg1_144.Uid)
      v824 = reg.state
      v824.rank.Steal = 0
      v824 = reg.state
      if v824.order then
        local v825 = reg.state
        v825.order()
      end
      v824 = reg.slot21
      if not (v824.steal) then
        local v826 = reg.state
        if v826.autoSteal then
          local v827 = reg.state
          v827.autoSteal:Set(true)
        end
      end
      v824 = reg.state
      v824.retarget()
      fn34("Steal", ((arg1_144.held and "Chasing ") or "Stealing now: ") .. arg1_144.n, "info")
    end
    tbl88.Refresh()
  end
  tbl88.Move = function(arg1_145, arg2_58)
    local v828 = tbl88.queue or {}
    local find4 = table.find(v828, arg1_145)
    local v829 = find4 and (find4 + arg2_58)
    if v829 then
      if not (v828[v829]) then
        return
      end
    else
      return
    end
    local v830, v831 = tbl95[arg1_145], tbl95[v828[v829]]
    local v832 = (v830 and v830.hw) or (v831 and v831.hw)
    if v832 then
      local v833 = reg.state
      if v833.hwMove then
        local v834 = reg.state
        v834.hwMove((v830 and v830.hw) and arg1_145, (v831 and v831.hw) and v828[v829], arg2_58)
      end
      return tbl88.Refresh()
    end
    v828[find4], v828[v829] = v828[v829], v828[find4]
    arg1_145, v832 = math.max(find4, v829), #v828
    for i15 = 1, v832, 1 do
      arg2_58 = nil
      arg2_58, arg1_145 = reg.state, if table.find(reg.state.pick, v828[i15]) then math.max(arg1_145, i15) else arg1_145
    end
    table.clear(reg.state.pick)
    for i16 = 1, arg1_145, 1 do
      v829 = reg.state
      v829.pick[i16] = v828[i16]
    end
    v830 = reg.state
    v830.rank.Steal = 0
    v830 = reg.state
    if v830.order then
      v832 = reg.state
      v832.order()
    end
    tbl88.Refresh()
  end
  tbl88.Set = function(arg1_146)
    if v780 then
      if not (tbl88.open) then
        return
      end
    else
      return
    end
    tbl88.Sync()
    local tbl98, tbl99, tbl100, tbl101, v835, num28 = {}, {}, {}, {}, ipairs, 0
    for it1_20, it2_19 in v835(arg1_146) do
      if it2_19.hw then
        local cur, v836 = it2_19.cur
        if cur then
          v836 = cur
        else
          it1_20 = reg.state
          v836 = it1_20.hwPick == it2_19.Uid
        end
        if v836 then
          table.insert(tbl98, 1, it2_19)
          num28 += 1
        else
          cur = reg.slot21
          if cur.hwEggs then
            if it2_19.tg then
              tbl100[#tbl100 + 1] = it2_19
            else
              tbl99[#tbl99 + 1] = it2_19
            end
          else
            tbl99[#tbl99 + 1] = it2_19
          end
        end
      else
        local v837 = reg.state
        if it2_19.Uid == v837.curUid then
          table.insert(tbl98, 1, it2_19)
        else
          local v838 = reg.state
          if table.find(v838.pick, it2_19.Uid) then
            num28 += 1
            tbl98[#tbl98 + 1] = it2_19
          else
            local v839 = reg.slot21
            if v839.steal then
              if it2_19.tg then
                tbl101[#tbl101 + 1] = it2_19
              else
                tbl99[#tbl99 + 1] = it2_19
              end
            else
              tbl99[#tbl99 + 1] = it2_19
            end
          end
        end
      end
    end
    table.sort(tbl100, function(arg1_147, arg2_59)
      local v840, v841 = arg1_147.o or math.huge, arg2_59.o or math.huge
      if v840 ~= v841 then
        return v840 < v841
      end
      return arg1_147.v > arg2_59.v
    end)
    v835 = reg.state
    local hwTurnNow, v842 = v835.hwTurnNow
    if hwTurnNow then
      arg1_146 = reg.state
      v842 = arg1_146.hwTurnNow()
    else
      v842 = hwTurnNow
    end
    hwTurnNow, v835 = 1, 1
    while tbl100[hwTurnNow] or tbl101[v835] do
      local cond22, v843 = tbl100[hwTurnNow] ~= nil
      if cond22 then
        arg1_146 = tbl101[v835]
        v843 = (if arg1_146 then v842 == true else not arg1_146) or ((v842 == nil) and (tbl100[hwTurnNow].v > tbl101[v835].v))
      else
        v843 = cond22
      end
      cond22 = nil
      if v843 then
        cond22 = tbl100[hwTurnNow]
        hwTurnNow = hwTurnNow + 1
      else
        cond22 = tbl101[v835]
        v835 = v835 + 1
      end
      v842 = not v843
      local v844 = reg.state
      if num28 < (#v844.pick + 8) then
        num28 += 1
        tbl98[#tbl98 + 1] = cond22
      else
        tbl99[#tbl99 + 1] = cond22
      end
    end
    arg1_146 = reg.state
    tbl100, hwTurnNow = arg1_146.sortKey
    if tbl100 then
      v835 = reg.state
      hwTurnNow = v835.sortKey()
    else
      hwTurnNow = tbl100
    end
    local v845 = hwTurnNow or "v"
    table.sort(tbl99, function(arg1_148, arg2_60)
      local v846, v847 = arg1_148[v845] or 0, arg2_60[v845] or 0
      if v846 ~= v847 then
        return v846 > v847
      end
      return arg1_148.v > arg2_60.v
    end)
    tbl101 = #tbl98
    for index59, item55 in ipairs(tbl99) do
      tbl98[#tbl98 + 1] = item55
    end
    tbl100 = {}
    tbl88.queue = {}
    for i17 = 1, tbl101, 1 do
      arg1_146 = reg.state
      if tbl98[i17].Uid ~= arg1_146.curUid then
        tbl88.queue[#tbl88.queue + 1] = tbl98[i17].Uid
      end
    end
    tbl99, v835 = math.min(#tbl98, 60), 0
    for i18 = 1, tbl99, 1 do
      arg1_146 = tbl98[i18]
      hwTurnNow = tbl90[arg1_146.Uid]
      if hwTurnNow then
      else
        hwTurnNow = v781:Clone()
        hwTurnNow.Visible, hwTurnNow.Name = true, arg1_146.Uid
        local uid2 = arg1_146.Uid
        fn105(hwTurnNow.Spacer.Unequip, function()
          fn117(tbl95[uid2])
        end)
        fn105(hwTurnNow.Spacer.Up, function()
          tbl88.Move(uid2, -1)
        end)
        fn105(hwTurnNow.Spacer.Down, function()
          tbl88.Move(uid2, 1)
        end)
        hwTurnNow.Parent = v780.ScrollingFrame
        tbl90[arg1_146.Uid] = hwTurnNow
        fn110(hwTurnNow, v780.AbsoluteSize.X)
      end
      tbl100[arg1_146.Uid], tbl95[arg1_146.Uid] = true, arg1_146
      hwTurnNow.LayoutOrder = i18
      local spacer, v848 = hwTurnNow.Spacer, reg.state
      local cond23, v849, v850 = v848.curUid == arg1_146.Uid, arg1_146.hw
      if v849 then
        local v851, v852 = arg1_146.cur and "STOP"
        if v851 then
          v852 = v851
        else
          v848 = reg.state
          v852 = (v848.hwPick == arg1_146.Uid) and "CANCEL"
        end
        v850 = v852 or "STEAL"
      else
        v850 = v849
      end
      v848, v849 = v850 or (cond23 and "STOP")
      if v848 then
        v849 = v848
      else
        local v853, v854 = tbl97[arg1_146.Uid]
        if v853 then
          v850 = nil
          v850, v854 = reg.state, table.find(reg.state.pick, arg1_146.Uid)
        else
          v854 = v853
        end
        v849 = v854 and "CANCEL"
      end
      v850 = (v849 or (arg1_146.held and "CHASE")) or "STEAL"
      tbl96[arg1_146.Uid] = v850
      if hwTurnNow:GetAttribute("k") ~= v850 then
        hwTurnNow:SetAttribute("k", v850)
        fn104(spacer.Unequip).Text = ((v850 == "STOP") and "CANCEL") or v850
        fn103(spacer.Unequip, tbl85[v850])
      end
      v835 = if i18 <= tbl101 then if cond23 then v835 else v835 + 1 else v835
      v850 = ((i18 <= tbl101) and not cond23) and not arg1_146.cur
      spacer.Up.Visible, spacer.Down.Visible = v850, v850
      spacer.Up.Arrow.ImageTransparency, spacer.Down.Arrow.ImageTransparency = ((v835 > 1) and 0) or 0.6, ((v835 < #tbl88.queue) and 0) or 0.6
      fn109(spacer, v850)
      spacer.Queue.Text = ((i18 <= tbl101) and ("<stroke color=\"#000000\" joins=\"round\" thickness=\"2\"><font color=\"#FFC83C\">%s</font></stroke>"):format((cond23 and "NOW") or ("#" .. v835))) or ""
      spacer.Icon.Image = fn99(arg1_146.cat)
      i18 = spacer.TextLabel:FindFirstChildOfClass("UIStroke")
      v849 = (i18 and i18.Thickness) or 2
      spacer.TextLabel.Text = arg1_146.la .. (str4 .. (arg1_146.hm .. (arg1_146.z .. "</font>")))
      spacer.SizeTag.Text = ("%s%s%s</font><stroke color=\"#000000\" joins=\"round\" thickness=\"%.1f\"><font color=\"#14FF00\">%s</font><font color=\"#B8C0CC\">%s</font></stroke>"):format(str4, arg1_146.la, arg1_146.hm or "", v849, arg1_146.m, arg1_146.z)
      spacer.MoneyTag.Text = (arg1_146.hm and ("%s%s</font><stroke color=\"#000000\" joins=\"round\" thickness=\"%.1f\"><font color=\"#14FF00\">%s</font></stroke>%s%s</font>"):format(str4, arg1_146.la, v849, arg1_146.hm, str4, arg1_146.z)) or ""
      i18 = fn16(arg1_146.cat)
      v848, cond23 = (i18 and i18.Rarity) and i18.Rarity.RarityGradient, spacer.TextLabel:FindFirstChildOfClass("UIGradient")
      if (typeof(v848) == "Instance") and (if cond23 then cond23:GetAttribute("c") ~= arg1_146.cat else not cond23) then
        if cond23 then
          cond23:Destroy()
        end
        cond23 = ((i18.Rarity._id == "Secret") and fn112(v848)) or v848:Clone()
        cond23:SetAttribute("c", arg1_146.cat)
        cond23.Parent = spacer.TextLabel
      end
    end
    for key21, item56 in next, tbl90, nil do
      if not (tbl100[key21]) then
        item56:Destroy()
        tbl90[key21] = nil
        tbl95[key21] = nil
        tbl96[key21] = nil
        tbl97[key21] = nil
      end
    end
    tbl100 = v784
    tbl100.Visible = #tbl98 == 0
    v780.Header.Title.Text = ((v835 > 0) and ("Steal Panel (" .. (v835 .. " in queue)"))) or "Steal Panel"
  end
  local flag22 = false
  tbl88.Refresh = function()
    if flag22 then
      return
    elseif not (tbl88.open) then
      return
    end
    flag22 = true
    task.delay(0.08, function()
      flag22 = false
      if not (tbl88.open) then
        return
      end
      local cond24, v855 = tbl88.hw == "Field"
      if cond24 then
        local v856 = reg.state
        v855 = v856.allEggs()
      else
        v855 = cond24
      end
      cond24 = nil
      if v855 then
        cond24 = v855
      else
        local v857 = reg.state
        local hwEggs = v857.hwEggs
        if hwEggs then
          v857 = reg.state
          cond24 = v857.hwEggs()
        else
          cond24 = hwEggs
        end
      end
      local v858 = cond24 or {}
      if (tbl88.hw or "All") == "All" then
        cond24 = reg.state
        for index60, item57 in ipairs(cond24.allEggs()) do
          v858[#v858 + 1] = item57
        end
      end
      v855 = ipairs
      for it1_21, it2_20 in v855(v858) do
        if not (it2_20.hm) then
          cond24, it1_21 = it2_20.n:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;") .. "\n", reg.callModule
          it2_20.hm = "$" .. ((it1_21("Fmt", "FormatCompact", it2_20.v, ".#") or fn15(it2_20.v)) .. "/s  ")
          it2_20.la, it2_20.m, it2_20.z = cond24, "", ("x%.2f"):format(it2_20.s) .. ((it2_20.hw and "  <font color=\"#FF9A3C\">Halloween</font>") or "")
        end
      end
      fn33("hud", function()
        tbl88.Set(v858)
      end)
    end)
  end
  task.spawn(function()
    local v859 = reg.modules
    local egg3, tbl102 = v859.Egg, {"FieldShifted", "FieldGone", "FieldClaimed", "FieldRefreshed", "SnapshotRefreshed"}
    for index61, item58 in ipairs(tbl102) do
      if egg3 then
        if egg3[item58] then
          pcall(fn2, egg3[item58], tbl88.Refresh)
        end
      end
    end
  end)
  local v860 = fn50({name = "HudPanel", gap = 2})
  v860.on = function()
    return tbl88.open
  end
  v860.fn = tbl88.Refresh
  local v861 = fn50({name = "HudIcon", gap = 1})
  v861.on = function()
    local v862 = reg.slot21
    return v862.panelBtn ~= false
  end
  v861.fn = function()
    local v863, v864, v865 = reg.state, -1
    for index62, item59 in ipairs(v863.allEggs()) do
      if item59.v > v864 then
        v865 = item59.cat
        v864 = item59.v
      else
      end
    end
    local v866 = (v865 and fn99(v865)) or tbl17.money
    fn33("hudIcon", function()
      local v867 = v783 and v783:FindFirstChild("ImageLabel")
      if v867 then
        if v867.Image ~= v866 then
          v867.Image = v866
        end
      end
    end)
  end
end
do
  local str5 = v121.Dir() .. "/_hop.json"
  local v868 = v121.Rd(str5) or {}
  v868.Visited = ((type(v868.Visited) == "table") and v868.Visited) or {}
  local function fn118()
    v121.Wr(str5, v868)
  end
  tbl41 = fn6() - 1800
  for key22, item60 in next, v868.Visited, nil do
    if item60 < tbl41 then
      v868.Visited[key22] = nil
    end
  end
  v868.Visited[reg.game.JobId] = fn6()
  fn118()
  local tbl103, v869 = {}
  local num29, v870 = 0
  local flag23, v871 = false
  fn2(teleportService.TeleportInitFailed, function(arg1_149)
    local v872 = reg.localPlayer
    if arg1_149 == v872 then
      local v873 = reg.state
      if v873.hopping then
        flag23 = false
        if v870 then
          tbl103[v870] = true
        end
        task.spawn(v871, reg.state.hopping)
      end
    end
  end)
  fn2(reg.localPlayer.OnTeleport, function(arg1_150)
    if arg1_150 == Enum.TeleportState.Started then
      flag23 = true
    elseif arg1_150 == Enum.TeleportState.InProgress then
      flag23 = true
    end
  end)
  local function fn119(arg1_151)
    if v869 then
      if (os.clock() - num29) < 60 then
        local v874 = v869
        return v874
      end
    end
    local tbl104, v875, str6 = {}, ((arg1_151 == "Random") and 3) or 6, ""
    for i19 = 1, v875, 1 do
      i19 = reg.game
      local format2 = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=%s&excludeFullGames=true&limit=100%s"):format(i19.PlaceId, ((arg1_151 == "Most players") and "Desc") or "Asc", str6)
      local v876, v877, v878, v879 = reg.game, reg.game, pcall(reg.game.HttpGet, reg.game, format2)
      local v880, v881, v882, v883 = reg.httpService, reg.httpService, pcall(reg.httpService.JSONDecode, reg.httpService, (v878 and v879) or "")
      if v882 then
        if type(v883) ~= "table" then
          break
        end
      else
        break
      end
      format2, v882 = ipairs, v883.data or {}
      for it1_22, it2_21 in format2(v882) do
        v879 = reg.game
        if it2_21.id ~= v879.JobId then
          tbl104[#tbl104 + 1] = it2_21
        end
      end
      if #tbl104 > 0 then
        if arg1_151 ~= "Random" then
          break
        elseif not (v883.nextPageCursor) then
          break
        end
      elseif not (v883.nextPageCursor) then
        break
      end
      str6 = "&cursor=" .. v883.nextPageCursor
    end
    v875 = nil
    v875, v869 = os.clock(), tbl104
    num29 = v875
    return tbl104
  end
  v871 = function(arg1_152)
    for i20 = 1, 2, 1 do
      local v884, tbl105 = ipairs, {2, 1}
      for it1_23, it2_22 in v884(tbl105) do
        local tbl106, v885, v886 = {}, ipairs, vm[53](fn119(arg1_152))
        for it1_24, it2_23 in v885(vm:uT(v886)) do
          if ((it2_23.maxPlayers or 0) - (it2_23.playing or 0)) >= it2_22 then
            it1_24 = tbl103
            if not (it1_24[it2_23.id]) then
              if i20 == 1 then
                if not (v868.Visited[it2_23.id]) then
                  tbl106[#tbl106 + 1] = it2_23
                end
              else
                tbl106[#tbl106 + 1] = it2_23
              end
            end
          end
        end
        if #tbl106 > 0 then
          table.sort(tbl106, function(arg1_153, arg2_61)
            if arg1_152 == "Most players" then
              return arg1_153.playing > arg2_61.playing
            end
            return arg1_153.playing < arg2_61.playing
          end)
          local v887 = tbl106[math.random(1, ((arg1_152 == "Random") and #tbl106) or math.min(#tbl106, 100))]
          v885, it2_22, v886, it1_23 = v868.Visited, v887.id, fn6(), v887.id
          v885[it2_22] = v886
          v870, flag23 = it1_23, false
          fn118()
          local v888 = reg.state
          v888.beforeTeleport()
          fn34("Server hop", ("Joining a server with %d players"):format(v887.playing or 0), "info")
          local v889, v890 = reg.game, reg.localPlayer
          pcall(teleportService.TeleportToPlaceInstance, teleportService, reg.game.PlaceId, v887.id, reg.localPlayer)
          task.delay(6, function()
            local v891 = reg.state
            if v891.hopping then
              local v892 = v870
              if v892 == v887.id then
                if not (flag23) then
                  local v893 = tbl103
                  v893[v887.id] = true
                  v871(arg1_152)
                end
              end
            end
          end)
          return true
        end
      end
      tbl103, v869 = {}, nil
    end
    local v894 = reg.state
    v894.hopping = nil
    return false
  end
  reg.state.hop = function(arg1_154)
    local v895 = reg.state
    if v895.hopping then
      return true
    end
    local v896, v897 = reg.state
    if arg1_154 then
      v897 = arg1_154
    else
      v895 = reg.slot21
      v897 = v895.hopMode
    end
    v896.hopping = v897 or "Least players"
    arg1_154 = reg.state
    return v871(arg1_154.hopping)
  end
  tbl9 = tbl39["Auto Steal"]:Section("Auto hop server", "server", 1)
  local v898 = fn35("hop", tbl9:Text(""))
  fn44(tbl9, "Auto hop", "autoHop", false, function(arg1_155)
    if not (arg1_155) then
      v898("")
    end
  end)
  fn46(tbl9, "Hop when", "hopWhen", {"No egg matches here", "After stealing a match", "A rare egg spawned"}, "After stealing a match")
  fn46(tbl9, "Rare from", "hopRare", tbl8, "Cosmic")
  fn47(tbl9, "First hop after", "hopDelay", 3, 15, 5, "s")
  fn49(tbl9)
  local now7 = os.clock()
  local onSteal = reg.state.onSteal
  reg.state.onSteal = function(arg1_156)
    local v899 = reg.slot21
    if v899.hopWhen == "After stealing a match" then
      if type(arg1_156) == "table" then
        local tbl107, v900, v901 = {cat = arg1_156.AssetCategory, r = fn17(arg1_156.AssetCategory), v = math.huge, m = {}}, reg.slot63, reg.state
        if v900(v901.stealFilter, tbl107) then
          local v902 = reg.callModule
          v868.Window = v902("Cycle", "NextNightTime", fn6()) or (fn6() + 300)
          fn118()
        end
      end
    end
    if onSteal then
      onSteal(arg1_156)
    end
  end
  local v903 = fn50({name = "Hopper", gap = 0.5})
  v903.on = function()
    local v904 = reg.slot21
    return v904.autoHop
  end
  v903.fn = function()
    local v905 = fn26()
    if v905 <= 0 then
      return v898("Night, waiting for the field to reset")
    end
    local v906 = reg.slot21
    if (os.clock() - now7) < v906.hopDelay then
      return v898("Looking around this server")
    end
    v906 = reg.slot29
    if v906() then
      return v898("Busy stealing")
    elseif reg.slot4 then
      if reg.slot4.name == "Steal" then
        return v898("Busy stealing")
      end
    end
    v906 = reg.state
    if v906.starWants then
      local v907 = reg.state
      if v907.starWants() then
        return v898("Catching a Shooting Star, hop waits")
      end
    end
    v906 = reg.state
    local stealFilter, v908, v909, v910, v911 = v906.stealFilter, reg.slot21, table.find(tbl7, reg.slot21.hopRare) or 7, pairs, reg.slot19
    local v912, flag24, num30, num31 = vm[53](v911()), false, 0, 0
    for it1_25, it2_24 in v910(vm:uT(v912)) do
      if type(it2_24) == "table" then
        if it2_24.State ~= "Claimed" then
          if it2_24.Uid then
            if it2_24.Uid:find("^FirstAreaEgg") then
            else
              it1_25 = fn21(it2_24)
              flag24 = if it1_25.r >= v909 then true else flag24
              v906 = reg.slot63
              v911 = v906(stealFilter, it1_25)
              local v913
              if v911 then
                local v914 = reg.slot21
                local zones2 = v914.zones
                v914 = not zones2
                if zones2 then
                  local v915 = reg.slot21
                  v913 = v915.zones[tostring(it2_24.AreaId):gsub("%s", "")]
                else
                  v913 = v914
                end
              else
                v913 = v911
              end
              if v913 then
                if it2_24.State == "Carried" then
                  local v916 = num30 + 1
                  num30 = v916
                else
                  local v917 = num31 + 1
                  num31 = v917
                end
              else
              end
            end
          else
          end
        else
        end
      else
      end
    end
    if flag24 then
      stealFilter = reg.slot21
      if stealFilter.hopWhen == "A rare egg spawned" then
        v912 = reg.callModule
        v868.Window = v912("Cycle", "NextNightTime", fn6()) or (fn6() + 300)
      end
    end
    if num31 > 0 then
      v910 = reg.slot21
      if v910.steal then
        return v898(num31 .. " matching egg(s) here")
      else
        v906 = reg.slot21
        if v906.hopWhen == "No egg matches here" then
          return v898(num31 .. " matching egg(s) here")
        end
      end
    end
    if num30 > 0 then
      if (os.clock() - (v903.seen or os.clock())) < 20 then
        v903.seen = v903.seen or os.clock()
        return v898("Someone is carrying a match, waiting")
      end
    end
    v903.seen = nil
    if v905 < 12 then
      return v898("Night is close, staying")
    end
    stealFilter = reg.slot21
    if stealFilter.hopWhen ~= "No egg matches here" then
      if fn6() > (v868.Window or 0) then
        return v898("Waiting for a reason to hop")
      end
    end
    v898("Hopping")
    v911 = reg.state
    if not (v911.hop("Least players")) then
      task.wait(1.5)
    end
  end
end
reg.state.reserved = {}
local function fn120(arg1_157)
  local tbl108 = {}
  for index63, item61 in ipairs(((type(arg1_157.EquippedAssets) == "table") and arg1_157.EquippedAssets) or {}) do
    tbl108[item61] = true
  end
  return tbl108
end
local function fn121()
  local v918 = reg.localPlayer
  local character9 = v918.Character
  v918 = character9 and (character9:FindFirstChildOfClass("Tool"))
  return v918 and (v918:GetAttribute("UID"))
end
local function fn122(arg1_158)
  local placedEggRenders, v919 = workspace:FindFirstChild("PlacedEggRenders"), reg.localPlayer
  local str7 = v919.UserId .. ("_" .. arg1_158)
  arg1_158, v919 = placedEggRenders and (placedEggRenders:FindFirstChild(str7))
  if arg1_158 then
    v919 = arg1_158
  else
    placedEggRenders = reg.state
    local hidden = placedEggRenders.hidden
    if hidden then
      local v920 = reg.state
      v919 = v920.hidden:FindFirstChild(str7)
    else
      v919 = hidden
    end
  end
  return v919
end
reg.state.eggPos = function(arg1_159)
  local v921, v922 = fn122(arg1_159), reg.getPlot
  local v923, v924 = v922(), fn25()[arg1_159]
  v922 = ((type(v924) == "table") and (type(v924.Placement) == "table")) and v924.Placement.LocalCFrame
  return ((v921 and v921:GetPivot().Position) or (((v923 and v923.CenterPoint) and (typeof(v922) == "CFrame")) and (v923.CenterPoint.CFrame * v922).Position)) or nil
end
local function fn123(arg1_160)
  local v925 = reg.invokeOk
  if not (v925("RF/EggWorld/AskHatch", arg1_160)) then
    return false
  end
  task.wait(0.35)
  v925 = reg.invokeRemote
  v925("RF/EggWorld/AskFinishHatch", arg1_160)
  return true
end
local function fn124(arg1_161, arg2_62)
  local v926 = ({Biggest = "s", ["Best rarity"] = "r"})[arg2_62] or "v"
  table.sort(arg1_161, function(arg1_162, arg2_63)
    if arg2_62 == "Smallest" then
      return arg1_162.s < arg2_63.s
    end
    if arg1_162[v926] ~= arg2_63[v926] then
      return arg1_162[v926] > arg2_63[v926]
    end
    return arg1_162.v > arg2_63.v
  end)
  return arg1_161
end
do
  local v927 = fn50({name = "Place", mover = true, gap = 8, pri = 4, soft = true, bad = {}})
  tbl41 = tbl39.Pen:Section("Auto place", "egg")
  fn44(tbl41, "Auto place", "place", false, function(arg1_163)
    if not (arg1_163) then
      fn51(v927)
    end
  end)
  local v928 = fn35("pen", tbl41:Text("Pen --"))
  fn46(tbl41, "Place when", "placeWhen", {"Always", "Steal is idle", "Right after a steal", "Only at night"}, "Always")
  fn46(tbl41, "Place first", "placeFirst", {"Best value", "Best rarity", "Biggest", "Smallest"}, "Best value")
  local v929, num32 = fn38(tbl41, {rar = tbl7, sp = "Only these eggs", mut = "Mutations", minV = "Min value /s", list = reg.state.eggSp}), 0
  local onSteal2 = reg.state.onSteal
  reg.state.onSteal = function(arg1_164)
    num32 = os.clock()
    if onSteal2 then
      onSteal2(arg1_164)
    end
  end
  local function fn125()
    local v930 = reg.getPlot
    local v931, v932, v933, tbl109, v934 = v930(), reg.zeroVec, next, {}, reg.state
    vm:yT(tbl109, 0, workspace:FindFirstChild("PlacedEggRenders"), v934.hidden)
    v930 = 0
    for key23, item62 in v933, tbl109, nil do
      v934, key23 = ipairs, vm[53](item62:GetChildren())
      for it1_26, it2_25 in v934(vm:uT(key23)) do
        if it2_25:IsA("Model") then
          it1_26, item62 = reg.localPlayer, it2_25.Name:find(reg.localPlayer.UserId .. "_", 1, true)
          if item62 == 1 then
            local v935, v936 = v930 + 1, v932 + it2_25:GetPivot().Position
            v930, v932 = v935, v936
          else
          end
        else
        end
      end
    end
    if v930 > 0 then
      return v932 / v930
    end
    return (v931 and v931.PetArea) and v931.PetArea.Position
  end
  local qT8 = vm:QT(15, 16, {[58] = reg, [20] = reg, [33] = reg}, vm2, vm5, nil)
  local function fn126(arg1_165)
    local v937 = reg.callModule
    if v937("Egg", "WearEggTool", arg1_165) == false then
      return false
    end
    v937 = os.clock() + 2
    while os.clock() < v937 do
      if fn121() == arg1_165 then
        return true
      end
      if os.clock() > (v937 - 1.3) then
        local v938, v939 = ipairs, (fn24() and fn24():GetChildren()) or {}
        for it1_27, it2_26 in v938(v939) do
          if it2_26:GetAttribute("UID") == arg1_165 then
            local v940, v941 = reg.getHumanoid, reg.getHumanoid
            pcall(reg.getHumanoid().EquipTool, reg.getHumanoid(), it2_26)
          end
        end
      end
      task.wait(0.1)
    end
    return false
  end
  reg.state.wear = fn126
  local function fn127()
    local v942 = reg.slot21
    local placeWhen = v942.placeWhen
    if placeWhen == "Steal is idle" then
      v942 = reg.slot21
      local steal3 = v942.steal
      return if steal3 then v303.empty ~= nil else not steal3
    end
    if placeWhen == "Right after a steal" then
      v942 = os.clock() - num32
      return v942 < 12
    end
    if placeWhen == "Only at night" then
      return fn26() < 14
    end
    return true
  end
  local function fn128()
    local v943, tbl110, v944, num33 = fn25(), {}, pairs, 0
    for it1_28, it2_27 in v944(v943) do
      if type(it2_27) == "table" then
        if it2_27.Placement then
          num33 += 1
        else
          if (v927.bad[it1_28] or 0) < os.clock() then
            local v945 = reg.state
            if not (v945.reserved[it1_28]) then
              local v946 = reg.state
              if not (v946.protect(it1_28, it2_27)) then
                local v947, v948 = fn21(it2_27), reg.slot21
                if v948.place then
                  local v949 = reg.slot63
                  if v949(v929, v947) then
                    v947.uid = it1_28
                    tbl110[#tbl110 + 1] = v947
                  end
                end
              end
            end
          end
        end
      else
      end
    end
    v928(("Pen %d/30  -  %d egg(s) ready to place"):format(num33, #tbl110))
    return num33, tbl110, v943
  end
  local v950 = fn50({name = "PlaceInfo", gap = 2, info = true})
  v950.on = function()
    return fn60("Farm")
  end
  v950.fn = fn128
  v927.want = function()
    local v951, v952, v953 = fn128()
    if v951 >= 30 then
      return
    elseif #v952 == 0 then
      return
    elseif not (fn127()) then
      return
    end
    local tbl111, v954 = {}, reg.slot21
    tbl111.list = fn124(v952, v954.placeFirst)
    tbl111.room = 30 - v951
    tbl111.recs = v953
    return tbl111
  end
  v927.run = function(arg1_166, arg2_64)
    local v955 = fn125()
    if not (v955) then
      return
    end
    local v956 = reg.slot10
    v956("Walking to your pen")
    v956 = reg.vec3
    if not (fn52(v955 + v956(0, 3, 0), arg2_64)) then
      return
    end
    local v957, min, num34, num35 = qT8(arg1_166.recs), math.min(arg1_166.room, #arg1_166.list), 0, 0
    for i21 = 1, min, 1 do
      if not (arg2_64()) then
        break
      end
      v955 = arg1_166.list[i21]
      if fn126(v955.uid) then
        i21 = false
        for i22 = 1, 8, 1 do
          num34 += 1
          v956 = v957[num34]
          if not v956 then
            break
          end
          i22 = reg.invokeOk
          if i22("RF/EggWorld/AskPlaceEgg", {Uid = v955.uid, LocalCFrame = v956[1]}) then
            num35 += 1
            local v958 = reg.slot36
            v958.placed = v958.placed + 1
            i21 = true
            break
          end
        end
        if not i21 then
          v927.bad[v955.uid] = os.clock() + 60
        end
        task.wait(0.25)
      else
        v927.bad[v955.uid] = os.clock() + 20
      end
    end
    v956 = reg.callModule
    v956("Egg", "DoffEggTool")
    if num35 > 0 then
      arg2_64 = reg.slot10
      arg2_64("Placed " .. (num35 .. " egg(s)"), "ok")
    end
  end
  v927.on = function()
    local v959 = reg.slot21
    return v959.place
  end
end
do
  local v960 = fn50({name = "Hatch", gap = 2, bad = {}, info = true})
  tbl9 = tbl39.Pen:Section("Auto hatch", "sparkles")
  fn44(tbl9, "Auto hatch", "hatch", false)
  fn44(tbl9, "Equip best pets", "equip", false)
  local stats = tbl9:Stats({{"Ready now", tbl17.egg}, {"Hatched", tbl17.pet}})
  local v961 = fn38(tbl9, {rar = tbl7, sp = "Only these eggs", mut = "Mutations", minV = "Min value /s", list = reg.state.eggSp})
  v960.on = function()
    local v962 = reg.slot21
    return v962.hatch or fn60("Farm")
  end
  v960.fn = function()
    local tbl112, v963, v964 = {}, pairs, vm[53](fn25())
    for it1_29, it2_28 in v963(vm:uT(v964)) do
      if type(it2_28) == "table" then
        if it2_28.Placement then
          local v965 = reg.callModule
          if v965("Egg", "IsReadyToHatch", it1_29) == true then
            tbl112[#tbl112 + 1] = {it1_29, it2_28}
          end
        end
      end
    end
    v964, v963 = {["Ready now"] = tostring(#tbl112)}
    v963, v964.Hatched = reg.slot36, tostring(reg.slot36.hatched)
    fn36("hs", stats, v964)
    v963 = reg.slot21
    if not (v963.hatch) then
      return
    end
    v964, v963 = ipairs, 0
    for it1_30, it2_29 in v964(tbl112) do
      if v963 >= 4 then
        break
      end
      it1_30 = it2_29[1]
      if (v960.bad[it1_30] or 0) < os.clock() then
        local v966 = reg.slot63
        if v966(v961, fn21(it2_29[2])) then
          local v967 = reg.state
          if v967.protect(it1_30, it2_29[2]) then
          else
            local v968 = v963 + 1
            if fn123(it1_30) then
              local v969 = reg.slot36
              v969.hatched = v969.hatched + 1
            else
              v960.bad[it1_30] = os.clock() + 10
            end
            task.wait(0.2)
            v963 = v968
          end
        else
        end
      else
      end
    end
  end
  local v970 = fn50({name = "Equip", gap = 8})
  v970.on = function()
    local v971 = reg.slot21
    return v971.equip
  end
  v970.fn = function()
    local v972 = reg.invokeRemote
    local v973, v974 = v972("RF/Haul/FetchWearBestStatus")
    if v973 then
      if v974 then
        v972 = reg.invokeRemote
        v972("RF/Haul/WearBest")
      end
    end
  end
end
do
  tbl9 = tbl39.Pen:Section("Keep eggs", "shield")
  fn49(tbl9)
  tbl9:Text("Kept eggs are never placed, hatched or sold, in your bag or your pen.")
  local tbl113, v975 = {}
  local tbl114, num36 = {}, 0
  local function fn129(arg1_167)
    return ((arg1_167 >= 1000) and ("%.0f"):format(arg1_167):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")) or ("%.2f"):format(arg1_167)
  end
  local function fn130(arg1_168)
    local v976 = reg.callModule
    return tonumber(v976("Rec", "WeightKgForScale", arg1_168.AssetCategory, arg1_168.AssetScale))
  end
  local function fn131()
    if (os.clock() - num36) < 2 then
      local v977 = tbl114
      return v977
    end
    local v978
    v978, tbl114 = os.clock(), {}
    num36 = v978
    local tbl115, tbl116 = {}, {}
    for key24, item63 in pairs(fn25()) do
      if type(item63) == "table" then
        tbl115[#tbl115 + 1] = {key24, item63, fn21(item63)}
      end
    end
    table.sort(tbl115, function(arg1_169, arg2_65)
      return arg1_169[3].v > arg2_65[3].v
    end)
    tbl114.rich = {}
    for index64, item64 in ipairs(tbl115) do
      index64, v978 = item64[3], fn130(item64[2])
      local str8 = index64.n .. ((v978 and ("  " .. (fn129(v978) .. " kg"))) or "")
      tbl116[str8] = (tbl116[str8] or 0) + 1
      str8 = if tbl116[str8] > 1 then str8 .. (" (" .. (tbl116[str8] .. ")")) else str8
      local v979 = tbl114
      v979[item64[1]] = str8
      v979 = tbl114
      v979[#v979 + 1] = str8
      v979 = {}
      for index65, item65 in ipairs(index64.m) do
        v979[#v979 + 1] = tbl10[item65] or item65
      end
      local tbl117 = {("x%.2f"):format(index64.s), "<font color=\"#14FF00\">$" .. (fn15(index64.v) .. "/s</font>")}
      if #v979 > 0 then
        tbl117[#tbl117 + 1] = table.concat(v979, " ")
      end
      tbl114.rich[#tbl114.rich + 1] = {v = str8, t = index64.n .. ((item64[2].Placement and "  (pen)") or ""), img = fn99(index64.cat), sub = tbl7[index64.r] or "?", note = table.concat(tbl117, "  \194\183  "), grad = fn23(index64.cat), col = fn22(index64.cat)}
    end
    v978 = tbl114
    return v978
  end
  local fn132, fn133 = function()
    return fn131().rich
  end, function(arg1_170)
    tbl113 = fn32(arg1_170) or {}
  end
  local dropdown = tbl9:Dropdown("Eggs to keep", fn132, {}, fn133, true)
  local v980 = fn50({name = "KeepPrune", gap = 5})
  v980.on = function()
    local v981 = (next(tbl113) ~= nil) and ((os.clock() - now2) > 15)
    return v981
  end
  v980.fn = function()
    local v982, tbl118 = fn131(), {}
    if #v982 == 0 then
      return
    end
    for index66, item66 in ipairs(dropdown.Value or {}) do
      if table.find(v982, item66) then
        tbl118[#tbl118 + 1] = item66
      end
    end
    if #tbl118 < #(dropdown.Value or {}) then
      fn33("keep", function()
        dropdown:Set(tbl118)
      end)
    end
  end
  tbl9:Slider("Min value /s", 0, 0, 0, function(arg1_171)
    v975 = ((arg1_171 > 0) and arg1_171) or nil
    fn37()
  end, "log")
  reg.state.protect = function(arg1_172, arg2_66)
    if next(tbl113) then
      local v983 = tbl113
      if v983[fn131()[arg1_172] or ""] then
        return true
      end
    end
    arg1_172 = ((v975 ~= nil) and (type(arg2_66) == "table")) and (fn21(arg2_66).v >= v975)
    return arg1_172
  end
end
do
  local tbl119 = {Boss = "Fractured", Scrambled = "Scrambled", Enchanted = "Enchanted", Nitro = "Nitro", Spectral = "Spectral"}
  local v984 = fn50({name = "Mutate", mover = true, gap = 1, pri = 3, soft = true, bad = {}})
  tbl41 = tbl39.Mutate:Section("Auto mutate", "wand")
  fn44(tbl41, "Auto mutate", "mutate", false, function(arg1_173)
    if not (arg1_173) then
      fn51(v984)
    end
  end)
  local v985, tbl120 = fn35("mst", tbl41:Text("Off")), {Boss = true, Scrambled = true, Enchanted = true, Nitro = true, Spectral = true}
  local dropdown2 = tbl41:Dropdown("Use items", {"Fractured", "Scrambled", "Enchanted", "Nitro", "Spectral"}, {"Fractured", "Scrambled", "Enchanted", "Nitro", "Spectral"}, function(arg1_174)
    for key25, item67 in next, tbl119, nil do
      tbl120[key25] = table.find(arg1_174, item67) ~= nil
    end
  end, true)
  task.delay(5, function()
    local v986, tbl121 = next, {Nitro = "VenyxSAE_nitro.txt", Spectral = "VenyxSAE_spectral.txt"}
    for key26, item68 in v986, tbl121, nil do
      if reg.alive and not (pcall(isfile, item68) and isfile(item68)) then
        local v987 = tbl120[key26]
        if if v987 then not v987 else next(tbl120) then
          local clone3 = table.clone(dropdown2.Value or {})
          clone3[#clone3 + 1] = tbl119[key26]
          fn33("add" .. key26, function()
            dropdown2:Set(clone3)
          end)
        end
        pcall(writefile, item68, "1")
      end
    end
  end)
  fn46(tbl41, "Mutate first", "mutFirst", {"Best value", "Best rarity", "Biggest"}, "Best value")
  tbl9 = tbl39.Mutate:Section("Mutate filter", "target")
  local v988, tbl122 = fn38(tbl9, {rar = tbl7, sp = "Only these eggs", minV = "Min value /s", list = reg.state.allSp}), {}
  local tbl123, fn134 = {"Rainbow", "Golden", "Silver", "Fractured", "Scrambled", "Enchanted", "Nitro", "Spectral", "Bloom", "Spirit Bloom", "Parasite"}, function(arg1_175)
    tbl122 = fn32(arg1_175, tbl27) or {}
    fn37()
  end
  tbl9:Dropdown("Skip eggs with", tbl123, {}, fn134, true)
  local stats2 = tbl9:Stats({{"Fractured", tbl17.fractured}, {"Scrambled", tbl17.scramble}, {"Enchanted", tbl17.essence}, {"Nitro", tbl17.nitro}, {"Spectral", tbl17.luck}})
  local function fn135()
    local tbl124, tbl125, v989, tbl126, v990, v991 = {}, {Boss = 0, Scrambled = 0, Enchanted = 0, Nitro = 0, Spectral = 0}, ipairs, {}, reg.localPlayer, reg.localPlayer
    vm:yT(tbl126, 0, v990.Character or (fn24()), v991.Character and (fn24()))
    for it1_31, it2_30 in v989(tbl126) do
      for index67, child22 in ipairs((it2_30 and it2_30:GetChildren()) or {}) do
        if child22:IsA("Tool") then
          if child22:GetAttribute("ItemType") == "MutationConsumable" then
            index67 = (child22:GetAttribute("MutationId") or child22:GetAttribute("MutationTemplate")) or "Boss"
            tbl124[index67] = tbl124[index67] or child22
            tbl125[index67] = (tbl125[index67] or 0) + ((tonumber(child22:GetAttribute("Uses")) or tonumber(child22.Name:match("%[X(%d+)%]"))) or 1)
          end
        end
      end
    end
    return tbl124, tbl125
  end
  local v992 = fn50({name = "Bag", gap = 2, info = true})
  v992.on = function()
    return fn60("Farm")
  end
  v992.fn = function()
    local v993, v994 = fn135()
    fn36("bag", stats2, {Fractured = tostring(v994.Boss), Scrambled = tostring(v994.Scrambled), Enchanted = tostring(v994.Enchanted), Nitro = tostring(v994.Nitro), Spectral = tostring(v994.Spectral)})
  end
  local function fn136(arg1_176)
    arg1_176 = arg1_176 or (fn135())
    if not (next(arg1_176)) then
      v985("No mutation items in your bag")
      return
    end
    local tbl127, v995, v996 = {}, pairs, vm[53](fn25())
    for it1_32, it2_31 in v995(vm:uT(v996)) do
      local v997, v998 = (type(it2_31) == "table") and it2_31.Placement
      if v997 then
        local v999 = reg.state
        v998 = not v999.reserved[it1_32]
      else
        v998 = v997
      end
      if v998 then
        local v1000, v1001 = fn21(it2_31), ipairs
        local m, flag25 = v1000.m, false
        for it1_33, it2_32 in v1001(m) do
          flag25 = flag25 or (tbl122[it2_32] == true)
        end
        v997 = reg.slot63
        if v997(v988, v1000) and not flag25 then
          for key27, item69 in next, arg1_176, nil do
            if tbl120[key27] then
              if not (v1000.ms[key27]) then
                if (v984.bad[it1_32 .. key27] or 0) < os.clock() then
                  v1000.uid = it1_32
                  v1000.k = key27
                  v1000.tool = item69
                  tbl127[#tbl127 + 1] = v1000
                  break
                end
              end
            end
          end
        end
      end
    end
    if #tbl127 == 0 then
      v985("Every egg that fits already has these mutations")
      return
    end
    v985(#tbl127 .. " egg(s) can be mutated")
    v996 = reg.slot21
    return fn124(tbl127, v996.mutFirst)[1]
  end
  local v1002 = fn50({name = "MutateInfo", gap = 2, info = true})
  v1002.on = function()
    return fn60("Farm")
  end
  v1002.fn = function()
    fn136()
  end
  v984.want = function()
    local v1003 = fn136(fn135())
    if not (v1003) then
      v984.at = os.clock() + 5
    end
    return v1003
  end
  local tbl128 = {Boss = 10, Scrambled = 10, Nitro = 10, Enchanted = 100, Spectral = 25}
  pcall(function()
    local bossMasteryFlags, scrambleMutationFlags = replicatedStorage.Shared:FindFirstChild("BossMasteryFlags", true), replicatedStorage.Shared:FindFirstChild("ScrambleMutationFlags", true)
    tbl128.Boss = require(bossMasteryFlags).MutationConsumableSuccessPercent:Get()
    tbl128.Nitro = tbl128.Boss
    tbl128.Scrambled = require(scrambleMutationFlags).SuccessPercent:Get()
  end)
  local function fn137(arg1_177, arg2_67)
    local v1004, v1005 = fn122(arg1_177.uid), reg.state
    local eggPos = v1005.eggPos(arg1_177.uid)
    if v1004 then
    else
      if eggPos then
        v985("Going to " .. arg1_177.n)
        v1005 = reg.vec3
        if not (fn52(eggPos + v1005(0, 3, 4), arg2_67)) then
          return
        end
        local v1006 = v1004
        for i23 = 1, 15, 1 do
          v1006 = fn122(arg1_177.uid)
          if v1006 then
            break
          end
          task.wait(0.2)
        end
        v1004 = v1006
      else
      end
    end
    if not (v1004) then
      v984.bad[arg1_177.uid .. arg1_177.k] = os.clock() + 30
      return v985(arg1_177.n .. " is not in your pen")
    end
    eggPos = reg.state
    if not (eggPos.needBody()) then
      return v985("Turning visible to use " .. tbl119[arg1_177.k])
    end
    v985("Mutating " .. (arg1_177.n .. (" with " .. tbl119[arg1_177.k])))
    eggPos = reg.slot10
    eggPos("Mutating " .. arg1_177.n)
    v1005, eggPos = reg.vec3, v1004:GetPivot().Position + reg.vec3(0, 3, 4)
    if not (fn52(eggPos, arg2_67)) then
      return
    end
    eggPos = reg.getHumanoid
    arg2_67 = eggPos()
    if arg2_67 then
      pcall(arg2_67.EquipTool, arg2_67, arg1_177.tool)
    end
    eggPos = reg.localPlayer
    if arg1_177.tool.Parent ~= eggPos.Character then
      pcall(function()
        local v1007
        v1007, arg1_177.tool.Parent = reg.localPlayer, reg.localPlayer.Character
      end)
    end
    task.wait(0.3)
    local now8, v1008 = os.clock(), reg.invokeRemote
    local v1009, v1010 = v1008("RF/BossMastery/AskUseMutationConsumable", arg1_177.uid)
    if (v1009 and (type(v1010) == "table")) and v1010.Success then
      if v1010.Mutated then
        v985(arg1_177.n .. (" got " .. tbl119[arg1_177.k]))
        fn34("Mutated", arg1_177.n .. (" got " .. tbl119[arg1_177.k]), "ok")
      else
        v985(("%s roll missed on %s (%s%% chance)"):format(tbl119[arg1_177.k], arg1_177.n, tostring(tbl128[arg1_177.k] or "?")))
      end
    else
      v984.bad[arg1_177.uid .. arg1_177.k] = os.clock() + 600
      v985(("%s refused on %s: %s"):format(tbl119[arg1_177.k], arg1_177.n, ((type(v1010) == "table") and tostring(v1010.Message or "no reason")) or "no answer"))
    end
    task.wait(math.max(0, 1 - (os.clock() - now8)))
    if arg2_67 then
      pcall(arg2_67.UnequipTools, arg2_67)
    end
    return true
  end
  v984.run = function(arg1_178, arg2_68)
    local v1011
    while arg1_178 and (arg2_68()) do
      v1011 = fn137(arg1_178, arg2_68)
      arg1_178 = (v1011 and arg2_68()) and fn136()
    end
    return v1011
  end
  v984.on = function()
    local v1012 = reg.slot21
    return v1012.mutate
  end
end
do
  local v1013 = fn50({name = "Treadmill", mover = true, gap = 2, pri = 9, soft = true})
  tbl9 = tbl39.Treadmill:Section("Treadmill", "gauge")
  fn44(tbl9, "Auto treadmill", "tread", false, function(arg1_179)
    if not (arg1_179) then
      fn51(v1013)
    end
  end)
  fn44(reg.state.adminSec, "Admin treadmill", "adminTread", false, function(arg1_180)
    if not (arg1_180) then
      fn51(v1013)
    end
  end)
  fn44(tbl9, "Auto upgrade treadmill", "upTread", false)
  local stats3, v1014, v1015, v1016, v1017 = tbl9:Stats({{"Speed power", "rbxassetid://78137530993637"}, {"Cash", tbl17.money}}), 0, 0, 0
  local function fn138()
    v1014 = os.clock()
    local v1018 = reg.state
    v1018.treadAt = v1014
    v1018 = reg.state
    if v1018.onAdmin then
      v1016 = 0
    end
  end
  local v1019 = fn50({name = "SpeedInfo", gap = 1, info = true})
  v1019.on = function()
    return true
  end
  v1019.fn = function()
    local v1020 = reg.slot59
    local v1021 = v1020()
    v1020 = v1021 and tonumber(v1021.Money)
    fn36("tst", stats3, {["Speed power"] = (v1021 and fn15(v1021.SpeedPower)) or "--", Cash = (v1020 and ("$" .. fn15(v1020))) or "--"})
    v1021 = reg.localPlayer
    v1020 = v1021:FindFirstChild("leaderstats")
    v1020 = v1020 and (v1020:FindFirstChild("Speed"))
    v1020 = v1020 and tonumber(v1020.Value)
    if v1020 then
      if v1017 then
        if v1020 > v1017 then
          fn138()
        end
      end
    end
    v1017 = v1020
  end
  local function fn139()
    local adminTreadmill, v1022 = workspace:FindFirstChild("AdminTreadmill"), reg.slot21
    local v1023 = v1022.adminTread and (adminTreadmill or fn54())
    if v1023 then
      v1022 = adminTreadmill and (adminTreadmill:FindFirstChild("Pad") or adminTreadmill:FindFirstChildWhichIsA("BasePart", true))
      local v1024, v1025 = v1022 and v1022.Position
      if v1024 then
        v1025 = v1024
      else
        local v1026 = reg.vec3
        v1025 = (v1026(540.05, 68.6, -369.7))
      end
      return v1025, true
    end
    v1023 = reg.getPlot
    v1022, adminTreadmill = v1023(), reg.slot21
    local v1027, v1028 = (adminTreadmill.tread and v1022) and v1022.PlotFolder:FindFirstChild("TreadmillBottom")
    if v1027 then
      v1023 = reg.vec3
      v1028 = v1023(v1027.Position.X, 72, v1027.Position.Z)
    else
      v1028 = v1027
    end
    return v1028
  end
  local rETreadmillSpeedGained, rETreadmillAssignedBeltShift = networking:FindFirstChild("RE/Treadmill/SpeedGained"), networking:FindFirstChild("RE/Treadmill/AssignedBeltShifted")
  if rETreadmillSpeedGained then
    fn2(rETreadmillSpeedGained.OnClientEvent, fn138)
  end
  if rETreadmillAssignedBeltShift then
    fn2(rETreadmillAssignedBeltShift.OnClientEvent, function(arg1_181, arg2_69, arg3_22, arg4_11, arg5_10, arg6_6)
      arg2_69 = reg.state
      arg3_22, arg4_11 = arg2_69.onAdmin, reg.state
      arg4_11.onAdmin = (arg1_181 ~= nil) and (arg6_6 == true)
      if arg3_22 then
        arg6_6 = reg.state
        if not (arg6_6.onAdmin) then
          arg4_11 = reg.slot21
          if not (arg4_11.tread) then
            if not (fn54()) then
              task.spawn(reg.invokeRemote, "RF/Treadmill/AskDoff")
            end
          end
        end
      end
    end)
  end
  v1013.want = function()
    local v1029 = reg.getRoot
    local v1030, v1031, v1032 = v1029(), fn139()
    if v1030 then
      if not (v1031) then
        return
      end
    else
      return
    end
    if v1032 then
      v1029 = reg.state
      local onAdmin2 = v1029.onAdmin
      local v1033 = ((if onAdmin2 then (os.clock() - v1014) > 5 else not onAdmin2) and v1031) or nil
      return v1033
    end
    if v1030.Anchored then
      return
    elseif (os.clock() - v1014) < 3 then
      return
    end
    return v1031
  end
  v1013.run = function(arg1_182, arg2_70)
    local v1034, v1035 = fn139()
    if v1035 then
      local v1036 = reg.state
      if v1036.onAdmin then
        v1016 += 1
        if v1016 >= 3 then
          local v1037 = reg.state
          if v1037.respawn then
            v1016 = 0
            local v1038 = reg.slot10
            v1038("Admin treadmill will not take you, respawning", "warn")
            v1038 = reg.state
            return v1038.respawn()
          end
        end
        local v1039 = reg.slot10
        v1039("Admin treadmill speed is not going up, getting back on", "warn")
        if not (reg.slot14(arg2_70)) then
          return
        end
      end
    end
    local v1040 = reg.slot10
    v1040((v1035 and "Going to the admin treadmill") or "Going to the treadmill")
    v1040 = reg.vec3
    if not (fn52(arg1_182 + v1040(0, 1, 0), arg2_70)) then
      return
    end
    arg1_182, v1040 = reg.state, reg.state
    arg1_182.hold = (v1040.hold or 0) + 1
    arg1_182 = os.clock() + ((v1035 and 2.5) or 3)
    v1014 = 0
    v1040 = false
    while ((os.clock() < arg1_182) and (arg2_70())) and not v1040 do
      if v1035 then
        local v1041 = reg.state
        v1040 = v1041.onAdmin == true
        if v1040 then
        else
          if os.clock() > (arg1_182 - 0.1) then
            v1041 = reg.invokeRemote
            local v1042, v1043, v1044 = v1041("RF/Treadmill/AskWearStill")
            local v1045, v1046, v1047 = ((v1042 and ((v1043 == true) or ((type(v1044) == "string") and v1044:lower():find("already")))) and true) or false, reg.state, reg.state
            v1046.onAdmin = v1047.onAdmin or v1045
            v1040 = v1045
          else
          end
        end
        if not v1040 then
          v1041 = reg.heartbeatWait
          v1041()
        end
      else
        local v1048 = reg.invokeRemote
        local v1049, v1050, v1051 = v1048("RF/Treadmill/AskWearStill")
        v1048 = reg.getRoot
        local v1052 = v1048()
        v1048 = (v1052 and v1052.Anchored) or (v1049 and ((v1050 == true) or ((type(v1051) == "string") and v1051:lower():find("already"))))
        v1040 = v1048 or ((os.clock() - v1014) < 3)
        if not v1040 then
          task.wait(0.3)
        end
      end
    end
    arg1_182 = reg.state
    arg1_182.hold = arg1_182.hold - 1
    if not (arg2_70()) then
      arg1_182 = reg.slot14
      return arg1_182(function()
        return true
      end)
    end
    if v1040 then
      v1015 = 0
      if v1035 then
        v1014 = os.clock()
      end
      arg1_182 = reg.slot10
      return arg1_182((v1035 and "Training on the admin treadmill") or "Training speed", "ok")
    end
    v1015 += 1
    if v1015 >= 2 then
      v1035 = reg.state
      if v1035.respawn then
        v1015 = 0
        arg2_70 = reg.slot10
        arg2_70("Treadmill will not take you, respawning", "warn")
        arg1_182 = reg.state
        arg1_182.respawn()
      end
    end
  end
  v1013.on = function()
    local v1053 = reg.slot21
    local tread, v1054 = v1053.tread
    if tread then
      v1054 = tread
    else
      v1053 = reg.slot21
      v1054 = v1053.adminTread and (fn54() or (workspace:FindFirstChild("AdminTreadmill") ~= nil))
    end
    return v1054
  end
  rETreadmillAssignedBeltShift = tbl39.Treadmill:Section("Progress", "crown")
  fn44(rETreadmillAssignedBeltShift, "Auto upgrade base", "upBase", false)
  fn44(rETreadmillAssignedBeltShift, "Auto buy trails", "trails", false)
  fn44(rETreadmillAssignedBeltShift, "Auto claim offline cash", "claimCash", false)
  fn44(rETreadmillAssignedBeltShift, "Auto claim index rewards", "claimIndex", false)
  local v1055 = fn50({name = "Progress", gap = 5, fail = {}})
  v1055.on = function()
    local v1056 = reg.slot21
    local claimCash, v1057 = v1056.claimCash
    if claimCash then
      v1057 = claimCash
    else
      v1056 = reg.slot21
      v1057 = v1056.claimIndex
    end
    v1056 = nil
    if v1057 then
      v1056 = v1057
    else
      claimCash = reg.slot21
      v1056 = claimCash.upBase
    end
    v1057 = nil
    if v1056 then
      v1057 = v1056
    else
      claimCash = reg.slot21
      v1057 = claimCash.upTread
    end
    v1056 = nil
    if v1057 then
      v1056 = v1057
    else
      claimCash = reg.slot21
      v1056 = claimCash.trails
    end
    return v1056
  end
  local tbl129 = {{"LimitedEgg", "GravityDisruptor", "LimitedEgg", "MechaReroll"}, {"BrainrotEgg", "BeeLauncher", "BrainrotEgg"}, {"MonsterEgg", "BeeLauncher", "MonsterEgg", "Mecha"}}
  v1055.fn = function()
    local v1058 = reg.slot59
    local v1059 = v1058()
    if not (v1059) then
      return
    end
    local v1060, v1061 = tonumber(v1059.Money) or 0, reg.slot21
    if v1061.claimCash then
      v1058 = reg.invokeRemote
      local v1062, v1063 = v1058("RF/AwayEarnings/FetchSummary")
      if v1062 then
        if type(v1063) == "table" then
          local num37 = tonumber(v1063.ClaimableAmount)
          if num37 then
            if num37 > 0 then
              local v1064 = reg.invokeRemote
              v1064("RF/AwayEarnings/AskCollect", {Kind = "Claim"})
            end
          end
        end
      end
    end
    v1058 = reg.slot21
    if v1058.claimIndex then
      local v1065, v1066, v1067 = ((type(v1059.Index) == "table") and v1059.Index) or {}, ((type(v1059.IndexClaimedCategories) == "table") and v1059.IndexClaimedCategories) or {}, next
      for key28, item70 in v1067, v1065, nil do
        if item70 == true then
          if v1066[key28] ~= true then
            v1061 = reg.invokeRemote
            v1061("RF/Codex/AskRedeemAll")
            break
          end
        end
      end
      v1067, v1066 = ((type(v1059.GearInventory) == "table") and v1059.GearInventory) or {}, ipairs
      for it1_34, it2_33 in v1066(tbl129) do
        if ((v1055.fail[it2_33[1]] or 0) < os.clock()) and ((tonumber(v1067[it2_33[2]]) or 0) <= 0) then
          it1_34 = replicatedStorage.Data:FindFirstChild(it2_33[3])
          local ok11, v1068 = pcall(require, it1_34)
          local flag26, flag27 = true, false
          if ok11 then
            if type(v1068) == "table" then
              local v1069, tbl130, entries, v1070 = ipairs, {}, v1068.Entries, it2_33[4] and (v1068[it2_33[4] .. "Entries"] or ((type(v1068[it2_33[4]]) == "table") and v1068[it2_33[4]].Entries))
              vm:yT(tbl130, 0, entries, v1070)
              v1070, entries = flag27, flag26
              for it1_35, it2_34 in v1069(tbl130) do
                for index68, item71 in ipairs(((type(it2_34) == "table") and it2_34) or {}) do
                  v1070, entries = true, if v1065[item71.AssetId] then entries else false
                end
              end
              if v1070 then
                if entries then
                  v1055.fail[it2_33[1]] = os.clock() + 60
                  tbl130 = reg.invokeRemote
                  tbl130("RF/Codex/AskRedeemLimitedEgg", it2_33[1])
                end
              end
            end
          end
        end
      end
    end
    v1058 = reg.slot21
    if v1058.upBase then
      v1061 = reg.modules
      local bases, v1071 = v1061.Bases, tonumber(v1059.BaseUpgradeLevel) or 1
      local v1072, v1073 = (bases and bases.BASES) and bases.BASES[v1071 + 1], reg.callModule
      bases = v1073("Bases", "GetMaxBaseLevel")
      if v1072 then
        if v1060 >= (tonumber(v1072.Cost) or math.huge) then
          if bases then
            if v1071 < bases then
              fn4("RE/Homestead/AskBaseTierRaise")
              return
            end
          else
            fn4("RE/Homestead/AskBaseTierRaise")
            return
          end
        end
      end
    end
    v1058 = reg.slot21
    if v1058.upTread then
      v1061 = reg.callModule
      local v1074 = v1061("Tread", "GetByUpgradeLevel", (tonumber(v1059.TreadmillUpgradeLevel) or 0) + 1)
      if type(v1074) == "table" then
        if v1074._id then
          if v1060 >= (tonumber(v1074.Price) or math.huge) then
            local v1075 = reg.invokeRemote
            v1075("RF/Treadmill/AskTierRaise", v1074._id)
            return
          end
        end
      end
    end
    v1058 = reg.slot21
    if v1058.trails then
      local v1076, v1077, v1078 = ((type(v1059.TrailInventory) == "table") and v1059.TrailInventory) or {}, next, reg.modules
      local trails, v1079 = v1078.Trails
      if trails then
        v1061 = reg.modules
        v1079 = v1061.Trails.Directory
      else
        v1079 = trails
      end
      trails = nil
      for key29, item72 in v1077, v1079 or {}, nil do
        v1078 = (type(item72) == "table") and tonumber(item72.Price)
        key29 = ((type(item72) == "table") and item72._id) or key29
        trails = if v1078 then if v1078 <= v1060 then if v1076[key29] ~= true then if v1055.fail[key29] then trails else if trails then if v1078 < trails[2] then {key29, v1078} else trails else {key29, v1078} else trails else trails else trails
      end
      if trails then
        v1079 = reg.invokeOk
        if not (v1079("RF/Trailwear/AskPurchase", trails[1])) then
          v1055.fail[trails[1]] = true
        end
      end
    end
  end
end
reg.slot61 = function(arg1_183, arg2_71)
  local v1080, v1081, tbl131, tbl132 = fn120(arg1_183), fn121(), {}, {}
  for key30, item73 in next, ((type(arg1_183.Inventory) == "table") and arg1_183.Inventory) or {}, nil do
    if type(item73) == "table" then
      if not (item73.InFuse) then
        if not (item73.IsFavorite) then
          if not (v1080[key30]) then
            local v1082 = fn21(item73)
            v1082.uid = key30
            tbl131[#tbl131 + 1] = v1082
          end
        end
      end
    end
  end
  v1080, arg1_183 = pairs, (arg2_71 and {}) or fn25()
  for it1_36, it2_35 in v1080(arg1_183) do
    if type(it2_35) == "table" then
      if not (it2_35.Placement) then
        if it1_36 ~= v1081 then
          arg2_71 = reg.state
          if not (arg2_71.reserved[it1_36]) then
            local v1083 = reg.state
            if not (v1083.protect(it1_36, it2_35)) then
              local v1084 = fn21(it2_35)
              v1084.uid = it1_36
              tbl132[#tbl132 + 1] = v1084
            end
          end
        end
      end
    end
  end
  return tbl131, tbl132
end
do
  local v1085 = fn50({name = "Sell", gap = 5, info = true})
  local function fn140(arg1_184, arg2_72, arg3_23, arg4_12, arg5_11, arg6_7)
    local section2 = tbl39.Sell:Section(arg1_184, arg2_72, arg4_12)
    fn44(section2, "Auto sell " .. arg1_184:lower(), arg3_23, false)
    arg2_72, arg4_12, arg1_184 = section2:Text("--"), {rar = arg5_11 or {"Common", "Uncommon", "Rare"}, rarName = "Sell rarities", no = "Never sell", mut = "Only mutations", maxV = "Only below /s"}
    if arg6_7 then
      arg1_184 = arg6_7
    else
      arg5_11 = reg.state
      arg1_184 = arg5_11.allSp
    end
    arg4_12.list = arg1_184
    arg1_184 = fn38(section2, arg4_12)
    fn44(section2, "Keep mutated", arg3_23 .. "Keep", true)
    return arg1_184, arg2_72, section2
  end
  local v1086, v1087, v1088 = fn140("Pets", "coins", "sellPets", 1)
  local v1089, v1090, v1091 = fn140("Eggs", "egg", "sellEggs", 2)
  local function fn141(arg1_185, arg2_73, arg3_24)
    local tbl133 = {}
    if not (arg2_73.rar) then
      return tbl133
    end
    local v1092 = ipairs
    for it1_37, it2_36 in v1092(arg1_185) do
      it1_37 = reg.slot63
      if it1_37(arg2_73, it2_36) then
        local v1093 = reg.slot21
        if v1093[arg3_24] then
          if not (#it2_36.m > 0) then
            tbl133[#tbl133 + 1] = it2_36.uid
          end
        else
          tbl133[#tbl133 + 1] = it2_36.uid
        end
      end
    end
    return tbl133
  end
  local function fn142(arg1_186)
    local v1094 = reg.slot59
    local v1095 = v1094()
    if not (v1095) then
      return 0, 0
    end
    v1094 = reg.slot61
    local v1096, v1097 = v1094(v1095)
    v1094, v1095 = fn141(v1096, v1086, "sellPetsKeep"), fn141(v1097, v1089, "sellEggsKeep")
    local count = #v1094
    local count2 = #v1095
    fn33("sellTx", function()
      v1087:Set(count .. " pet(s) match")
      v1090:Set(count2 .. " egg(s) match")
    end)
    if arg1_186 then
      if arg1_186 == "pets" then
        v1095 = {}
      else
        v1094 = {}
      end
    else
      v1097, v1096 = reg.slot21, reg.slot21
      v1094, v1095 = if v1097.sellPets then v1094 else {}, if v1096.sellEggs then v1095 else {}
    end
    for i24 = 1, math.max(#v1094, #v1095), 50 do
      fn4("RE/PetSatchel/SellSelection", {Eggs = {table.unpack(v1095, i24, math.min(i24 + 49, #v1095))}, Assets = {table.unpack(v1094, i24, math.min(i24 + 49, #v1094))}})
      task.wait(0.3)
    end
    return #v1094, #v1095
  end
  v1085.on = function()
    local v1098 = reg.slot21
    local sellPets, v1099 = v1098.sellPets
    if sellPets then
      v1099 = sellPets
    else
      v1098 = reg.slot21
      v1099 = v1098.sellEggs
    end
    return v1099 or (fn60("Farm"))
  end
  v1085.fn = fn142
  v1088:Button("Sell matching pets now", "Sell", function()
    task.spawn(function()
      local v1100 = fn142("pets")
      fn34("Sold", v1100 .. " pet(s)", ((v1100 > 0) and "ok") or "info")
    end)
  end, "gold")
  v1091:Button("Sell matching eggs now", "Sell", function()
    task.spawn(function()
      local v1101, v1102 = fn142("eggs")
      fn34("Sold", v1102 .. " egg(s)", ((v1102 > 0) and "ok") or "info")
    end)
  end, "gold")
end
do
  local v1103 = fn50({name = "Favorite", gap = 3, pend = {}})
  tbl41 = tbl39.Sell:Section("Favorite", "star", 2)
  fn44(tbl41, "Auto favorite", "fav", false)
  fn46(tbl41, "Match", "favMatch", {"All picked rules", "Any picked rule"}, "All picked rules")
  local v1104, tbl134 = fn38(tbl41, {rar = {}, mut = "Mutations", minV = "Min value /s"}), {}
  local function fn143(arg1_187)
    tbl134 = fn32(arg1_187) or {}
  end
  tbl41:Dropdown("Always favorite", fn28, {}, fn143, true)
  fn44(tbl41, "Favorite equipped", "favEq", false)
  fn44(tbl41, "Unfavorite pets not matching", "unfav", false)
  v1103.on = function()
    local v1105 = reg.slot21
    local fav, v1106 = v1105.fav
    if fav then
      v1106 = fav
    else
      v1105 = reg.slot21
      v1106 = v1105.favEq
    end
    fav = nil
    if v1106 then
      fav = v1106
    else
      v1105 = reg.slot21
      fav = v1105.unfav
    end
    return fav
  end
  local function fn144(arg1_188)
    local v1107, v1108, v1109 = tbl134, arg1_188.n
    if v1108 then
      v1109 = v1108
    else
      local v1110 = reg.getDisplayName
      v1109 = v1110(arg1_188.cat)
    end
    if v1107[v1109] then
      return true
    end
    v1107, v1108 = 0, 0
    if v1104.rar then
      v1107, v1108 = 1, v1108 + ((v1104.rar[arg1_188.r] and 1) or 0)
    else
    end
    if v1104.mut then
      v1109 = reg.slot63
      v1107, v1108 = v1107 + 1, v1108 + ((v1109({mut = v1104.mut}, arg1_188) and 1) or 0)
    else
    end
    v1109 = v1104.minV
    if v1109 then
      if v1109 > 0 then
        local v1111, v1112 = v1107 + 1, v1108 + (((arg1_188.v >= v1104.minV) and 1) or 0)
        v1107, v1108 = v1111, v1112
      else
      end
    else
    end
    v1109, arg1_188 = v1107 > 0
    if v1109 then
      local v1113 = reg.slot21
      arg1_188 = ((v1113.favMatch == "Any picked rule") and (v1108 > 0)) or (v1108 == v1107)
    else
      arg1_188 = v1109
    end
    return arg1_188
  end
  v1103.fn = function()
    local v1114 = reg.slot59
    local v1115 = v1114()
    if not (v1115) then
      return
    end
    local v1116, v1117, v1118, v1119, num38 = fn120(v1115), ((v1104.rar or v1104.mut) or ((v1104.minV or 0) > 0)) or (next(tbl134) ~= nil), next, ((type(v1115.Inventory) == "table") and v1115.Inventory) or {}, 0
    for key31, item74 in v1118, v1119, nil do
      if num38 >= 25 then
        break
      end
      if type(item74) == "table" then
        if (v1103.pend[key31] or 0) < os.clock() then
          v1114 = reg.slot21
          local v1120, v1121 = v1114.favEq and v1116[key31]
          if v1120 then
            v1121 = v1120
          else
            v1115 = reg.slot21
            local fav2, v1122 = v1115.fav
            if fav2 then
              v1122 = fav2
            else
              local v1123 = reg.slot21
              v1122 = v1123.unfav
            end
            v1121 = v1122 and fn144(fn21(item74))
          end
          v1120 = nil
          local isFavorite = item74.IsFavorite
          local flag28, v1124 = not isFavorite
          if isFavorite then
            v1124 = flag28
          else
            local v1125 = reg.slot21
            local v1126 = v1125.favEq and v1116[key31]
            if v1126 then
              v1124 = v1126
            else
              v1125 = reg.slot21
              v1124 = v1125.fav and v1121
            end
          end
          if v1124 then
            v1120 = true
          else
            if item74.IsFavorite then
              isFavorite = reg.slot21
              v1120 = if isFavorite.unfav then if v1117 then if v1121 then v1120 else false else v1120 else v1120
            else
            end
          end
          if v1120 ~= nil then
            v1124 = num38 + 1
            v1103.pend[key31] = os.clock() + 4
            fn4("RE/PetSatchel/WriteFavourite", key31, v1120)
            task.wait(0.12)
            num38 = v1124
          else
          end
        else
        end
      else
      end
    end
  end
end
do
  local v1127 = fn50({name = "Fuse", gap = 2, bad = {}, info = true})
  reg.slot62 = v1127
  tbl9 = tbl39.Fuse:Section("Fuse machine", "flame")
  fn44(tbl9, "Auto fuse", "fuse", false)
  local v1128 = fn35("fuseTx", tbl9:Text("--"))
  reg.slot66 = v1128
  fn46(tbl9, "Fuse first", "fuseFirst", {"Lowest rarity", "Highest rarity", "Most copies", "Lowest value"}, "Lowest rarity")
  fn46(tbl9, "Use pets", "fuseUse", {"Lowest value first", "Highest value first"}, "Lowest value first")
  fn44(tbl9, "Skip mutated", "fuseKeep", true)
  fn44(tbl9, "Eject odd pets", "fuseEject", true)
  local v1129, tbl135 = fn38(tbl39.Fuse:Section("Fuse filter", "target"), {rar = {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic"}, sp = "Only these pets", no = "Never fuse", maxV = "Only below /s", list = reg.state.allSp}), {["Lowest rarity"] = function(arg1_189)
    return (-arg1_189.r * 1000) + #arg1_189
  end, ["Highest rarity"] = function(arg1_190)
    return (arg1_190.r * 1000) + #arg1_190
  end, ["Most copies"] = function(arg1_191)
    return #arg1_191
  end, ["Lowest value"] = function(arg1_192)
    return -arg1_192.v
  end}
  reg.slot64 = v1129
  reg.slot65 = tbl135
  reg.slot62.on = function()
    local v1130 = reg.slot21
    return v1130.fuse or fn60("Farm")
  end
  reg.slot62.fn = vm:QT(17, 18, {[59] = reg, [21] = reg, [28] = reg, [60] = reg, [61] = reg, [62] = reg, [63] = reg, [64] = reg, [65] = reg, [66] = reg, [67] = reg, [30] = reg, [68] = reg}, vm2, vm5, nil)
end
do
  tbl41 = tbl39.Fuse:Section("Fuse predictor", "sparkles")
  fn49(tbl41)
  local stats4, v1131, v1132 = tbl41:Stats({{"Slots", tbl17.pet}, {"Status", tbl17.tread}, {"Likely size", tbl17.x2}, {"Chance", tbl17.luck}, {"Value", tbl17.money}, {"Best case", tbl17.medal}}), {{0.85, 1.05, 2000}, {1.45, 1.55, 250}, {1.9, 2.1, 125}, {2.85, 3.15, 62.5}, {3.8, 4.2, 31.25}, {0.3, 0.45, 18}, {0.1, 0.2, 5}, {5.8, 6.2, 15.625}, {9.5, 12.5, 3}, {12, 17, 0.05}, {20, 35, 0.0001}}
  local function fn145()
    if v1132 then
      local v1133 = v1132
      return v1133
    end
    v1132 = v1131
    pcall(function()
      local v1134, v1135, v1136, v1137 = next, reg.modules, debug.getupvalues(reg.modules.Rec.DrawAssetScale)
      for key32, item75 in v1134, v1136, v1137 do
        if (((type(item75) == "table") and (type(item75[1]) == "table")) and item75[1].min) and item75[1].weight then
          v1132 = {}
          for index69, item76 in ipairs(item75) do
            key32 = v1132
            key32[index69] = {item76.min, item76.max, item76.weight}
          end
        end
      end
    end)
    local v1138 = v1132
    return v1138
  end
  local v1139 = fn50({name = "FusePred", gap = 2, info = true})
  v1139.on = function()
    return fn60("Farm")
  end
  v1139.fn = function()
    local v1140 = reg.slot59
    local v1141 = v1140()
    if not (v1141) then
      return
    end
    local v1142, tbl136, tbl137 = ((type(v1141.Inventory) == "table") and v1141.Inventory) or {}, {}, {}
    for index70, item77 in ipairs(((type(v1141.FusionSlots) == "table") and v1141.FusionSlots) or {}) do
      v1140 = (type(item77) == "string") and v1142[item77]
      if type(v1140) == "table" then
        tbl136[#tbl136 + 1] = v1140
      end
    end
    local tbl138, v1143, v1144 = {Slots = #tbl136 .. " / 3", Status = "Waiting for pets", ["Likely size"] = "--", Chance = "--", Value = "--", ["Best case"] = "--"}, (#tbl136 < 3) and not v1141.FusionLocked
    if v1143 then
      v1142 = reg.state
      v1144 = v1142.fuseNext
    else
      v1144 = v1143
    end
    tbl136 = v1144 or tbl136
    for index71, item78 in ipairs(tbl136) do
      tbl137[#tbl137 + 1] = tonumber(item78.Scale) or 1
    end
    if v1141.FusionEggReward then
      tbl138.Status = "Done, claim the egg"
    elseif v1141.FusionLocked then
      v1140 = (tonumber(v1141.FusionDuration) or 0) - fn6()
      tbl138.Status = ((v1140 > 0) and ("Fusing %dm %02ds"):format(v1140 // 60, v1140 % 60)) or "Fusing"
    end
    if #tbl136 == 3 then
      local v1145, tbl139, v1146, v1147, num39 = ((tbl137[1] + tbl137[2]) + tbl137[3]) / 3, {}, ipairs, vm[53](fn145()), 0
      for it1_38, it2_37 in v1146(vm:uT(v1147)) do
        v1142, v1141 = pcall(function()
          local v1148 = reg.modules
          return v1148.Fuse.BandWeightBias(tbl137, it2_37[1], it2_37[2])
        end)
        v1141 = (v1142 and tonumber(v1141)) or math.exp((math.log(v1145, 2) * math.log((it2_37[1] + it2_37[2]) / 2, 2)) * 0.6)
        it1_38 = it2_37[3] * v1141
        num39 += it1_38
        tbl139[#tbl139 + 1] = {it2_37[1], it2_37[2], it1_38}
      end
      table.sort(tbl139, function(arg1_193, arg2_74)
        return arg1_193[3] > arg2_74[3]
      end)
      v1145 = tbl139[1]
      for index72, item79 in ipairs(tbl139) do
        v1145 = if item79[2] > v1145[2] then if (item79[3] / num39) > 1e-06 then item79 else v1145 else v1145
      end
      v1146, v1140, v1143 = ipairs, 1
      for it1_39, it2_38 in v1146(tbl136) do
        v1147, it1_39 = ipairs, vm[53](fn18(it2_38))
        for it1_40, it2_39 in v1147(vm:uT(it1_39)) do
          it2_38, it1_40 = pcall(function()
            local v1149 = reg.modules
            return v1149.Mut.EarningsFor({it2_39})
          end)
          if it2_38 then
            if tonumber(it1_40) then
              if it1_40 > v1140 then
                v1140, v1143 = it1_40, it2_39
              else
              end
            else
            end
          else
          end
        end
      end
      v1147, v1146 = tbl136[1].Category, tbl139[1]
      tbl138["Likely size"] = ("x%.2f - x%.2f"):format(v1146[1], v1146[2])
      tbl138.Chance = ("%.1f%%"):format((v1146[3] / num39) * 100)
      tbl138.Value = "$" .. (fn15(fn20(v1147, v1146[1], {v1143})) .. (" - " .. fn15(fn20(v1147, v1146[2], {v1143}))))
      tbl138["Best case"] = ("x%.0f  $%s"):format(v1145[2], fn15(fn20(v1147, v1145[2], {v1143})))
      if tbl138.Status == "Waiting for pets" then
        tbl139 = nil
        tbl139, tbl138.Status = reg.getDisplayName, ((v1144 and "Next: ") or "") .. (((v1143 and ((tbl10[v1143] or v1143) .. " ")) or "") .. reg.getDisplayName(v1147))
      end
    end
    fn36("fpred", stats4, tbl138)
  end
end
do
  reg.slot21.eggShow = "All"
  fn49 = tbl39["Egg Predictor"]:Section("Egg showcase", "egg", 4)
  local v1150, v1151
  fn46(fn49, "Sort eggs", "eggSort", {"Value", "Rarity", "Weight", "Time left"}, "Value")
  local tbl140, tbl141 = {}, {"Boss", "Scrambled", "Enchanted", "Nitro", "Spectral"}
  for index73, item80 in ipairs(tbl141) do
    tbl140[#tbl140 + 1] = tbl10[item80]
    tbl140[tbl10[item80]] = item80
  end
  fn46(fn49, "Calculate mutations", "eggMut", table.clone(tbl140), {}, function()
    if v1151 then
      task.spawn(v1151.fn)
    end
  end, true, "Cards show the value with these mutations added")
  local function fn146(arg1_194)
    local e2, tbl142, v1152 = arg1_194.e, {}, ipairs
    for it1_41, it2_40 in v1152(tbl140) do
      it1_41 = reg.slot21
      if table.find(it1_41.eggMut, it2_40) then
        if not (e2.ms[tbl140[it2_40]]) then
          tbl142[#tbl142 + 1] = tbl140[it2_40]
        end
      end
    end
    if #tbl142 == 0 then
      return
    end
    v1152 = table.concat(tbl142, ",")
    if not (arg1_194[v1152]) then
      local clone4 = table.clone(e2.m)
      table.move(tbl142, 1, #tbl142, #clone4 + 1, clone4)
      arg1_194[v1152] = fn20(e2.cat, e2.s, clone4)
    end
    return arg1_194[v1152], v1152, tbl142
  end
  local v1153
  fn44(fn49, "Preview card", "eggCard", true, function(arg1_195)
    if v1153 then
      v1153:Card(arg1_195)
    end
  end)
  v1153 = fn49:Showcase(3, {{"All", "grid"}, {"Ready", "sparkles"}, {"Growing", "clock"}, {"In bag", "egg"}}, function(arg1_196)
    local v1154 = reg.slot21
    v1154.eggShow = arg1_196
    if v1151 then
      task.spawn(v1151.fn)
    end
  end, function(arg1_197)
    task.spawn(function()
      if arg1_197.kind == "Ready" then
        if fn123(arg1_197.id) then
          fn34("Hatched", arg1_197.title, "ok")
        end
      elseif arg1_197.kind == "In bag" then
        local v1155 = reg.state
        v1155.wear(arg1_197.id)
      else
        local v1156 = reg.state
        v1150 = v1156.eggPos(arg1_197.id)
      end
    end)
  end)
  v1153:Card(reg.slot21.eggCard)
  local v1157 = fn50({name = "GoTo", mover = true, gap = 0.5, pri = 0, soft = true})
  v1157.on = function()
    local v1158 = v1150
    return v1158 ~= nil
  end
  v1157.want = function()
    local v1159 = v1150
    return v1159
  end
  v1157.run = function(arg1_198, arg2_75)
    local v1160 = reg.vec3
    fn52(arg1_198 + v1160(0, 3, 4), arg2_75)
    v1150 = nil
  end
  local tbl143 = {Ready = "Hatch now", ["In bag"] = "Hold egg", Growing = "Go to egg"}
  v1151 = fn50({name = "Eggs", gap = 1})
  v1151.on = function()
    return fn60("Steal")
  end
  local tbl144 = {}
  v1151.fn = function()
    local tbl145, tbl146, num40, tbl147, v1161 = {}, {All = 0, Ready = 0, Growing = 0, ["In bag"] = 0}, 0, {}, pairs
    local v1162 = vm[53](fn25())
    for it1_42, it2_41 in v1161(vm:uT(v1162)) do
      if type(it2_41) == "table" then
        local format3, v1163 = ("%s|%s|%s"):format(tostring(it2_41.AssetCategory or it2_41.Category), tostring(it2_41.AssetScale or it2_41.Scale), table.concat(fn18(it2_41), ",")), tbl144[it1_42]
        v1163 = if if v1163 then v1163.k ~= format3 else not v1163 then {k = format3, e = fn21(it2_41)} else v1163
        tbl147[it1_42] = v1163
        format3 = v1163.e
        format3.uid, format3.kind, format3.left = it1_42, "In bag", math.huge
        format3.pct = 0
        format3.pv, format3.pk, format3.pa = fn146(v1163)
        if it2_41.Placement then
          local v1164 = reg.callModule
          if v1164("Egg", "IsReadyToHatch", it1_42) == true then
            format3.kind = "Ready"
            format3.left = 0
            format3.pct = 1
          else
            local v1165, v1166 = reg.callModule, tonumber(reg.callModule("Rec", "GrowthDuration", it2_41)) or 0
            format3.kind, format3.left = "Growing", fn14(it2_41)
            format3.pct = ((v1166 > 0) and math.clamp(1 - (format3.left / v1166), 0, 1)) or 0
          end
        end
        tbl146.All = tbl146.All + 1
        tbl146[format3.kind] += 1
        num40 += format3.v
        tbl145[#tbl145 + 1] = format3
      else
      end
    end
    table.sort(tbl145, function(arg1_199, arg2_76)
      return (arg1_199.pv or arg1_199.v) > (arg2_76.pv or arg2_76.v)
    end)
    local tbl148 = {}
    tbl144 = tbl147
    v1161 = ipairs
    for it1_43, it2_42 in v1161(tbl145) do
      v1162, tbl147 = #tbl148 < 40
      if v1162 then
        local v1167 = reg.slot21
        local cond25 = v1167.eggShow == "All"
        if cond25 then
          tbl147 = cond25
        else
          v1167 = reg.slot21
          tbl147 = v1167.eggShow == it2_42.kind
        end
      else
        tbl147 = v1162
      end
      if tbl147 then
        local v1168 = tbl144
        local v1169 = v1168[it2_42.uid]
        v1169.it = v1169.it or fn100(it2_42)
        local it, v1170, v1171 = v1169.it, ((it2_42.kind == "Growing") and fn13(it2_42.left)) or nil, it2_42.pk and ("+" .. it2_42.pk)
        v1169.base = v1169.base or it.muts
        if v1171 and not v1169[v1171] then
          v1169[v1171] = table.clone(v1169.base)
          for index74, item81 in ipairs(it2_42.pa) do
            local insert, v1172, tbl149 = table.insert, v1169[v1171], {}
            tbl149.n = "+" .. tbl10[item81]:upper()
            insert(v1172, tbl149)
          end
        end
        it.muts, it.value = (v1171 and v1169[v1171]) or v1169.base, "$" .. (fn15(it2_42.pv or it2_42.v) .. "/s")
        it.kind, it.pct, it.ready, it.label, it.rank, it.time, it.r, it.left = it2_42.kind, it2_42.pct, it2_42.kind == "Ready", tbl143[it2_42.kind], it1_43, v1170, it2_42.r, it2_42.left
        it.status = (v1170 and ("GROWING %d%%  \194\183  %s"):format(it2_42.pct * 100, v1170)) or it2_42.kind:upper()
        tbl148[#tbl148 + 1] = it
      end
    end
    v1162 = reg.slot21
    tbl147, tbl145 = (v1162.eggSort == "Rarity") and "r"
    if tbl147 then
      tbl145 = tbl147
    else
      v1161 = reg.slot21
      tbl145 = (v1161.eggSort == "Weight") and "kg"
    end
    local v1173
    if tbl145 then
      v1173 = tbl145
    else
      v1161 = reg.slot21
      v1173 = (v1161.eggSort == "Time left") and "left"
    end
    if v1173 then
      table.sort(tbl148, function(arg1_200, arg2_77)
        return (arg1_200[v1173] ~= arg2_77[v1173]) and ((v1173 == "left") == (arg1_200[v1173] < arg2_77[v1173]))
      end)
    end
    fn33("eggs", function()
      v1153:Set(tbl148, tbl146, "$" .. (fn15(num40) .. "/s"))
    end)
  end
end
do
  local tbl150, tbl151, tbl152 = {"Steal filter eggs", "Shooting Star", "Phantom Express", "Pumpkin Moon", "Butterfly", "Steal wisp eggs", "Wisp", "Steal missing Halloween index", "Steal missing index", "Place", "Mutate", "Butterfly machine", "Ghost Dog quest", "Halloween monsters", "Halloween fishing", "Treadmill"}, {pick = "picked egg", index = "missing index", wisp = "wisp egg", filter = "filter egg"}, {["Steal missing index"] = "Steal:index", ["Steal missing Halloween index"] = "Steal:hwindex", ["Steal wisp eggs"] = "Steal:wisp", ["Steal filter eggs"] = "Steal:filter", ["Shooting Star"] = "Star", Butterfly = "Bloom", Wisp = "WispGo", Mutate = "Mutate", Place = "Place", ["Phantom Express"] = "Train", ["Butterfly machine"] = "Machine", Treadmill = "Treadmill"}
  reg.state.rank = {}
  local function fn147(arg1_201)
    local v1174 = ipairs
    for it1_44, it2_43 in v1174(arg1_201) do
      local v1175 = reg.state
      v1175.rank[tbl152[it2_43] or ("HW:" .. it2_43)] = it1_44
    end
    arg1_201, v1174 = reg.state
    v1174, arg1_201.rank["HW:Halloween eggs"] = reg.state, reg.state.rank["Steal:filter"]
    local v1176, v1177, v1178, v1179, v1180, v1181 = reg.state
    v1177, v1178, v1179, v1180, v1181, v1176.rank.Halloween = reg.state, reg.state, reg.state, reg.state, reg.state, math.min(reg.state.rank["HW:Pumpkin Moon"], reg.state.rank["HW:Ghost Dog quest"], reg.state.rank["HW:Halloween eggs"], reg.state.rank["HW:Halloween monsters"], reg.state.rank["HW:Halloween fishing"])
    v1177, v1176 = reg.state, reg.state
    v1177.hwRank0 = v1176.rank.Halloween
    v1174, arg1_201, v1177 = reg.state
    arg1_201, v1177, v1174.rank["Steal:pick"], reg.state.rank.Combat = reg.state, reg.state, 0, reg.state.rank.Treadmill - 0.5
    v1179 = reg.state
    v1176, v1174 = v1179.rank, reg.state
    v1178, arg1_201 = (#v1174.pick > 0) and 0
    if v1178 then
      arg1_201 = v1178
    else
      v1177, v1180, v1179 = nil
      v1177, v1180, v1179, arg1_201 = reg.state, reg.state, reg.state, math.min(reg.state.rank["Steal:index"], reg.state.rank["Steal:wisp"], reg.state.rank["Steal:filter"])
    end
    v1176.Steal = arg1_201
  end
  fn147(tbl150)
  tbl9 = tbl39.Priority:Section("Task order", "sliders")
  tbl9:Text("Top goes first. A carried egg is always delivered first, and before the field opens every task waits in the safe zone.")
  local stats5 = tbl9:Stats({{"Doing", tbl17.tread}, {"Waiting", tbl17.timer}})
  tbl9:Order("Task order", tbl150, function(arg1_202)
    fn147(arg1_202)
    arg1_202 = reg.state
    if arg1_202.order then
      local v1182 = reg.state
      v1182.order()
    end
  end)
  local v1183 = fn50({name = "PrioInfo", gap = 1, info = true})
  v1183.on = function()
    return fn60("Farm")
  end
  v1183.fn = function()
    local tbl153, v1184 = {}, ipairs
    for it1_45, it2_44 in v1184(tbl31) do
      if it2_44.mover then
        if it2_44 ~= reg.slot4 then
          if it2_44.on then
            if it2_44.on() then
              if it2_44.name ~= "Stage" then
                tbl153[#tbl153 + 1] = it2_44.name
              end
            end
          end
        end
      end
    end
    local v1185, v1186, v1187, v1188 = ((#tbl153 == 0) and "Nothing") or (table.concat(tbl153, ", ", 1, math.min(#tbl153, 2)) .. (((#tbl153 > 2) and (" +" .. (#tbl153 - 2))) or "")), {}, reg.slot4
    if v1187 then
      tbl153, v1184 = reg.slot4.name == "Steal"
      if tbl153 then
        local v1189 = reg.state
        v1184 = v1189.stealKind
      else
        v1184 = tbl153
      end
      local v1190
      if v1184 then
        local v1191 = reg.state
        v1190 = "Steal " .. tbl151[v1191.stealKind]
      else
        v1190 = v1184
      end
      v1188 = v1190 or reg.slot4.name
    else
      v1188 = v1187
    end
    v1187 = nil
    if v1188 then
      v1187 = v1188
    else
      tbl153 = nil
      tbl153, v1187 = reg.state, ((os.clock() - (reg.state.treadAt or 0)) < 3) and "Treadmill"
    end
    v1186.Doing = v1187 or "Idle"
    v1186.Waiting = v1185
    fn36("prio", stats5, v1186)
  end
end
local function fn148(arg1_203)
  local v1192, tbl154, v1193 = ipairs, {}, reg.localPlayer
  vm:yT(tbl154, 0, v1193.Character or (fn24()), fn24())
  for it1_46, it2_45 in v1192(tbl154) do
    for index75, child23 in ipairs((it2_45 and it2_45:GetChildren()) or {}) do
      if child23:IsA("Tool") then
        if arg1_203(child23) then
          return child23
        end
      end
    end
  end
end
local tbl155, tbl156 = {}, {}
pcall(function()
  local v1194 = reg.modules
  for key33, item82 in next, v1194.Gears.Directory, nil do
    local v1195 = (type(item82) == "table") and item82.BatControllerData
    if (v1195 or (item82.ToolController == "Slap")) or tostring(key33):lower():find("scrambl") then
      tbl155[key33] = (v1195 and tonumber(v1195.RangeBonus)) or -1
      tbl156[#tbl156 + 1] = key33
    end
  end
end)
table.sort(tbl156, function(arg1_204, arg2_78)
  return (tbl155[arg1_204] > tbl155[arg2_78]) or ((tbl155[arg1_204] == tbl155[arg2_78]) and (arg1_204 < arg2_78))
end)
reg.state.weaponId, reg.state.weaponName = {}, {}
tbl9 = ipairs
for it1_47, it2_46 in tbl9(tbl156) do
  fn49 = reg.modules.Gears.Directory[it2_46]
  it1_47 = ((type(fn49) == "table") and fn49.DisplayName) or it2_46
  reg.state.weaponName[it2_46], reg.state.weaponId[it1_47] = it1_47, it2_46
end
local function fn149(arg1_205)
  return arg1_205:GetAttribute("GearName") or arg1_205.Name
end
reg.state.ownedWeapons = function()
  local v1196 = reg.slot59
  local v1197 = v1196()
  local v1198, tbl157, v1199, tbl158, v1200 = (((type(v1197) == "table") and (type(v1197.GearInventory) == "table")) and table.clone(v1197.GearInventory)) or {}, {}, ipairs, {}, reg.localPlayer
  vm:yT(tbl158, 0, v1200.Character, fn24())
  for it1_48, it2_47 in v1199(tbl158) do
    for index76, child24 in ipairs((it2_47 and it2_47:GetChildren()) or {}) do
      if child24:IsA("Tool") then
        v1198[fn149(child24)] = true
      end
    end
  end
  tbl158 = ipairs
  for it1_49, it2_48 in tbl158(tbl156) do
    if v1198[it2_48] then
      v1196 = nil
      v1196, tbl157[#tbl157 + 1] = reg.state, reg.state.weaponName[it2_48]
    end
  end
  return tbl157
end
local function fn150(arg1_206)
  local v1201, v1202 = (tbl155[fn149(arg1_206)] ~= nil) or (arg1_206:GetAttribute("IsBat") == true)
  if v1201 then
    v1202 = v1201
  else
    local itemType = arg1_206:GetAttribute("ItemType")
    v1202 = (if itemType then not itemType else not arg1_206:GetAttribute("GearName")) and ((arg1_206.Name:lower():find("bat") or arg1_206.Name:lower():find("sword")) or arg1_206.Name:lower():find("hammer"))
  end
  return v1202
end
reg.state.scrambler = function(arg1_207)
  return arg1_207 and (tbl155[fn149(arg1_207)] == -1)
end
local function fn151(arg1_208)
  return fn6() >= (tonumber(arg1_208:GetAttribute("CooldownEndTime")) or 0)
end
local tbl159 = {i = 1, at = 0}
reg.state.bat = function()
  local tbl160, v1203, tbl161, v1204 = {}, ipairs, {}, reg.localPlayer
  vm:yT(tbl161, 0, v1204.Character or (fn24()), fn24())
  v1204 = nil
  local v1205 = -2
  for it1_50, it2_49 in v1203(tbl161) do
    local v1206, v1207 = ipairs, (it2_49 and it2_49:GetChildren()) or {}
    for it1_51, it2_50 in v1206(v1207) do
      if it2_50:IsA("Tool") then
        if fn150(it2_50) then
          it1_51, it1_50 = tbl155[fn149(it2_50)] or 0, reg.slot21
          if it1_50.weap then
            it2_49 = reg.slot21
            if it2_49.weap[fn149(it2_50)] then
              if not (tbl160[fn149(it2_50)]) then
                tbl160[fn149(it2_50)] = it2_50
              end
            end
          end
          if it1_51 >= 0 then
            if v1204 then
              if it1_51 > v1205 then
                v1204, v1205 = it2_50, it1_51
              else
              end
            else
              v1204, v1205 = it2_50, it1_51
            end
          else
          end
        else
        end
      else
      end
    end
  end
  v1203 = {}
  for index77, item83 in ipairs(tbl156) do
    if tbl160[item83] then
      v1203[#v1203 + 1] = tbl160[item83]
    end
  end
  if #v1203 == 0 then
    return v1204, math.max(v1205, 0)
  end
  if #v1203 > 1 then
    if tbl159.i > #v1203 then
      tbl159.i = 1
    end
    local v1208, v1209, v1210, v1211 = (tbl159.i % #v1203) + 1, reg.slot21, (os.clock() - tbl159.at) >= (reg.slot21.swapT or 0.35)
    if v1210 then
      v1211 = v1210
    else
      v1204 = fn151(v1203[tbl159.i])
      v1211 = if v1204 then not v1204 else fn151(v1203[v1208])
    end
    if v1211 then
      tbl159.i, tbl159.at = v1208, os.clock()
    end
  else
    tbl159.i = 1
  end
  v1204 = v1203[tbl159.i]
  return v1204, math.max(tbl155[fn149(v1204)] or 0, 0)
end
do
  local tbl162, tbl163 = {Radiant = "Golden", Amethyst = "Purple", Sapphire = "Blue", Emerald = "Green"}, {Green = 1, Blue = 2, Purple = 3, Golden = 4}
  local v1212 = fn50({name = "Bloom", mover = true, gap = 1, pri = 5, soft = true})
  tbl9 = tbl39.Butterfly:Section("Butterfly bloom", "wind")
  fn44(tbl9, "Auto butterfly bloom", "bloom", false, function(arg1_209)
    if not (arg1_209) then
      fn51(v1212)
    end
  end)
  local text, stats6 = tbl9:Text("Off"), tbl9:Stats({{"Emerald", tbl17.Green}, {"Sapphire", tbl17.Blue}, {"Amethyst", tbl17.Purple}, {"Radiant", tbl17.Golden}, {"Essence", tbl17.essence}, {"Caught", tbl17.net}})
  fn46(tbl9, "Catch mode", "bfMode", {"Stand", "Patrol", "Circle", "Chase"}, "Stand")
  fn46(tbl9, "Catch priority", "bfPri", {"Rarest", "Nearest"}, "Rarest")
  local tbl164 = {Golden = true, Purple = true, Blue = true, Green = true}
  tbl9:Dropdown("Catch", {"Radiant", "Amethyst", "Sapphire", "Emerald"}, {"Radiant", "Amethyst", "Sapphire", "Emerald"}, function(arg1_210)
    tbl164 = fn32(arg1_210, tbl162) or {}
  end, true)
  fn47(tbl9, "Catch speed", "bfSpeed", 100, 600, 400, "", 10)
  local tbl165, tbl166 = {}, {"Spawned", "Escaped"}
  for index78, item84 in ipairs(tbl166) do
    index78 = networking:FindFirstChild("RE/Butterflies/" .. item84)
    if index78 then
      fn2(index78.OnClientEvent, function(arg1_211, arg2_79)
        local v1213 = ((type(arg1_211) == "table") and arg1_211) or ((type(arg2_79) == "table") and arg2_79)
        if v1213 then
          if v1213.Id then
            tbl165[v1213.Id] = v1213
          end
        end
      end)
    end
  end
  tbl41 = networking:FindFirstChild("RE/Butterflies/Removed")
  if tbl41 then
    fn2(tbl41.OnClientEvent, function(arg1_212)
      tbl165[arg1_212] = nil
    end)
  end
  local num41, num42, num43, num44 = 14, 0, 1800, 900
  pcall(function()
    local module = require(replicatedStorage.Shared.Flags.ButterflyFlags)
    local v1214, v1215, v1216 = tonumber(module.NetReach:Get()) or num41, tonumber(module.IntervalSeconds:Get()) or num43, tonumber(module.OffsetSeconds:Get()) or num44
    num41, num43, num44 = v1214, v1215, v1216
  end)
  local function fn152()
    local num45 = tonumber(workspace:GetAttribute("ButterflyBloomEndsAt"))
    return (workspace:GetAttribute("Event_ButterflyBloom") == true) and (if num45 then fn6() < num45 else not num45)
  end
  local function fn153()
    local num46 = tonumber(workspace:GetAttribute("ButterflyBloomEndsAt"))
    return math.min((num46 and (num46 - fn6())) or math.huge, fn26())
  end
  local function fn154()
    local v1217 = reg.getRoot
    local v1218, v1219, v1220 = v1217(), fn153() > 25
    if v1219 then
      v1220 = v1219
    else
      if v1218 then
        v1217 = nil
        v1217, v1220 = reg.vec3, (v1218.Position - reg.vec3(6700, 74, -364)).Magnitude < 300
      else
        v1220 = v1218
      end
    end
    return v1220
  end
  reg.state.bloomWants = function()
    local v1221 = reg.slot21
    local bloom, v1222 = v1221.bloom
    if bloom then
      v1221 = fn152() and fn154()
      if v1221 then
        v1222 = v1221
      else
        local v1223 = num44
        v1222 = ((v1223 - fn6()) % num43) < 12
      end
    else
      v1222 = bloom
    end
    return v1222
  end
  local function fn155()
    local v1224 = reg.findInWorld
    return v1224("Areas", "ButterflyBloom", "Bounds")
  end
  local function fn156()
    local v1225 = reg.slot59
    local v1226 = v1225()
    return ((v1226 and (type(v1226.Butterflies) == "table")) and v1226.Butterflies) or {}
  end
  local v1227 = fn35("bf", text)
  local function fn157(arg1_213)
    return ((arg1_213:GetAttribute("ButterflyNet") == true) or (arg1_213:GetAttribute("ItemType") == "ButterflyNet")) or (arg1_213.Name == "Butterfly Net")
  end
  local new3 = RaycastParams.new()
  new3.FilterType = Enum.RaycastFilterType.Exclude
  local function fn158(arg1_214)
    local tbl167, v1228 = {}, reg.localPlayer
    vm:yT(tbl167, 0, v1228.Character, workspace:FindFirstChild("ButterflyBloomSwarm"))
    new3.FilterDescendantsInstances = tbl167
    local v1229, v1230, raycast, v1231 = reg.vec3, reg.vec3, workspace:Raycast(arg1_214 + reg.vec3(0, 25, 0), reg.vec3(0, -120, 0), new3), reg.getHumanoid
    tbl167 = v1231()
    v1231 = nil
    if raycast then
      v1228 = reg.vec3
      v1231 = v1228(arg1_214.X, (raycast.Position.Y + ((tbl167 and tbl167.HipHeight) or 2)) + 1, arg1_214.Z)
    else
      v1231 = raycast
    end
    return v1231 or arg1_214
  end
  local function fn159(arg1_215)
    local v1232 = reg.findInWorld
    local v1233 = v1232("Machines", "ButterflyStation", arg1_215)
    v1232 = v1233 and (v1233:FindFirstChild("Anchor") or v1233)
    return v1232 and ((v1232:IsA("BasePart") and v1232.Position) or (v1232:IsA("Model") and v1232:GetPivot().Position))
  end
  local function fn160(arg1_216, arg2_80)
    local v1234, v1235 = reg.localPlayer, reg.localPlayer
    pcall(reg.localPlayer.RequestStreamAroundAsync, reg.localPlayer, arg1_216)
    local v1236, v1237, v1238 = reg.setRootCFrame, reg.cframeNew, reg.vec3
    v1236(v1237(arg1_216 + v1238(0, 3, 4)))
    v1237 = os.clock() + 0.6
    while (os.clock() < v1237) and (arg2_80()) do
      local v1239, v1240, v1241 = reg.setRootCFrame, reg.cframeNew, reg.vec3
      v1239(v1240(arg1_216 + v1241(0, 3, 4)))
      v1240 = reg.heartbeatWait
      v1240()
    end
  end
  local function fn161(arg1_217)
    local v1242 = fn159("NetStand") or fn159("ButterflyMachine")
    if not (v1242) then
      return false
    end
    local v1243 = reg.slot15
    if not (v1243(arg1_217)) then
      return false
    end
    v1243 = reg.getRoot
    local v1244 = v1243()
    if v1244 then
      if (v1244.Position - v1242).Magnitude > 60 then
        v1243 = reg.state
        if not (v1243.reach({Pos = v1242, Name = "the net"}, arg1_217)) then
          return false
        end
      end
    end
    for i25 = 1, 5, 1 do
      if not (arg1_217()) then
        return false
      end
      fn160(v1242, arg1_217)
      v1244 = reg.invokeRemote
      v1243, i25 = v1244("RF/Butterflies/AskClaimNet")
      if v1243 then
        if i25 == true then
          return true
        end
      end
      task.wait(0.8)
    end
    return fn156().NetClaimed == true
  end
  local v1245
  pcall(function()
    v1245 = require(replicatedStorage.Controllers.Game.AdminAbuseClientController.Events.ButterflyBloom.Swarm)
  end)
  local function fn162(arg1_218, arg2_81)
    local v1246, v1247
    local v1248 = reg.modules
    local cat, v1249, tbl168 = v1248.Cat, fn6(), {}
    local function fn163(arg1_219, arg2_82, arg3_25)
      if typeof(arg3_25) ~= "Vector3" then
        return
      else
        local v1250 = tbl164
        if not (v1250[arg2_82.Tier]) then
          return
        end
      end
      local v1251, v1252, v1253 = reg.slot21, reg.slot21, (((arg3_25 - arg1_218).Magnitude / reg.slot21.bfSpeed) - (((reg.slot21.bfPri ~= "Nearest") and ((tbl163[arg2_82.Tier] or 0) * 1000)) or 0)) - (((arg1_219 == arg2_81) and 1) or 0)
      if if v1246 then v1253 < v1247 else not v1246 then
        v1246, v1247 = {id = arg1_219, p = arg3_25, f = arg2_82}, v1253
      end
    end
    if v1245 then
      if v1245.Each then
        pcall(function()
          local v1254 = v1245
          for it1_52, it2_51 in v1254.Each() do
            local v1255, v1256 = (type(it2_51) == "table") and it2_51.Flight, (type(it2_51) == "table") and it2_51.Body
            if type(v1255) == "table" then
              if typeof(v1256) == "Instance" then
                it2_51 = v1255.Id or it1_52
                tbl168[it2_51] = true
                fn163(it2_51, v1255, (v1256:IsA("BasePart") and v1256.Position) or (v1256:IsA("Model") and v1256:GetPivot().Position))
              end
            end
          end
        end)
      end
    end
    if cat and not next(tbl168) then
      for key34, item85 in next, tbl165, nil do
        if not (tbl168[key34]) then
          local ok12, v1257 = pcall(cat.PositionAt, item85, v1249)
          if ok12 then
            fn163(key34, item85, v1257)
          end
        end
      end
    end
    if v1246 then
      local ok13, v1258 = pcall(cat and cat.VelocityAt, v1246.f, v1249)
      local v1259, v1260 = ok13 and (typeof(v1258) == "Vector3")
      if v1259 then
        ok13 = reg.vec3
        v1260 = ok13(v1258.X, 0, v1258.Z)
      else
        v1260 = v1259
      end
      v1248 = nil
      if v1260 then
        v1248 = v1260
      else
        v1259 = reg.zeroVec
        v1248 = v1259
      end
      v1246.v = v1248
    end
    return v1246
  end
  v1212.want = function()
    if not (fn152()) then
      return v1227("Waiting for the next Butterfly Bloom")
    end
    if fn26() <= 0 then
      return v1227("Night, waiting")
    end
    if not (fn154()) then
      local v1261 = vm[53](math.max(fn153(), 0))
      return v1227(("Bloom ends in %ds, not worth the trip"):format(vm:uT(v1261)))
    end
    return fn155() or true
  end
  v1212.run = function(arg1_220, arg2_83)
    local v1262 = reg.state
    if not (v1262.needBody()) then
      return
    end
    v1262 = reg.getHumanoid
    local v1263 = v1262()
    if not (fn156().NetClaimed) then
      v1227("Claiming the butterfly net")
      if reg.slot14(arg2_83) then
        if not (fn161(arg2_83)) then
          return v1227("Could not claim the net")
        end
      else
        return v1227("Could not claim the net")
      end
    end
    local v1264, v1265 = (typeof(arg1_220) == "Instance") and arg1_220.Position
    if v1264 then
      v1265 = v1264
    else
      arg1_220 = reg.vec3
      v1265 = (arg1_220(6700, 74, -364))
    end
    v1262 = reg.getRoot
    v1264 = v1262()
    if v1264 and ((v1264.Position - v1265).Magnitude > 300) then
      if os.clock() < num42 then
        return v1227("Ragdoll TP did not land, trying again soon")
      end
      pcall(v1263.UnequipTools, v1263)
      if reg.slot14(arg2_83) then
        arg1_220 = reg.slot15
        if not (arg1_220(arg2_83)) then
          return v1227("Stuck on treadmill")
        end
      else
        return v1227("Stuck on treadmill")
      end
      v1262 = reg.getRoot
      v1264 = v1262()
      if v1264 then
        local v1266 = reg.isBeforeSeparation
        if v1266(v1264.Position) then
          local v1267 = reg.slot18
          if not (v1267(arg2_83, "Butterfly bloom")) then
            return
          end
        end
      end
      local v1268 = reg.vec3
      local v1269, flag29 = fn158(v1265 + v1268(0, 0, 6)), false
      for i26 = 1, 2, 1 do
        v1227(("Ragdoll TP to the bloom (try %d/2)"):format(i26))
        flag29 = fn57(function()
          return v1269
        end, arg2_83)
        if flag29 then
          break
        elseif not (arg2_83()) then
          break
        end
        task.wait(0.5)
      end
      if flag29 then
      else
        if arg2_83() then
          v1268 = reg.state
          flag29 = if v1268.reach({Pos = v1269, Name = "the bloom"}, arg2_83) then true else flag29
        else
        end
      end
      if not (flag29) then
        num42 = os.clock() + 10
        return v1227("Ragdoll TP did not land, trying again soon")
      end
    end
    local now9, now10, v1270 = os.clock(), os.clock(), reg.runService
    arg1_220 = fn2(v1270.Stepped, function()
      local v1271 = reg.slot21
      if v1271.bfMode ~= "Stand" then
        return
      end
      local v1272, v1273 = ipairs, vm[53](players:GetPlayers())
      for it1_53, it2_52 in v1272(vm:uT(v1273)) do
        v1271 = reg.localPlayer
        for index79, child25 in ipairs((((it2_52 ~= v1271) and it2_52.Character) and it2_52.Character:GetChildren()) or {}) do
          if child25:IsA("BasePart") then
            child25.CanCollide = false
          end
        end
      end
    end)
    v1262 = nil
    local num47, v1274 = 0
    while (arg2_83() and (fn152())) and (fn26() > 0) do
      v1270 = reg.getRoot
      v1264 = v1270()
      local v1275 = reg.getHumanoid
      v1263 = v1275()
      if v1264 then
        if v1263 then
          if (v1264.Position - v1265).Magnitude > 600 then
            break
          end
        else
          break
        end
      else
        break
      end
      v1275 = fn148(fn157)
      if v1275 then
        local v1276 = reg.localPlayer
        if v1275.Parent ~= v1276.Character then
          pcall(v1263.EquipTool, v1263, v1275)
        end
      end
      v1275 = fn162(v1264.Position, v1262)
      v1262 = v1275 and v1275.id
      local v1277 = reg.slot21
      local v1278, v1279 = (v1277.bfMode == "Stick") and "Chase"
      if v1278 then
        v1279 = v1278
      else
        v1277 = reg.slot21
        v1279 = v1277.bfMode
      end
      if os.clock() >= num47 then
        num47 = os.clock() + 0.5
        v1227(((v1279 == "Chase") and "Chasing butterflies") or "Catching butterflies")
      else
      end
      if v1279 == "Chase" then
        v1263.PlatformStand = false
        v1278, v1277 = v1275 and v1275.p
        if v1278 then
          v1277 = v1278
        else
          local v1280 = reg.vec3
          v1277 = fn158(v1265 + v1280(0, 0, 6))
        end
        local v1281 = reg.vec3
        local v1282, assemblyLinearVelocity = v1281(v1277.X - v1264.Position.X, 0, v1277.Z - v1264.Position.Z), v1264.AssemblyLinearVelocity
        if v1274 then
        else
          v1281 = reg.state
          local normalWalk, v1283 = v1281.normalWalk
          if normalWalk then
            local v1284 = reg.state
            v1283 = v1284.normalWalk(v1263)
          else
            v1283 = normalWalk
          end
          v1274 = v1283 or math.max(v1263.WalkSpeed, 16)
        end
        if v1275 and (v1282.Magnitude <= 40) then
          v1281 = reg.vec3
          local v1285, v1286, v1287 = v1281(v1277.X, math.max(fn158(v1277).Y, (v1277.Y - num41) + 4), v1277.Z), ((v1275.v.Magnitude > 1) and v1275.v.Unit) or ((v1282.Magnitude > 0.5) and v1282.Unit)
          if v1286 then
            v1287 = v1286
          else
            local v1288 = reg.vec3
            v1287 = v1288(v1264.CFrame.LookVector.X, 0, v1264.CFrame.LookVector.Z)
          end
          local v1289, v1290 = reg.setRootCFrame, reg.cframeNew
          v1289(v1290(v1285, v1285 + v1287))
          v1264.AssemblyLinearVelocity = v1275.v
          v1263.WalkSpeed = math.max(v1275.v.Magnitude, 16)
          v1263:MoveTo(v1285 + v1275.v)
          now10 = os.clock()
        else
          if v1282.Magnitude > 2 then
            local v1291, clamp = reg.slot21, math.clamp(v1282.Magnitude * 8, 16, reg.slot21.bfSpeed)
            v1263.WalkSpeed = clamp
            v1263:MoveTo(v1264.Position + v1282)
            local v1292
            v1292, v1264.AssemblyLinearVelocity = reg.vec3, (v1282.Unit * clamp) + reg.vec3(0, assemblyLinearVelocity.Y, 0)
            v1292 = reg.vec3
            now10 = if v1292(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z).Magnitude > (clamp * 0.3) then os.clock() else now10
          else
            v1263:MoveTo(v1264.Position)
            now10 = os.clock()
          end
        end
        if (os.clock() - now10) > 0.5 then
          now10 = os.clock()
          v1263.Jump = true
        else
        end
        v1282 = reg.heartbeatWait
        v1282()
        continue
      end
      v1263.PlatformStand = true
      v1277 = reg.vec3
      v1275, v1278 = fn158(v1265 + v1277(0, 0, 6)), os.clock() - now9
      if v1279 == "Patrol" then
        local v1293, v1294 = reg.vec3
        v1294, v1275 = reg.slot21, fn158(v1265 + v1293(math.sin((v1278 * reg.slot21.bfSpeed) / 180) * 170, 0, 0))
      else
        if v1279 == "Circle" then
          local v1295, v1296, v1297 = reg.vec3
          v1296, v1297, v1275 = reg.slot21, reg.slot21, fn158(v1265 + v1295(math.cos(((v1278 * reg.slot21.bfSpeed) / 25) / 4) * 25, 0, math.sin(((v1278 * reg.slot21.bfSpeed) / 25) / 4) * 25))
        else
        end
      end
      v1277 = v1275 - v1264.Position
      if v1277.Magnitude > 8 then
        v1279 = nil
        v1279, v1264.AssemblyLinearVelocity = reg.slot21, v1277.Unit * math.min(reg.slot21.bfSpeed, v1277.Magnitude / 0.05)
      else
        local v1298, v1299 = reg.setRootCFrame, reg.cframeNew
        v1298(v1299(v1275))
      end
      v1275 = reg.heartbeatWait
      v1275()
    end
    arg1_220:Disconnect()
    if v1263 then
      v1263.PlatformStand = false
      v1265 = reg.zeroVec
      v1263:Move(v1265)
      if v1274 then
        v1263.WalkSpeed = v1274
      end
    end
  end
  v1212.on = function()
    local v1300 = reg.slot21
    if v1300.bloom then
      if reg.slot4 then
        if reg.slot4.name == "Steal" then
          local v1301 = reg.slot29
          if not (v1301()) then
            local v1302, v1303 = reg.state, reg.state
            if (v1302.rank.Bloom or 5) < (v1303.rank.Steal or 9) then
              local v1304 = reg.state
              if v1304.bloomWants() then
                fn51(reg.slot4)
              end
            end
          end
        end
      end
    end
    v1300 = reg.slot21
    return v1300.bloom
  end
  local v1305 = fn50({name = "BloomInfo", gap = 2})
  v1305.on = function()
    return fn60("Event")
  end
  v1305.fn = function()
    local v1306 = fn156()
    local v1307, v1308 = v1306.Counts or {}, reg.state
    local v1309 = v1308.bfRec or {}
    local function fn164(arg1_221)
      return tostring(v1307[arg1_221] or 0) .. ((v1309[arg1_221] and (" / " .. v1309[arg1_221])) or "")
    end
    fn36("bst", stats6, {Emerald = fn164("Green"), Sapphire = fn164("Blue"), Amethyst = fn164("Purple"), Radiant = fn164("Golden"), Essence = tostring(v1306.Essence or 0), Caught = fn15(v1306.TotalCaught or 0)})
  end
  text = tbl39.Butterfly:Section("Butterfly machine", "sparkles")
  reg.state.bfT = fn44(text, "Auto trade up", "bfTrade", false, function(arg1_222)
    if arg1_222 then
      local v1310 = reg.slot21
      if v1310.bfSmart then
        local v1311 = reg.state
        v1311.bfS:Set(false)
      end
    end
  end)
  local tbl169 = {}
  fn49, tbl166 = {"Emerald to Sapphire", "Sapphire to Amethyst", "Amethyst to Radiant"}, function(arg1_223)
    tbl169 = {}
    for index80, item86 in ipairs(arg1_223) do
      index80 = tbl169
      index80[#index80 + 1] = tbl162[item86:match("^(%a+)")]
    end
  end
  text:Dropdown("Trade", fn49, {}, tbl166, true)
  reg.state.bfS = fn44(text, "Smart trade for essence", "bfSmart", false, function(arg1_224)
    if arg1_224 then
      local v1312 = reg.slot21
      if v1312.bfTrade then
        local v1313 = reg.state
        v1313.bfT:Set(false)
      end
    end
  end)
  fn44(text, "Auto craft essence", "bfCraft", false)
  local tbl170, tbl171 = {Green = 10, Blue = 10, Purple = 50}, {Green = 240, Blue = 115, Purple = 40, Golden = 1}
  pcall(function()
    local module2, tbl172 = require(replicatedStorage.Shared.Flags.ButterflyFlags), {Green = "GreenToBlueCost", Blue = "BlueToPurpleCost", Purple = "PurpleToGoldenCost"}
    for key35, item87 in next, tbl172, nil do
      tbl170[key35] = tonumber(module2[item87]:Get()) or tbl170[key35]
    end
    for key36 in next, tbl171, nil do
      tbl171[key36] = tonumber(module2["Essence" .. key36]:Get()) or tbl171[key36]
    end
  end)
  reg.state.bfRec = tbl171
  local function fn165(arg1_225)
    for key37, item88 in next, tbl171, nil do
      if (arg1_225[key37] or 0) < item88 then
        return false
      end
    end
    return true
  end
  local function fn166(arg1_226)
    local v1314, v1315, v1316, v1317 = arg1_226.Green or 0, arg1_226.Blue or 0, arg1_226.Purple or 0, arg1_226.Golden or 0
    for i27 = 60, 1, -1 do
      arg1_226 = math.max(0, (i27 * tbl171.Golden) - v1317)
      local max5 = math.max(0, ((i27 * tbl171.Purple) + (tbl170.Purple * arg1_226)) - v1316)
      local max6 = math.max(0, ((i27 * tbl171.Blue) + (tbl170.Blue * max5)) - v1315)
      if v1314 >= ((i27 * tbl171.Green) + (tbl170.Green * max6)) then
        return {Green = max6, Blue = max5, Purple = arg1_226}
      end
    end
  end
  local v1318 = fn50({name = "Machine", mover = true, gap = 20, pri = 6, soft = true})
  v1318.on = function()
    local v1319 = reg.slot21
    local bfTrade, v1320 = v1319.bfTrade
    if bfTrade then
      v1320 = bfTrade
    else
      v1319 = reg.slot21
      v1320 = v1319.bfSmart
    end
    bfTrade = nil
    if v1320 then
      bfTrade = v1320
    else
      v1319 = reg.slot21
      bfTrade = v1319.bfCraft
    end
    return bfTrade
  end
  v1318.want = function()
    if fn152() then
      return
    else
      local v1321 = reg.localPlayer
      if v1321:GetAttribute("EnchantedTreeUnlocked") ~= true then
        return
      end
    end
    local v1322, v1323 = fn156().Counts or {}, reg.slot21
    if v1323.bfCraft then
      if fn165(v1322) then
        return true
      end
    end
    v1323 = reg.slot21
    if v1323.bfSmart then
      local v1324 = fn166(v1322)
      return (v1324 and (((v1324.Green + v1324.Blue) + v1324.Purple) > 0)) or nil
    end
    local v1325, v1326 = ipairs, tbl169
    for it1_54, it2_53 in v1325(v1326) do
      v1323 = reg.slot21
      if v1323.bfTrade then
        local v1327, v1328 = reg.slot21, (v1322[it2_53] or 0) - ((reg.slot21.bfCraft and tbl171[it2_53]) or 0)
        if v1328 >= tbl170[it2_53] then
          return true
        end
      end
    end
  end
  local function fn167(arg1_227)
    local v1329 = reg.localPlayer
    if v1329:GetAttribute("InEnchantedTree") then
      return true
    end
    v1329 = reg.findInWorld
    local v1330 = v1329("Build", "EnchantedTreeInterior", "Markers", "EnterTrigger", "EnchantedTreeEntrance", "EnchantedTreePrompt")
    v1329 = v1330 and v1330.Parent
    local v1331 = v1329 and ((v1329:IsA("Attachment") and v1329.WorldPosition) or (v1329:IsA("BasePart") and v1329.Position))
    if not (v1331) then
      return false
    end
    v1329 = reg.slot15
    if not (v1329(arg1_227)) then
      return false
    end
    v1329 = reg.getRoot
    local v1332 = v1329()
    if v1332 then
      v1329 = reg.isBeforeSeparation
      if v1329(v1332.Position) then
        local v1333 = reg.slot18
        if not (v1333(arg1_227, "Enchanted Tree", 0.3)) then
          return false
        end
      end
    end
    v1332 = reg.vec3
    v1329 = v1331 + v1332(0, 0, -12)
    for i28 = 1, 2, 1 do
      i28 = reg.getRoot
      v1332 = i28()
      if v1332 then
        if arg1_227() then
          if fn26() > 0 then
            if not ((v1332.Position - v1329).Magnitude > 500) then
              break
            end
          else
            break
          end
        else
          break
        end
      else
        break
      end
      i28 = reg.slot10
      i28("Ragdoll TP to the Enchanted Tree")
      i28 = reg.vec3
      fn57(v1329 + i28(0, 3, 0), arg1_227)
    end
    v1332 = reg.getRoot
    local v1334 = v1332()
    if v1334 then
      if (v1334.Position - v1329).Magnitude > 60 then
        v1332 = reg.state
        if not (v1332.reach({Pos = v1329, Name = "the tree"}, arg1_227)) then
          return false
        end
      end
    end
    for i29 = 1, 4, 1 do
      arg1_227, v1329, v1334 = reg.setRootCFrame, reg.cframeNew, reg.vec3
      arg1_227(v1329(v1331 + v1334(0, 3, -6)))
      pcall(fireproximityprompt, v1330)
      i29 = os.clock() + 4
      while true do
        local cond26, v1335 = os.clock() < i29
        if cond26 then
          v1332 = reg.localPlayer
          v1335 = not v1332:GetAttribute("InEnchantedTree")
        else
          v1335 = cond26
        end
        if not v1335 then
          break
        end
        cond26 = reg.heartbeatWait
        cond26()
      end
      i29 = reg.localPlayer
      if i29:GetAttribute("InEnchantedTree") then
        return true
      end
    end
    return false
  end
  reg.state.enterTree = fn167
  reg.state.leaveTree = function()
    local v1336 = reg.findInWorld
    local v1337 = v1336("Build", "EnchantedTreeInterior", "Markers", "ExitTrigger")
    if v1337 then
      if v1337:IsA("BasePart") then
        v1336 = reg.localPlayer
        if not (v1336:GetAttribute("InEnchantedTree")) then
          return
        end
      else
        return
      end
    else
      return
    end
    local v1338, v1339 = reg.setRootCFrame, reg.cframeNew
    v1338(v1339(v1337.Position + (v1337.CFrame.LookVector * ((v1337.Size.Z / 2) + 3))))
    v1339 = reg.heartbeatWait
    v1339()
    v1336 = reg.setRootCFrame
    v1336(v1337.CFrame)
    v1336 = os.clock() + 1.5
    while true do
      v1339 = reg.localPlayer
      if not (v1339:GetAttribute("InEnchantedTree") and (os.clock() < v1336)) then
        break
      end
      v1338 = reg.heartbeatWait
      v1338()
    end
    v1336 = reg.localPlayer
    if v1336:GetAttribute("InEnchantedTree") then
      v1338 = reg.getRoot
      fn8(v1338(), v1337)
    end
  end
  local function fn168(arg1_228, arg2_84, arg3_26, ...)
    local v1340 = fn159(arg2_84)
    if not (v1340) then
      return false
    end
    for i30 = 1, 3, 1 do
      fn160(v1340, arg3_26)
      i30 = reg.invokeRemote
      local v1341, v1342, v1343 = i30(arg1_228, ...)
      if v1341 then
        if v1342 ~= false then
          return true
        end
      end
      if not (tostring(v1343):lower():find("closer")) then
        return false
      end
    end
    return false
  end
  v1318.run = function(arg1_229, arg2_85)
    arg1_229 = reg.state
    if not (arg1_229.needBody()) then
      return
    end
    if reg.slot14(arg2_85) then
      if not (fn167(arg2_85)) then
        arg1_229 = reg.slot10
        return arg1_229("Could not enter the tree", "warn")
      end
    else
      local v1344 = reg.slot10
      return v1344("Could not enter the tree", "warn")
    end
    arg1_229 = reg.slot21
    local v1345, v1346 = arg1_229.bfSmart and fn166(fn156().Counts or {}), ipairs
    arg1_229 = (v1345 and {"Green", "Blue", "Purple"}) or {}
    for it1_55, it2_54 in v1346(arg1_229) do
      it1_55 = v1345[it2_54]
      for i31 = 1, it1_55, 1 do
        i31 = reg.slot21
        if i31.bfSmart then
          if arg2_85() then
            if not (fn168("RF/Butterflies/AskTradeUp", "ButterflyMachine", arg2_85, it2_54)) then
              break
            end
          else
            break
          end
        else
          break
        end
        task.wait(0.15)
      end
    end
    v1345, arg1_229 = ipairs, reg.slot21
    v1346 = (arg1_229.bfSmart and {}) or tbl169
    for it1_56, it2_55 in v1345(v1346) do
      while true do
        arg1_229 = reg.slot21
        local v1347, v1348 = (arg1_229.bfTrade and arg2_85()) and (fn156().Counts or {})[it2_55]
        if v1347 then
          it1_56 = nil
          it1_56, v1348 = reg.slot21, (fn156().Counts[it2_55] - ((reg.slot21.bfCraft and tbl171[it2_55]) or 0)) >= tbl170[it2_55]
        else
          v1348 = v1347
        end
        if not v1348 then
          break
        end
        if not (fn168("RF/Butterflies/AskTradeUp", "ButterflyMachine", arg2_85, it2_55)) then
          break
        end
        task.wait(0.15)
      end
    end
    for i32 = 1, 50, 1 do
      v1345 = reg.slot21
      if v1345.bfCraft then
        if arg2_85() then
          if not (fn165(fn156().Counts or {})) then
            break
          end
        else
          break
        end
      else
        break
      end
      if not (fn168("RF/Butterflies/AskCraftEssence", "MutationShrine", arg2_85)) then
        break
      end
      task.wait(0.3)
    end
    arg2_85 = reg.state
    arg2_85.leaveTree()
  end
end
do
  local v1349, section3 = fn50({name = "Wisp", gap = 3}), tbl39.Butterfly:Section("Wisp companion", "ghost")
  fn44(section3, "Auto wisp quest", "wisp", false)
  fn44(section3, "Auto banjo cricket", "banjo", false)
  local v1350 = fn35("wt", section3:Text("Off"))
  reg.state.wispSay = v1350
  local stats7 = section3:Stats({{"Stage", tbl17.wisp}, {"Progress", tbl17.wisp3}})
  v1349.on = function()
    local v1351 = reg.slot21
    return v1351.wisp or fn60("Event")
  end
  local wisp = reg.modules.Wisp
  local function fn169()
    local v1352 = reg.slot59
    local v1353 = v1352()
    v1352 = v1353 and v1353.WispCompanion
    return v1353, ((type(v1352) == "table") and v1352) or nil
  end
  local function fn170(arg1_230)
    if arg1_230 then
      if arg1_230.Accepted then
        if arg1_230.Unlocked then
          return
        end
      else
        return
      end
    else
      return
    end
    return (((type(wisp) == "table") and wisp.List) or {})[tonumber(arg1_230.Stage) or 1]
  end
  local function fn171(arg1_231, arg2_86)
    return ((type(arg1_231.Progress) == "table") and tonumber(arg1_231.Progress[arg2_86.Id])) or 0
  end
  local function fn172(arg1_232, arg2_87)
    return (type(arg1_232.Claimed) == "table") and arg1_232.Claimed[arg2_87.Id]
  end
  local tbl173 = {}
  local function fn173(arg1_233)
    if not (tbl173[arg1_233]) then
      local tbl174 = {}
      pcall(function()
        for index81, item89 in ipairs(require(replicatedStorage.Data.Areas.Configs[arg1_233]).DropTable) do
          tbl174[tostring(item89[1] or item89.Category)] = true
        end
      end)
      tbl173[arg1_233] = tbl174
    end
    return tbl173[arg1_233]
  end
  local tbl175 = {at = 0}
  local function fn174(arg1_234)
    if tbl175.q == arg1_234 then
      if (os.clock() - tbl175.at) < 2 then
        local v1354 = tbl175
        return v1354
      end
    end
    local v1355 = reg.slot59
    local v1356, v1357 = v1355(), fn173((type(arg1_234.Match) == "table") and arg1_234.Match.AreaId)
    local v1358, tbl176, tbl177 = fn120(v1356 or {}), {}, {}
    for key38, item90 in next, ((v1356 and (type(v1356.Inventory) == "table")) and v1356.Inventory) or {}, nil do
      v1355 = (type(item90) == "table") and tostring(item90.AssetCategory)
      if v1355 then
        if v1357[v1355] then
          if not (item90.IsFavorite) then
            if not (item90.InFuse) then
              if not (v1358[key38]) then
                tbl176[v1355] = tbl176[v1355] or {}
                table.insert(tbl176[v1355], key38)
                tbl177[v1355] = (tbl177[v1355] or 0) + 1
              end
            end
          end
        end
      end
    end
    for key39, item91 in pairs(fn25()) do
      v1356 = (type(item91) == "table") and tostring(item91.AssetCategory)
      if v1356 then
        if v1357[v1356] then
          tbl177[v1356] = (tbl177[v1356] or 0) + 1
        end
      end
    end
    tbl175 = {q = arg1_234, at = os.clock(), supply = 0}
    for key40, item92 in next, tbl176, nil do
      if #item92 >= 3 then
        arg1_234, v1356 = tbl175, tbl175
        arg1_234.ready = {item92[1], item92[2], item92[3]}
        v1356.cat = key40
      end
    end
    for key41, item93 in next, tbl177, nil do
      v1358 = tbl175
      v1358.supply = math.max(tbl175.supply, item93)
    end
    arg1_234 = tbl175
    return arg1_234
  end
  local function fn175(arg1_235)
    local v1359, v1360 = fn169()
    local v1361 = fn170(v1360)
    if v1361 then
      if fn172(v1360, v1361) then
        return false
      end
    else
      return false
    end
    local v1362 = ((type(v1361.Match) == "table") and v1361.Match) or {}
    if v1361.Event == "PetFused" then
      return (arg1_235.a == v1362.AreaId) and (fn174(v1361).supply < 3)
    end
    if v1361.Event ~= "EggSecured" then
      return false
    elseif fn171(v1360, v1361) >= (tonumber(v1361.Target) or 1) then
      return false
    end
    for key42, item94 in next, v1362, nil do
      if key42 == "AreaId" then
        if item94 ~= arg1_235.a then
          return false
        end
      elseif key42 == "Rarity" then
        v1360 = fn16(arg1_235.cat)
        v1360 = v1360 and v1360.Rarity
        if v1360 then
          if not (v1360.DisplayName == item94) then
            if not (v1360._id == item94) then
              return false
            end
          end
        else
          return false
        end
      else
        return false
      end
    end
    return true
  end
  reg.state.wispSteals = function()
    local v1363 = reg.slot21
    if not (v1363.wisp) then
      return false
    end
    local v1364, v1365 = fn169()
    v1363 = fn170(v1365)
    if v1363 then
      if fn172(v1365, v1363) then
        return false
      end
    else
      return false
    end
    if v1363.Event == "EggSecured" then
      return fn171(v1365, v1363) < (tonumber(v1363.Target) or 1)
    end
    return (v1363.Event == "PetFused") and (fn174(v1363).supply < 3)
  end
  local wantEgg2 = reg.state.wantEgg
  reg.state.wantEgg = function(arg1_236)
    local v1366 = reg.slot21
    if v1366.wisp then
      if fn175(arg1_236) then
        return "wisp"
      end
    end
    return wantEgg2 and (wantEgg2(arg1_236))
  end
  local function fn176(...)
    local v1367 = reg.findInWorld
    local v1368 = v1367("Build", ...)
    return v1368 and ((v1368:IsA("BasePart") and v1368.Position) or (v1368:IsA("Model") and v1368:GetPivot().Position))
  end
  local function fn177(arg1_237)
    local v1369 = reg.slot59
    local v1370 = v1369()
    if not (v1370) then
      return
    end
    if v1370.FusionLocked then
      if type(v1370.FusionEggReward) == "table" then
        v1369 = reg.invokeRemote
        v1369("RF/Fusery/FinishReveal")
      end
      return v1350("Fusing for the wisp quest")
    end
    v1369 = fn174(arg1_237)
    if not (v1369.ready) then
      return v1350(((v1369.supply >= 3) and "Hatching eggs for the fuse quest") or "Stealing eggs for the fuse quest")
    end
    local tbl178, tbl179 = {}, {}
    for index82, item95 in ipairs(v1369.ready) do
      tbl178[item95] = true
    end
    local v1371, v1372 = ipairs, ((type(v1370.FusionSlots) == "table") and v1370.FusionSlots) or {}
    for it1_57, it2_56 in v1371(v1372) do
      if tbl178[it2_56] then
        tbl179[it2_56] = true
      else
        it1_57 = reg.invokeRemote
        it1_57("RF/Fusery/EjectPet", it2_56)
        task.wait(0.35)
      end
    end
    if v1370.FusionInfoAcknowledged == false then
      tbl178 = reg.invokeRemote
      tbl178("RF/Fusery/ConfirmBriefing")
      task.wait(0.35)
    end
    tbl178, v1370 = ipairs, v1369.ready
    for it1_58, it2_57 in tbl178(v1370) do
      if not (tbl179[it2_57]) then
        v1371 = reg.invokeRemote
        v1371("RF/Fusery/LoadPet", it2_57)
        task.wait(0.35)
      end
    end
    v1372 = reg.invokeRemote
    v1372("RF/Fusery/BeginFuse")
    tbl175.at = 0
    v1370 = reg.getDisplayName
    v1350("Fusing 3 " .. (v1370(v1369.cat) .. " for the wisp quest"))
  end
  v1349.fn = function()
    local v1373, v1374 = fn169()
    if not (v1374) then
      return v1350("Reading quest")
    end
    local v1375 = ((type(wisp) == "table") and tonumber(wisp.StageCount)) or 4
    if v1374.Unlocked then
      fn36("wst", stats7, {Stage = ("%d / %d"):format(v1375, v1375), Progress = "Complete"})
      return v1350("Done, the Enchanted Tree is open")
    end
    if not (v1374.Accepted) then
      fn36("wst", stats7, {Stage = ("0 / %d"):format(v1375), Progress = "Not accepted"})
    end
    local v1376 = fn170(v1374)
    if v1376 then
      fn36("wst", stats7, {Stage = ("%d / %d"):format(tonumber(v1374.Stage) or 1, v1375), Progress = ("%d / %d"):format(fn171(v1374, v1376), tonumber(v1376.Target) or 1)})
    end
    v1376 = reg.slot21
    if not (v1376.wisp) then
      return v1350((v1374.Accepted and "Off") or "Off - quest not accepted yet")
    end
    if v1373.FusionLocked then
      if type(v1373.FusionEggReward) == "table" then
        v1376 = reg.invokeRemote
        v1376("RF/Fusery/FinishReveal")
      end
    end
    if not (v1374.Accepted) then
      v1376 = ((type(wisp) == "table") and tonumber(wisp.RequiredSpeedPower)) or 50000000000
      if (tonumber(v1373.SpeedPower) or 0) < v1376 then
        return v1350("Needs " .. (fn15(v1376) .. " speed power to meet the wisp"))
      end
      local v1377 = reg.findInWorld
      local v1378 = v1377("Build")
      if v1378 then
        if not (v1378:GetAttribute("EnchantedForestZoneRevealed")) then
          return v1350("Waiting for the Enchanted Forest to open")
        end
      else
        return v1350("Waiting for the Enchanted Forest to open")
      end
      v1377 = reg.state
      v1377.wispGo = {fn176("EnchantedForestZone", "WispSpawn"), "Accept"}
      return v1350("Going to accept the quest")
    end
    v1373 = fn170(v1374)
    if v1373 then
      if not (fn172(v1374, v1373)) then
        if fn171(v1374, v1373) >= (tonumber(v1373.Target) or 1) then
          v1376 = reg.invokeRemote
          v1376("RF/WispCompanion/Request", "Claim", v1373.Id)
          return v1350("Claimed " .. tostring(v1373.Title))
        end
      end
    end
    if (tonumber(v1374.Stage) or 1) >= v1375 then
      if not (v1374.Returning) then
        v1376 = reg.invokeRemote
        v1376("RF/WispCompanion/Request", "BeginReturn")
      end
      local v1379 = reg.state
      v1379.wispGo = {fn176("EnchantedForestZone", "Zone13Props", "EnchantedTree", "WispAnchor") or fn176("EnchantedForestZone", "WispAnchor"), "Return"}
      return v1350("Returning the wisp")
    end
    if not v1373 then
      return v1350("Reading quest")
    end
    if v1373.Event == "PetFused" then
      return fn177(v1373)
    end
    v1350(tostring(v1373.Title) .. ((((type(v1373.Match) == "table") and v1373.Match.Rarity) and " - waiting for that egg in this server") or ""))
  end
  local v1380 = fn50({name = "WispGo", mover = true, gap = 3, pri = 4})
  v1380.on = function()
    local v1381 = reg.slot21
    return v1381.wisp
  end
  v1380.want = function()
    local v1382 = reg.state
    local wispGo, v1383 = v1382.wispGo
    if wispGo then
      v1382 = reg.state
      v1383 = v1382.wispGo[1]
    else
      v1383 = wispGo
    end
    wispGo = nil
    if v1383 then
      v1382 = reg.state
      wispGo = v1382.wispGo
    else
      wispGo = v1383
    end
    return wispGo or nil
  end
  v1380.run = function(arg1_238, arg2_88)
    local v1384 = arg1_238[1]
    if reg.slot14(arg2_88) then
      local v1385 = reg.slot15
      if not (v1385(arg2_88)) then
        return
      end
    else
      return
    end
    local v1386 = reg.getRoot
    local v1387 = v1386()
    if v1387 then
      v1386 = reg.isBeforeSeparation
      if v1386(v1387.Position) then
        local v1388 = reg.slot18
        if not (v1388(arg2_88, "Wisp", 0.3)) then
          return
        end
      end
    end
    v1387, v1386 = reg.localPlayer, reg.localPlayer
    pcall(reg.localPlayer.RequestStreamAroundAsync, reg.localPlayer, v1384)
    local v1389 = reg.getRoot
    local v1390 = v1389()
    if not (v1390) then
      return
    end
    if (v1390.Position - v1384).Magnitude > 1200 then
      if fn26() > 0 then
        v1389 = reg.vec3
        fn57(v1384 + v1389(0, 3, 3), arg2_88)
      end
    end
    v1389 = reg.getRoot
    v1390 = v1389()
    if v1390 then
      if (v1390.Position - v1384).Magnitude > 40 then
        local v1391, v1392 = reg.state, reg.vec3
        if not (v1391.stepTo(v1384 + v1392(0, 0, 3), arg2_88)) then
          return
        end
      end
    end
    v1389 = reg.getHumanoid
    local v1393, num48 = v1389(), 0
    while true do
      local v1394, v1395 = (v1393 and arg2_88()) and (num48 < 3)
      if v1394 then
        v1389 = reg.getRoot
        v1395 = (v1389())
      else
        v1395 = v1394
      end
      v1394 = nil
      if v1395 then
        local v1396 = reg.getRoot
        v1394 = (v1396().Position - v1384).Magnitude > 6
      else
        v1394 = v1395
      end
      if not v1394 then
        break
      end
      v1393:MoveTo(v1384)
      num48 += task.wait(0.2)
    end
    task.wait(0.5)
    arg2_88 = reg.invokeRemote
    arg2_88("RF/WispCompanion/Request", arg1_238[2])
    arg2_88 = reg.state
    arg2_88.wispGo = nil
  end
end
do
  local tbl180 = {pay = nil, caught = 0, slipped = 0, tries = 0, askAt = 0, jumped = {}}
  local v1397 = fn50({name = "Star", mover = true, gap = 0.5, pri = 2})
  tbl9 = tbl39.Star:Section("Shooting Star", "star")
  local stats8 = tbl9:Stats({{"Star", tbl17.star}, {"Lands in", tbl17.timer}, {"Caught", tbl17.check}, {"Doing", tbl17.tread}})
  fn44(tbl9, "Auto catch shooting star", "star", false, function(arg1_239)
    if not (arg1_239) then
      fn51(v1397)
    end
  end)
  local stats9 = tbl39.Star:Section("Catch", "hand"):Stats({{"Expires in", tbl17.timer}, {"Slipped", tbl17.trap}, {"Tries", tbl17.net}, {"Distance", tbl17.pin}})
  local function fn178(arg1_240)
    if type(arg1_240) == "table" then
      if arg1_240.Id ~= nil then
        if tbl180.pay then
          if not (tbl180.pay.Id == arg1_240.Id) then
            tbl180.slipped = 0
            tbl180.tries = 0
          end
        else
          tbl180.slipped = 0
          tbl180.tries = 0
        end
        tbl180.pay = arg1_240
      end
    end
  end
  local function fn179()
    tbl180.askAt = os.clock() + 15
    task.spawn(function()
      local v1398 = reg.invokeRemote
      local v1399, v1400 = v1398("RF/ShootingStar/AskState")
      if v1399 then
        fn178(v1400)
      end
    end)
  end
  local function fn180(arg1_241, arg2_89)
    local findFirstChild5 = networking:FindFirstChild(arg1_241)
    if findFirstChild5 then
      if findFirstChild5:IsA("RemoteEvent") then
        fn2(findFirstChild5.OnClientEvent, arg2_89)
      end
    end
  end
  fn180("RE/ShootingStar/Fall", fn178)
  fn180("RE/ShootingStar/Wander", function(arg1_242, arg2_90)
    if tbl180.pay then
      if tbl180.pay.Id == arg1_242 then
        if type(arg2_90) == "table" then
          tbl180.pay.Leg = arg2_90
        end
      end
    end
  end)
  fn180("RE/ShootingStar/Slipped", function(arg1_243)
    if tbl180.pay then
      if tbl180.pay.Id == arg1_243 then
        tbl180.slipped = tbl180.slipped + 1
        tbl180.hold = nil
      end
    end
  end)
  fn180("RE/ShootingStar/Claimed", function(arg1_244)
    if tbl180.pay then
      if tbl180.pay.Id == arg1_244 then
        tbl180.caught = tbl180.caught + 1
        tbl180.pay = nil
        fn51(v1397)
        fn34("Shooting Star", "Caught a star", "ok")
      end
    end
  end)
  fn180("RE/ShootingStar/Expired", function(arg1_245)
    if tbl180.pay then
      if tbl180.pay.Id == arg1_245 then
        tbl180.pay = nil
        fn51(v1397)
      end
    end
  end)
  fn179()
  local function fn181(arg1_246)
    local shootingStarClient = workspace:FindFirstChild("ShootingStarClient")
    local v1401 = shootingStarClient and (shootingStarClient:FindFirstChild("Buddy"))
    shootingStarClient = v1401 and (v1401:FindFirstChild("RootPart"))
    if shootingStarClient then
      if shootingStarClient:IsA("BasePart") then
        return shootingStarClient.Position
      end
    end
    shootingStarClient, v1401 = fn6(), arg1_246.Leg
    if type(v1401) == "table" then
      if typeof(v1401.From) == "Vector3" then
        if typeof(v1401.To) == "Vector3" then
          local v1402 = tonumber(v1401.StartAt) or shootingStarClient
          local v1403 = (tonumber(v1401.ArriveAt) or v1402) - v1402
          local v1404, v1405 = ((v1403 > 0) and math.clamp((shootingStarClient - v1402) / v1403, 0, 1)) or 1, v1401.To - v1401.From
          local lerp, v1406, v1407 = v1401.From:Lerp(v1401.To, v1404), (v1404 < 1) and (v1405.Magnitude > 0.5)
          if v1406 then
            v1402 = reg.vec3
            v1407 = v1402(v1405.X, 0, v1405.Z).Unit
          else
            v1407 = v1406
          end
          return lerp, v1407 or nil
        end
      end
    end
    v1401 = arg1_246.Landing
    if typeof(v1401) == "CFrame" then
      return v1401.Position
    end
    return ((typeof(v1401) == "Vector3") and v1401) or nil
  end
  local function fn182(arg1_247)
    local v1408 = fn6()
    return (arg1_247 and (v1408 >= (tonumber(arg1_247.LandAt) or v1408))) and ((tonumber(arg1_247.ExpiresAt) or math.huge) > v1408)
  end
  reg.state.starWants = function()
    local v1409 = reg.slot21
    return v1409.star and fn182(tbl180.pay)
  end
  v1397.on = function()
    if os.clock() >= tbl180.askAt then
      fn179()
    end
    if tbl180.pay then
      if (tonumber(tbl180.pay.ExpiresAt) or math.huge) <= fn6() then
        tbl180.pay = nil
      end
    end
    local v1410 = reg.slot21
    return v1410.star and fn182(tbl180.pay)
  end
  v1397.want = function()
    local v1411 = reg.slot29
    if v1411() then
      return
    end
    return tbl180.pay
  end
  v1397.run = function(arg1_248, arg2_91)
    local v1412 = reg.localPlayer
    local character10 = v1412.Character
    local function fn183()
      local v1413, v1414 = arg2_91() and (tbl180.pay == arg1_248)
      if v1413 then
        local v1415 = reg.localPlayer
        v1414 = v1415.Character == character10
      else
        v1414 = v1413
      end
      return v1414
    end
    if reg.slot14(fn183) then
      v1412 = reg.slot15
      if not (v1412(fn183)) then
        return
      end
    else
      return
    end
    v1412 = reg.getRoot
    local v1416 = v1412()
    v1412 = nil
    if v1416 then
      local v1417 = reg.isBeforeSeparation
      v1412 = v1417(v1416.Position)
    else
      v1412 = v1416
    end
    if v1412 then
      local v1418 = reg.slot18
      if not (v1418(fn183, "Shooting Star")) then
        return
      end
    end
    local function fn184()
      local v1419 = fn181(arg1_248)
      local v1420
      if v1419 then
        local v1421 = reg.vec3
        v1420 = v1419 + v1421(0, 3, 3)
      else
        v1420 = v1419
      end
      return v1420
    end
    local function fn185()
      local v1422, v1423 = fn184(), reg.getRoot
      local v1424 = v1423()
      return ((v1422 and v1424) and (v1424.Position - v1422).Magnitude) or math.huge
    end
    if fn185() > 40 then
      if not (tbl180.jumped[arg1_248.Id]) then
        tbl180.jumped[arg1_248.Id] = true
        v1412 = reg.slot10
        v1412("Ragdoll jump to the star")
        fn57(fn184, fn183)
      end
    end
    if fn183() then
      if fn185() > 40 then
        v1412 = reg.slot10
        v1412("Running to the star")
        local v1425 = fn184()
        local v1426
        if v1425 then
          v1426 = v1425
        else
          local v1427 = reg.zeroVec
          v1426 = v1427
        end
        fn58(v1426, fn183, 30, 40)
      end
    end
    v1412, fn185 = (tonumber(arg1_248.HoldSeconds) or 1.6) + 0.3, reg.getPing
    local v1428, now11 = 0.5 + (fn185() * 2), os.clock()
    fn185 = false
    local v1429
    local num49 = 0
    while fn183() do
      local v1430, v1431 = fn181(arg1_248)
      local v1432 = reg.getRoot
      v1416 = v1432()
      v1432 = reg.getHumanoid
      local v1433 = v1432()
      if v1430 then
        if v1416 then
          if not (v1433) then
            return
          end
        else
          return
        end
      else
        return
      end
      if v1416.Anchored then
        reg.slot14(fn183)
      end
      v1432 = reg.vec3
      local v1434, v1435, v1436 = v1430 + v1432(0, 3, 0), v1431 and (v1431 * 2)
      if v1435 then
        v1436 = v1435
      else
        v1432 = reg.vec3
        v1436 = (v1432(0, 0, 3))
      end
      v1431 = (v1434 + v1436) - v1416.Position
      if v1431.Magnitude > 60 then
        return
      end
      v1433.PlatformStand = true
      local v1437, v1438 = v1431 * 10, reg.vec3
      local v1439 = v1438(v1430.X - v1416.Position.X, 0, v1430.Z - v1416.Position.Z)
      if v1437.Magnitude > 200 then
        v1437 = v1437.Unit * 200
      else
      end
      pcall(function()
        if v1439.Magnitude > 0.05 then
          local v1440
          v1440, v1416.CFrame = reg.cframeNew, reg.cframeNew(v1416.Position, v1416.Position + v1439.Unit)
        end
        local v1441
        v1441, v1416.AssemblyLinearVelocity, v1416.AssemblyAngularVelocity = reg.zeroVec, v1437, reg.zeroVec
      end)
      if fn185 then
        if tbl180.hold then
          if if v1429 then not v1429 else (os.clock() - tbl180.hold) >= v1412 then
            num49 += 1
            tbl180.tries = tbl180.tries + 1
            v1429 = os.clock()
            fn4("RE/ShootingStar/Catch", arg1_248.Id)
            v1438 = reg.slot10
            v1438("Catching the star (try " .. (num49 .. ")"))
          else
            if v1429 then
              if (os.clock() - v1429) >= 2 then
                tbl180.hold = nil
                fn4("RE/ShootingStar/Hold", arg1_248.Id, false)
                if (num49 % 3) == 0 then
                  fn179()
                end
              end
            end
          end
        else
          v1429, tbl180.hold = nil, os.clock()
          fn4("RE/ShootingStar/Hold", arg1_248.Id, true)
          v1433 = reg.slot10
          v1433("Holding the star" .. (((tbl180.slipped > 0) and (" (slipped " .. (tbl180.slipped .. ")"))) or ""))
        end
      else
        now11 = if v1431.Magnitude > 8 then os.clock() else now11
        fn185 = (os.clock() - now11) >= v1428
        if not fn185 then
          v1436 = reg.slot10
          v1436("At the star, letting the server catch up")
        end
      end
      v1434 = reg.heartbeatWait
      v1434()
    end
    if tbl180.pay == arg1_248 then
      fn4("RE/ShootingStar/Hold", arg1_248.Id, false)
    end
    tbl180.hold = nil
  end
  local v1442 = fn50({name = "StarInfo", gap = 1})
  v1442.on = function()
    return fn60("Event")
  end
  v1442.fn = function()
    local pay, v1443 = tbl180.pay, fn6()
    local v1444, v1445, v1446, v1447 = pay and ((tonumber(pay.LandAt) or v1443) - v1443), pay and tonumber(pay.ExpiresAt), pay and (fn181(pay)), reg.getRoot
    local v1448, v1449, v1450, v1451 = v1447(), {Star = (pay and (((v1444 > 0) and "Falling") or "Landed")) or "None", ["Lands in"] = (pay and (((v1444 > 0) and (math.ceil(v1444) .. "s")) or "now")) or "--", Caught = tostring(tbl180.caught)}, (reg.slot4 == v1397) and "Catching"
    if v1450 then
      v1451 = v1450
    else
      v1444 = reg.slot21
      v1451 = v1444.star and "Waiting"
    end
    v1449.Doing = v1451 or "Off"
    fn36("star", stats8, v1449)
    fn36("starc", stats9, {["Expires in"] = (v1445 and fn13(math.max(v1445 - v1443, 0))) or "--", Slipped = tostring(tbl180.slipped), Tries = tostring(tbl180.tries), Distance = ((v1446 and v1448) and tostring(math.floor((v1448.Position - v1446).Magnitude))) or "--"})
  end
end
do
  local v1452 = fn50({name = "Stage", mover = true, gap = 0.5, pri = 50, soft = true})
  local function fn186()
    local v1453 = reg.slot21
    if v1453.steal then
      local v1454 = reg.state
      if v1454.targetsSoon then
        local v1455, v1456, v1457 = reg.state, pcall(reg.state.targetsSoon)
        if v1456 then
          if type(v1457) == "table" then
            if v1457[1] then
              local v1458 = reg.state
              if v1458.fieldFresh then
                return true
              end
            end
          end
        end
      end
    end
    v1453 = reg.state
    local starWants, v1459 = v1453.starWants
    if starWants then
      v1453 = reg.state
      v1459 = v1453.starWants()
    else
      v1459 = starWants
    end
    starWants = nil
    if v1459 then
      starWants = v1459
    else
      v1453 = reg.state
      local bloomWants = v1453.bloomWants
      if bloomWants then
        local v1460 = reg.state
        starWants = v1460.bloomWants()
      else
        starWants = bloomWants
      end
    end
    return starWants
  end
  v1452.on = function()
    local v1461 = reg.callModule
    local v1462 = v1461("Cycle", "IsNightPhase", fn6())
    local flag30, v1463 = not v1462
    if v1462 then
      v1463 = flag30
    else
      v1461 = reg.callModule
      v1463 = v1461("Wall", "IsSealed") == true
    end
    flag30, v1462 = (v1463 and 0.5) or 50, reg.state
    if v1462.rank.Stage ~= flag30 then
      v1461 = reg.state
      v1461.rank.Stage = flag30
      local v1464 = reg.state
      if v1464.order then
        local v1465 = reg.state
        v1465.order()
      end
    end
    return (v1463 and fn186()) or false
  end
  v1452.want = function()
    local v1466 = reg.slot29
    if not (v1466()) then
      local v1467 = reg.getRoot
      if v1467() then
        local v1468, v1469 = reg.getRiftPos, reg.vec3
        return v1468() + v1469(0, 3, 0)
      end
    end
  end
  v1452.run = function(arg1_249, arg2_92)
    local v1470 = reg.state
    if v1470.inFuse then
      local v1471 = reg.state
      if v1471.inFuse() then
        local v1472 = reg.slot10
        v1472("Leaving the portal zone before the field opens")
        v1472 = reg.state
        v1472.leaveFuse()
      end
    end
    if not (reg.slot14(arg2_92)) then
      return
    end
    v1470 = reg.getRoot
    local v1473 = v1470()
    if v1473 then
      v1470 = reg.isBeforeSeparation
      if v1470(v1473.Position) then
        if (v1473.Position - arg1_249).Magnitude > 8 then
          local v1474 = reg.slot10
          v1474("To the safe zone before the field opens")
          v1474 = reg.slot46
          if not (v1474(arg1_249, arg2_92, 250)) then
            return
          end
        end
      end
    end
    arg1_249 = reg.slot18
    arg1_249(arg2_92, "Ready in the safe zone", 0)
    v1473 = reg.slot10
    v1473("Field open, the top task goes first")
  end
end
do
  local function fn187(arg1_250)
    local ok14, v1476 = pcall(function()
      local v1475 = reg.modules
      return v1475.Egg.ReadFieldEgg(arg1_250)
    end)
    if ok14 then
      if type(v1476) == "table" then
        return v1476
      end
    end
    v1476 = reg.slot19
    ok14 = v1476()
    if type(ok14[arg1_250]) == "table" then
      return ok14[arg1_250]
    end
    for key43, item96 in pairs(ok14) do
      if type(item96) == "table" then
        if item96.Uid == arg1_250 then
          return item96
        end
      end
    end
  end
  local function fn188(arg1_251)
    return (arg1_251 and arg1_251:IsA("Model")) and arg1_251:GetPivot().Position
  end
  local function fn189()
    local v1477, tbl181 = ipairs, {"CaptureTheEggSpawn", "AdminAbuseEggSpawn"}
    for it1_59, it2_58 in v1477(tbl181) do
      it1_59 = reg.findInWorld
      local v1478 = it1_59("Areas", it2_58)
      if v1478 then
        if v1478:IsA("BasePart") then
          return v1478.Position
        end
      end
    end
  end
  local function fn190(arg1_252, arg2_93)
    local areaEggSlotsClient2 = workspace:FindFirstChild("AreaEggSlotsClient")
    return ((fn188(areaEggSlotsClient2 and areaEggSlotsClient2:FindFirstChild(arg1_252)) or fn188(workspace:FindFirstChild(arg1_252))) or ((arg2_93 and (typeof(arg2_93.BottomCFrame) == "CFrame")) and arg2_93.BottomCFrame.Position)) or (fn189())
  end
  local function fn191(arg1_253)
    local num50 = tonumber(arg1_253 and arg1_253.CarrierUserId)
    return ((num50 and (num50 > 0)) and num50) or nil
  end
  local function fn192(arg1_254, arg2_94)
    local v1479 = reg.slot29
    local v1480 = v1479(arg1_254)
    v1479 = nil
    if v1480 then
      v1479 = v1480
    else
      arg1_254 = nil
      arg1_254, v1479 = reg.localPlayer, fn191(arg2_94) == reg.localPlayer.UserId
    end
    return v1479
  end
  local function fn193(arg1_255, arg2_95, arg3_27)
    local v1481 = reg.getRoot
    local v1482, v1483 = v1481(), reg.getHumanoid
    v1481 = v1483()
    if not (v1482) then
      return
    end
    if v1481 then
      v1481.PlatformStand = true
    end
    v1483 = arg1_255 - v1482.Position
    local v1484, v1485 = ((v1483.Magnitude > (arg2_95 * arg3_27)) and (v1482.Position + ((v1483.Unit * arg2_95) * arg3_27))) or arg1_255, reg.vec3
    arg1_255, arg2_95 = v1485(v1483.X, 0, v1483.Z), reg.setRootCFrame
    v1482, v1481 = (arg1_255.Magnitude > 0.5) and CFrame.lookAt(v1484, v1484 + arg1_255)
    if v1482 then
      v1481 = v1482
    else
      arg3_27 = reg.cframeNew
      v1481 = (arg3_27(v1484))
    end
    arg2_95(v1481)
  end
  local function fn194(arg1_256, arg2_96)
    local v1486, v1487, v1488, v1489, v1490 = ipairs, vm[53](workspace:GetChildren()), 14
    for it1_60, it2_59 in v1486(vm:uT(v1487)) do
      it1_60 = ((it2_59.Name == "SmartPromptPart") and it2_59:IsA("BasePart")) and it2_59:FindFirstChild("CarryAreaEgg")
      if it1_60 then
        if it1_60:IsA("ProximityPrompt") then
          local v1491 = reg.vec3
          local magnitude2 = v1491(it2_59.Position.X - arg2_96.X, 0, it2_59.Position.Z - arg2_96.Z).Magnitude
          if magnitude2 < v1488 then
            v1488, v1489, v1490 = magnitude2, it1_60, it2_59
          else
          end
        else
        end
      else
      end
    end
    arg2_96, v1487 = v1489 and workspace:FindFirstChild("AreaEggSlotsClient"), ipairs
    v1486 = (arg2_96 and arg2_96:GetChildren()) or {}
    for it1_61, it2_60 in v1487(v1486) do
      it1_61 = (it2_60.Name ~= arg1_256) and fn188(it2_60)
      if it1_61 then
        arg2_96 = reg.vec3
        if (arg2_96(it1_61.X - v1490.Position.X, 0, it1_61.Z - v1490.Position.Z).Magnitude + 1.5) < v1488 then
          return
        end
      end
    end
    return v1489
  end
  local function fn195(arg1_257, arg2_97)
    local v1492 = reg.getHumanoid
    local v1493, v1494 = v1492(), reg.localPlayer
    v1492 = v1494.Character
    if v1493 then
      if v1492 then
        if v1492:FindFirstChildWhichIsA("Tool") then
          pcall(v1493.UnequipTools, v1493)
        end
      end
    end
    v1493, v1494 = os.clock() + 1.4, 0
    while (os.clock() < v1493) and (arg2_97()) do
      v1492 = fn187(arg1_257)
      if fn192(arg1_257, v1492) then
        return true
      end
      if fn191(v1492) then
        return false
      end
      local v1495 = fn190(arg1_257, v1492)
      if v1495 then
        local v1496, v1497, v1498 = reg.setRootCFrame, reg.cframeNew, reg.vec3
        v1496(v1497(v1495 + v1498(0, 2.5, 0)))
        if os.clock() >= v1494 then
          v1494 = os.clock() + 0.08
          local v1499 = fireproximityprompt and fn194(arg1_257, v1495)
          if v1499 then
            pcall(function()
              v1499.HoldDuration = 0
              fireproximityprompt(v1499)
            end)
          else
            task.spawn(reg.callModule, "Egg", "CarryFieldEgg", arg1_257, ((v1492 and v1492.AreaId) and v1492.NestId) and (v1492.AreaId .. (":" .. v1492.NestId)))
          end
        else
        end
      else
      end
      v1495 = reg.heartbeatWait
      v1495()
    end
    return fn192(arg1_257, fn187(arg1_257))
  end
  tbl9 = tbl39.AA:Section("Capture the egg", "flag")
  local v1500 = fn35("cap", tbl9:Text("Off"))
  local v1501 = fn50({name = "Capture", mover = true, gap = 0.25, pri = -1, urgent = true, ev = function()
    return true
  end})
  fn44(tbl9, "Auto capture event egg", "capture", false, function(arg1_258)
    if not (arg1_258) then
      fn51(v1501)
    end
  end)
  fn44(tbl9, "Take it from the holder", "capTake", true)
  fn47(tbl9, "Hold height", "capH", 20, 120, 45, "", 1)
  fn47(tbl9, "Keep away", "capAway", 20, 150, 45, "", 1)
  local function fn196()
    local eventCaptureTheEggUid = workspace:GetAttribute("Event_CaptureTheEggUid")
    return (((type(eventCaptureTheEggUid) == "string") and (eventCaptureTheEggUid ~= "")) and eventCaptureTheEggUid) or nil
  end
  local tbl182 = {}
  local v1502 = -9
  local function fn197()
    if (os.clock() - v1502) < 5 then
      local v1503 = tbl182
      return v1503
    end
    local v1504
    v1504, tbl182 = os.clock(), {}
    v1502 = v1504
    v1504 = reg.findInWorld
    local v1505, v1506 = v1504("Areas", "EggCarryBounds"), ipairs
    v1504 = (v1505 and v1505:GetChildren()) or {}
    for it1_62, it2_61 in v1506(v1504) do
      if (((it2_61:IsA("BasePart") and (it2_61.Name ~= "SafeZone")) and (it2_61.Position.Y > 0)) and (it2_61.Size.X > 60)) and (it2_61.Size.Z > 60) then
        it1_62 = reg.vec3
        local v1507, v1508 = it1_62(1000000000, 0, 1000000000), reg.vec3
        local v1509, v1510, v1511, tbl183 = v1508(-1000000000, 0, -1000000000), it2_61.Size / 2, ipairs, {-1, 1}
        for it1_63, it2_62 in v1511(tbl183) do
          v1505, v1508 = ipairs, {-1, 1}
          for it1_64, it2_63 in v1505(v1508) do
            it1_64, it1_63 = reg.vec3, it2_61.CFrame:PointToWorldSpace(reg.vec3(v1510.X * it2_62, 0, v1510.Z * it2_63))
            v1507, v1509 = (v1507:Min(it1_63)), (v1509:Max(it1_63))
          end
        end
        v1508 = tbl182
        v1511, tbl183 = #v1508 + 1, {lo = v1507, hi = v1509}
        tbl183.y, v1508[v1511] = it2_61.Position.Y + v1510.Y, tbl183
      end
    end
    v1504 = tbl182
    return v1504
  end
  local function fn198(arg1_259, arg2_98)
    arg2_98 = arg2_98 or 0
    for index83, item97 in ipairs(fn197()) do
      if arg1_259.X >= (item97.lo.X + arg2_98) then
        if arg1_259.X <= (item97.hi.X - arg2_98) then
          if arg1_259.Z >= (item97.lo.Z + arg2_98) then
            if arg1_259.Z <= (item97.hi.Z - arg2_98) then
              return item97
            end
          end
        end
      end
    end
  end
  local function fn199(arg1_260)
    local huge4, v1512, v1513 = math.huge, ipairs, vm[53](players:GetPlayers())
    for it1_65, it2_64 in v1512(vm:uT(v1513)) do
      it1_65 = reg.localPlayer
      local v1514, v1515 = ((it2_64 ~= it1_65) and it2_64.Character) and it2_64.Character:FindFirstChild("HumanoidRootPart"), it2_64.Character and it2_64.Character:FindFirstChildOfClass("Humanoid")
      huge4 = if v1514 then if v1515 then if v1515.Health > 0 then math.min(huge4, (v1514.Position - arg1_260).Magnitude) else huge4 else huge4 else huge4
    end
    v1513 = reg.findInWorld
    local v1516, v1517 = v1513("Areas", "GuardAreas"), ipairs
    v1513 = (v1516 and v1516:GetChildren()) or {}
    for it1_66, it2_65 in v1517(v1513) do
      v1516 = it2_65:FindFirstChild("Guard") and it2_65.Guard:FindFirstChild("HumanoidRootPart", true)
      if v1516 then
        it1_66, it2_65 = nil
        it1_66, it2_65, huge4 = reg.vec3, reg.slot21, math.min(huge4, (reg.vec3(v1516.Position.X - arg1_260.X, 0, v1516.Position.Z - arg1_260.Z).Magnitude * reg.slot21.capAway) / 32)
      else
      end
    end
    return huge4
  end
  local function fn200(arg1_261)
    local huge5, v1518, v1519 = math.huge, ipairs, vm[53](fn197())
    local v1520
    local v1521, v1522 = -1
    for it1_67, it2_66 in v1518(vm:uT(v1519)) do
      local v1523, v1524 = (it2_66.lo.Z + it2_66.hi.Z) / 2, (it2_66.hi.Z - it2_66.lo.Z) / 2
      local min2, v1525, v1526 = math.min(40, math.max(0, v1524 - 14)), it2_66.lo.X + 14, it2_66.hi.X - 14
      for i33 = v1525, v1526, 50 do
        it1_67, v1524 = ipairs, {v1523 - min2, v1523, v1523 + min2}
        for it1_68, it2_67 in it1_67(v1524) do
          it1_68 = reg.vec3
          local v1527, v1528 = reg.slot21, it1_68(i33, it2_66.y + reg.slot21.capH, it2_67)
          local v1529, magnitude3, v1530 = fn199(v1528), (v1528 - arg1_261).Magnitude, reg.slot21
          if v1529 >= (v1530.capAway + 10) then
            if magnitude3 < huge5 then
              huge5, v1520 = magnitude3, v1528
            else
            end
          else
          end
          if v1529 > v1521 then
            v1521, v1522 = v1529, v1528
          else
            if v1529 == v1521 then
              if v1522 then
                if magnitude3 < (v1522 - arg1_261).Magnitude then
                  v1521, v1522 = v1529, v1528
                else
                end
              else
              end
            else
            end
          end
        end
      end
    end
    return v1520 or v1522
  end
  local v1531
  local num51, str9 = 0, ""
  tbl41 = networking:FindFirstChild("RE/EggCapture/StandingsRefreshed")
  if tbl41 then
    fn2(tbl41.OnClientEvent, function(arg1_262)
      local v1532 = (type(arg1_262) == "table") and ((arg1_262.Entries or arg1_262.Standings) or arg1_262)
      if type(v1532) ~= "table" then
        return
      end
      str9 = ""
      arg1_262 = ipairs
      for it1_69, it2_68 in arg1_262(v1532) do
        if type(it2_68) == "table" then
          local v1533 = reg.localPlayer
          if tonumber(it2_68.UserId) == v1533.UserId then
            str9 = ("  %.1fs  #%d"):format(tonumber(it2_68.Seconds) or 0, tonumber(it2_68.Rank) or it1_69)
            break
          end
        end
      end
    end)
  end
  v1501.on = function()
    local v1534 = reg.slot21
    return v1534.capture and (fn196() ~= nil)
  end
  v1501.want = function()
    local v1535 = fn196()
    return (v1535 and fn187(v1535)) and v1535
  end
  v1501.run = function(arg1_263, arg2_99)
    if not (reg.slot14(arg2_99)) then
      return
    end
    local v1536 = reg.state
    v1536.ready(arg2_99, 3)
    local num52, num53 = 0.016666666666666666, 0
    while arg2_99() do
      local v1537, v1538 = fn187(arg1_263), reg.getRoot
      v1536 = v1538()
      if v1537 then
        if not v1536 then
          break
        end
      else
        break
      end
      local v1539, v1540 = fn191(v1537), reg.state
      v1540.godHunt = false
      if fn192(arg1_263, v1537) then
        v1538 = v1531
        local flag31, v1541 = not v1538
        if v1538 then
          v1540 = os.clock() >= num51
          if v1540 then
            local v1542 = fn198(v1531, 13)
            local flag32 = not v1542
            if v1542 then
              local v1543
              v1543, v1541 = reg.slot21, fn199(v1531) < reg.slot21.capAway
            else
              v1541 = flag32
            end
          else
            v1541 = v1540
          end
        else
          v1541 = flag31
        end
        if v1541 then
          v1531 = fn200(v1536.Position)
        end
        num51 = os.clock() + 0.25
        local v1544, v1545, v1546 = fn198(v1536.Position), v1531
        if v1545 then
          v1546 = v1545
        else
          v1541, flag31 = reg.vec3
          flag31, v1546 = reg.slot21, v1541(v1536.Position.X, ((v1544 and v1544.y) or v1536.Position.Y) + reg.slot21.capH, v1536.Position.Z)
        end
        fn193(v1546, 220, num52)
        v1500("Holding the event egg" .. str9)
      else
        if v1539 then
          v1531 = nil
          local getPlayerByUserId = players:GetPlayerByUserId(v1539)
          local v1547
          if getPlayerByUserId then
            local v1548 = reg.slot21
            v1547 = v1548.capTake
          else
            v1547 = getPlayerByUserId
          end
          local v1549
          if v1547 then
            local v1550 = reg.state
            v1549 = v1550.bat()
          else
            v1549 = v1547
          end
          v1547 = nil
          if v1549 then
            local v1551 = reg.state
            v1547 = v1551.chase(getPlayerByUserId, true)
          else
            v1547 = v1549
          end
          if v1547 then
            v1549 = reg.state
            v1549.godHunt = true
            v1500("Taking the event egg from " .. getPlayerByUserId.DisplayName)
          else
            local v1552 = fn190(arg1_263, v1537)
            if v1552 then
              if fn198(v1552) then
                local v1553 = reg.vec3
                fn193(v1552 + v1553(0, 25, 0), 400, num52)
              end
            end
            local v1554, v1555 = (getPlayerByUserId and getPlayerByUserId.DisplayName) or "Someone", reg.slot21
            local capTake, v1556 = v1555.capTake
            if capTake then
              v1552 = reg.state
              v1556 = not v1552.bat()
            else
              v1556 = capTake
            end
            v1500(v1554 .. (" has the event egg" .. ((v1556 and ", get a bat to take it") or "")))
          end
        else
          if v1537.State == "Carried" then
            v1500("Someone has the event egg")
          else
            local v1557 = fn190(arg1_263, v1537)
            if not (v1557) then
              break
            end
            local v1558 = reg.vec3
            local magnitude4, v1559 = v1558(v1557.X - v1536.Position.X, 0, v1557.Z - v1536.Position.Z).Magnitude, reg.isBeforeSeparation
            v1558 = v1559(v1536.Position)
            v1559 = nil
            if v1558 then
              local v1560 = reg.isBeforeSeparation
              v1559 = not v1560(v1557)
            else
              v1559 = v1558
            end
            v1558 = nil
            if v1559 then
              local v1561 = reg.callModule
              local v1562 = v1561("Wall", "IsSealed")
              if v1562 then
                v1558 = v1562
              else
                v1561 = reg.callModule
                v1558 = v1561("Cycle", "IsNightPhase", fn6())
              end
            else
              v1558 = v1559
            end
            if v1558 then
              v1500("Field wall is up, waiting to go out")
            else
              if (magnitude4 > 220) and (os.clock() >= num53) then
                v1500("Ragdoll jump to the event egg")
                num53 = os.clock() + 4
                if fn57(function()
                  local v1563 = fn190(arg1_263, fn187(arg1_263))
                  local v1564
                  if v1563 then
                    local v1565 = reg.vec3
                    v1564 = v1563 + v1565(0, 3, 0)
                  else
                    v1564 = v1563
                  end
                  return v1564
                end, arg2_99) then
                  num53 = os.clock() + 2
                  v1500("Landed, grabbing the event egg")
                  local v1566 = os.clock() + 8
                  while (os.clock() < v1566) and (arg2_99()) do
                    local v1567 = fn187(arg1_263)
                    if v1567 then
                      if fn192(arg1_263, v1567) then
                        break
                      elseif fn191(v1567) then
                        break
                      end
                    else
                      break
                    end
                    fn195(arg1_263, arg2_99)
                  end
                else
                end
              else
                if v1559 then
                  v1500("Leaving the base for the event egg")
                  local v1568, v1569 = reg.slot46, reg.vec3
                  v1568(v1557 + v1569(0, 2.5, 0), function()
                    return arg2_99() and not fn192(arg1_263, fn187(arg1_263))
                  end, 400)
                elseif magnitude4 <= 220 then
                  v1500("Grabbing the event egg")
                  fn195(arg1_263, arg2_99)
                else
                  local v1570 = reg.vec3
                  fn193(v1557 + v1570(0, 2.5, 0), 400, num52)
                  v1500(("Going for the event egg  %d studs"):format(magnitude4))
                end
              end
            end
          end
        end
      end
      v1538 = nil
      v1538, num52 = reg.heartbeatWait, math.clamp(reg.heartbeatWait(), 0.004166666666666667, 0.05)
    end
    local v1571 = reg.state
    v1531 = nil
    v1571.godHunt = false
    v1571 = reg.getRoot
    v1536 = v1571()
    v1571 = v1536 and fn198(v1536.Position, -4)
    if v1571 and (v1536.Position.Y > (v1571.y + 8)) then
      local v1572 = reg.vec3
      local v1573, v1574 = v1572(v1536.Position.X, v1571.y + 3.5, v1536.Position.Z), os.clock() + 1.5
      while true do
        local cond27, v1575 = os.clock() < v1574
        if cond27 then
          v1572 = reg.getRoot
          v1575 = (v1572())
        else
          v1575 = cond27
        end
        cond27 = nil
        if v1575 then
          local v1576 = reg.getRoot
          cond27 = (v1576().Position - v1573).Magnitude > 1
        else
          cond27 = v1575
        end
        if not cond27 then
          break
        end
        fn193(v1573, 160, num52)
        cond27 = nil
        cond27, num52 = reg.heartbeatWait, math.clamp(reg.heartbeatWait(), 0.004166666666666667, 0.05)
      end
    end
    v1536 = reg.getHumanoid
    v1571 = v1536()
    if v1571 then
      v1571.PlatformStand = false
    end
  end
  local v1577 = fn50({name = "CaptureInfo", gap = 1})
  v1577.on = function()
    return fn60("Event")
  end
  v1577.fn = function()
    local v1578, v1579 = (fn196() or workspace:GetAttribute("Event_CaptureTheEgg")) or workspace:GetAttribute("Event_CaptureTheEggGameplay"), reg.slot21
    if v1579.capture then
      if v1578 then
        if reg.slot4 then
          if reg.slot4.name ~= "Capture" then
            if fn196() then
              v1500("Waiting for " .. (reg.slot4.name .. " to finish"))
            elseif not reg.slot4 then
              v1500("Looking for the event egg")
            end
          elseif not reg.slot4 then
            v1500("Looking for the event egg")
          end
        elseif not reg.slot4 then
          v1500("Looking for the event egg")
        end
      else
        v1500("Waiting for Capture the egg")
      end
    else
      v1500("Off")
    end
  end
  fn49 = tbl39.AA:Section("Minigame eggs", "trophy")
  local v1580 = fn35("mg", fn49:Text("Off"))
  fn44(fn49, "Auto steal minigame egg", "minigame", true)
  local tbl184 = {{"RedLightGreenLight", "RLGL"}, {"TrexRun", "TrexRun"}}
  local v1581, flag33, num54 = fn50({name = "Minigame", gap = 0.5}), false, 0
  local function fn201()
    local v1582 = reg.state
    if v1582.mgUid then
      local v1583, v1584, find5 = reg.state, reg.state, table.find(reg.state.pick, reg.state.mgUid)
      if find5 then
        table.remove(reg.state.pick, find5)
      end
      find5 = reg.state
      find5.mgUid = nil
    end
    if flag33 then
      v1582 = reg.slot29
      if not (v1582()) then
        local v1585 = reg.state
        if v1585.autoSteal then
          flag33 = false
          fn33("mgSteal", function()
            local v1586 = reg.state
            v1586.autoSteal:Set(false)
          end)
        end
      end
    end
  end
  v1581.on = function()
    local v1587 = reg.slot21
    local minigame, v1588 = v1587.minigame
    if minigame then
      v1588 = minigame
    else
      v1587 = reg.state
      v1588 = v1587.mgUid ~= nil
    end
    return v1588
  end
  v1581.fn = function()
    local v1589
    for index84, item98 in ipairs(tbl184) do
      if (workspace:GetAttribute("Event_" .. item98[1]) == true) or (typeof(workspace:GetAttribute(item98[2] .. "_EggPosition")) == "Vector3") then
        v1589 = item98[2]
        break
      end
    end
    local v1590 = reg.slot21
    if not (v1590.minigame and v1589) then
      fn201()
      local v1591 = reg.slot21
      return v1580((v1591.minigame and "Waiting for Red Light Green Light or T-Rex Run") or "Off")
    end
    local attr, attr2, v1592 = workspace:GetAttribute(v1589 .. "_CarrierUserId"), workspace:GetAttribute(v1589 .. "_EggPosition"), reg.localPlayer
    if attr == v1592.UserId then
      return v1580("Carrying the egg home")
    end
    if type(attr) == "number" then
      if attr > 0 then
        v1590 = reg.state
        v1590.mgUid = nil
        return v1580("Another player has the egg")
      end
    end
    if typeof(attr2) ~= "Vector3" then
      fn201()
      return v1580("Waiting for the egg to land")
    end
    v1592, v1590 = pairs, reg.slot19
    local v1593, v1594, v1595 = vm[53](v1590()), 40
    for it1_70, it2_69 in v1592(vm:uT(v1593)) do
      attr = (((type(it2_69) == "table") and (it2_69.State ~= "Carried")) and (it2_69.State ~= "Claimed")) and (it2_69.BottomCFrame or it2_69.BoundsCFrame)
      it1_70, v1590 = typeof(attr) == "CFrame"
      if it1_70 then
        local v1596 = reg.vec3
        v1590 = v1596(attr.Position.X - attr2.X, 0, attr.Position.Z - attr2.Z).Magnitude
      else
        v1590 = it1_70
      end
      if v1590 then
        if v1590 < v1594 then
          it1_70 = it2_69.Uid
          v1594, v1595 = v1590, it1_70
        else
        end
      else
      end
    end
    if not (v1595) then
      fn201()
      return v1580("Egg landed, looking for it")
    end
    v1592 = reg.state
    if (v1595 ~= v1592.mgUid) or ((os.clock() - num54) > 2) then
      attr2, attr = reg.state, os.clock()
      attr2.mgUid = v1595
      num54 = attr
      v1590, v1593 = reg.state, table.find(reg.state.pick, v1595)
      if v1593 ~= 1 then
        if v1593 then
          table.remove(reg.state.pick, v1593)
        end
        table.insert(reg.state.pick, 1, v1595)
        local v1597 = reg.state
        v1597.rank.Steal = 0
        v1597 = reg.state
        v1597.order()
      end
      if reg.slot4 then
        if reg.slot4.name == "Steal" then
          local v1598 = reg.state
          if v1598.curUid ~= v1595 then
            local v1599 = reg.slot29
            if not (v1599()) then
              fn51(reg.slot4)
            end
          end
        end
      end
      local v1600 = reg.slot21
      if not (v1600.steal) then
        local v1601 = reg.state
        if v1601.autoSteal then
          flag33 = true
          fn33("mgSteal", function()
            local v1602 = reg.state
            v1602.autoSteal:Set(true)
          end)
        end
      end
    end
    v1580("Going for the " .. ((((v1589 == "RLGL") and "Red Light Green Light") or "T-Rex Run") .. " egg"))
  end
  reg.state.greenLight = function(arg1_264, arg2_100)
    local v1603 = os.clock() + 20
    while true do
      local v1604 = reg.state
      if not (((((arg1_264 == v1604.mgUid) and (workspace:GetAttribute("Event_RedLightGreenLight") == true)) and (workspace:GetAttribute("RLGL_Light") ~= "Green")) and (os.clock() < v1603)) and (arg2_100())) then
        break
      end
      v1604 = reg.slot10
      v1604("Waiting for the green light")
      v1604 = reg.heartbeatWait
      v1604()
    end
  end
end
do
  local tbl185, tbl186 = {listen = 0, wrong = 0, acks = {}, next = 0}, {}
  local v1605, v1606, v1607, v1608, v1609 = reg.vec3(6218.93, 17159.02, 16903.8), reg.vec3(6257.93, 17159.02, 16912.8), reg.vec3(6270.93, 17159.02, 16903.8), reg.vec3(6244.93, 17159.02, 16918.8), vm[53](reg.vec3(6231.93, 17159.02, 16912.8))
  vm:yT(tbl186, 0, v1605, v1606, v1607, v1608, vm:uT(v1609))
  local v1610 = reg.vec3(6244.93, 17159.02, 16880)
  local v1611 = reg.vec3(6272.46, 17164.04, 16958.18)
  local v1612 = reg.vec3(6246.9, 17161, 16887)
  local v1613 = reg.vec3(6246.9, 17165, 16881.6)
  local v1614 = reg.vec3(5905.63, 17027.3, 15610.83)
  local v1615 = reg.vec3(6248.72, 17163, 16928)
  local v1616 = reg.vec3(6248.72, 17163, 16944)
  local collectionService = fn("CollectionService")
  local function fn202()
    local v1617 = reg.slot59
    local v1618 = v1617()
    return ((v1618 and (type(v1618.BanjoCricket) == "table")) and v1618.BanjoCricket) or {}
  end
  local function fn203(arg1_265)
    local ok15, v1619 = pcall(function()
      return require(replicatedStorage.Data.BanjoCricket).PlaybackSeconds(arg1_265)
    end)
    return (ok15 and tonumber(v1619)) or ((arg1_265 * 0.65) + 0.5)
  end
  v1607 = networking:FindFirstChild("RE/BanjoCricket/Effect")
  if v1607 then
    fn2(v1607.OnClientEvent, function(arg1_266)
      if type(arg1_266) ~= "table" then
        return
      end
      if (arg1_266.Kind == "Playback") and (type(arg1_266.Notes) == "table") then
        tbl185.notes, tbl185.listen = arg1_266.Notes, os.clock() + fn203(#arg1_266.Notes)
      elseif arg1_266.Kind == "Note" then
        table.insert(tbl185.acks, {arg1_266.Mushroom, os.clock()})
        if #tbl185.acks > 40 then
          table.remove(tbl185.acks, 1)
        end
      elseif arg1_266.Kind == "Wrong" then
        tbl185.wrong = os.clock()
        tbl185.notes = nil
      elseif arg1_266.Kind == "Reset" then
        tbl185.notes = nil
      elseif arg1_266.Kind == "Solved" then
        tbl185.solved = true
      end
    end)
  end
  local function fn204(arg1_267)
    for index85, item99 in ipairs(collectionService:GetTagged("BanjoCricketMushroom")) do
      if item99:GetAttribute("MushroomIndex") == arg1_267 then
        local v1620 = item99:FindFirstChild("Hitbox") or item99:FindFirstChild("Hitbox Part")
        local ok16, v1621 = pcall(function()
          return (v1620 and v1620.Position) or item99:GetPivot().Position
        end)
        if ok16 then
          if v1621 then
            return v1621
          end
        end
      end
    end
    return tbl186[arg1_267]
  end
  local function fn205()
    local ok17, v1622 = pcall(function()
      return collectionService:GetTagged("BanjoCricketNpc")[1]:GetPivot().Position
    end)
    return (ok17 and v1622) or v1611
  end
  local function fn206(...)
    local v1623 = reg.findInWorld
    local v1624 = v1623("Build", "EnchantedTreeInterior", "Markers", ...)
    return (v1624 and v1624:IsA("BasePart")) and v1624.Position
  end
  local function fn207()
    local v1625 = reg.getRoot
    local v1626 = v1625()
    return (v1626 ~= nil) and ((v1626.Position - ((fn206("Passages", "SecretRoomSpawn") or fn206("SecretRoomSpawn")) or v1612)).Magnitude < 120)
  end
  local function fn208(arg1_268)
    local new4, tbl187, v1627 = RaycastParams.new(), {}, reg.localPlayer
    vm:yT(tbl187, 0, v1627.Character)
    new4.FilterDescendantsInstances, new4.FilterType = tbl187, Enum.RaycastFilterType.Exclude
    local v1628, v1629, raycast2 = reg.vec3, reg.vec3, workspace:Raycast(arg1_268 + reg.vec3(0, 20, 0), reg.vec3(0, -80, 0), new4)
    tbl187 = nil
    if raycast2 then
      v1627 = nil
      v1627, tbl187 = reg.vec3, raycast2.Position + reg.vec3(0, 3, 0)
    else
      tbl187 = raycast2
    end
    return tbl187 or arg1_268
  end
  local function fn209(arg1_269)
    local v1630 = reg.getRoot
    local v1631 = v1630()
    if v1631 then
      v1630 = reg.setRootCFrame
      v1630(CFrame.lookAt(v1631.Position, reg.vec3(arg1_269.X, v1631.Position.Y, arg1_269.Z)))
    end
  end
  local function fn210(arg1_270, arg2_101)
    local v1632, v1633 = fn204(arg1_270), reg.vec3
    local v1634 = v1633(v1632.X - v1610.X, 0, v1632.Z - v1610.Z)
    v1633 = (v1634.Magnitude > 0.1) and v1634.Unit
    if v1633 then
      v1634 = v1633
    else
      local v1635 = reg.vec3
      v1634 = (v1635(0, 0, 1))
    end
    v1633 = reg.slot46
    if not (v1633(fn208(v1632 + (v1634 * 6.5)), arg2_101, 60)) then
      return false
    end
    fn209(v1632)
    v1633 = reg.state
    v1632, arg2_101 = v1633.bat(), reg.getHumanoid
    v1633 = arg2_101()
    if v1632 then
      if not v1633 then
        return false
      end
    else
      return false
    end
    arg2_101 = reg.localPlayer
    if v1632.Parent ~= arg2_101.Character then
      pcall(v1633.EquipTool, v1633, v1632)
      task.wait(0.25)
    end
    fn4("RE/BanjoCricket/Aim", arg1_270)
    arg2_101 = os.clock() + 2
    while ((os.clock() < arg2_101) and (v1632:GetAttribute("CooldownActive") == true)) and (fn6() < (tonumber(v1632:GetAttribute("CooldownEndTime")) or 0)) do
      task.wait(0.05)
    end
    pcall(v1632.Activate, v1632)
    return true
  end
  local function fn211(arg1_271, arg2_102, arg3_28)
    local v1636 = os.clock() + arg3_28
    while os.clock() < v1636 do
      if tbl185.wrong > arg2_102 then
        return "wrong"
      end
      for index86, item100 in ipairs(tbl185.acks) do
        if item100[1] == arg1_271 then
          if item100[2] > arg2_102 then
            return "ok"
          end
        end
      end
      task.wait(0.05)
    end
  end
  local function fn212(arg1_272)
    local v1637 = os.clock() + 300
    tbl185.notes = nil
    local num55, num56 = 0, 0
    while arg1_272() and (os.clock() < v1637) do
      local v1638 = reg.localPlayer
      if v1638:GetAttribute("InEnchantedTree") then
        if not (fn207()) then
          return false
        end
      else
        return false
      end
      if tbl185.solved then
        return true
      elseif fn202().Solved == true then
        return true
      end
      v1638 = tbl185.notes
      if v1638 then
        if os.clock() < tbl185.listen then
          task.wait(0.05)
        else
          num56 = 0
          tbl185.notes = nil
          local v1639 = reg.slot10
          v1639(("Playing back %d notes"):format(#v1638))
          v1639 = ipairs
          for it1_71, it2_70 in v1639(v1638) do
            it1_71 = nil
            for i34 = 1, 2, 1 do
              i34 = os.clock()
              if not (fn210(it2_70, arg1_272)) then
                break
              end
              it1_71 = fn211(it2_70, i34, 1.6)
              if it1_71 then
                break
              end
            end
            if it1_71 ~= "ok" then
              it2_70 = reg.slot10
              it2_70("Missed a note, starting over", "warn")
              break
            end
          end
          num55 = os.clock()
        end
      else
        if (os.clock() - num55) > 4 then
          num56 += 1
          if num56 > 12 then
            local v1640 = reg.slot10
            v1640("The mushrooms do not answer", "warn")
            return false
          end
          local v1641 = reg.slot10
          v1641("Waking the mushrooms")
          fn210(4, arg1_272)
          num55 = os.clock()
        else
        end
        task.wait(0.1)
      end
    end
    return false
  end
  local function fn213(arg1_273)
    if fn207() then
      return true
    end
    for i35 = 1, 2, 1 do
      i35 = reg.findInWorld
      local v1642 = i35("Build", "EnchantedTreeInterior", "SecretLeapHint", "Streaks")
      local v1643, v1644 = ((v1642 and v1642:IsA("BasePart")) and v1642.Position) or v1614, reg.getRoot
      i35 = v1644()
      if not i35 then
        return false
      end
      v1642 = reg.slot10
      v1642("Flying to the Secret Leap")
      v1642, v1644 = reg.slot46, reg.vec3
      if v1642(v1644(i35.Position.X, v1643.Y + 18, i35.Position.Z), arg1_273, 120) then
        local v1645, v1646 = reg.slot46, reg.vec3
        if not (v1645(v1643 + v1646(0, 18, 0), arg1_273, 120)) then
          return false
        end
      else
        return false
      end
      v1642 = reg.slot10
      v1642("Taking the Secret Leap")
      v1643 = os.clock() + 8
      while ((os.clock() < v1643) and (arg1_273())) and not fn207() do
        task.wait(0.1)
      end
      if fn207() then
        task.wait(1)
        return true
      end
    end
    return false
  end
  local function fn214(arg1_274)
    task.wait(5)
    for i36 = 1, 3, 1 do
      local v1647, v1648 = fn205(), reg.getRoot
      i36 = v1648()
      if i36 and ((i36.Position - v1647).Magnitude > 9) then
        v1648 = reg.slot10
        v1648("Going to Jitterbug")
        local v1649 = reg.vec3
        local v1650 = v1649(v1616.X - v1647.X, 0, v1616.Z - v1647.Z)
        v1649 = (v1650.Magnitude > 0.1) and v1650.Unit
        if v1649 then
          v1650 = v1649
        else
          local v1651 = reg.vec3
          v1650 = (v1651(0, 0, -1))
        end
        local v1652, tbl188 = ipairs, {fn208(v1615), fn208(v1616), fn208(v1647 + (v1650 * 6))}
        for it1_72, it2_71 in v1652(tbl188) do
          v1649 = reg.slot46
          if not (v1649(it2_71, arg1_274, 60)) then
            return false
          end
        end
        fn209(v1647)
      end
      i36 = reg.slot10
      i36("Claiming Cricket's Banjo")
      v1648 = reg.invokeRemote
      v1647, i36 = v1648("RF/BanjoCricket/AskClaim")
      if i36 == true then
        return true
      elseif fn202().Claimed == true then
        return true
      end
      task.wait(1)
    end
    return fn202().Claimed == true
  end
  local function fn215()
    local v1653 = reg.getHumanoid
    local v1654 = v1653()
    local function fn216()
      return true
    end
    if v1654 then
      pcall(v1654.UnequipTools, v1654)
    end
    if fn207() then
      v1653, v1654 = fn206("Passages", "SecretRoomExit") or v1613, reg.slot46
      v1654(v1653, fn216, 60)
      local v1655 = os.clock() + 5
      while (os.clock() < v1655) and (fn207()) do
        local v1656, v1657 = reg.setRootCFrame, reg.cframeNew
        v1656(v1657(v1653))
        task.wait(0.1)
      end
    end
    fn216 = reg.state
    fn216.leaveTree()
  end
  local v1658 = fn50({name = "Banjo", mover = true, gap = 3, pri = 6, soft = true})
  v1658.on = function()
    local v1659 = reg.slot21
    return v1659.banjo and not tbl185.done
  end
  local function fn217(arg1_275)
    local v1660 = reg.state
    if v1660.wispSay then
      local v1661 = reg.state
      v1661.wispSay("Banjo cricket: " .. arg1_275)
    end
  end
  v1658.want = function()
    if fn202().Claimed == true then
      tbl185.done = true
      return fn217("done, Cricket's Banjo is yours")
    end
    local v1662 = reg.localPlayer
    if v1662:GetAttribute("EnchantedTreeUnlocked") ~= true then
      return fn217("needs the Enchanted Tree open (finish the wisp quest)")
    end
    v1662 = reg.state
    if not (v1662.bat()) then
      return fn217("needs a bat in your bag")
    end
    if os.clock() < tbl185.next then
      return
    end
    return true
  end
  v1658.run = function(arg1_276, arg2_103)
    arg1_276 = reg.state
    if not (arg1_276.needBody()) then
      return fn217("leaving invisibility first")
    end
    tbl185.next = os.clock() + 15
    if reg.slot14(arg2_103) then
      arg1_276 = reg.state
      if not (arg1_276.enterTree(arg2_103)) then
        return fn217("could not get into the Enchanted Tree")
      end
    else
      return fn217("could not get into the Enchanted Tree")
    end
    if not (fn213(arg2_103)) then
      fn215()
      return fn217("could not take the Secret Leap")
    end
    if fn202().Solved ~= true then
      if not (tbl185.solved) then
        if not (fn212(arg2_103)) then
          fn215()
          return fn217("puzzle not solved, trying again")
        end
      end
    end
    if fn214(arg2_103) then
      tbl185.done = true
      fn34("Banjo", "Cricket's Banjo claimed", "ok")
      fn217("done, Cricket's Banjo is yours")
    end
    fn215()
  end
end
(function()
  local collectionService2, tbl189, tbl190, tbl191, tbl192, tbl193, tbl194, tbl195, tbl196 = fn("CollectionService"), {bad = {}, fish = 0, hitAt = 0, buyAt = 0, fishAt = 0, dogAt = 0, doing = "Off"}, {at = 0, pc = {}, miss = {}}, {cd = {}, shot = 0, at = 0}, {Prep = true, Match = true, SuddenDeath = true}, {Intro = true, Reveal = true, Prep = true, Match = true, SuddenDeath = true, Win = true, Outro = true}, {Boarded = true, Departing = true, Returning = true, Respawning = true}, {"Pumpkin Moon", "Ghost Dog quest", "Halloween eggs", "Halloween monsters", "Halloween fishing"}, {"Meet the dog", "Find 4 memories", "Talk to the fisherman", "Catch the ghost dog", "Done"}
  local function fn218(arg1_277)
    local v1663 = reg.localPlayer
    return v1663:GetAttribute(arg1_277)
  end
  local function fn219(arg1_278, arg2_104)
    local ok18, v1664 = pcall(function()
      return require(replicatedStorage.Shared.Flags[arg1_278])[arg2_104]:Get()
    end)
    if ok18 then
      return v1664
    end
  end
  local function fn220(arg1_279)
    local v1665 = reg.slot59
    local v1666 = v1665()
    return v1666 and v1666[arg1_279]
  end
  local function fn221()
    return fn218("InHalloweenDimension") == true
  end
  local function fn222()
    return workspace:FindFirstChild("HalloweenDimension")
  end
  local function fn223(arg1_280)
    local v1667 = reg.vec3
    return v1667(arg1_280.X, 0, arg1_280.Z)
  end
  local function fn224(arg1_281)
    if typeof(arg1_281) ~= "Instance" then
      return nil
    end
    if arg1_281:IsA("BasePart") then
      return arg1_281.Position
    elseif arg1_281:IsA("Attachment") then
      return arg1_281.WorldPosition
    elseif arg1_281:IsA("Model") then
      return arg1_281:GetPivot().Position
    end
    return arg1_281.Parent and fn224(arg1_281.Parent)
  end
  local function fn225(arg1_282)
    if arg1_282.WalkSpeed >= 16 then
      return arg1_282.WalkSpeed
    end
    local ok19, v1669 = pcall(function()
      local v1668 = reg.localPlayer
      return require(replicatedStorage.Shared.Util.TreadmillUtil).SpeedPowerToWalkSpeed(v1668.leaderstats.Speed.Value)
    end)
    return (((ok19 and tonumber(v1669)) and (v1669 >= 16)) and v1669) or 16
  end
  local v1670 = reg.state
  v1670.normalWalk = fn225
  local function fn226(arg1_283, arg2_105, arg3_29)
    local v1671 = reg.getRoot
    if v1671() then
      if not (arg1_283) then
        return
      end
    else
      return
    end
    pcall(function()
      arg1_283.CanTouch = true
    end)
    local lookVector, v1672, now12, v1673 = arg1_283.CFrame.LookVector, (arg1_283.Size.Z / 2) + 3, os.clock(), os.clock() + 10
    local function fn227()
      return (arg2_105() or (os.clock() > v1673)) or (arg3_29 and not arg3_29())
    end
    v1671 = 1
    repeat
      for i37 = 0, 8, 1 do
        if arg2_105 and (arg2_105()) then
          return
        end
        local v1674, v1675 = reg.setRootCFrame, reg.cframeNew
        v1674(v1675(arg1_283.Position + (((lookVector * v1672) * v1671) * (1 - (i37 / 4)))))
        v1675 = reg.heartbeatWait
        v1675()
      end
      v1671 = -v1671
    until (not arg2_105 or fn227()) or ((os.clock() - now12) > 3)
    if not arg2_105 or fn227() then
      return
    end
    v1671, v1672, now12 = arg1_283.CFrame.RightVector, reg.vec3, arg1_283.Position - reg.vec3(0, (arg1_283.Size.Y / 2) - 3, 0)
    local tbl197, num57 = {{lookVector * 20, -lookVector * 20}, {-lookVector * 20, lookVector * 20}, {(lookVector * 15) - (v1671 * 12), (-lookVector * 15) + (v1671 * 12)}, {(lookVector * 15) + (v1671 * 12), (-lookVector * 15) - (v1671 * 12)}}, 0
    while not fn227() do
      lookVector = reg.getHumanoid
      v1671 = lookVector()
      if not v1671 then
        return
      end
      num57 = (num57 % #tbl197) + 1
      local v1676, v1677, v1678 = now12 + tbl197[num57][1], now12 + tbl197[num57][2], reg.setRootCFrame
      v1678(CFrame.lookAt(v1676, reg.vec3(v1677.X, v1676.Y, v1677.Z)))
      v1678 = os.clock() + 3
      while (os.clock() < v1678) and not fn227() do
        v1671:MoveTo(v1677)
        v1676 = reg.heartbeatWait
        v1676()
      end
    end
  end
  local function fn228(arg1_284)
    if arg1_284 and fireproximityprompt then
      pcall(function()
        arg1_284.HoldDuration = 0
        fireproximityprompt(arg1_284)
      end)
    end
  end
  local function fn229(arg1_285)
    local v1679, tbl198, v1680, v1681 = ipairs, {}, reg.localPlayer, reg.localPlayer
    vm:yT(tbl198, 0, v1680.Character, v1681:FindFirstChildOfClass("Backpack"))
    for it1_73, it2_72 in v1679(tbl198) do
      for index87, child26 in ipairs((it2_72 and it2_72:GetChildren()) or {}) do
        if child26:IsA("Tool") then
          if arg1_285(child26) then
            return child26
          end
        end
      end
    end
  end
  local function fn230(arg1_286)
    local v1682 = reg.getHumanoid
    local v1683 = v1682()
    if arg1_286 then
      if v1683 then
        v1682 = reg.localPlayer
        if arg1_286.Parent ~= v1682.Character then
          pcall(v1683.EquipTool, v1683, arg1_286)
        end
      end
    end
    return arg1_286
  end
  local function fn231(arg1_287, arg2_106)
    local v1684 = os.clock() + arg1_287
    while os.clock() < v1684 do
      if arg2_106 then
        if not (arg2_106()) then
          return false
        end
      end
      arg1_287 = reg.heartbeatWait
      arg1_287()
    end
    return true
  end
  local function fn232(arg1_288, arg2_107, arg3_30)
    local v1685 = os.clock() + arg2_107
    while os.clock() < v1685 do
      if arg1_288() then
        return true
      end
      if arg3_30 then
        if not (arg3_30()) then
          return false
        end
      end
      arg2_107 = reg.heartbeatWait
      arg2_107()
    end
    return arg1_288()
  end
  local function fn233(arg1_289)
    local v1686 = reg.getRoot
    local v1687 = v1686()
    if v1687 and arg1_289 then
      local v1688 = fn223(arg1_289 - v1687.Position)
      if v1688.Magnitude > 0.1 then
        pcall(function()
          local v1689 = reg.cframeNew
          v1687.CFrame = v1689(v1687.Position, v1687.Position + v1688.Unit)
        end)
      end
    end
  end
  local function fn234(arg1_290)
    local function fn235()
      local v1690 = reg.getRoot
      local v1691 = v1690()
      return ((v1691 ~= nil) and (arg1_290 ~= nil)) and ((v1691.Position - arg1_290).Magnitude > 12)
    end
    return fn235
  end
  local tbl199, tbl200, num58 = {}, {}, 0
  local function fn236(arg1_291)
    if arg1_291 then
      local v1692, v1693 = ipairs, reg.localPlayer
      local character11, v1694 = v1693.Character
      if character11 then
        v1693 = reg.localPlayer
        v1694 = v1693.Character:GetDescendants()
      else
        v1694 = character11
      end
      for it1_74, it2_73 in v1692(v1694 or {}) do
        if it2_73:IsA("BasePart") then
          if it2_73.CanCollide then
            tbl199[it2_73] = true
            it2_73.CanCollide = false
          end
        end
      end
      character11 = reg.getRoot
      v1692 = character11()
      if v1692 and ((os.clock() - num58) > 0.15) then
        num58 = os.clock()
        local new5, new6, exclude, tbl201, v1695 = RaycastParams.new(), OverlapParams.new(), Enum.RaycastFilterType.Exclude, {}, reg.localPlayer
        vm:yT(tbl201, 0, reg.localPlayer.Character)
        new5.FilterType = exclude
        new5.FilterDescendantsInstances = tbl201
        v1693, character11, v1694 = Enum.RaycastFilterType.Exclude, {}, reg.localPlayer
        vm:yT(character11, 0, reg.localPlayer.Character)
        new6.FilterType = v1693
        new6.FilterDescendantsInstances = character11
        tbl201, exclude = reg.vec3, workspace:Raycast(v1692.Position, reg.vec3(0, -12, 0), new5)
        local v1696, tbl202 = (exclude and exclude.Position.Y) or (v1692.Position.Y - 3), {}
        for index88, item101 in ipairs(workspace:GetPartBoundsInRadius(v1692.Position, 14, new6)) do
          if item101.CanCollide or tbl200[item101] then
            if item101 ~= (exclude and exclude.Instance) then
              if (item101.Position.Y + (item101.Size.Y / 2)) > (v1696 + 1.5) then
                tbl202[item101] = true
                tbl200[item101] = true
                item101.CanCollide = false
              end
            end
          end
        end
        for key44 in next, tbl200, nil do
          if not (tbl202[key44]) then
            tbl200[key44] = nil
            if key44.Parent then
              key44.CanCollide = true
            end
          end
        end
      end
    else
      for key45 in next, tbl199, nil do
        if key45.Parent then
          key45.CanCollide = true
        end
      end
      for key46 in next, tbl200, nil do
        if key46.Parent then
          key46.CanCollide = true
        end
      end
      table.clear(tbl199)
      table.clear(tbl200)
    end
  end
  fn2(fn("RunService").Stepped, function()
    if tbl189.move then
      fn236(true)
    elseif next(tbl200) then
      fn236(false)
    end
  end)
  local function fn237(arg1_292)
    tbl189.mv = (tbl189.mv or 0) + 1
    tbl189.move = true
    local ok20, v1697 = pcall(arg1_292)
    tbl189.mv = tbl189.mv - 1
    if tbl189.mv == 0 then
      tbl189.move = false
      fn236(false)
    end
    if not (ok20) then
      error(v1697, 0)
    end
    return v1697
  end
  local function fn238(arg1_293, arg2_108, arg3_31)
    local function fn239()
      local v1698 = reg.slot46
      return v1698(arg1_293, arg2_108, arg3_31)
    end
    return fn237(fn239)
  end
  local function fn240(arg1_294, arg2_109)
    local findFirstChild6 = networking:FindFirstChild(arg1_294)
    if findFirstChild6 then
      if findFirstChild6:IsA("RemoteEvent") then
        fn2(findFirstChild6.OnClientEvent, arg2_109)
      end
    end
  end
  local function fn241(arg1_295)
    return function(arg1_296)
      if arg1_296 then
        tbl189.idleUntil = 0
      else
        fn51(arg1_295)
      end
    end
  end
  local function fn242(arg1_297, arg2_110)
    local v1699 = reg.getRoot
    local v1700 = v1699()
    if v1700 then
      if not (arg1_297) then
        return false
      end
    else
      return false
    end
    if (v1700.Position - arg1_297).Magnitude > 400 then
      v1699 = reg.vec3
      return fn52(arg1_297 + v1699(0, 3, 0), arg2_110)
    end
    v1699 = reg.vec3
    return fn238(arg1_297 + v1699(0, 3, 0), arg2_110)
  end
  local function fn243(arg1_298)
    if type(arg1_298) == "table" then
      tbl190.st, tbl190.at = arg1_298, os.clock()
    end
  end
  local function fn244(arg1_299)
    if type(arg1_299) == "table" then
      tbl191.snap, tbl191.at = arg1_299, os.clock()
    end
  end
  local function fn245()
    local v1701 = fn218("TrainEventPhase")
    if v1701 ~= nil then
      return v1701
    end
    return ((tbl190.st and ((os.clock() - tbl190.at) < 10)) and tbl190.st.Phase) or nil
  end
  tbl191.me = function()
    local snap, v1702 = tbl191.snap, ipairs
    local v1703 = ((snap and (type(snap.Entries) == "table")) and snap.Entries) or {}
    for it1_75, it2_74 in v1702(v1703) do
      if type(it2_74) == "table" then
        snap = reg.localPlayer
        if it2_74.UserId == snap.UserId then
          return it2_74
        end
      end
    end
  end
  tbl191.held = function()
    local snap2 = tbl191.snap
    return (((snap2 ~= nil) and (tbl193[snap2.Phase] == true)) and ((os.clock() - tbl191.at) < 30)) and (tbl191.me() ~= nil)
  end
  v1670 = reg.state
  v1670.inDim = fn221
  local v1704 = reg.state
  v1704.only = function()
    if tbl191.held() then
      return "IslandWars"
    end
    local v1705 = fn245()
    if tbl194[v1705] then
      return "Train"
    elseif v1705 == "Town" then
      return "Train"
    else
      local v1706 = reg.localPlayer
      if v1706.Character then
        local v1707 = reg.localPlayer
        if v1707.Character:GetAttribute("TrainEventInForgottenTown") == true then
          return "Train"
        end
      end
    end
    v1705 = reg.localPlayer
    if v1705:GetAttribute("TrainEventTravelStage") == "Prepare" then
      return "Train"
    else
      local v1708 = reg.state
      if v1708.trainBoard then
        local v1709 = reg.state
        if v1709.trainBoard() then
          return "Train"
        end
      end
    end
    if tbl189.busy then
      return "Halloween"
    elseif fn218("GhostDogChase") ~= nil then
      return "Halloween"
    end
  end
  local v1710 = reg.state
  v1710.realHum = function()
    return ((tbl194[fn245()] == true) or tbl191.held()) or fn221()
  end
  local v1711 = reg.state
  v1711.highOk = function()
    local v1712 = fn245()
    local v1713, v1714 = ((fn221() or (fn218("InPumpkinArena") == true)) or (fn218("GhostDogChase") ~= nil)) or ((v1712 ~= nil) and (v1712 ~= "Home"))
    if v1713 then
      v1714 = v1713
    else
      v1712 = reg.state
      v1714 = v1712.only() ~= nil
    end
    return v1714
  end
  local function fn246()
    local v1715 = reg.slot59
    local v1716 = v1715()
    v1715 = v1716 and v1716.GuardTutorialProgress
    return (((v1716 ~= nil) and ((tonumber(v1716.SpeedPower) or 0) >= (fn219("HalloweenDimensionFlags", "SpeedPowerRequirement") or 2500000))) and (type(v1715) == "table")) and (v1715.Completed == true)
  end
  local function fn247(arg1_300)
    if fn221() then
      return true
    end
    local v1717 = reg.findInWorld
    local v1718 = v1717("HalloweenDimensionPortal")
    v1717 = v1718 and (v1718:FindFirstChild("Hitbox", true))
    if not (v1717 and (v1717:IsA("BasePart"))) then
      v1718 = reg.slot10
      v1718("Halloween portal is not here", "warn")
      return false
    end
    v1718 = reg.getRoot
    local v1719 = v1718()
    if v1719 then
      v1718 = reg.isBeforeSeparation
      if v1718(v1719.Position) then
        local v1720 = reg.slot18
        if not (v1720(arg1_300, "Halloween portal")) then
          return false
        end
      end
    end
    if not (reg.slot14(arg1_300)) then
      return false
    end
    v1718 = reg.slot15
    if not (v1718(arg1_300, true)) then
      return false
    end
    local function fn248(arg1_301)
      fn232(fn234(arg1_301), 6, arg1_300)
      fn231(1.5, arg1_300)
      arg1_301 = fn220("HalloweenDimension")
      if type(arg1_301) == "table" then
        if arg1_301.TutorialSeen ~= true then
          task.spawn(reg.invokeRemote, "RF/HalloweenDimension/AskTutorialSeen")
        end
      end
      return true
    end
    v1719 = reg.slot10
    v1719("Teleporting to the Halloween portal")
    v1718 = reg.getRoot
    v1719 = v1718()
    if v1719 then
      if (v1719.Position - v1717.Position).Magnitude > 400 then
        local v1721, v1722 = reg.vec3, v1717.Position + reg.vec3(0, 3, 0)
        if not (fn52(v1722, arg1_300)) then
          return false
        end
      end
    end
    v1719, v1718 = reg.setRootCFrame, reg.cframeNew
    v1719(v1718(v1717.Position))
    fn226(v1717, fn221, arg1_300)
    if fn232(fn221, 2, arg1_300) then
      return (fn248(v1717.Position))
    end
    if (os.clock() - (tbl189.enterReset or -99)) > 20 then
      v1717 = reg.state
      if v1717.respawn then
        tbl189.enterReset = os.clock()
        fn248 = reg.slot10
        fn248("The Halloween portal did not take you, resetting the character", "warn")
        v1718 = reg.state
        v1718.respawn(true)
        return false
      end
    end
    v1717 = reg.slot10
    v1717("The Halloween portal did not take you", "warn")
    return false
  end
  local v1723 = ((type(getgenv) == "function") and getgenv()) or _G
  local function fn249(arg1_302)
    tbl189.entering = true
    v1723.HalloweenPortalUse = os.clock() + 60
    local v1724 = reg.findInWorld
    local v1725 = v1724("HalloweenDimensionPortal", "Hitbox")
    if v1725 then
      if v1725:IsA("BasePart") then
        v1725.CanTouch = true
      end
    end
    v1724, v1725 = pcall(fn247, arg1_302)
    tbl189.entering = false
    v1723.HalloweenPortalUse = 0
    if not v1724 then
      error(v1725, 0)
    end
    return v1725
  end
  local v1726
  local function fn250()
    if v1726 == nil then
      local v1727 = reg.localPlayer
      local playerScripts = v1727:FindFirstChild("PlayerScripts")
      local v1728
      if playerScripts then
        v1727 = reg.localPlayer
        v1728 = v1727.PlayerScripts:FindFirstChild("PlayerModule")
      else
        v1728 = playerScripts
      end
      if not v1728 then
        return false
      end
      playerScripts, v1727 = pcall(function()
        return require(v1728):GetControls()
      end)
      v1726 = (playerScripts and v1727) or false
    end
    local ok21, v1730 = pcall(function()
      local v1729 = v1726 and v1726:GetMoveVector()
      return v1729
    end)
    return (ok21 and (typeof(v1730) == "Vector3")) and (v1730.Magnitude > 0.1)
  end
  local tbl203 = {Halloween = true, Train = true, Ghouler = true, IslandWars = true}
  local function fn251(arg1_303)
    if tbl189.entering then
      return true
    elseif (v1723.HalloweenPortalUse or 0) > os.clock() then
      return true
    end
    if tbl189.exitGuard then
      local v1731 = reg.getRoot
      local v1732 = v1731()
      if fn221() then
        return false
      elseif v1732 then
        if (v1732.Position - arg1_303.Position).Magnitude < 20 then
          return false
        end
      else
        return false
      end
      tbl189.exitGuard = false
    end
    arg1_303 = ((reg.slot4 == nil) or (tbl203[reg.slot4.name] == true)) or fn250()
    return arg1_303
  end
  v1670 = reg.localPlayer
  fn2(v1670:GetAttributeChangedSignal("InHalloweenDimension"), function()
    if not (fn221()) then
      tbl189.exitGuard = true
      return
    end
    if not (tbl189.entering) then
      if reg.slot4 then
        if not (tbl203[reg.slot4.name]) then
          local v1733 = reg.slot10
          v1733("Entered the dimension by accident, restarting " .. reg.slot4.name, "warn")
          fn51(reg.slot4)
        end
      end
    end
  end)
  task.spawn(function()
    while true do
      local v1734 = reg.state
      if v1734.hwPortalOff then
        break
      end
      v1734 = reg.findInWorld
      local v1735 = v1734("HalloweenDimensionPortal", "Hitbox")
      if v1735 then
        if v1735:IsA("BasePart") then
          v1734 = fn251(v1735)
          if v1735.CanTouch ~= v1734 then
            v1735.CanTouch = v1734
          end
        end
      end
      v1735 = reg.heartbeatWait
      v1735()
    end
  end)
  local v1736 = reg.state
  v1736.leaveDim = function(arg1_304)
    for i38 = 1, 2, 1 do
      if not (fn221()) then
        return true
      end
      local v1737 = fn222()
      local v1738 = v1737 and (v1737:FindFirstChild("ExitPortal", true))
      local v1739 = v1738 and (v1738:FindFirstChild("Hitbox", true))
      if v1739 then
      else
        v1738 = v1737 and (v1737:FindFirstChild("PortalHome", true))
        v1739 = v1738 and (v1738:FindFirstChild("Portal") or v1738:FindFirstChildWhichIsA("BasePart", true))
      end
      if not (v1739) then
        break
      end
      v1737 = reg.slot10
      v1737("Leaving the Halloween Dimension")
      v1738, v1737 = reg.setRootCFrame, reg.cframeNew
      v1738(v1737(v1739.Position))
      v1738 = fn224(v1739)
      fn226(v1739, function()
        return not fn221()
      end, arg1_304)
      if fn232(function()
        return not fn221()
      end, 10, arg1_304) then
        tbl189.idleUntil = math.max(tbl189.idleUntil or 0, os.clock() + 3)
        fn232(fn234(v1738), 6, arg1_304)
        v1737 = reg.state
        v1737.dimLeftAt = os.clock()
        fn231(1.5, arg1_304)
        return true
      end
      if i38 == 1 then
        if (os.clock() - (tbl189.enterReset or -99)) > 20 then
          v1737 = reg.state
          if v1737.respawn then
            tbl189.enterReset = os.clock()
            v1738 = reg.slot10
            v1738("The exit portal did not take you, resetting the character", "warn")
            local v1740 = reg.state
            v1740.respawn(true)
            fn231(1.5)
          end
        end
      end
    end
    return not fn221()
  end
  local function fn252(arg1_305)
    local v1741 = fn222()
    local v1742 = v1741 and (v1741:FindFirstChild("Zones"))
    v1742 = v1742 and (v1742:FindFirstChild(arg1_305))
    return ((v1742 and v1742:IsA("BasePart")) and v1742) or nil
  end
  local function fn253(arg1_306, arg2_111, arg3_32)
    local pointToObjectSpace = arg1_306.CFrame:PointToObjectSpace(arg2_111)
    return (math.abs(pointToObjectSpace.X) <= ((arg1_306.Size.X / 2) - (arg3_32 or 0))) and (math.abs(pointToObjectSpace.Z) <= ((arg1_306.Size.Z / 2) - (arg3_32 or 0)))
  end
  local function fn254(arg1_307)
    for i39 = 3, 1, -1 do
      local v1743 = fn252("Zone" .. i39)
      if v1743 then
        if fn253(v1743, arg1_307) then
          return i39
        end
      end
    end
    return 0
  end
  local function fn255()
    local v1744, v1745 = fn252("SafeZone"), reg.getRoot
    local v1746 = v1745()
    if v1744 then
      if not (v1746) then
        return nil
      end
    else
      return nil
    end
    local pointToObjectSpace2, max7, max8 = v1744.CFrame:PointToObjectSpace(v1746.Position), math.max((v1744.Size.X / 2) - 6, 0), math.max((v1744.Size.Z / 2) - 6, 0)
    local v1747, pointToWorldSpace, v1748 = reg.vec3, v1744.CFrame:PointToWorldSpace(reg.vec3(math.clamp(pointToObjectSpace2.X, -max7, max7), pointToObjectSpace2.Y, math.clamp(pointToObjectSpace2.Z, -max8, max8))), reg.vec3
    return v1748(pointToWorldSpace.X, v1746.Position.Y, pointToWorldSpace.Z), v1744
  end
  local tbl204 = {}
  local function fn256(arg1_308)
    local halloweenEggUid, preparedSourceName = arg1_308:GetAttribute("HalloweenEggUid"), arg1_308:GetAttribute("PreparedSourceName")
    tbl189.known = tbl189.known or {}
    if halloweenEggUid then
      if preparedSourceName then
        tbl189.known[halloweenEggUid] = preparedSourceName
      end
    end
    local v1749 = (preparedSourceName or (halloweenEggUid and tbl189.known[halloweenEggUid])) or ("Mystery Egg (Zone " .. (tostring(arg1_308:GetAttribute("Zone") or "?") .. ")"))
    if v1749 == nil then
      return tbl204[v1749] or v1749
    elseif tbl204[v1749] then
      return tbl204[v1749] or v1749
    end
    tbl204[v1749] = v1749
    pcall(function()
      local specs = require(replicatedStorage.Data.HalloweenPets).Specs
      if not (specs[v1749]) then
        for key47, item102 in next, specs, nil do
          if type(item102) == "table" then
            if item102.EggSource == v1749 then
              tbl204[v1749] = item102.Id or key47
              break
            elseif item102.EggModel == v1749 then
              tbl204[v1749] = item102.Id or key47
              break
            end
          end
        end
      end
    end)
    return tbl204[v1749]
  end
  local function fn257(arg1_309)
    local v1750 = fn256(arg1_309)
    local ok22, v1752 = pcall(function()
      local v1751 = reg.modules
      return v1751.Assets.Directory[v1750].EarningRate
    end)
    local v1753 = (arg1_309:IsA("Model") and (arg1_309:GetScale())) or 1
    return ((ok22 and tonumber(v1752)) or 0) * (((v1753 > 5) and (((v1753 / 5) ^ 1.2) * 19.637875755794113)) or (v1753 ^ 1.85))
  end
  local function fn258(arg1_310)
    if os.clock() >= (tbl189.ixAt or 0) then
      tbl189.ixAt = os.clock() + 5
      tbl189.ix = {}
      local v1754 = reg.slot59
      local v1755 = v1754() or {}
      local v1756, tbl205, tbl206 = ((type(v1755.Index) == "table") and v1755.Index) or {}, {}, {"Inventory", "EggInventory"}
      for index89, item103 in ipairs(tbl206) do
        for key48, item104 in next, ((type(v1755[item103]) == "table") and v1755[item103]) or {}, nil do
          if type(item104) == "table" then
            tbl205[(item104.Category or item104.AssetCategory) or ""] = true
          end
        end
      end
      pcall(function()
        for index90, item105 in ipairs(require(replicatedStorage.Data.HalloweenIndex).GetSections()) do
          if item105.Category == "HalloweenWorldEggs" then
            for index91, item106 in ipairs(item105.Entries) do
              if v1756[item106.AssetId] ~= true then
                if not (tbl205[item106.AssetId]) then
                  tbl189.ix[item106.AssetId] = true
                end
              end
            end
          end
        end
      end)
    end
    return tbl189.ix[arg1_310] == true
  end
  local function fn259(arg1_311)
    local v1757, v1758 = fn256(arg1_311), reg.slot21
    if v1758.hwEggOnly then
      local v1759, v1760 = reg.slot21, reg.getDisplayName
      if not (v1759.hwEggOnly[v1760(v1757)]) then
        return false
      end
    end
    v1758 = reg.slot21
    if v1758.hwMinV then
      local v1761 = reg.slot21
      if fn257(arg1_311) < v1761.hwMinV then
        return false
      end
    end
    arg1_311 = reg.slot21
    if arg1_311.hwRar then
      v1758 = fn16(v1757)
      local v1762, v1763 = (v1758 and (type(v1758.Rarity) == "table")) and (v1758.Rarity.DisplayName or v1758.Rarity._id), reg.slot21
      if not (v1763.hwRar[v1762]) then
        return false
      end
    end
    return true
  end
  local function fn260(arg1_312)
    local v1764 = fn259(arg1_312)
    local v1765
    if v1764 then
      local v1766 = reg.state
      v1765 = v1766.rank["Steal:filter"] or 9
    else
      v1765 = v1764
    end
    local v1767, v1768 = v1765 or nil, reg.slot21
    if v1768.hwIndex then
      if fn258(fn256(arg1_312)) then
        v1765 = nil
        v1765, v1767 = reg.state, math.min(v1767 or 99, reg.state.rank["Steal:hwindex"] or 9)
      else
      end
    else
    end
    return v1767
  end
  local function fn261(arg1_313)
    return fn260(arg1_313) ~= nil
  end
  local function fn262()
    local v1769, v1770 = fn222(), reg.getRoot
    local v1771, v1772 = v1770(), v1769 and (v1769:FindFirstChild("WorldEggs"))
    if v1772 then
      if not (v1771) then
        return nil
      end
    else
      return nil
    end
    local cond28, v1773, v1774 = os.clock() < (tbl189.retry or 0), ipairs, vm[53](v1772:GetChildren())
    for it1_76, it2_75 in v1773(vm:uT(v1774)) do
      v1770 = reg.state
      if v1770.hwPick then
        it1_76 = reg.state
        if it2_75:GetAttribute("HalloweenEggUid") == it1_76.hwPick then
          v1769 = it2_75:FindFirstChild("StealPrompt", true)
          if v1769 then
            if v1769.Enabled then
              tbl189.pickRank = nil
              return it2_75, fn254(fn224(it2_75))
            end
          end
          if cond28 then
            return nil
          end
        end
      end
    end
    v1769 = reg.state
    v1769.hwPick = nil
    tbl189.retry = 0
    v1774, cond28, v1769, v1773, v1770 = nil
    for index92, child27 in ipairs(v1772:GetChildren()) do
      index92 = child27:FindFirstChild("StealPrompt", true)
      local v1775 = (((index92 and index92:IsA("ProximityPrompt")) and index92.Enabled) and ((tbl189.bad[child27] or 0) < os.clock())) and fn260(child27)
      if v1775 then
        index92 = fn224(child27)
        local v1776 = index92 and (fn254(index92))
        if v1776 then
          if v1776 >= 1 then
            local magnitude5, v1777, v1778 = (index92 - v1771.Position).Magnitude, fn257(child27), (tbl189.oi or {})[child27:GetAttribute("HalloweenEggUid")] or math.huge
            if (if v1774 then v1778 < cond28 else not v1774) or ((v1778 == cond28) and ((v1775 < v1769) or ((v1775 == v1769) and ((v1777 > v1773) or ((v1777 == v1773) and (magnitude5 < v1770)))))) then
              v1774, cond28, v1769, v1773, v1770 = child27, v1778, v1775, v1777, magnitude5
            else
            end
          else
          end
        else
        end
      else
      end
    end
    tbl189.pickRank = v1769
    return v1774, (v1774 and fn254(fn224(v1774))) or 0
  end
  local v1779 = reg.state
  v1779.hwBeats = function(arg1_314, arg2_112, arg3_33)
    local v1780 = reg.state
    if v1780.hwPick then
      return true
    end
    v1780 = reg.state
    local v1781, v1782 = v1780.rank["Steal:" .. tostring(arg3_33.kind)] or 99
    if arg1_314 then
      v1782 = arg1_314
    else
      v1780 = reg.state
      v1782 = v1780.rank["Steal:filter"]
    end
    arg1_314 = v1782 or 99
    if arg1_314 ~= v1781 then
      return arg1_314 < v1781
    end
    v1780 = reg.state
    v1782, v1781 = v1780.hwTurnNow
    if v1782 then
      v1780 = reg.state
      v1781 = v1780.hwTurnNow()
    else
      v1781 = v1782
    end
    return (v1781 == true) or ((v1781 == nil) and (arg2_112 > arg3_33.v))
  end
  local function fn263(arg1_315, arg2_113)
    local v1783 = fn222()
    local v1784 = v1783 and (v1783:FindFirstChild("WorldEggs"))
    task.spawn(reg.invokeRemote, "RF/HalloweenDimension/AskDropEgg")
    local v1785, flag34, num59 = os.clock() + 3, false, 0
    while arg2_113() and (os.clock() < v1785) do
      if fn218("HalloweenCarrying") ~= true then
        flag34 = true
      else
        if flag34 then
          return true
        end
      end
      v1783 = nil
      for index93, child28 in ipairs((v1784 and v1784:GetChildren()) or {}) do
        v1783 = if child28:GetAttribute("HalloweenEggUid") == arg1_315 then child28 else v1783
      end
      local v1786 = v1783 and (v1783:FindFirstChild("StealPrompt", true))
      if flag34 then
        if v1786 then
          if v1786.Enabled then
            if (os.clock() - num59) > 0.6 then
              local now13, v1787, v1788 = os.clock(), reg.setRootCFrame, reg.cframeNew
              v1787(v1788(fn224(v1783) + reg.vec3(0, 3, 0)))
              fn228(v1786)
              num59 = now13
            else
            end
          else
          end
        else
        end
      else
      end
      v1786 = reg.heartbeatWait
      v1786()
    end
  end
  local function fn264(arg1_316, arg2_114)
    local v1789 = os.clock() + 15
    while (arg2_114() and (fn218("HalloweenCarrying") == true)) and (os.clock() < v1789) do
      local v1790 = reg.getRoot
      local v1791 = v1790()
      if not (v1791) then
        return
      end
      v1790 = reg.vec3
      local v1792 = v1790(arg1_316.X, v1791.Position.Y, arg1_316.Z) - v1791.Position
      if v1792.Magnitude < 2 then
        return true
      end
      local v1793, v1794 = reg.setRootCFrame, reg.cframeNew
      v1793(v1794(v1791.Position + (v1792.Unit * math.min(v1792.Magnitude, reg.slot21.hwStep or 40))))
      v1794 = reg.heartbeatWait
      v1794()
    end
  end
  local function fn265(arg1_317)
    local v1795 = fn218("HalloweenDelivered")
    local v1796, tbl207, carryUid, v1797, v1798 = os.clock() + 60, {}, tbl189.carryUid, fn252("SafeZone"), reg.getRoot
    local v1799 = v1798()
    tbl189.doing = "Carrying an egg to safety"
    v1798 = reg.slot10
    v1798("Halloween: carrying the egg to safety")
    v1798 = reg.slot21
    if (((v1798.hwInstant and carryUid) and v1797) and v1799) and (fn218("HalloweenCarrying") == true) then
      local pointToObjectSpace3, v1800, v1801 = v1797.CFrame:PointToObjectSpace(v1799.Position), (v1797.Size.X / 2) + 10, (v1797.Size.Z / 2) + 10
      tbl189.doing = "Carrying: instant steal"
      local v1802, pointToWorldSpace2 = reg.vec3, v1797.CFrame:PointToWorldSpace(reg.vec3(math.clamp(pointToObjectSpace3.X, -v1800, v1800), 0, math.clamp(pointToObjectSpace3.Z, -v1801, v1801)))
      fn264(pointToWorldSpace2, arg1_317)
      for i40 = 1, 4, 1 do
        v1800, pointToObjectSpace3 = os.clock() + 0.8, false
        while (arg1_317() and (fn218("HalloweenCarrying") == true)) and (os.clock() < v1800) do
          i40 = reg.getRoot
          v1801 = i40()
          if v1801 and (fn223(v1801.Position - pointToWorldSpace2).Magnitude >= 100) then
            pointToObjectSpace3 = true
            break
          end
          local v1803 = reg.heartbeatWait
          v1803()
        end
        if not pointToObjectSpace3 then
          break
        end
        tbl189.doing = "Pulled back, stepping to the safe zone edge again"
        fn264(pointToWorldSpace2, arg1_317)
      end
      if arg1_317() then
        if fn263(carryUid, arg1_317) then
          fn231(0.5, arg1_317)
        end
      end
    end
    v1799 = nil
    while (arg1_317() and (fn218("HalloweenCarrying") == true)) and (os.clock() < v1796) do
      v1798 = reg.getRoot
      v1797, carryUid = v1798(), fn252("SafeZone")
      if v1797 then
        if carryUid then
          local v1804 = reg.localPlayer
          if not (v1804.Character) then
            break
          end
        else
          break
        end
      else
        break
      end
      v1799 = v1799 or v1797.Position.Y
      local v1805 = reg.localPlayer
      for index94, child29 in ipairs(v1805.Character:GetDescendants()) do
        if child29:IsA("BasePart") then
          if child29.CanCollide then
            tbl207[child29] = true
            child29.CanCollide = false
          end
        end
      end
      local pointToObjectSpace4, v1806 = carryUid.CFrame:PointToObjectSpace(v1797.Position), reg.slot21
      v1805 = (v1806.hwInstant and 6) or 40
      local max9, max10 = math.max((carryUid.Size.X / 2) - v1805, 0), math.max((carryUid.Size.Z / 2) - v1805, 0)
      v1805, v1806 = reg.vec3, fn223(carryUid.CFrame:PointToWorldSpace(reg.vec3(math.clamp(pointToObjectSpace4.X, -max9, max9), pointToObjectSpace4.Y, math.clamp(pointToObjectSpace4.Z, -max10, max10))) - v1797.Position)
      pointToObjectSpace4, max9 = v1806.Magnitude > 3
      if pointToObjectSpace4 then
        max10 = nil
        max10, max9 = reg.slot21, v1806.Unit * math.min(fn7() * ((reg.slot21.hwInstant and 1) or 1.5), v1806.Magnitude / 0.05)
      else
        max9 = pointToObjectSpace4
      end
      max10 = nil
      if max9 then
        max10 = max9
      else
        pointToObjectSpace4 = reg.zeroVec
        max10 = pointToObjectSpace4
      end
      v1806 = reg.vec3
      v1797.AssemblyLinearVelocity = max10 + v1806(0, (v1799 - v1797.Position.Y) * 8, 0)
      v1806 = reg.heartbeatWait
      v1806()
    end
    arg1_317 = reg.getRoot
    v1799 = arg1_317()
    if v1799 then
      v1798 = reg.zeroVec
      v1799.AssemblyLinearVelocity = v1798
    end
    for key49 in next, tbl207, nil do
      if key49.Parent then
        key49.CanCollide = true
      end
    end
    if fn218("HalloweenCarrying") == true then
      if os.clock() >= v1796 then
        v1798 = reg.invokeRemote
        v1798("RF/HalloweenDimension/AskDropEgg")
      end
    end
    fn232(function()
      return fn218("HalloweenDelivered") ~= v1795
    end, 0.6)
    if fn218("HalloweenDelivered") ~= v1795 then
      carryUid, tbl207 = reg.state, reg.state
      carryUid.lastEgg, tbl207.lastEggAt = "halloween", os.clock()
      v1799 = reg.slot10
      v1799("Halloween egg secured", "ok")
    end
  end
  local function fn266(arg1_318)
    return fn237(function()
      return fn265(arg1_318)
    end)
  end
  local function fn267(arg1_319, arg2_115)
    local v1807, v1808 = fn262()
    local v1809
    if arg2_115 and arg2_115.Parent then
      v1808 = fn254(fn224(arg2_115))
      v1809 = arg2_115
    else
      v1809 = v1807
    end
    if not v1809 then
      return false
    end
    local stealPrompt = v1809:FindFirstChild("StealPrompt", true)
    tbl189.doing = "Stealing a zone " .. (v1808 .. " egg")
    arg2_115 = reg.slot10
    arg2_115("Halloween: going to a zone " .. (v1808 .. " egg"))
    local function fn268()
      return ((arg1_319() and (v1809.Parent ~= nil)) and stealPrompt.Enabled) and (fn218("HalloweenCarrying") ~= true)
    end
    arg2_115 = v1809:GetAttribute("HalloweenEggUid")
    tbl189.cur = {Uid = arg2_115, n = fn256(v1809), cat = fn256(v1809), v = fn257(v1809), s = (v1809:IsA("Model") and v1809:GetScale()) or 1, tg = true, hw = true, zone = v1808, cur = true}
    for i41 = 1, 3, 1 do
      i41 = fn224(v1809)
      if i41 then
        if not (fn268()) then
          break
        end
      else
        break
      end
      local v1810 = reg.slot21
      if v1810.hwInstant then
        local v1811 = os.clock() + 3
        while fn268() and (os.clock() < v1811) do
          local v1812 = reg.getRoot
          local v1813, v1814 = v1812(), fn224(v1809)
          if v1813 then
            if not (v1814) then
              break
            end
          else
            break
          end
          v1812 = reg.vec3
          local v1815 = (v1814 + v1812(0, 3, 0)) - v1813.Position
          if v1815.Magnitude < 3 then
            break
          end
          v1812, v1814 = reg.setRootCFrame, reg.cframeNew
          v1812(v1814(v1813.Position + (v1815.Unit * math.min(v1815.Magnitude, reg.slot21.hwStep or 40))))
          v1813 = reg.heartbeatWait
          v1813()
        end
      end
      v1810 = reg.getRoot
      local v1816 = v1810()
      if if v1816 then (v1816.Position - i41).Magnitude > 20 else not v1816 then
        v1810 = reg.vec3
        if not (fn238(i41 + v1810(0, 3, 0), fn268)) then
          break
        end
      end
      i41, v1816 = os.clock() + 4, 0
      while fn268() and (os.clock() < i41) do
        v1810 = fn224(v1809)
        if v1810 then
          local v1817, v1818, v1819 = reg.setRootCFrame, reg.cframeNew, reg.vec3
          v1817(v1818(v1810 + v1819(0, 3, 0)))
        end
        if (os.clock() - v1816) > 0.6 then
          v1816 = os.clock()
          fn228(stealPrompt)
        else
        end
        local v1820 = reg.heartbeatWait
        v1820()
      end
      if fn218("HalloweenCarrying") == true then
        break
      end
    end
    if fn218("HalloweenCarrying") == true then
      fn268 = reg.state
      if fn268.hwPick == arg2_115 then
        local v1821 = reg.state
        v1821.hwPick = nil
      end
      tbl189.carryUid = arg2_115
      local v1822 = reg.state
      local lastEggAt = v1822.lastEggAt
      fn266(arg1_319)
      if (fn218("HalloweenCarrying") ~= true) and ((tbl189.qd or 0) >= 2) then
        tbl189.bad[v1809] = os.clock() + 60
        tbl189.qd = 0
        v1822 = reg.slot10
        v1822("Halloween: that egg keeps dropping, skipping it", "warn")
      elseif fn218("HalloweenCarrying") ~= true then
        local v1823 = reg.state
        if v1823.lastEggAt == lastEggAt then
          if v1809.Parent then
            local v1824 = reg.state
            v1824.hwPick, tbl189.retry = arg2_115, os.clock() + 60
            v1824 = reg.slot10
            v1824("Halloween: dropped the egg, going back for it")
          end
        end
      end
      v1822 = reg.state
      if v1822.lastEggAt ~= lastEggAt then
        local v1825 = reg.state
        v1825.hwPick = nil
        tbl189.retry = 0
      end
    elseif v1809.Parent then
      tbl189.bad[v1809] = os.clock() + 30
    end
    tbl189.cur = nil
    return true
  end
  v1670 = reg.localPlayer
  fn2(v1670:GetAttributeChangedSignal("HalloweenCarrying"), function()
    if fn218("HalloweenCarrying") == true then
      tbl189.ca = os.clock()
    elseif tbl189.ca then
      tbl189.qd = (((os.clock() - tbl189.ca) < 0.6) and ((tbl189.qd or 0) + 1)) or 0
      tbl189.ca = nil
    end
  end)
  local function fn269(arg1_320, arg2_116)
    local ok23, v1826 = pcall(fn237, function()
      return fn267(arg1_320, arg2_116)
    end)
    tbl189.cur = nil
    if not (ok23) then
      error(v1826, 0)
    end
    return v1826
  end
  local function fn270(arg1_321)
    local v1827 = fn255()
    if not (v1827) then
      return
    end
    tbl189.doing = "Healing in the safe zone"
    local v1828 = reg.slot10
    v1828("Halloween: low health, healing in the safe zone")
    fn238(v1827, arg1_321)
    fn232(function()
      local v1829 = reg.getHumanoid
      local v1830 = v1829()
      return if v1830 then v1830.Health >= (v1830.MaxHealth * 0.85) else not v1830
    end, 25, arg1_321)
  end
  fn240("RE/HalloweenDimension/MonsterHit", function()
    tbl189.hitAt = os.clock()
  end)
  local function fn271(arg1_322)
    local new7, v1831 = RaycastParams.new(), fn222()
    new7.FilterType = Enum.RaycastFilterType.Exclude
    local tbl208, v1832 = {}, reg.localPlayer
    vm:yT(tbl208, 0, v1832.Character, v1831 and (v1831:FindFirstChild("Monsters")), v1831 and (v1831:FindFirstChild("Ghosts")))
    new7.FilterDescendantsInstances = tbl208
    v1832, v1831, tbl208 = reg.vec3, reg.vec3, workspace:Raycast(arg1_322 + reg.vec3(0, 25, 0), reg.vec3(0, -80, 0), new7)
    new7 = nil
    if tbl208 then
      local v1833 = reg.vec3
      new7 = v1833(arg1_322.X, tbl208.Position.Y + 3, arg1_322.Z)
    else
      new7 = tbl208
    end
    return new7 or arg1_322
  end
  local function fn272(arg1_323, arg2_117)
    local v1834 = reg.getRoot
    local v1835, v1836 = v1834(), reg.getHumanoid
    v1834 = v1836()
    if v1835 then
      if not v1834 then
        return
      end
    else
      return
    end
    v1836 = fn223(arg1_323 - v1835.Position)
    tbl189.ws0 = tbl189.ws0 or fn225(v1834)
    local v1837 = arg1_323.Y - v1835.Position.Y
    local v1838 = ((v1837 > 2) and math.min(v1837 * 6, 40)) or math.min(v1835.AssemblyLinearVelocity.Y, 8)
    if v1836.Magnitude > 2 then
      v1834.WalkSpeed = arg2_117
      v1837 = reg.vec3
      v1834:MoveTo(v1837(arg1_323.X, v1835.Position.Y, arg1_323.Z))
      local v1839
      v1839, v1835.AssemblyLinearVelocity = reg.vec3, (v1836.Unit * math.min(arg2_117, v1836.Magnitude / 0.05)) + reg.vec3(0, v1838, 0)
    else
      v1834:MoveTo(v1835.Position)
      local v1840 = reg.vec3
      v1835.AssemblyLinearVelocity = v1840(0, v1838, 0)
    end
  end
  local function fn273()
    local v1841 = reg.getHumanoid
    local v1842, v1843 = v1841(), reg.getRoot
    v1841 = v1843()
    if v1841 then
      v1843 = reg.vec3
      v1841.AssemblyLinearVelocity = v1843(0, math.min(v1841.AssemblyLinearVelocity.Y, 0), 0)
    end
    if v1842 then
      v1842:MoveTo((v1841 and v1841.Position) or v1842.WalkToPoint)
      if tbl189.ws0 then
        v1842.WalkSpeed = tbl189.ws0
        tbl189.ws0 = nil
      end
    end
  end
  local function fn274(arg1_324, arg2_118, arg3_34)
    local v1844 = os.clock() + 25
    while arg2_118() and (os.clock() < v1844) do
      local v1845 = reg.getRoot
      local v1846 = v1845()
      if v1846 then
        if fn223(arg1_324 - v1846.Position).Magnitude < 3 then
          if (arg1_324.Y - v1846.Position.Y) < 2 then
            break
          end
        end
      else
        break
      end
      fn272(arg1_324, arg3_34)
      v1846 = reg.heartbeatWait
      v1846()
    end
    fn273()
    return arg2_118()
  end
  local function fn275()
    if not (tbl189.bats) then
      tbl189.bats = {}
      tbl189.wpn = {}
      local v1847, v1848 = next, reg.state
      local weaponName = v1848.weaponName
      for key50 in v1847, weaponName, nil do
        v1848 = reg.modules
        local v1849 = v1848.Gears.Directory[key50]
        if type(v1849) == "table" then
          tbl189.bats[key50] = (v1849.BatControllerData ~= nil) or nil
          tbl189.wpn[key50] = ((v1849.BatControllerData or (v1849.ToolController == "Slap")) and true) or nil
        end
      end
    end
    local v1850 = reg.slot21
    local v1851, tbl209, v1852 = v1850.hwWeap or tbl189.wpn, {}, reg.localPlayer
    local character12, v1853, tbl210, v1854 = v1852.Character, ipairs, {}, reg.localPlayer
    vm:yT(tbl210, 0, character12, v1854:FindFirstChildOfClass("Backpack"))
    for it1_77, it2_76 in v1853(tbl210) do
      for index95, child30 in ipairs((it2_76 and it2_76:GetChildren()) or {}) do
        if child30:IsA("Tool") then
          if v1851[fn149(child30)] then
            if tbl189.wpn[fn149(child30)] then
              tbl209[#tbl209 + 1] = child30
            end
          end
        end
      end
    end
    if #tbl209 == 0 then
      v1853 = reg.state
      return v1853.bat()
    end
    table.sort(tbl209, function(arg1_325, arg2_119)
      return arg1_325.Name < arg2_119.Name
    end)
    tbl210 = character12 and (character12:FindFirstChildOfClass("Tool"))
    character12 = tbl210 and table.find(tbl209, tbl210)
    local function fn276(arg1_326)
      return tonumber(arg1_326:GetAttribute("CooldownEndTime")) or 0
    end
    v1853 = tbl209[1]
    if character12 then
      if #tbl209 == 1 then
        return tbl210
      elseif not ((os.clock() - (tbl189.wAt or 0)) >= 0.5) then
        if fn276(tbl210) == tbl189.wCd then
          return tbl210
        end
      end
      v1850 = nil
      for i42 = 1, #tbl209 - 1, 1 do
        v1854 = tbl209[(((character12 + i42) - 1) % #tbl209) + 1]
        v1852 = fn276(v1854) - fn6()
        if v1852 <= 0 then
          v1853 = v1854
          break
        end
        if v1850 then
          if v1852 < v1850 then
            v1853, v1850 = v1854, v1852
          else
          end
        else
          v1853, v1850 = v1854, v1852
        end
      end
    else
    end
    tbl189.wAt, tbl189.wCd = os.clock(), fn276(v1853)
    return v1853
  end
  local v1855 = reg.state
  v1855.hwNeedVis = function()
    return os.clock() < (tbl189.visUntil or 0)
  end
  local function fn277(arg1_327, arg2_120)
    tbl189.visUntil = os.clock() + 20
    local v1856 = reg.state
    if v1856.needBody then
      local v1857 = reg.state
      if not (v1857.needBody()) then
        tbl189.doing = "Turning visible " .. arg1_327
        fn231(0.5, arg2_120)
        return false
      end
    end
    return true
  end
  local function fn278(arg1_328)
    if not (fn277("to farm monsters", arg1_328)) then
      return true
    end
    local v1858 = reg.state
    local bat, v1859 = v1858.bat(), reg.getHumanoid
    v1858 = v1859()
    if not (bat) then
      tbl189.doing = "Get a bat to fight monsters"
      return false
    end
    if v1858 then
      if v1858.Health < (v1858.MaxHealth * 0.4) then
        fn270(arg1_328)
        return true
      end
    end
    v1858 = reg.getRoot
    v1859 = v1858()
    if not v1859 then
      return false
    end
    local v1860
    local huge6, tbl211, v1861, v1862 = math.huge, {Small = 12, Medium = 28, Large = 65}, ipairs, vm[53](collectionService2:GetTagged("HalloweenMonster"))
    for it1_78, it2_77 in v1861(vm:uT(v1862)) do
      v1858, it1_78 = it2_77:IsDescendantOf(workspace) and (it2_77:GetAttribute("KilledBy") == nil)
      if v1858 then
        local v1863 = reg.slot21
        local hwMonKinds = v1863.hwMonKinds
        v1863 = not hwMonKinds
        if hwMonKinds then
          local v1864 = reg.slot21
          it1_78 = v1864.hwMonKinds[it2_77.Name]
        else
          it1_78 = v1863
        end
      else
        it1_78 = v1858
      end
      local v1865 = it1_78 and (fn224(it2_77))
      local v1866, v1867 = v1865 and (v1865 - v1859.Position).Magnitude
      if v1866 then
        it1_78 = reg.slot21
        v1867 = ((it1_78.hwMonOrder == "Most tokens") and (v1866 - ((tbl211[it2_77:GetAttribute("MonsterSize")] or 0) * 1000))) or v1866
      else
        v1867 = v1866
      end
      if (v1867 and (v1867 < huge6)) and not (fn252("SafeZone") and fn253(fn252("SafeZone"), v1865)) then
        v1860 = it2_77
        huge6 = v1867
      else
      end
    end
    huge6 = (v1860 and (fn224(v1860) - v1859.Position).Magnitude) or huge6
    if not v1860 then
      return false
    end
    tbl189.doing = "Fighting " .. (tostring(v1860:GetAttribute("MonsterSize") or "a") .. " monster")
    local function fn279()
      local v1868, v1869 = ((arg1_328() and (v1860.Parent ~= nil)) and (v1860:GetAttribute("KilledBy") == nil)) and (fn218("HalloweenCarrying") ~= true)
      if v1868 then
        local v1870 = reg.getHumanoid
        local v1871 = v1870()
        v1870 = not v1871
        if v1871 then
          local v1872, v1873 = reg.getHumanoid
          v1873, v1869 = reg.getHumanoid, v1872().Health >= (reg.getHumanoid().MaxHealth * 0.4)
        else
          v1869 = v1870
        end
      else
        v1869 = v1868
      end
      return v1869
    end
    v1861 = fn224(v1860)
    if huge6 > 30 then
      tbl211 = reg.slot21
      if not (fn274(fn271(v1861), fn279, tbl211.hwMonSp)) then
        return true
      end
    end
    v1858 = os.clock() + 15
    while fn279() and (os.clock() < v1858) do
      v1861, v1859 = fn224(v1860), reg.getRoot
      v1862 = v1859()
      if v1861 then
        if not v1862 then
          break
        end
      else
        break
      end
      tbl211 = fn223(v1862.Position - v1861)
      local v1874, v1875 = (tbl211.Magnitude > 0.1) and tbl211.Unit
      if v1874 then
        v1875 = v1874
      else
        local v1876 = reg.vec3
        v1875 = (v1876(0, 0, 1))
      end
      v1874 = reg.slot21
      fn272(fn271(v1861 + (v1875 * 4)), v1874.hwMonSp)
      fn233(v1861)
      v1875 = fn275() or bat
      fn230(v1875)
      if tbl189.bats then
        if not (tbl189.bats[fn149(v1875)]) then
          v1874 = reg.localPlayer
          if v1875.Parent == v1874.Character then
            if fn6() >= (tonumber(v1875:GetAttribute("CooldownEndTime")) or 0) then
              if (os.clock() - (tbl189.trig or 0)) > 0.1 then
                if (os.clock() - (tbl189.wAt or 0)) > 0.15 then
                  tbl189.trig = os.clock()
                  fn4("RE/ToolTrigger/Trigger", v1875)
                end
              end
            end
          end
        end
      end
      v1875 = reg.heartbeatWait
      v1875()
    end
    fn273()
    return true
  end
  local function fn280(arg1_329)
    return fn237(function()
      return fn278(arg1_329)
    end)
  end
  local function fn281(arg1_330)
    local v1877 = fn222()
    if not (v1877) then
      return false
    end
    local altar = v1877:FindFirstChild("Altar")
    altar = altar and (altar:FindFirstChild("PumpkinDeposit"))
    if fn218("HalloweenPumpkinCarrying") == true then
      tbl189.doing = "Bringing a pumpkin to the altar"
      if altar and (altar:GetAttribute("Open") ~= false) then
        local function fn282()
          return arg1_330() and (fn218("HalloweenPumpkinCarrying") == true)
        end
        local v1878, v1879 = reg.vec3, (fn224(altar:FindFirstChild("Target")) or altar.Position) + reg.vec3(0, 3, 0)
        fn237(function()
          local v1880 = reg.slot21
          return fn274(v1879, fn282, v1880.hwPumpSp)
        end)
        for i43 = 1, 4, 1 do
          if not (fn282()) then
            break
          end
          local v1881, v1882 = reg.setRootCFrame, reg.cframeNew
          v1881(v1882(altar.Position + reg.vec3(0, 3, 0)))
          fn226(altar)
          fn228(altar:FindFirstChildWhichIsA("ProximityPrompt", true))
          fn231(0.3, fn282)
        end
      else
        fn231(0.5, arg1_330)
      end
      return true
    end
    local runawayPumpkins, v1883 = v1877:FindFirstChild("RunawayPumpkins"), reg.getRoot
    local v1884, v1885, v1886 = v1883(), math.huge
    for index96, child31 in ipairs((runawayPumpkins and runawayPumpkins:GetChildren()) or {}) do
      v1877 = child31:IsA("Model") and child31:FindFirstChild("CatchPrompt", true)
      v1883 = (v1877 and v1877.Enabled) and fn224(child31)
      index96 = (v1883 and v1884) and (v1883 - v1884.Position).Magnitude
      if index96 then
        if index96 < v1885 then
          v1885, v1886 = index96, child31
        else
        end
      else
      end
    end
    if not (v1886) then
      tbl189.doing = "Looking for pumpkins"
      return false
    end
    tbl189.doing = "Catching a pumpkin"
    v1884 = os.clock() + 10
    tbl189.move = true
    while (((arg1_330() and v1886.Parent) and (v1886:FindFirstChild("CatchPrompt", true))) and (os.clock() < v1884)) and (fn218("HalloweenPumpkinCarrying") ~= true) do
      v1883, runawayPumpkins = fn224(v1886), reg.getRoot
      v1877 = runawayPumpkins()
      if v1883 then
        if not v1877 then
          break
        end
      else
        break
      end
      local v1887, catchPrompt = v1883 - v1877.Position, v1886:FindFirstChild("CatchPrompt", true)
      if catchPrompt then
        if catchPrompt:IsA("ProximityPrompt") then
          if v1887.Magnitude <= (catchPrompt.MaxActivationDistance + 2) then
            fn228(catchPrompt)
          end
        end
      end
      catchPrompt = reg.slot21
      fn272(v1883, catchPrompt.hwPumpSp)
      catchPrompt = reg.heartbeatWait
      catchPrompt()
    end
    tbl189.move = false
    fn236(false)
    fn273()
    v1884 = reg.getRoot
    runawayPumpkins = v1884()
    if runawayPumpkins then
      v1877 = reg.zeroVec
      runawayPumpkins.AssemblyLinearVelocity = v1877
    end
    return true
  end
  local function fn283(arg1_331)
    local v1888 = fn222()
    local v1889 = v1888 and (v1888:FindFirstChild("GhostDogQuest"))
    v1889 = v1889 and (v1889:FindFirstChild("Markers"))
    v1888 = v1889 and (v1889:FindFirstChild(arg1_331))
    return ((v1888 and v1888:IsA("BasePart")) and v1888) or nil
  end
  local function fn284(arg1_332, arg2_121)
    local v1890 = fn283(arg1_332)
    local cond29, v1891 = v1890 ~= nil
    if cond29 then
      arg1_332 = nil
      arg1_332, v1891 = reg.vec3, fn238(v1890.Position + reg.vec3(0, 3, 0), arg2_121)
    else
      v1891 = cond29
    end
    return v1891
  end
  local function fn285(arg1_333, arg2_122, arg3_35)
    local v1892, v1893
    for i44 = 1, 3, 1 do
      local v1894, v1895, v1896 = reg.invokeRemote
      v1895, v1895, v1896 = v1894("RF/GhostDogQuest/Talk", arg2_122)
      if v1895 then
        v1892, v1893 = v1895, v1896
        break
      elseif type(v1896) == "string" then
        if not (v1896:lower():find("closer")) then
          v1892, v1893 = v1895, v1896
          break
        end
      else
        v1892, v1893 = v1895, v1896
        break
      end
      fn284(arg1_333, arg3_35)
      fn231(0.4, arg3_35)
      v1892, v1893 = v1895, v1896
    end
    return v1892, v1893
  end
  local function fn286()
    local v1897 = fn220("GhostDogQuest")
    return ((type(v1897) == "table") and tonumber(v1897.Stage)) or 0, ((type(v1897) == "table") and v1897) or {}
  end
  local function fn287()
    return fn229(function(arg1_334)
      return arg1_334:GetAttribute("GhostDogRod") == true
    end)
  end
  local function fn288()
    local v1898, v1899 = fn286()
    local num60 = 0
    for key51 in next, ((type(v1899.Artifacts) == "table") and v1899.Artifacts) or {}, nil do
      num60 += 1
    end
    return ((v1898 * 10) + num60) + ((fn287() and 5) or 0)
  end
  local function fn289(arg1_335, arg2_123, arg3_36)
    local ok24, v1900 = pcall(require, replicatedStorage.Data.GhostDogQuest)
    local function fn290(arg1_336)
      local ok25, v1901 = pcall(v1900.ChaseFrame, arg1_335, arg1_336)
      return ((ok25 and (typeof(v1901) == "CFrame")) and v1901) or nil
    end
    if ok24 then
      if type(v1900) == "table" then
        if not (fn290(0)) then
          return false
        end
      else
        return false
      end
    else
      return false
    end
    tbl189.busy = true
    tbl189.doing = "Underwater chase"
    ok24 = reg.slot10
    ok24("Ghost Dog: underwater chase")
    local ok26, v1918 = pcall(function()
      fn232(function()
        local v1902 = reg.getRoot
        local v1903, v1904 = v1902(), fn290(0)
        return (v1903 and v1904) and ((v1903.Position - v1904.Position).Magnitude < 40)
      end, 8, arg3_36)
      local v1905 = reg.getHumanoid
      local v1906, cFrame2 = v1905(), CFrame.Angles(-1.2566, 0, 0)
      if v1906 then
        v1906.PlatformStand = true
      end
      v1906 = os.clock() + 4
      while arg3_36() and (os.clock() < v1906) do
        v1905 = reg.setRootCFrame
        v1905(fn290(0) * cFrame2)
        local v1907 = reg.heartbeatWait
        v1907()
      end
      v1906, v1905 = os.clock(), arg2_123 * (fn219("GhostDogQuestFlags", "ChaseSpeed") or 58)
      while arg3_36() and (fn218("GhostDogChase") ~= nil) do
        local min3 = math.min((os.clock() - v1906) * (fn219("GhostDogQuestFlags", "ChaseSpeed") or 58), v1905)
        local v1908 = fn290(min3)
        if v1908 then
          local v1909 = reg.setRootCFrame
          v1909(v1908 * cFrame2)
        end
        if min3 >= v1905 then
          break
        end
        min3 = reg.heartbeatWait
        min3()
      end
      v1906 = false
      for i45 = 1, 8, 1 do
        local v1910 = reg.invokeRemote
        local v1911, v1912 = v1910("RF/GhostDogQuest/Claim")
        if v1912 == true then
          v1906 = true
          break
        end
        if i45 == 4 then
          v1910 = os.clock() + 5
          while os.clock() < v1910 do
            v1912 = fn290(v1905)
            if v1912 then
              local v1913 = reg.setRootCFrame
              v1913(v1912 * cFrame2)
            end
            local v1914 = reg.heartbeatWait
            v1914()
          end
        else
          task.wait(0.7)
        end
      end
      task.wait((v1906 and 3) or 0.5)
      for i46 = 1, 3, 1 do
        cFrame2 = reg.invokeRemote
        i46, v1905 = cFrame2("RF/GhostDogQuest/Surface")
        if v1905 == true then
          break
        end
        task.wait(0.5)
      end
      fn232(function()
        local v1915, v1916 = fn283("ReturnSpot"), reg.getRoot
        local v1917 = v1916()
        return if v1915 then v1917 and ((v1917.Position - v1915.Position).Magnitude < 25) else not v1915
      end, 6)
      return v1906
    end)
    ok24 = reg.getHumanoid
    local v1919 = ok24()
    if v1919 then
      v1919.PlatformStand = false
    end
    ok24 = reg.invokeRemote
    ok24("RF/GhostDogQuest/Abort")
    tbl189.busy = false
    return ok26 and v1918
  end
  local function fn291(arg1_337)
    local ok27, v1920 = pcall(require, replicatedStorage.Controllers.Game.FishingController[arg1_337])
    return (ok27 and v1920) or nil
  end
  local function fn292(arg1_338, arg2_124)
    local v1921 = reg.getRoot
    if not (v1921()) then
      return nil
    end
    fn233(arg1_338)
    local v1922, v1923, v1924, v1925, v1926 = reg.slot21, 1.2 * ((({["x1.2"] = 1, ["x1.1"] = 0.5, ["x1.0 Fastest"] = 0.02})[reg.slot21.hwLuck] or 0.875) ^ 0.7142857142857143), fn291("Ui"), pcall(require, replicatedStorage.Shared.Util.Fishing)
    local ok28, v1927 = pcall(require, replicatedStorage.Shared.Flags.FishingFlags)
    fn4("RE/Fishing/Hold")
    local now14, flag35 = os.clock(), false
    while (os.clock() - now14) < v1923 do
      if not (arg2_124()) then
        if v1924 then
          pcall(v1924.ShowCharge, false)
        end
        return nil
      end
      v1921 = (((os.clock() - now14) - v1923) + 0.25) / 0.2
      if v1924 then
        if v1925 then
          if v1921 >= 0 then
            if flag35 then
            else
              pcall(v1924.ShowCharge, true, (ok28 and v1927.PerfectMin:Get()) or 0.8, (ok28 and v1927.PerfectMax:Get()) or 0.95)
              flag35 = true
            end
            local v1928, v1929 = v1926.ChargeAt(v1923) * math.min(v1921, 1), reg.localPlayer
            local character13, v1930 = v1929.Character
            if character13 then
              v1929 = reg.localPlayer
              v1930 = v1929.Character:FindFirstChild("Head")
            else
              v1930 = character13
            end
            character13 = workspace.CurrentCamera
            v1929 = v1930 and character13:WorldToViewportPoint(v1930.Position)
            pcall(v1924.SetCharge, v1928, v1926.LuckText(v1926.LuckFor(v1928)), v1926.IsPerfect(v1928), v1929 and Vector2.new(v1929.X / character13.ViewportSize.X, v1929.Y / character13.ViewportSize.Y))
          else
          end
        else
        end
      else
      end
      local v1931 = reg.heartbeatWait
      v1931()
    end
    if v1924 then
      pcall(v1924.ShowCharge, false)
      ok28 = reg.localPlayer
      now14, v1927 = ok28.Character
      if now14 then
        v1921 = reg.localPlayer
        v1927 = v1921.Character:FindFirstChild("Head")
      else
        v1927 = now14
      end
      if v1927 then
        if v1925 then
          if v1926.IsPerfect(v1926.ChargeAt(v1923)) then
            arg2_124 = workspace.CurrentCamera
            local v1932, worldToViewportPoint = reg.vec3, arg2_124:WorldToViewportPoint(v1927.Position + reg.vec3(0, 2.6, 0))
            pcall(v1924.Perfect, Vector2.new(worldToViewportPoint.X / arg2_124.ViewportSize.X, worldToViewportPoint.Y / arg2_124.ViewportSize.Y))
          end
        end
      end
    end
    v1925 = reg.invokeRemote
    ok28, arg2_124, v1921 = v1925("RF/Fishing/Cast", v1923, arg1_338)
    if type(arg2_124) ~= "table" then
      v1925 = reg.slot10
      v1925("Fishing: " .. tostring(v1921 or "no answer"), "warn")
    end
    return ((type(arg2_124) == "table") and arg2_124) or nil, v1921
  end
  local function fn293(arg1_339, arg2_125, arg3_37)
    if not (fn231(3.5, arg3_37)) then
      local v1933 = reg.invokeRemote
      v1933("RF/GhostDogQuest/Abort")
      return false
    end
    local v1934 = reg.invokeRemote
    v1934("RF/GhostDogQuest/Dive")
    return fn289(arg1_339, arg2_125, arg3_37)
  end
  local function fn294(arg1_340, arg2_126)
    if not (fn231((tonumber(arg1_340.Wait) or 3) + 0.45, arg2_126)) then
      return
    end
    local v1935 = reg.invokeRemote
    local v1936, v1937 = v1935("RF/GhostDogQuest/Cast", arg1_340.Id)
    if type(v1937) ~= "number" then
      v1935 = reg.invokeRemote
      v1935("RF/GhostDogQuest/Abort")
      return
    end
    if fn293(v1937, fn219("GhostDogQuestFlags", "FishChaseSeconds") or 25, arg2_126) then
      fn34("Fishing", "Caught a Ghost Fish!", "ok")
    end
  end
  local function fn295(arg1_341)
    local v1938, v1939 = fn286()
    local v1940 = fn288()
    local v1941
    tbl189.doing = "Ghost Dog quest, step " .. (v1938 + 1)
    if v1938 == 0 then
      if fn284("DogSpot", arg1_341) then
        v1941 = fn285("DogSpot", "Dog", arg1_341)
        fn232(function()
          return fn286() >= 1
        end, 5, arg1_341)
      else
      end
    else
      if v1938 == 1 then
        local v1942, tbl212, flag36 = ipairs, {"Collar", "Bone", "Toy", "Photo"}, true
        for it1_79, it2_78 in v1942(tbl212) do
          if (type(v1939.Artifacts) == "table") and v1939.Artifacts[it2_78] then
          else
            flag36 = false
            if arg1_341() then
              if fn284("Artifact_" .. it2_78, arg1_341) then
                fn231(0.3, arg1_341)
                it1_79 = reg.invokeRemote
                local v1943, v1944 = it1_79("RF/GhostDogQuest/Collect", it2_78)
                fn231(0.5, arg1_341)
                v1941 = v1944
              else
              end
            else
            end
          end
        end
        if flag36 then
          if fn284("DogSpot", arg1_341) then
            v1942 = fn285("DogSpot", "Dog", arg1_341)
            fn232(function()
              return fn286() >= 2
            end, 5, arg1_341)
            v1941 = v1942
          else
          end
        else
        end
      else
        local v1945 = (v1938 == 2) or ((v1938 == 3) and not fn287())
        if v1945 then
          if fn284("FishermanSpot", arg1_341) then
            v1941 = fn285("FishermanSpot", "Fisherman", arg1_341)
            if (v1941 == "FisherReunion") or (v1941 == "FisherHint") then
              fn231(2.5, arg1_341)
              v1941 = fn285("FishermanSpot", "Rod", arg1_341)
              fn232(function()
                return fn287() ~= nil
              end, 5, arg1_341)
            else
            end
          else
          end
        else
          if v1938 == 3 then
            local v1946 = fn283("CastTarget")
            if v1946 then
              if fn284("CastSpot", arg1_341) then
                fn230(fn287())
                fn231(0.5, arg1_341)
                local v1947 = fn292(v1946.Position, arg1_341)
                if v1947 and (v1947.Mode == "Quest") then
                  fn231((tonumber(v1947.Wait) or 3) + 0.45, arg1_341)
                  fn4("RE/Fishing/Cancel", v1947.Id)
                  local v1948 = reg.invokeRemote
                  local v1949, v1950 = v1948("RF/GhostDogQuest/Cast")
                  if type(v1950) == "number" then
                    if fn293(v1950, fn219("GhostDogQuestFlags", "ChaseSeconds") or 50, arg1_341) then
                      fn34("Ghost Dog", "Phantom Express Ticket unlocked", "ok")
                    end
                  end
                elseif v1947 then
                  if v1947.Id then
                    fn4("RE/Fishing/Cancel", v1947.Id)
                  end
                end
              end
            end
          end
        end
      end
    end
    if fn288() == v1940 then
      tbl189.dogAt = os.clock() + 20
      if type(v1941) == "string" then
        arg1_341 = reg.slot10
        arg1_341("Ghost Dog: " .. v1941, "warn")
      end
    end
    return true
  end
  local function fn296(arg1_342)
    local new8 = RaycastParams.new()
    new8.FilterType = Enum.RaycastFilterType.Exclude
    local tbl213, v1951 = {}, reg.localPlayer
    vm:yT(tbl213, 0, v1951.Character)
    for i47 = 1, 6, 1 do
      new8.FilterDescendantsInstances = tbl213
      local v1952, v1953, raycast3 = reg.vec3, reg.vec3, workspace:Raycast(arg1_342 + reg.vec3(0, 40, 0), reg.vec3(0, -180, 0), new8)
      if not (raycast3) then
        return nil
      end
      v1951 = raycast3.Instance
      if raycast3.Material == Enum.Material.Water then
        return raycast3.Position
      elseif v1951:GetAttribute("TerrainRole") == "Basin" then
        return raycast3.Position
      elseif v1951:GetAttribute("FishingWater") then
        return raycast3.Position
      elseif collectionService2:HasTag(v1951, "FishingWater") then
        return raycast3.Position
      end
      if v1951:IsA("BasePart") then
        if not (v1951.Transparency >= 0.95) then
          return nil
        end
      else
        return nil
      end
      tbl213[#tbl213 + 1] = v1951
    end
  end
  local tbl214, v1954 = {}, reg.runService
  fn2(v1954.Stepped, function()
    if tbl189.pin then
      local v1955, v1956 = ipairs, vm[53](players:GetPlayers())
      for it1_80, it2_79 in v1955(vm:uT(v1956)) do
        it1_80 = reg.localPlayer
        local v1957 = (it2_79 ~= it1_80) and it2_79.Character
        if v1957 then
          for index97, child32 in ipairs(v1957:GetChildren()) do
            if child32:IsA("BasePart") then
              if child32.CanCollide then
                tbl214[child32] = true
                child32.CanCollide = false
              end
            end
          end
        end
      end
    elseif next(tbl214) then
      for key52 in next, tbl214, nil do
        if key52.Parent then
          key52.CanCollide = true
        end
      end
      table.clear(tbl214)
    end
  end)
  v1670 = reg.runService
  fn2(v1670.Stepped, function()
    local pin, v1958, v1959 = tbl189.pin, tbl189.pin
    if v1958 then
      local v1960 = reg.getRoot
      v1959 = (v1960())
    else
      v1959 = v1958
    end
    if v1959 then
      v1959.CFrame = pin
      v1958 = reg.zeroVec
      v1959.AssemblyLinearVelocity = v1958
      local v1961 = reg.zeroVec
      v1959.AssemblyAngularVelocity = v1961
    end
  end)
  local function fn297(arg1_343, arg2_127)
    local new9, tbl215 = RaycastParams.new(), {}
    for index98, item107 in ipairs(players:GetPlayers()) do
      if item107.Character then
        tbl215[#tbl215 + 1] = item107.Character
      end
    end
    new9.FilterType = Enum.RaycastFilterType.Exclude
    new9.FilterDescendantsInstances = tbl215
    new9.RespectCanCollide = true
    local v1962, v1963, raycast4, v1964 = reg.vec3, reg.vec3, workspace:Raycast(arg1_343.Position + reg.vec3(0, 4, 0), reg.vec3(0, -20, 0), new9), reg.getHumanoid
    tbl215 = v1964()
    new9, v1964 = (raycast4 and ((raycast4.Position.Y + ((tbl215 and tbl215.HipHeight) or 2)) + (arg1_343.Size.Y / 2))) or arg1_343.Position.Y, reg.vec3
    raycast4 = v1964(arg1_343.Position.X, new9, arg1_343.Position.Z)
    if tbl215 then
      v1964 = reg.zeroVec
      tbl215:Move(v1964)
      tbl215:MoveTo(raycast4)
    end
    arg1_343 = reg.vec3
    return CFrame.lookAt(raycast4, arg1_343(arg2_127.X, new9, arg2_127.Z))
  end
  local v1965
  local function fn298(arg1_344)
    local ok29, v1966 = pcall(v1965, arg1_344)
    tbl189.pin = nil
    if not (ok29) then
      error(v1966, 0)
    end
    return v1966
  end
  v1965 = function(arg1_345)
    if not (fn277("to fish", arg1_345)) then
      return true
    end
    if fn286() == 3 then
      tbl189.doing = "Ghost Dog quest blocks fishing, casting at the ripples"
      return fn295(arg1_345)
    end
    local num61, flag37 = 0, false
    local function fn299()
      local v1967 = reg.slot21
      if v1967.hwEggs then
        local v1968, v1969 = reg.state, reg.state
        if v1968.rank["HW:Halloween eggs"] < v1969.rank["HW:Halloween fishing"] then
          if os.clock() >= num61 then
            local v1970, cond30 = os.clock() + 0.5, fn262() ~= nil
            num61, flag37 = v1970, cond30
          end
        end
      end
      v1967 = arg1_345() and not flag37
      return v1967
    end
    local v1971 = fn287()
    if not (v1971) then
      return false
    end
    if os.clock() < tbl189.fishAt then
      if (tbl189.fishAt - os.clock()) > 5 then
        return false
      end
      fn231(tbl189.fishAt - os.clock(), fn299)
      return true
    end
    local v1972 = reg.getRoot
    local v1973, v1974 = v1972(), fn283("ReturnSpot")
    if not (v1973) then
      return false
    end
    v1972 = v1974 and ((fn223(v1973.Position - v1974.Position).Magnitude > 8) or ((v1974.Position.Y + 1) > v1973.Position.Y))
    if v1972 then
      tbl189.doing = "Going to the fishing spot"
      local function fn300()
        local v1975, v1976 = reg.vec3, v1974.Position + reg.vec3(0, 3, 0)
        return fn274(v1976, fn299, 300)
      end
      return fn237(fn300)
    end
    local v1977, ghostFisherman = fn283("CastTarget"), workspace:FindFirstChild("GhostFisherman")
    local v1978
    local v1979, v1980 = ((ghostFisherman and ghostFisherman:IsA("Model")) and ghostFisherman:GetPivot().LookVector) or (v1974 and v1974.CFrame.LookVector)
    if v1979 then
      v1980 = v1979
    else
      v1972 = reg.vec3
      v1980 = (v1972(0, 0, -1))
    end
    v1972 = math.atan2(v1980.Z, v1980.X)
    for i48 = 0, 12, 1 do
      v1979 = v1972 + (((((((i48 % 2) == 0) and 1) or -1) * math.ceil(i48 / 2)) * 3.141592653589793) / 18)
      v1980, ghostFisherman, i48 = reg.vec3, reg.slot21, fn296(v1973.Position + (reg.vec3(math.cos(v1979), 0, math.sin(v1979)) * (10 + (32 * (({["x1.2"] = 1, ["x1.1"] = 0.5, ["x1.0 Fastest"] = 0.02})[reg.slot21.hwLuck] or 0.875)))))
      if i48 and not (v1977 and (fn223(i48 - v1977.Position).Magnitude < 12)) then
        v1978 = i48
        break
      end
    end
    if not v1978 then
      tbl189.doing = "Looking for water to fish"
      fn231(1, fn299)
      return true
    end
    tbl189.pin = fn297(v1973, v1978)
    v1977 = reg.slot21
    tbl189.doing = "Casting (" .. ((v1977.hwLuck or "x1.5 Perfect") .. ")")
    fn230(v1971)
    v1979, v1972 = fn292(v1978, fn299)
    tbl189.fishAt = os.clock() + 1.2
    if not v1979 then
      tbl189.fishAt = os.clock() + ((tostring(v1972):lower():find("closed") and 30) or 3)
      return true
    end
    local v1981, v1982 = tonumber(v1979.Wait) or 3, fn291("Line")
    local v1983, rodTip = fn291("Ui"), v1971:FindFirstChild("RodTip", true)
    local v1984, v1985 = (rodTip and rodTip:IsA("Attachment")) and rodTip.WorldPosition
    if v1984 then
      v1985 = v1984
    else
      v1971 = nil
      v1971, v1985 = reg.vec3, v1973.Position + reg.vec3(0, 4, 0)
    end
    local flag38, v1986 = false
    if v1982 then
      flag38, v1986 = pcall(v1982.Spawn, rodTip, v1985)
    else
    end
    v1986 = flag38 and v1986
    local v1987, flag39, flag40 = v1986 or nil, true, false
    if v1987 then
      task.spawn(function()
        pcall(v1982.Fly, v1987, v1985, v1978, 0.75, function()
          return flag39
        end)
        local now15 = os.clock()
        while flag39 and v1987.Parent do
          pcall((flag40 and v1982.Thrash) or v1982.Float, v1987, v1978, (flag40 and 1) or (os.clock() - now15), 0)
          task.wait((flag40 and 0.06) or nil)
        end
      end)
    end
    tbl189.doing = "Waiting for a bite"
    if v1979.Mode == "GhostFish" then
      fn294(v1979, fn299)
    else
      if ((v1979.Mode == "Nothing") or (v1979.Mode == "Hint")) or (v1979.Mode == "Quest") then
        fn231(v1981, fn299)
        fn4("RE/Fishing/Cancel", v1979.Id)
      else
        if fn231(v1981, fn299) then
          flag40 = true
          tbl189.doing = "Reeling in"
          v1977, v1972 = os.clock(), false
          while ((os.clock() - v1977) < 1.2) and (fn299()) do
            v1973 = ((os.clock() - v1977) - 1.05) / 0.15
            if v1983 then
              if v1973 >= 0 then
                if v1972 then
                else
                  pcall(v1983.ShowReel, true, "Click Fast!")
                  v1972 = true
                end
                pcall(v1983.SetReel, math.min(v1973, 1), math.floor(math.min(v1973, 1) * 16), "Click Fast!")
                pcall(v1983.PunchReel)
              else
              end
            else
            end
            task.wait()
          end
          if v1983 then
            pcall(v1983.ShowReel, false)
          end
          v1984 = reg.invokeRemote
          local v1988, v1989, v1990 = v1984("RF/Fishing/Reel", v1979.Id, "Caught", 16)
          if v1989 then
            if type(v1990) == "table" then
              tbl189.fish = tbl189.fish + 1
              v1971 = reg.slot10
              v1971("Caught " .. (tostring(v1990.DisplayName) .. (" x" .. tostring(v1990.Amount))), "ok")
              if v1983 then
                task.spawn(pcall, v1983.Reveal, v1990, 2.6)
              end
            end
          end
        else
          fn4("RE/Fishing/Cancel", v1979.Id)
        end
      end
    end
    flag39 = false
    if v1987 then
      task.spawn(function()
        pcall(v1982.Return, v1987, rodTip, 0.3)
        v1987:Destroy()
      end)
    end
    tbl189.doing = "Fishing, " .. (tbl189.fish .. " caught")
    tbl189.fishAt = os.clock()
    return true
  end
  local v1991 = reg.state
  v1991.hwEggs = function()
    local v1992, tbl216 = fn222(), {tbl189.cur}
    local v1993 = v1992 and (v1992:FindFirstChild("WorldEggs"))
    for index99, child33 in ipairs((v1993 and v1993:GetChildren()) or {}) do
      local halloweenEggUid2, v1994, stealPrompt2, v1995 = child33:GetAttribute("HalloweenEggUid"), fn256(child33), child33:FindFirstChild("StealPrompt", true), fn224(child33)
      if halloweenEggUid2 then
        if v1994 then
          if v1995 then
            if stealPrompt2 then
              if stealPrompt2.Enabled then
                if not (tbl189.cur and (tbl189.cur.Uid == halloweenEggUid2)) then
                  index99 = fn254(v1995)
                  tbl216[#tbl216 + 1] = {Uid = halloweenEggUid2, n = v1994, cat = v1994, v = fn257(child33), s = (child33:IsA("Model") and child33:GetScale()) or 1, tg = fn261(child33) and (index99 >= 1), hw = true, zone = index99, o = (tbl189.oi or {})[halloweenEggUid2]}
                end
              end
            end
          end
        end
      end
    end
    return tbl216
  end
  local v1996 = reg.state
  v1996.hwTurnNow = function()
    if tbl189.turn then
      local v1997 = reg.state
      if (v1997.lastEggAt or 0) < tbl189.turnAt then
        return tbl189.turn == "halloween"
      end
    end
    local v1998 = reg.state
    if v1998.lastEgg == "field" then
      return true
    else
      local v1999 = reg.state
      if v1999.lastEgg == "halloween" then
        return false
      end
    end
  end
  local v2000 = reg.state
  v2000.hwMove = function(arg1_346, arg2_128, arg3_38)
    local tbl217, tbl218, v2001 = {}, {}, reg.state
    for index100, item108 in ipairs(v2001.hwEggs()) do
      if not (item108.cur) then
        tbl217[#tbl217 + 1] = item108
      end
    end
    table.sort(tbl217, function(arg1_347, arg2_129)
      local v2002, v2003 = arg1_347.o or math.huge, arg2_129.o or math.huge
      if v2002 ~= v2003 then
        return v2002 < v2003
      end
      return arg1_347.v > arg2_129.v
    end)
    for index101, item109 in ipairs(tbl217) do
      tbl218[#tbl218 + 1] = item109.Uid
    end
    if arg1_346 and arg2_128 then
      tbl217, v2001 = table.find(tbl218, arg1_346), table.find(tbl218, arg2_128)
      if tbl217 then
        if v2001 then
          tbl218[tbl217], tbl218[v2001] = tbl218[v2001], tbl218[tbl217]
        end
      end
    else
      local cond31 = (arg1_346 ~= nil) == (arg3_38 < 0)
      tbl189.turn, tbl189.turnAt = (cond31 and "halloween") or "field", os.clock()
      local v2004 = cond31 and table.find(tbl218, arg1_346 or arg2_128)
      if v2004 then
        table.insert(tbl218, 1, table.remove(tbl218, v2004))
      end
    end
    tbl189.oi = {}
    for index102, item110 in ipairs(tbl218) do
      tbl189.oi[item110] = index102
    end
  end
  local v2005 = fn50({name = "Halloween", mover = true, gap = 1, pri = 8, soft = true})
  local function fn301()
    local v2006 = ipairs
    for it1_81, it2_80 in v2006(tbl31) do
      if it2_80.mover then
        local ok30, v2007 = pcall(it2_80.on)
        if ok30 then
          if v2007 then
            local ok31, v2008 = pcall(it2_80.want)
            if ok31 then
              if v2008 then
                local v2009, v2010 = (it2_80 == v2005) or (it2_80.name == "Train")
                if v2009 then
                  v2010 = v2009
                else
                  it1_81 = reg.state
                  local cond32 = it1_81.TOOLV ~= nil
                  if cond32 then
                    local v2011 = reg.state
                    v2010 = v2011.TOOLV[it2_80.name] == true
                  else
                    v2010 = cond32
                  end
                end
                return v2010
              end
            end
          end
        end
      end
    end
    return false
  end
  local v2012 = reg.state
  v2012.hwBest = function()
    local v2013 = reg.slot21
    if v2013.hwEggs then
      if not (fn221()) then
        if fn246() then
          local v2014 = reg.findInWorld
          if not (v2014("HalloweenDimensionPortal")) then
            return
          end
        else
          return
        end
      end
    else
      return
    end
    v2013 = fn262()
    if not v2013 then
      return
    end
    return {hw = true, e = v2013, Uid = v2013:GetAttribute("HalloweenEggUid"), Name = fn256(v2013), v = fn257(v2013), r = tbl189.pickRank}
  end
  local v2015 = reg.state
  v2015.hwSteal = function(arg1_348, arg2_130)
    local function fn302()
      return arg2_130() and ((fn26() > 0) or (fn218("HalloweenCarrying") == true))
    end
    if not (fn249(arg2_130)) then
      return
    end
    while (arg2_130() and (fn26() <= 0)) and (fn218("HalloweenCarrying") ~= true) do
      tbl189.doing = "Night, waiting in the Halloween safe zone for " .. tostring(arg1_348.Name)
      local v2016 = reg.slot10
      v2016(tbl189.doing)
      local v2017, v2018 = fn255()
      v2016 = reg.getRoot
      local v2019 = v2016()
      if v2017 then
        if v2019 then
          if fn253(v2018, v2019.Position) then
            fn231(1, arg2_130)
          else
            fn238(v2017, arg2_130)
          end
        else
          fn231(1, arg2_130)
        end
      else
        fn231(1, arg2_130)
      end
    end
    local v2020 = reg.slot36
    v2020.cur = arg1_348.Name
    fn269(fn302, arg1_348.e)
    if fn218("HalloweenCarrying") == true then
      fn266(fn302)
    end
  end
  local function fn303()
    local v2021 = reg.slot21
    local hwEggs2, v2022 = v2021.hwEggs
    if hwEggs2 then
      v2021 = reg.slot21
      local steal4 = v2021.steal
      v2022 = if steal4 then (fn26() <= 0) and (fn262() ~= nil) else not steal4
    else
      v2022 = hwEggs2
    end
    v2021 = nil
    if v2022 then
      v2021 = v2022
    else
      hwEggs2 = reg.slot21
      v2021 = hwEggs2.hwMon
    end
    hwEggs2 = nil
    if v2021 then
      hwEggs2 = v2021
    else
      v2022 = reg.slot21
      hwEggs2 = v2022.hwDog
    end
    v2021 = nil
    if hwEggs2 then
      v2021 = hwEggs2
    else
      v2022 = reg.slot21
      v2021 = v2022.hwFish
    end
    v2022 = nil
    if v2021 then
      v2022 = v2021
    else
      hwEggs2 = reg.slot21
      v2022 = hwEggs2.hwPump and (workspace:GetAttribute("HalloweenWorldEvent") == "PumpkinMoon")
    end
    return v2022
  end
  local function fn304()
    local v2023 = reg.slot21
    local hwMon, v2024 = v2023.hwMon
    if hwMon then
      v2024 = hwMon
    else
      v2023 = reg.slot21
      v2024 = v2023.hwFish
    end
    v2023 = nil
    if v2024 then
      v2023 = v2024
    else
      hwMon = reg.slot21
      v2023 = hwMon.hwDog and (fn286() < 4)
    end
    hwMon = nil
    if v2023 then
      hwMon = v2023
    else
      v2024 = reg.slot21
      hwMon = v2024.hwPump and (workspace:GetAttribute("HalloweenWorldEvent") == "PumpkinMoon")
    end
    return ((hwMon or ((tbl189.cur ~= nil) or (os.clock() < (tbl189.retry or 0)))) or (fn218("HalloweenCarrying") == true)) or (fn262() ~= nil)
  end
  local function fn305()
    local v2025 = reg.slot21
    if not (v2025.steal) then
      return false
    end
    local cond33, v2026 = fn26() > 0
    if cond33 then
      v2025 = reg.state
      v2026 = v2025.targets()
    else
      v2026 = cond33
    end
    v2025 = nil
    if v2026 then
      v2025 = v2026
    else
      cond33 = reg.state
      v2025 = cond33.targetsSoon()
    end
    v2026, cond33 = v2025[1], fn262()
    if v2026 then
      if fn26() <= 0 then
        v2025 = reg.state
        if not (v2025.fieldFresh) then
          return false
        end
      end
    else
      return false
    end
    if not cond33 then
      return true
    end
    v2025 = reg.state
    return not v2025.hwBeats(tbl189.pickRank, fn257(cond33), v2026)
  end
  local function fn306()
    local v2027, num62 = ipairs, 99
    for it1_82, it2_81 in v2027(tbl195) do
      it1_82 = reg.state
      local v2028, v2029, v2030 = it1_82.rank["HW:" .. it2_81] or 99, it2_81 == "Halloween eggs"
      if v2029 then
        it1_82 = reg.slot21
        v2030 = it1_82.hwEggs
      else
        v2030 = v2029
      end
      v2029 = nil
      if v2030 then
        it1_82 = reg.slot21
        v2029 = not it1_82.steal
      else
        v2029 = v2030
      end
      it1_82 = v2029 and ((((tbl189.cur ~= nil) or (os.clock() < (tbl189.retry or 0))) or (fn218("HalloweenCarrying") == true)) or (fn262() ~= nil))
      v2028 = if it1_82 then if tbl189.pickRank then tbl189.pickRank else v2028 else v2028
      if v2028 < num62 then
        v2029, v2030 = it2_81 == "Pumpkin Moon"
        if v2029 then
          local v2031 = reg.slot21
          v2030 = v2031.hwPump
        else
          v2030 = v2029
        end
        local v2032, v2033 = v2030 and (workspace:GetAttribute("HalloweenWorldEvent") == "PumpkinMoon")
        if v2032 then
          v2033 = v2032
        else
          local cond34, v2034 = it2_81 == "Ghost Dog quest"
          if cond34 then
            local v2035 = reg.slot21
            v2034 = v2035.hwDog
          else
            v2034 = cond34
          end
          v2033 = v2034 and (fn286() < 4)
        end
        local v2036, v2037 = v2033 or it1_82
        if v2036 then
          v2037 = v2036
        else
          v2033 = it2_81 == "Halloween monsters"
          if v2033 then
            v2032 = reg.slot21
            v2037 = v2032.hwMon
          else
            v2037 = v2033
          end
        end
        if v2037 then
          num62 = v2028
        else
          if it2_81 == "Halloween fishing" then
            v2032 = reg.slot21
            num62 = if v2032.hwFish then v2028 else num62
          else
          end
        end
      else
      end
    end
    return num62
  end
  local function fn307()
    local v2038 = reg.state
    v2038.rank.Halloween = fn306()
    v2038 = reg.state
    if v2038.order then
      local v2039 = reg.state
      v2039.order()
    end
    return fn301()
  end
  local function fn308()
    local v2040 = reg.state
    local cond35, v2041 = v2040.bloomWants ~= nil
    if cond35 then
      v2040 = reg.state
      v2041 = v2040.bloomWants()
    else
      v2041 = cond35
    end
    v2040 = nil
    if v2041 then
      cond35 = reg.state
      v2040 = (cond35.rank.Bloom or 99) < fn306()
    else
      v2040 = v2041
    end
    return v2040
  end
  v2005.on = function()
    if not (v2005.busy) then
      local v2042 = reg.state
      v2042.rank.Halloween = fn306()
    end
    local v2043 = fn308()
    local v2044, v2045 = if v2043 then not v2043 else fn303()
    if v2044 then
      v2043 = fn221()
      if v2043 then
        v2045 = v2043
      else
        local cond36, v2046 = fn26() > 0
        if cond36 then
          v2046 = cond36
        else
          local v2047 = reg.slot21
          v2046 = v2047.hwEggs and (fn262() ~= nil)
        end
        v2045 = (v2046 and fn246()) and fn304()
      end
    else
      v2045 = v2044
    end
    return v2045 and (os.clock() >= (tbl189.idleUntil or 0))
  end
  v2005.want = function()
    local v2048 = reg.slot29
    if v2048() then
      return
    end
    v2048 = fn221()
    local v2049
    if v2048 then
      v2049 = v2048
    else
      local v2050 = reg.findInWorld
      v2049 = v2050("HalloweenDimensionPortal") ~= nil
    end
    return v2049
  end
  v2005.run = function(arg1_349, arg2_131)
    local function fn309()
      return (arg2_131() and ((fn26() > 0) or (fn218("HalloweenCarrying") == true))) and ((((tbl189.cur ~= nil) or (os.clock() < (tbl189.retry or 0))) or (fn218("HalloweenCarrying") == true)) or not fn308())
    end
    if not (fn221()) then
      arg1_349 = table.clone(tbl195)
      table.sort(arg1_349, function(arg1_350, arg2_132)
        local v2051, v2052 = reg.state, reg.state
        return v2051.rank["HW:" .. arg1_350] < v2052.rank["HW:" .. arg2_132]
      end)
      local v2053 = ipairs
      for it1_83, it2_82 in v2053(arg1_349) do
        local cond37, v2054 = it2_82 == "Pumpkin Moon"
        if cond37 then
          it1_83 = reg.slot21
          v2054 = it1_83.hwPump
        else
          v2054 = cond37
        end
        cond37, it1_83 = v2054 and (workspace:GetAttribute("HalloweenWorldEvent") == "PumpkinMoon")
        if cond37 then
          it1_83 = cond37
        else
          local cond38, v2055 = it2_82 == "Ghost Dog quest"
          if cond38 then
            v2054 = reg.slot21
            v2055 = v2054.hwDog
          else
            v2055 = cond38
          end
          it1_83 = v2055 and (fn286() < 4)
        end
        if it1_83 then
          break
        elseif it2_82 == "Halloween eggs" then
          cond37 = reg.slot21
          if cond37.hwEggs then
            v2054 = reg.slot21
            if not (v2054.steal) then
              break
            end
          end
        end
        cond37, it1_83 = it2_82 == "Halloween monsters"
        if cond37 then
          v2054 = reg.slot21
          it1_83 = v2054.hwMon
        else
          it1_83 = cond37
        end
        v2054 = nil
        if it1_83 then
          v2054 = it1_83
        else
          cond37 = it2_82 == "Halloween fishing"
          if cond37 then
            local v2056 = reg.slot21
            v2054 = v2056.hwFish
          else
            v2054 = cond37
          end
        end
        if v2054 then
          if not (fn277("before entering the dimension", arg2_131)) then
            return
          end
          break
        end
      end
    end
    local v2057 = fn221()
    if not (fn249(arg2_131)) then
      return
    end
    if not (v2057) then
      fn231(1, arg2_131)
    end
    arg1_349 = nil
    while arg2_131() and (fn221()) do
      v2057 = false
      if fn218("HalloweenCarrying") == true then
        local v2058 = reg.state
        v2058.rank.Halloween = 0
        fn266(fn309)
        v2057 = true
      else
        local cond39, v2059 = fn26() <= 0
        if cond39 then
          local v2060 = reg.callModule
          v2059 = not v2060("Cycle", "IsNightPhase", fn6())
        else
          v2059 = cond39
        end
        cond39 = nil
        if v2059 then
          local v2061 = reg.state
          cond39 = (v2061.rank.Steal or 9) < fn306()
        else
          cond39 = v2059
        end
        if cond39 and (fn305()) then
          tbl189.doing, tbl189.idleUntil = "Eggs reset, leaving to wait for Auto Steal", os.clock() + 30
          v2059 = reg.state
          v2059.leaveDim(arg2_131)
          break
        elseif fn26() <= 0 then
          arg1_349 = nil
          tbl189.doing = "Night, waiting in the safe zone"
          local v2062, v2063 = fn255()
          local v2064 = reg.getRoot
          local v2065, v2066 = v2064(), fn283("ReturnSpot")
          if (v2066 and v2065) and (fn223(v2065.Position - v2066.Position).Magnitude < 40) then
            tbl189.doing = "Night, waiting at the fishing spot"
            fn231(1, arg2_131)
          elseif v2062 then
            if v2065 then
              if fn253(v2063, v2065.Position) then
                fn231(1, arg2_131)
              else
                fn238(v2062, arg2_131)
              end
            else
              fn231(1, arg2_131)
            end
          else
            fn231(1, arg2_131)
          end
          v2057 = true
        else
        end
      end
      local v2067 = reg.slot21
      if v2067.hwEggs then
        fn262()
        local v2068 = reg.state
        local rank, v2069, v2070 = v2068.rank, tbl189.pickRank
        if v2069 then
          v2070 = v2069
        else
          v2068 = reg.state
          v2070 = v2068.rank["Steal:filter"]
        end
        rank["HW:Halloween eggs"] = v2070
      end
      v2067 = table.clone(tbl195)
      table.sort(v2067, function(arg1_351, arg2_133)
        local v2071, v2072 = reg.state, reg.state
        return v2071.rank["HW:" .. arg1_351] < v2072.rank["HW:" .. arg2_133]
      end)
      local v2073 = ipairs
      for it1_84, it2_83 in v2073(v2067) do
        if v2057 then
          break
        end
        local function fn310()
          local v2074, v2075 = reg.state
          v2075, v2074.rank.Halloween = reg.state, reg.state.rank["HW:" .. it2_83]
          if it2_83 ~= "Halloween monsters" then
            if it2_83 ~= "Halloween fishing" then
              tbl189.visUntil = 0
            end
          end
          return true
        end
        local cond40, v2076 = it2_83 == "Pumpkin Moon"
        if cond40 then
          it1_84 = reg.slot21
          v2076 = it1_84.hwPump
        else
          v2076 = cond40
        end
        if (v2076 and (workspace:GetAttribute("HalloweenWorldEvent") == "PumpkinMoon")) and fn310() then
          v2057 = (fn281(fn309))
        else
          it1_84, cond40 = it2_83 == "Ghost Dog quest"
          if it1_84 then
            local v2077 = reg.slot21
            cond40 = v2077.hwDog
          else
            cond40 = it1_84
          end
          if ((cond40 and (fn286() < 4)) and (os.clock() >= tbl189.dogAt)) and fn310() then
            v2057 = (fn295(fn309))
          else
            local cond41, v2078 = it2_83 == "Halloween eggs"
            if cond41 then
              local v2079 = reg.slot21
              v2078 = v2079.hwEggs
            else
              v2078 = cond41
            end
            if (v2078 and not fn305()) and fn310() then
              v2057 = (fn269(fn309))
            else
              local cond42, v2080 = it2_83 == "Halloween monsters"
              if cond42 then
                cond41 = reg.slot21
                v2080 = cond41.hwMon
              else
                v2080 = cond42
              end
              if v2080 and (fn310()) then
                v2057 = (fn280(fn309))
              else
                if it2_83 == "Halloween fishing" then
                  cond42 = reg.slot21
                  v2057 = if cond42.hwFish then if fn310() then (fn298(fn309)) else v2057 else v2057
                else
                end
              end
            end
          end
        end
      end
      if v2057 then
      else
        v2073 = reg.slot21
        if v2073.hwEggs then
          if os.clock() < (tbl189.retry or 0) then
            tbl189.doing = "Waiting to grab the dropped egg again"
            fn231(0.3, fn309)
            v2057 = true
          else
          end
        else
        end
      end
      if not v2057 then
        v2067 = reg.state
        v2067.rank.Halloween = fn306() + ((fn305() and 0.5) or 0)
      end
      arg1_349 = (if v2057 then not v2057 else arg1_349 or os.clock()) or nil
      v2067 = false
      if arg1_349 then
        if (os.clock() - arg1_349) > 6 then
          local v2081, v2082 = ipairs, v2067
          for it1_85, it2_84 in v2081(tbl31) do
            if (((it2_84.mover and (it2_84 ~= v2005)) and it2_84.on) and (it2_84.name ~= "Stage")) and (it2_84.name ~= "NightHome") then
              it1_85, v2073 = pcall(it2_84.on)
              local flag41, v2083 = false
              if it1_85 then
                if v2073 then
                  flag41, v2083 = pcall(it2_84.want)
                else
                end
              else
              end
              v2083 = flag41 and v2083
              local v2084
              if v2083 then
                local cond43 = it2_84.name ~= "Steal"
                if cond43 then
                  v2084 = cond43
                else
                  local cond44 = fn26() > 0
                  if cond44 then
                    local v2085 = reg.state
                    v2084 = #v2085.targets() > 0
                  else
                    v2084 = cond44
                  end
                end
              else
                v2084 = v2083
              end
              if v2084 then
                v2082 = true
                break
              end
            end
          end
          if v2082 then
            tbl189.doing, tbl189.idleUntil = "Nothing to do, back to other tasks", os.clock() + 45
            v2081 = reg.state
            v2081.leaveDim(arg2_131)
            break
          end
        end
      end
      if not v2057 then
        tbl189.doing = "Nothing to do yet, free to move"
        fn231(0.5, arg2_131)
      end
      v2073 = reg.heartbeatWait
      v2073()
    end
    fn309, arg1_349 = reg.state
    arg1_349, tbl189.doing, fn309.rank.Halloween = reg.state, "Off", reg.state.hwRank0
    if not (fn307()) then
      tbl189.visUntil = 0
    end
  end
  local v2086 = fn50({name = "HwStuck", gap = 1})
  local v2087
  v2086.on = function()
    return true
  end
  v2086.fn = function()
    if reg.slot4 and (reg.slot4.name == "Train") then
      v2087 = nil
      return
    else
      local v2088 = reg.localPlayer
      if v2088:GetAttribute("TrainEventTravelStage") == "Prepare" then
        v2087 = nil
        return
      end
    end
    local v2089 = reg.getRoot
    local v2090, v2091 = v2089(), fn222()
    v2089 = v2091 and (v2091:FindFirstChild("PortalHome", true))
    v2091 = v2089 and (v2089:FindFirstChild("Portal") or v2089:FindFirstChildWhichIsA("BasePart", true))
    if v2090 then
      if v2091 then
        if fn221() then
          v2087 = nil
          return
        elseif (fn245() or "Home") == "Home" then
          if not ((v2090.Position - v2091.Position).Magnitude < 2000) then
            v2087 = nil
            return
          end
        else
          v2087 = nil
          return
        end
      else
        v2087 = nil
        return
      end
    else
      v2087 = nil
      return
    end
    v2087 = v2087 or os.clock()
    if (os.clock() - v2087) < 4 then
      return
    end
    v2087 = nil
    v2091 = reg.slot10
    v2091("Stuck in the dimension after leaving, resetting the character", "warn")
    v2090 = reg.state
    if v2090.respawn then
      v2091 = reg.state
      v2091.respawn(true)
    end
  end
  local v2092 = fn50({name = "HalloweenBuy", gap = 5})
  v2092.on = function()
    local v2093 = reg.slot21
    return v2093.hwBuy and (os.clock() >= tbl189.buyAt)
  end
  v2092.fn = function()
    local ok32, v2094 = pcall(function()
      return require(replicatedStorage.Data.HalloweenDimensionEgg).Price
    end)
    v2094 = (ok32 and tonumber(v2094)) or 2250
    if (tonumber(fn220("HalloweenTokens")) or 0) < v2094 then
      return
    end
    ok32 = reg.invokeRemote
    local v2095, v2096, v2097 = ok32("RF/HalloweenDimension/AskBuyEgg")
    if v2096 == true then
      fn34("Halloween", "Bought a Halloween Dimension Egg", "ok")
    else
      tbl189.buyAt = os.clock() + 30
      ok32 = reg.slot10
      ok32("Egg shop: " .. tostring(v2097 or "refused"), "warn")
    end
  end
  local function fn311(...)
    local v2098 = reg.invokeRemote
    return v2098("RF/TrainEvent/Action", ...)
  end
  local function fn312()
    local v2099, v2100, v2101 = fn311("Status")
    if v2100 then
      fn243(v2101)
    end
    return tbl190.st
  end
  fn240("RE/TrainEvent/State", fn243)
  fn240("RE/TrainEvent/CaptureState", function(arg1_352)
    if type(arg1_352) == "table" then
      if tbl190.st then
        tbl190.st.Invasion = arg1_352
      end
    end
  end)
  fn240("RE/GhostBoss/Defeated", function(arg1_353)
    if type(arg1_353) == "table" then
      fn34("Ghouler", "+" .. (tostring(arg1_353.Souls or 0) .. " Souls"), "ok")
    end
  end)
  local function fn313(arg1_354, arg2_134)
    local v2102 = tbl190.pc[arg1_354 .. tostring(arg2_134)]
    if v2102 then
      if v2102.Parent then
        return v2102
      end
    end
    if os.clock() < (tbl190.miss[arg1_354 .. tostring(arg2_134)] or 0) then
      return nil
    end
    tbl190.miss[arg1_354 .. tostring(arg2_134)] = os.clock() + 5
    local v2103, tbl219 = ipairs, {workspace:FindFirstChild("TrainEventRuntime"), workspace:FindFirstChild("TrainEventAssets"), workspace}
    for it1_86, it2_85 in v2103(tbl219) do
      for index103, child34 in ipairs((it2_85 and it2_85:GetDescendants()) or {}) do
        if child34:IsA("ProximityPrompt") and (((arg1_354 == "Name") and (child34.Name == arg2_134)) or (child34:GetAttribute(arg1_354) == arg2_134)) then
          tbl190.pc[arg1_354 .. tostring(arg2_134)] = child34
          return child34
        end
      end
    end
  end
  local function fn314(arg1_355, arg2_135, arg3_39)
    local v2104 = reg.getRoot
    local v2105, attr3, attr4 = v2104(), arg1_355:GetAttribute(arg2_135), arg1_355:GetAttribute(arg3_39)
    if v2105 then
      if typeof(attr3) == "Vector3" then
        if typeof(attr4) == "Vector3" then
          arg2_135 = attr4 - attr3
          return attr3 + (arg2_135 * (((arg2_135.Magnitude > 0) and math.clamp((v2105.Position - attr3):Dot(arg2_135) / arg2_135:Dot(arg2_135), 0, 1)) or 0))
        end
      end
    end
    return fn224(arg1_355.Parent)
  end
  local function fn315()
    return fn229(function(arg1_356)
      return arg1_356:GetAttribute("ConductorTicket") == true
    end)
  end
  local function fn316()
    local v2106 = fn220("TrainEvent")
    return (type(v2106) == "table") and (((v2106.AccessUnlocked == true) or ((tonumber(v2106.Tickets) or 0) > 0)) or (fn315() ~= nil))
  end
  local function fn317()
    local st = tbl190.st
    return ((st and (st.ArrivalOpen == true)) and (fn6() < (tonumber(st.DepartureAt) or 0))) and ((st.Phase == "Home") or (st.Phase == nil))
  end
  local function fn318(arg1_357)
    local ghostBossState = replicatedStorage:FindFirstChild("GhostBossState")
    local v2107 = ghostBossState and (ghostBossState:GetAttribute("Phase"))
    return (((((ghostBossState ~= nil) and (ghostBossState:GetAttribute("BossId") ~= "")) and ((v2107 == "Alive") or (v2107 == "Spawning"))) and (ghostBossState:GetAttribute("Realm") == arg1_357)) and ghostBossState) or nil
  end
  local function fn319(arg1_358)
    return fn229(function(arg1_359)
      return (arg1_359:GetAttribute("GhostVacuum") == true) or (arg1_358 and (arg1_359:GetAttribute("GhostBossVacuum") ~= nil))
    end)
  end
  local function fn320(arg1_360, ...)
    if (os.clock() - (tbl190.suckAt or 0)) >= (((arg1_360 == "RE/GhostBoss/Suction") and 0.25) or 0.2) then
      tbl190.suckAt = os.clock()
      fn4(arg1_360, ...)
    end
  end
  local function fn321(arg1_361)
    local ground, v2108 = arg1_361:GetAttribute("Ground"), reg.getRoot
    local v2109 = v2108()
    if typeof(ground) ~= "Vector3" then
      return
    elseif v2109 then
    else
      return
    end
    local velocity, v2110 = arg1_361:GetAttribute("Velocity"), tonumber(arg1_361:GetAttribute("MovedAt")) or fn6()
    ground = if typeof(velocity) == "Vector3" then ground + (velocity * math.clamp(fn6() - v2110, 0, 0.3)) else ground
    v2110 = fn223(v2109.Position - ground)
    arg1_361, v2108 = (v2110.Magnitude > 0.5) and v2110.Unit
    if arg1_361 then
      v2108 = arg1_361
    else
      velocity = reg.vec3
      v2108 = (velocity(1, 0, 0))
    end
    arg1_361, v2110 = reg.vec3, (ground + (v2108 * 42)) + reg.vec3(0, 3, 0)
    local v2111, v2112, v2113 = v2110 - v2109.Position, reg.setRootCFrame, reg.cframeNew
    v2112(v2113(v2109.Position + (((v2111.Magnitude > 2) and (v2111.Unit * math.min(v2111.Magnitude, 1.3333333333333333))) or v2111), reg.vec3(ground.X, v2109.Position.Y, ground.Z)))
    velocity = reg.vec3
    fn320("RE/GhostBoss/Suction", true, ((ground + velocity(0, 8, 0)) - v2109.Position).Unit)
  end
  local function fn322(arg1_362)
    return ((type(arg1_362) == "table") and arg1_362.CanTrade) and ((tonumber(arg1_362.Souls) or 0) >= (tonumber(arg1_362.Cost) or math.huge))
  end
  local function fn323(arg1_363)
    local v2114 = fn313("TrainEventAction", "OpenSoulShop")
    if v2114 then
      local v2115, v2116, v2117 = reg.vec3, fn224(v2114.Parent) + reg.vec3(0, 3, 0), reg.slot21
      if fn238(v2116, arg1_363, v2117.hwGhostSp or 300) then
        fn228(v2114)
        fn231(0.5, arg1_363)
      end
    end
    local v2118, v2119, v2120 = fn311("OpenSoulShop")
    v2114 = ((type(v2120) == "table") and v2120.SoulShop) or (tbl190.st and tbl190.st.SoulShop)
    for i49 = 1, 200, 1 do
      if type(v2114) == "table" then
        if v2114.CanTrade then
          if not ((tonumber(v2114.Souls) or 0) >= (tonumber(v2114.Cost) or math.huge)) then
            break
          end
        else
          break
        end
      else
        break
      end
      local v2121, v2122, v2123 = fn311("TradeSouls", v2114.Cost)
      if not (v2122) then
        break
      end
      i49 = ((type(v2123) == "table") and (v2123.SoulShop or ((v2123.Souls ~= nil) and v2123))) or nil
      if (type(i49) == "table") and (i49.Souls ~= nil) then
        v2114 = i49
      else
        v2114.Souls = (tonumber(v2114.Souls) or 0) - (tonumber(v2114.Cost) or 0)
      end
      fn231(0.3, arg1_363)
    end
  end
  local function fn324(arg1_364)
    for i50 = 1, 4, 1 do
      fn323(arg1_364)
      local v2124, v2125, v2126 = fn311("Status")
      if arg1_364() then
        if type(v2126) == "table" then
          if not (fn322(v2126.SoulShop)) then
            return
          end
        else
          return
        end
      else
        return
      end
      tbl189.doing = "Souls left, trading again"
    end
  end
  local function fn325()
    if fn218("HalloweenCarrying") == true then
      return true
    end
    local v2127 = reg.state
    local v2128, v2129 = v2127.rank.Train or 99, reg.slot21
    if v2129.hwEggs then
      v2127 = reg.slot21
      local steal5, v2130 = v2127.steal
      if steal5 then
        local v2131 = reg.state
        v2130 = v2131.rank.Steal
      else
        v2130 = steal5
      end
      steal5 = nil
      if v2130 then
        steal5 = v2130
      else
        local v2132 = reg.state
        steal5 = v2132.rank["HW:Halloween eggs"]
      end
      if steal5 < v2128 then
        if tbl189.cur ~= nil then
          return true
        elseif os.clock() < (tbl189.retry or 0) then
          return true
        else
          v2130 = reg.state
          if v2130.hwBest() then
            return true
          end
        end
      end
    end
    v2127 = reg.slot21
    local steal6, v2133 = v2127.steal
    if steal6 then
      v2127 = reg.state
      v2133 = v2127.rank.Steal < v2128
    else
      v2133 = steal6
    end
    v2128 = nil
    if v2133 then
      v2127 = (fn26() <= 0) and (fn245() ~= "Town")
      if v2127 then
        v2128 = v2127
      else
        v2129 = reg.state
        v2128 = #v2129.targets() > 0
      end
    else
      v2128 = v2133
    end
    return v2128
  end
  local function fn326(arg1_365)
    local function fn327()
      return arg1_365() and (fn245() == "Town")
    end
    local v2134
    tbl190.left = nil
    tbl190.vis = false
    local function fn328()
      tbl190.left = true
      if (os.clock() - (tbl190.retAt or -99)) < 15 then
        return
      else
        local v2135 = reg.localPlayer
        if v2135:GetAttribute("TrainEventTravelStage") == "Prepare" then
          return
        end
      end
      tbl190.retAt = os.clock()
      local v2136 = fn313("Name", "TrainReturn")
      if v2136 then
        fn242(fn314(v2136, "ReturnRailStart", "ReturnRailEnd"), fn327)
      end
      fn311("Return")
    end
    local num63 = 0
    while fn327() do
      local soulRide, v2137 = tbl190.soulRide
      if soulRide then
        local v2138 = reg.slot21
        local train = v2138.train
        v2137 = if train then tbl190.leftEgg == (tbl190.st and tbl190.st.DepartureAt) else not train
      else
        v2137 = soulRide
      end
      if v2137 then
        if not (tbl190.left) then
          tbl189.doing = "Trading souls"
          fn324(fn327)
        end
        tbl189.doing = "Souls traded, riding back home"
        fn328()
        fn231(1, fn327)
        continue
      end
      if tbl190.vis then
        tbl189.visUntil = os.clock() + 10
      end
      if tbl190.left then
      else
        if os.clock() >= num63 then
          v2137 = os.clock() + 2
          if fn325() then
            tbl189.doing = "Leaving town to steal an egg"
            tbl190.leftEgg = tbl190.st and tbl190.st.DepartureAt
            fn328()
          end
          num63 = v2137
        else
        end
      end
      local v2139, v2140, v2141 = ((tbl190.st and (type(tbl190.st.Invasion) == "table")) and tbl190.st.Invasion) or {}, fn319(true), reg.slot21
      v2137, soulRide = v2141.hwBoss and fn318("Town"), fn319(false)
      if if soulRide then not soulRide else not v2139.VacuumOwned then
        tbl189.doing = "Picking up the Ghost Vacuum"
        v2141 = fn313("TrainEventAction", "PickupVacuum")
        if v2141 then
          if fn242(fn224(v2141.Parent), fn327) then
            fn228(v2141)
            fn232(function()
              return fn319(false) ~= nil
            end, 3, fn327)
          else
            fn231(1, fn327)
          end
        else
          fn231(1, fn327)
        end
      else
        if (v2137 and v2140) and not fn277("to vacuum Ghouler", fn327) then
        else
          if v2137 and v2140 then
            tbl190.vis = true
            tbl189.doing = "Sucking in Ghouler"
            fn230(v2140)
            tbl189.move = true
            fn321(v2137)
          else
            if ((v2139.Phase == "Active") and fn319(false)) and not fn277("to vacuum ghosts", fn327) then
            else
              if (v2139.Phase == "Active") and fn319(false) then
                tbl190.vis = true
                fn230(fn319(false))
                local trainGhostVisuals, v2142 = workspace:FindFirstChild("TrainGhostVisuals"), reg.getRoot
                local v2143 = v2142()
                if v2134 and v2134.Parent then
                else
                  v2134 = nil
                  local v2144, v2145, v2146 = -math.huge, ipairs, (trainGhostVisuals and trainGhostVisuals:GetChildren()) or {}
                  for it1_87, it2_86 in v2145(v2146) do
                    v2142 = it2_86:GetAttribute("TrainGhost") and fn224(it2_86)
                    local v2147, v2148 = (v2142 and v2143) and (v2142 - v2143.Position).Magnitude
                    if v2147 then
                      it1_87 = reg.slot21
                      v2148 = ((it1_87.hwGhost == "Closest") and -v2147) or (((((it2_86.Name:find("Vengeful") and 3) or (it2_86.Name:find("Haunted") and 2)) or 1) * 100000) - v2147)
                    else
                      v2148 = v2147
                    end
                    if v2148 and (v2148 > v2144) then
                      v2134 = it2_86
                      v2144 = v2148
                    else
                    end
                  end
                end
                v2142 = v2134 and fn224(v2134)
                if v2142 and v2143 then
                  tbl189.doing = ("Vacuuming ghosts %s/%s"):format(tostring(v2139.Captured or 0), tostring(v2139.Goal or 50))
                  local v2149 = reg.getHumanoid
                  local v2150, clamp2 = v2149(), math.clamp(tonumber(v2134:GetAttribute("ServerCaptureProgress")) or 0, 0, 1)
                  v2149 = (((clamp2 >= 0.75) and 7) or ((clamp2 >= 0.5) and 10)) or 15
                  tbl189.move = true
                  local new10, exclude2, tbl220, v2151 = RaycastParams.new(), Enum.RaycastFilterType.Exclude, {}, reg.localPlayer
                  vm:yT(tbl220, 0, reg.localPlayer.Character, trainGhostVisuals)
                  new10.FilterType = exclude2
                  new10.FilterDescendantsInstances = tbl220
                  exclude2, clamp2 = nil
                  for i51 = 0, 15, 1 do
                    tbl220 = reg.vec3
                    local v2152, num64 = v2142 + (tbl220(math.cos((i51 * 3.141592653589793) / 8), 0, math.sin((i51 * 3.141592653589793) / 8)) * v2149), 12
                    for index104, child35 in ipairs(trainGhostVisuals:GetChildren()) do
                      index104 = (child35 ~= v2134) and fn224(child35)
                      num64 = if index104 then math.min(num64, fn223(v2152 - index104).Magnitude) else num64
                    end
                    i51 = ((num64 * 10) - fn223(v2152 - v2143.Position).Magnitude) - ((workspace:Raycast(v2142, v2152 - v2142, new10) and 1000) or 0)
                    if exclude2 then
                      if i51 > exclude2 then
                        exclude2, clamp2 = i51, v2152
                      else
                      end
                    else
                      exclude2, clamp2 = i51, v2152
                    end
                  end
                  new10, exclude2, tbl220 = math.clamp(tonumber(v2134:GetAttribute("ServerCaptureProgress")) or 0, 0, 1), (v2143.Position - v2142).Magnitude < 24, math.min(os.clock() - (tbl189.gT or 0), 0.1)
                  tbl189.gT = os.clock()
                  local v2153 = reg.slot21
                  local v2154 = (v2153.hwGhostSp or 150) * (1 - (0.9 * new10))
                  if new10 > 0.5 then
                    local function fn329(arg1_366)
                      local num65 = 12
                      for index105, child36 in ipairs(trainGhostVisuals:GetChildren()) do
                        index105 = (child36 ~= v2134) and fn224(child36)
                        num65 = if index105 then math.min(num65, fn223(arg1_366 - index105).Magnitude) else num65
                      end
                      return num65
                    end
                    v2153 = nil
                    for i52 = 0, 15, 1 do
                      local v2155 = reg.vec3
                      local v2156, v2157 = reg.vec3, v2155(v2142.X, v2143.Position.Y, v2142.Z) + (reg.vec3(math.cos((i52 * 3.141592653589793) / 8), 0, math.sin((i52 * 3.141592653589793) / 8)) * v2149)
                      i52 = (fn329(v2157) * 10) - fn223(v2157 - v2143.Position).Magnitude
                      if v2153 then
                        if i52 > v2153 then
                          v2153, clamp2 = i52, v2157
                        else
                        end
                      else
                        v2153, clamp2 = i52, v2157
                      end
                    end
                    exclude2, v2154 = true, ((fn329(v2143.Position) < 12) and 60) or 6
                  else
                  end
                  if v2150 then
                    v2149 = fn223(clamp2 - v2143.Position)
                    tbl189.ws0 = tbl189.ws0 or fn225(v2150)
                    v2150.AutoRotate = false
                    if v2149.Magnitude > 2 then
                      new10, v2153 = exclude2 and v2154
                      if new10 then
                        v2153 = new10
                      else
                        local v2158 = reg.slot21
                        v2153 = v2158.hwGhostSp
                      end
                      local clamp3 = math.clamp(v2149.Magnitude * 8, math.min(8, v2153), v2153)
                      v2150.WalkSpeed = clamp3
                      local v2159 = reg.vec3
                      v2150:MoveTo(v2159(clamp2.X, v2143.Position.Y, clamp2.Z))
                      v2159 = nil
                      v2159, v2143.AssemblyLinearVelocity = reg.vec3, (v2149.Unit * clamp3) + reg.vec3(0, math.min(v2143.AssemblyLinearVelocity.Y, 8), 0)
                    else
                      v2150:MoveTo(v2143.Position)
                      local v2160 = reg.vec3
                      v2143.AssemblyLinearVelocity = v2160(0, math.min(v2143.AssemblyLinearVelocity.Y, 8), 0)
                    end
                    local v2161, v2162 = reg.cframeNew
                    v2162, v2143.CFrame = reg.vec3, v2161(v2143.Position, reg.vec3(v2142.X, v2143.Position.Y, v2142.Z))
                  else
                    local v2163 = clamp2 - v2143.Position
                    clamp2 = if exclude2 then if v2163.Magnitude > (v2154 * tbl220) then v2143.Position + ((v2163.Unit * v2154) * tbl220) else clamp2 else clamp2
                    local v2164, v2165, v2166 = reg.setRootCFrame, reg.cframeNew, reg.vec3
                    v2164(v2165(clamp2, v2166(v2142.X, clamp2.Y, v2142.Z)))
                  end
                else
                  tbl189.doing = "Waiting for ghosts"
                  tbl189.move = false
                  fn236(false)
                end
              else
                if (v2139.Phase == "Warmup") or (v2139.Phase == nil) then
                  tbl189.doing = "Invasion starts soon"
                  fn231(0.5, fn327)
                elseif v2139.Phase == "Active" then
                  tbl189.doing = "Waiting for the Ghost Vacuum"
                  fn231(0.5, fn327)
                else
                  local v2167 = tbl190.st and tbl190.st.DepartureAt
                  if tbl190.tradeDep ~= v2167 then
                    tbl190.tradeDep = v2167
                    local v2168 = reg.getHumanoid
                    local v2169 = v2168()
                    if v2169 then
                      v2169:UnequipTools()
                    end
                    v2168 = reg.slot21
                    if v2168.hwSouls then
                      tbl189.doing = "Trading souls"
                      fn324(fn327)
                    end
                  end
                  if not (tbl190.left) then
                    tbl190.doneDep = tbl190.st and tbl190.st.DepartureAt
                  end
                  tbl189.doing = "Riding back home"
                  fn328()
                  fn231(1, fn327)
                end
              end
            end
          end
        end
      end
      v2137 = reg.heartbeatWait
      v2137()
    end
    tbl189.move = false
    fn328 = reg.getHumanoid
    local v2170 = fn328()
    if v2170 then
      v2170:UnequipTools()
      v2170.AutoRotate = true
      if tbl189.ws0 then
        v2170.WalkSpeed = tbl189.ws0
        tbl189.ws0 = nil
      end
    end
    fn236(false)
    if tbl190.vis then
      if not (fn307()) then
        tbl189.visUntil = 0
      end
    end
  end
  local function fn330()
    local v2171 = reg.localPlayer
    return v2171:GetAttribute("TrainEventTravelStage") == "Prepare"
  end
  local function fn331(arg1_367)
    if fn330() then
      tbl189.doing = "Already boarding, waiting for the Phantom Express"
      fn232(function()
        return not fn330()
      end, 30, arg1_367)
      tbl190.fail = os.clock() + 30
      return
    end
    if not (fn277("before boarding", arg1_367)) then
      return
    end
    local st2 = tbl190.st
    tbl189.doing = "Boarding the Phantom Express"
    if not (fn221()) then
      if not (fn249(arg1_367)) then
        tbl190.fail = os.clock() + 10
        return
      end
    end
    if st2 then
      if not (st2.AtStation) then
        if (os.clock() - (tbl190.stAt or -99)) > 10 then
          tbl190.stAt = os.clock()
          local v2172 = reg.slot10
          v2172("Phantom Express: going to the station")
          fn311("Station")
          fn231(3, arg1_367)
          fn312()
        end
      end
    end
    st2 = fn313("Name", "TrainBoard")
    if not st2 then
      local v2173 = reg.slot10
      v2173("Phantom Express: boarding prompt not found", "warn")
      tbl190.fail = os.clock() + 20
      return
    end
    if not (fn242(fn314(st2, "BoardRailStart", "BoardRailEnd"), arg1_367)) then
      return
    end
    st2 = fn220("TrainEvent")
    if not ((type(st2) == "table") and st2.AccessUnlocked) then
      fn230(fn315())
      fn231(0.4, arg1_367)
    end
    if fn330() then
      return
    end
    local v2174, v2175, v2176 = fn311("Board")
    if v2175 then
      st2 = reg.slot10
      st2("Boarded the Phantom Express", "ok")
    else
      tbl190.fail = os.clock() + 30
      local v2177 = reg.slot10
      v2177("Phantom Express: " .. tostring(v2176 or "could not board"), "warn")
      fn232(function()
        return not fn330()
      end, 30, arg1_367)
    end
    if v2175 then
      tbl189.doing = "Boarded, waiting for the Phantom Express to leave"
      fn232(function()
        local v2178, v2179 = fn245(), reg.localPlayer
        local trainEventTravelStage = v2179:GetAttribute("TrainEventTravelStage")
        return (trainEventTravelStage == "Failed") or ((trainEventTravelStage ~= "Prepare") and (((v2178 == "Departing") or (v2178 == "Town")) or (v2178 == "Returning")))
      end, 25, arg1_367)
    end
  end
  local v2180 = fn50({name = "Train", mover = true, gap = 1, pri = 3})
  v2180.on = function()
    local v2181, v2182 = tbl190.st and tbl190.st.SoulShop, reg.slot21
    local v2183, v2184, v2185 = ((v2182.hwSouls and (type(v2181) == "table")) and (v2181.CanTrade == true)) and ((tonumber(v2181.Souls) or 0) >= (tonumber(v2181.Cost) or math.huge)), fn245(), reg.slot21
    if v2185.train then
    elseif v2183 then
    elseif tbl190.soulRide then
      if not (v2184 == "Town") then
        if not (tbl194[v2184]) then
          return false
        end
      end
    else
      return false
    end
    v2184 = reg.slot21
    if not (v2184.train) then
      if fn317() then
        tbl190.soulRide = v2183 or nil
      end
    end
    if tbl190.leftEgg ~= nil then
      if fn317() then
        if tbl190.leftEgg == tbl190.st.DepartureAt then
          v2182 = tbl190.st.Invasion
          if type(v2182) ~= "table" then
            tbl190.soulRide = nil
          elseif v2182.Phase == nil then
            tbl190.soulRide = nil
          elseif v2182.Phase == "Active" then
            tbl190.soulRide = nil
          elseif v2182.Phase == "Warmup" then
            tbl190.soulRide = nil
          elseif v2183 then
            tbl190.soulRide = true
          else
            return false
          end
        end
      end
    end
    return (fn245() == "Town") or ((((fn317() and (os.clock() >= (tbl190.fail or 0))) and fn316()) and not fn325()) and (tbl190.doneDep ~= tbl190.st.DepartureAt))
  end
  v2180.want = function()
    local v2186 = reg.slot29
    if v2186() then
      return
    end
    return ((fn245() == "Town") and "town") or "board"
  end
  local num66, flag42, v2187 = 0, false, reg.state
  v2187.trainBoard = function()
    if (os.clock() - num66) >= 0.5 then
      num66 = os.clock()
      local on2 = v2180.on()
      local v2188
      if on2 then
        local v2189 = reg.slot29
        v2188 = not v2189()
      else
        v2188 = on2
      end
      flag42 = v2188
    end
    local v2190 = flag42
    return v2190
  end
  v2180.run = function(arg1_368, arg2_136)
    if arg1_368 == "town" then
      fn326(arg2_136)
    else
      fn331(arg2_136)
    end
  end
  local v2191 = reg.state
  v2191.hwKeep = function()
    local v2192, v2193 = fn245(), reg.slot21
    local v2194, v2195 = v2193.train or tbl190.soulRide
    if v2194 then
      local v2196, v2197 = (v2192 == "Town") or (tbl194[v2192] == true)
      if v2196 then
        v2197 = v2196
      else
        v2193 = reg.localPlayer
        local character14 = v2193.Character
        if character14 then
          local v2198 = reg.localPlayer
          v2197 = v2198.Character:GetAttribute("TrainEventInForgottenTown") == true
        else
          v2197 = character14
        end
      end
      v2195 = v2197 or v2180.on()
    else
      v2195 = v2194
    end
    return v2195
  end
  local v2199 = fn50({name = "Ghouler", mover = true, gap = 1, pri = 2})
  v2199.on = function()
    local v2200 = reg.slot21
    return (((v2200.hwBoss and (fn245() ~= "Town")) and not fn221()) and (fn318("World") ~= nil)) and (fn319(true) ~= nil)
  end
  v2199.want = function()
    local v2201 = reg.slot29
    if v2201() then
      return
    end
    return fn318("World")
  end
  v2199.run = function(arg1_369, arg2_137)
    local ground2 = arg1_369:GetAttribute("Ground")
    if typeof(ground2) == "Vector3" then
      local v2202 = reg.vec3
      if not (fn242(ground2 + v2202(42, 0, 0), arg2_137)) then
        return
      end
    end
    while arg2_137() and (fn318("World")) do
      fn230(fn319(true))
      tbl189.doing = "Sucking in Ghouler"
      fn321(arg1_369)
      ground2 = reg.heartbeatWait
      ground2()
    end
    fn4("RE/GhostBoss/Suction", false)
  end
  local v2203 = fn50({name = "TrainInfo", gap = 3})
  v2203.on = function()
    local v2204 = reg.slot21
    if not (v2204.train) then
      if not (v2180.busy) then
        if fn245() ~= "Town" then
          if not (tbl194[fn245()]) then
            if not (fn317()) then
              tbl190.soulRide = nil
            end
          end
        end
      end
    end
    v2204 = reg.slot21
    local train2, v2205 = v2204.train
    if train2 then
      v2205 = train2
    else
      v2204 = reg.slot21
      v2205 = v2204.hwBoss
    end
    v2204 = nil
    if v2205 then
      v2204 = v2205
    else
      train2 = reg.slot21
      v2204 = train2.hwSouls
    end
    return v2204
  end
  v2203.fn = function()
    fn312()
  end
  local function fn332()
    local v2206 = reg.invokeRemote
    local v2207, v2208 = v2206("RF/IslandWars/Fetch")
    fn244(v2208)
  end
  fn240("RE/LiveEvents/Began", function(arg1_370)
    if arg1_370 == "CursedIslandWars" then
      tbl191.sd = false
      tbl191.col = nil
      task.spawn(fn332)
    end
  end)
  fn240("RE/LiveEvents/Ended", function(arg1_371)
    if arg1_371 == "CursedIslandWars" then
      tbl191.snap = nil
      tbl191.sd = false
      tbl191.col = nil
    end
  end)
  local v2209 = fn50({name = "IslandWarsInfo", gap = 5})
  v2209.on = function()
    return (tbl191.snap ~= nil) and (tbl193[tbl191.snap.Phase] == true)
  end
  v2209.fn = fn332
  fn240("RE/IslandWars/State", fn244)
  fn240("RE/IslandWars/Moment", function(arg1_372, arg2_138, arg3_40)
    if (arg1_372 == "Cooldown") and (type(arg2_138) == "string") then
      tbl191.cd[arg2_138] = tonumber(arg3_40) or 0
    elseif ((arg1_372 == "SuddenDeath") or (arg1_372 == "EarlySuddenDeath")) or (((arg1_372 == "Warning") and tonumber(arg2_138)) and (tonumber(arg2_138) <= 15)) then
      tbl191.sd = true
    elseif (arg1_372 == "CollapseWarn") and (type(arg2_138) == "table") then
      tbl191.col, tbl191.colAt = arg2_138, os.clock()
    elseif arg1_372 == "Win" then
      tbl191.sd = false
    elseif arg1_372 == "Outro" then
      tbl191.sd = false
    end
  end)
  task.spawn(function()
    local v2210 = reg.invokeRemote
    local v2211, v2212 = v2210("RF/LiveEvents/FetchRunning")
    if type(v2212) == "table" then
      if v2212.CursedIslandWars then
        fn332()
      end
    end
  end)
  local function fn333(arg1_373)
    pcall(function()
      local module3 = require(replicatedStorage.Controllers.Game.AdminAbuseClientController.Events.CursedIslandWars.Input)
      tbl191.k0 = tbl191.k0 or module3.Knock
      module3.Knock = (arg1_373 and (function()
      end)) or tbl191.k0
    end)
  end
  v1670, fn240 = reg.state, reg.state
  v1670.cleanup = fn240.cleanup or {}
  table.insert(reg.state.cleanup, function()
    fn333(false)
  end)
  table.insert(reg.state.cleanup, function()
    local v2213 = reg.state
    v2213.hwPortalOff = true
    v2213 = reg.findInWorld
    local v2214 = v2213("HalloweenDimensionPortal", "Hitbox")
    if v2214 then
      v2214.CanTouch = true
    end
  end)
  local function fn334()
    local v2215 = reg.getRoot
    local v2216 = v2215()
    if v2216 then
      if tbl191.col then
        if not ((os.clock() - tbl191.colAt) < 8) then
          return false
        end
      else
        return false
      end
    else
      return false
    end
    v2215 = RaycastParams.new()
    v2215.FilterType = Enum.RaycastFilterType.Include
    v2215.FilterDescendantsInstances = tbl191.col
    local v2217, raycast5 = reg.vec3, workspace:Raycast(v2216.Position, reg.vec3(0, -14, 0), v2215)
    return raycast5 ~= nil
  end
  local function fn335(arg1_374)
    return fn229(function(arg1_375)
      return arg1_375.Name == arg1_374
    end)
  end
  local v2218 = fn50({name = "IslandWars", mover = true, gap = 0.3, pri = -2, urgent = true, ev = function()
    return true
  end})
  v2218.on = function()
    local snap3, me, v2219 = tbl191.snap, tbl191.me(), reg.slot21
    return ((((v2219.ciw and (snap3 ~= nil)) and (tbl192[snap3.Phase] == true)) and (me ~= nil)) and (me.State == "Alive")) and ((os.clock() - tbl191.at) < 30)
  end
  v2218.want = function()
    return true
  end
  v2218.run = function(arg1_376, arg2_139)
    fn333(true)
    while arg2_139() do
      local snap4, me2, v2220 = tbl191.snap, tbl191.me(), reg.getRoot
      arg1_376 = v2220()
      if snap4 then
        if me2 then
          if arg1_376 then
            if me2.State == "Alive" then
              if not (tbl192[snap4.Phase]) then
                break
              end
            else
              break
            end
          else
            break
          end
        else
          break
        end
      else
        break
      end
      local v2221, v2222, v2223 = ((me2.Team == "Red") and "Blue") or "Red", fn6(), snap4.Island and snap4.Island:FindFirstChild("Centre")
      v2220 = fn224(v2223 and (v2223:FindFirstChild("Top")))
      me2 = v2220 and ((tbl191.sd or (snap4.Phase == "SuddenDeath")) or fn334())
      if me2 then
        if fn223(arg1_376.Position - v2220).Magnitude > 18 then
          tbl189.doing = "Island Wars: moving to the centre"
          local unit, v2224 = fn223(v2220 - arg1_376.Position).Unit
          v2224, arg1_376.AssemblyLinearVelocity = reg.vec3, (unit * math.max(fn7(), 30)) + reg.vec3(0, arg1_376.AssemblyLinearVelocity.Y, 0)
        end
      end
      me2, v2220 = 25
      for index106, item111 in ipairs(((type(snap4.Entries) == "table") and snap4.Entries) or {}) do
        index106 = ((((type(item111) == "table") and (item111.Team == v2221)) and (item111.State == "Alive")) and (typeof(item111.Model) == "Instance")) and item111.Model:FindFirstChild("HumanoidRootPart")
        item111 = index106 and (index106.Position - arg1_376.Position).Magnitude
        if item111 then
          if item111 < me2 then
            me2, v2220 = item111, index106
          else
          end
        else
        end
      end
      local v2225 = reg.slot21
      v2220 = if v2225.ciwT == "Walls and crystal" then nil else v2220
      if snap4.Phase ~= "Prep" then
        local v2226, v2227 = fn335("Bat"), fn335("PumpkinLauncher")
        if ((v2220 and (me2 <= 10)) and v2226) and (v2222 >= (tbl191.cd.Bat or 0)) then
          tbl189.doing = "Island Wars: hitting an enemy"
          fn230(v2226)
          fn233(v2220.Position)
          fn4("RE/IslandWars/Use", "Swing", v2220)
          tbl191.cd.Bat = math.max(tbl191.cd.Bat or 0, v2222 + 0.75)
        elseif v2227 then
          if v2222 >= (tbl191.cd.PumpkinLauncher or 0) then
            local v2228, v2229 = (type(snap4.Barriers) == "table") and snap4.Barriers[v2221], (type(snap4.Crystals) == "table") and snap4.Crystals[v2221]
            v2225 = ((v2220 and (v2220.Position + (v2220.AssemblyLinearVelocity * (me2 / 110)))) or (((v2228 and ((tonumber(v2228.Health) or 0) > 0)) and (typeof(v2228.Model) == "Instance")) and fn224(v2228.Model:FindFirstChild("Hitbox") or v2228.Model))) or (((v2229 and ((tonumber(v2229.Health) or 0) > 0)) and (typeof(v2229.Model) == "Instance")) and fn224(v2229.Model:FindFirstChild("Pivot", true) or v2229.Model))
            if v2225 then
              tbl189.doing = (v2220 and "Island Wars: shooting an enemy") or "Island Wars: shooting the enemy base"
              fn230(v2227)
              fn233(v2225)
              v2228 = v2227:FindFirstChild("Handle") and v2227.Handle:FindFirstChild("Muzzle")
              local v2230, v2231 = (v2228 and v2228:IsA("Attachment")) and v2228.WorldPosition
              if v2230 then
                v2231 = v2230
              else
                v2229 = nil
                v2229, v2231 = reg.vec3, arg1_376.Position + reg.vec3(0, 1.5, 0)
              end
              if (v2225 - v2231).Magnitude > 1 then
                tbl191.shot = tbl191.shot + 1
                fn4("RE/IslandWars/Use", "Launch", tbl191.shot, v2231, (v2225 - v2231).Unit)
                tbl191.cd.PumpkinLauncher = math.max(tbl191.cd.PumpkinLauncher or 0, v2222 + 1.25)
              end
            end
          end
        end
      end
      snap4 = reg.heartbeatWait
      snap4()
    end
  end
  v1670, v1954 = tbl39.Halloween:Section("Halloween Dimension", "ghost"), reg.state
  v1954.hwEggsT = fn44(v1670, "Auto steal Halloween eggs", "hwEggs", false, (fn241(v2005)))
  fn44(v1670, "Instant steal Halloween eggs", "hwInstant", true)
  fn44(v1670, "Steal missing Halloween index", "hwIndex", false, function()
    tbl189.ixAt = 0
    tbl189.idleUntil = 0
  end)
  fn47(v1670, "Steal speed", "hwStep", 10, 100, 40, " st", 5)
  fn240, v1954 = function()
    local tbl221 = {}
    pcall(function()
      for key53, item112 in next, require(replicatedStorage.Data.HalloweenPets).Specs, nil do
        tbl221[((type(item112) == "table") and item112.Id) or key53] = true
      end
    end)
    return fn28(tbl221)
  end, function(arg1_377)
    local v2232 = reg.slot21
    v2232.hwEggOnly = nil
    v2232 = ipairs
    for it1_88, it2_87 in v2232(arg1_377) do
      local v2233, v2234 = reg.slot21, reg.slot21
      v2233.hwEggOnly = v2234.hwEggOnly or {}
      v2233 = reg.slot21
      v2233.hwEggOnly[it2_87] = true
    end
  end
  v1670:Dropdown("Halloween eggs", fn240, {}, v1954, true)
  local function fn336(arg1_378)
    local v2235 = reg.slot21
    v2235.hwRar = nil
    v2235 = ipairs
    for it1_89, it2_88 in v2235(arg1_378) do
      local v2236, v2237 = reg.slot21, reg.slot21
      v2236.hwRar = v2237.hwRar or {}
      v2237 = reg.slot21
      v2237.hwRar[it2_88] = true
    end
  end
  v1670:Dropdown("Halloween rarities", tbl8, {}, fn336, true)
  v1670:Slider("Min value /s", 0, 0, 0, function(arg1_379)
    local v2238 = reg.slot21
    v2238.hwMinV = ((arg1_379 > 0) and arg1_379) or nil
  end, "log")
  fn44(v1670, "Auto Pumpkin Moon", "hwPump", true)
  fn47(v1670, "Walk speed", "hwPumpSp", 100, 1000, 300, " st/s", 10)
  fn44(v1670, "Auto buy Halloween Dimension Egg", "hwBuy", false)
  fn336 = tbl39.Halloween:Section("Monsters", "swords")
  fn44(fn336, "Auto farm monsters", "hwMon", false, (fn241(v2005)))
  v1954, fn240 = {}, {{"Candy Corn", 12, 95288958121268}, {"Hollow Bat", 12, 74981089555029}, {"Scarecrow", 28, 116705851588512}, {"Chest Mimic", 28, 127208298529364}, {"Pumpkin Golem", 65, 84950520721038}, {"Soul Phantom", 65, 139447998862041}}
  for index107, item113 in ipairs(fn240) do
    v1954[#v1954 + 1] = {v = item113[1], t = item113[1], img = "rbxassetid://" .. item113[3], note = "+" .. (item113[2] .. " Candy Corn")}
  end
  local function fn337(arg1_380)
    local v2239 = reg.slot21
    v2239.hwMonKinds = nil
    v2239 = ipairs
    for it1_90, it2_89 in v2239(arg1_380) do
      local v2240, v2241 = reg.slot21, reg.slot21
      v2240.hwMonKinds = v2241.hwMonKinds or {}
      v2240 = reg.slot21
      v2240.hwMonKinds[it2_89] = true
    end
  end
  fn336:Dropdown("Monsters", v1954, {}, fn337, true)
  fn46(fn336, "Monster order", "hwMonOrder", {"Closest", "Most tokens"}, "Closest")
  fn47(fn336, "Walk speed", "hwMonSp", 100, 1000, 300, " st/s", 10)
  local function fn338()
    local tbl222, v2242, v2243 = {}, ipairs, reg.state
    local v2244 = vm[53](v2243.ownedWeapons())
    for it1_91, it2_90 in v2242(vm:uT(v2244)) do
      v2243 = reg.modules
      local v2245, v2246 = reg.state, v2243.Gears.Directory[reg.state.weaponId[it2_90] or it2_90]
      if type(v2246) == "table" then
        if v2246.BatControllerData then
          tbl222[#tbl222 + 1] = it2_90
        elseif v2246.ToolController == "Slap" then
          tbl222[#tbl222 + 1] = it2_90
        end
      end
    end
    return tbl222
  end
  local function fn339(arg1_381)
    local v2247 = reg.slot21
    v2247.hwWeap = nil
    v2247 = ipairs
    for it1_92, it2_91 in v2247(arg1_381) do
      local v2248, v2249 = reg.slot21, reg.slot21
      v2248.hwWeap = v2249.hwWeap or {}
      v2248, v2249 = reg.slot21
      v2249, v2248.hwWeap[reg.state.weaponId[it2_91] or it2_91] = reg.state, true
    end
  end
  fn336:Dropdown("Use weapons", fn338, fn338(), fn339, true)
  fn337 = tbl39.Halloween:Section("Ghost Dog and fishing", "hand")
  local stats10 = fn337:Stats({{"Quest", tbl17.check}, {"Fish caught", tbl17.net}})
  fn44(fn337, "Auto Ghost Dog quest", "hwDog", false, (fn241(v2005)))
  fn44(fn337, "Auto fishing", "hwFish", false, (fn241(v2005)))
  fn46(fn337, "Cast luck", "hwLuck", {"x1.5 Perfect", "x1.2", "x1.1", "x1.0 Fastest"}, "x1.5 Perfect")
  fn338 = tbl39.Halloween:Section("Phantom Express", "zap")
  local stats11 = fn338:Stats({{"Train", tbl17.timer}, {"Souls", tbl17.soul}})
  fn44(fn338, "Auto Phantom Express", "train", false, (fn241(v2180)))
  fn44(fn338, "Auto vacuum Ghouler boss", "hwBoss", true)
  fn46(fn338, "Ghost target", "hwGhost", {"Rarest first", "Closest"}, "Rarest first")
  fn47(fn338, "Walk speed", "hwGhostSp", 100, 1000, 300, " st/s", 10)
  fn44(fn338, "Auto trade souls", "hwSouls", false)
  v1670 = tbl39.AA:Section("Cursed Island Wars", "swords")
  local v2250 = fn35("ciw", v1670:Text("Waiting for Cursed Island Wars"))
  fn44(v1670, "Auto play Cursed Island Wars", "ciw", true, function(arg1_382)
    fn333(arg1_382 and tbl191.held())
    if not (arg1_382) then
      fn51(v2218)
    end
  end)
  fn46(v1670, "Island Wars target", "ciwT", {"Enemies and base", "Walls and crystal"}, "Enemies and base")
  local v2251 = fn50({name = "HalloweenNote", gap = 0.5, info = true})
  v2251.on = function()
    local v2252 = (reg.slot4 ~= nil) and ((((reg.slot4 == v2005) or (reg.slot4 == v2180)) or (reg.slot4 == v2199)) or (reg.slot4 == v2218))
    return v2252 and (tbl189.doing ~= tbl189.noted)
  end
  v2251.fn = function()
    tbl189.noted = tbl189.doing
    local v2253 = reg.slot10
    v2253(tbl189.doing)
  end
  local v2254 = fn50({name = "HalloweenInfo", gap = 1})
  v2254.on = function()
    return fn60("Event")
  end
  v2254.fn = function()
    local v2255, st3, v2256, v2257 = fn220("TrainEvent"), tbl190.st, fn6(), fn245()
    fn36("hwb", stats10, {Quest = tbl196[fn286() + 1] or "Done", ["Fish caught"] = tostring(tbl189.fish)})
    fn36("hwc", stats11, {Train = (((v2257 and (v2257 ~= "Home")) and v2257) or (fn317() and ("Boarding " .. fn13(math.max((tonumber(st3.DepartureAt) or v2256) - v2256, 0))))) or "Not here", Souls = ((type(v2255) == "table") and fn15(tonumber(v2255.Souls) or 0)) or "--"})
    v2257, v2255, st3 = tbl191.snap, tbl191.me(), reg.slot21
    v2256 = st3.ciw
    v2250((((if v2256 then not v2256 else "Off") or ((v2257 and v2255) and (v2257.Phase .. (" | Team " .. (tostring(v2255.Team) .. (" | " .. tostring(v2255.State))))))) or (v2257 and "Watching, you are not on a team")) or "Waiting for Cursed Island Wars")
  end
end)()
do
  local tweenService2 = fn("TweenService")
  local v2258 = fn3("Folder", {Parent = (gethui and gethui()) or fn("CoreGui")})
  table.insert(reg.state.cleanup, function()
    v2258:Destroy()
  end)
  local new11 = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.ExtraBold)
  local new12 = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold)
  local color3_2, str10 = Color3.new(1, 1, 1), "#7CFF7A"
  local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
  reg.slot21.tagSize = 100
  reg.slot21.espFixed = false
  local function fn340(arg1_383)
    return ("#%02X%02X%02X"):format(arg1_383.R * 255, arg1_383.G * 255, arg1_383.B * 255)
  end
  local function fn341(arg1_384, arg2_140, arg3_41, arg4_13)
    local v2259 = fn3("TextLabel", {Parent = arg1_384, LayoutOrder = arg4_13, BackgroundTransparency = 1, Size = UDim2.fromScale(1, arg3_41 / 42), FontFace = arg2_140, TextScaled = true, TextColor3 = color3_2, RichText = true, Text = "", TextTransparency = 1})
    fn3("UITextSizeConstraint", {Parent = v2259, MaxTextSize = arg3_41, MinTextSize = 1})
    return v2259, (fn3("UIStroke", {Parent = v2259, Color = Color3.new(0, 0, 0), Thickness = 1.6, Transparency = 1, LineJoinMode = Enum.LineJoinMode.Round}))
  end
  local function fn342(arg1_385)
    local v2260 = reg.slot21
    local v2261, v2262 = v2260.tagSize / 100, reg.slot21
    arg1_385.Size = (v2262.espFixed and UDim2.new(5 * v2261, 130 * v2261, 1.25 * v2261, 34 * v2261)) or UDim2.fromOffset(240, 60)
  end
  local function fn343(arg1_386, arg2_141, arg3_42, arg4_14, arg5_12, arg6_8, arg7_3)
    local tbl223, v2263 = {Parent = v2258, Adornee = arg1_386, AlwaysOnTop = true, LightInfluence = 0}, reg.vec3
    tbl223.StudsOffsetWorldSpace = v2263(0, arg5_12 or 3, 0)
    tbl223.MaxDistance = 3000
    local v2264 = fn3("BillboardGui", tbl223)
    fn342(v2264)
    arg5_12 = reg.slot21
    tbl223, v2263 = arg5_12.espFixed and 1
    if tbl223 then
      v2263 = tbl223
    else
      arg1_386 = reg.slot21
      v2263 = arg1_386.tagSize / 100
    end
    arg1_386, tbl223 = fn3("UIScale", {Parent = v2264, Scale = v2263 * 0.8}), fn3("Frame", {Parent = v2264, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)})
    fn3("UIListLayout", {Parent = tbl223, SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Center, VerticalAlignment = Enum.VerticalAlignment.Bottom})
    local v2265 = fn3("ImageLabel", {Parent = tbl223, LayoutOrder = 0, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0.42857142857142855), ScaleType = Enum.ScaleType.Fit, ImageTransparency = 1, Visible = false})
    local v2266, v2267 = fn341(tbl223, new11, 11, 1)
    local v2268, v2269 = fn341(tbl223, new11, 16, 2)
    local v2270, v2271 = fn341(tbl223, new12, 12, 3)
    local tbl224 = {b = v2264, s = arg1_386, paint = function(arg1_387, arg2_142, arg3_43, arg4_15)
      if v2265.Image ~= (arg4_15 or "") then
        v2265.Image, v2265.Visible = arg4_15 or "", arg4_15 ~= nil
      end
      if v2266.Text ~= arg1_387 then
        v2266.Text, v2266.Visible = arg1_387, arg1_387 ~= ""
      end
      if v2268.Text ~= arg2_142 then
        v2268.Text = arg2_142
      end
      if v2270.Text ~= arg3_43 then
        v2270.Text = arg3_43
      end
    end, grad = function(arg1_388)
      local uIGradient2 = v2268:FindFirstChildOfClass("UIGradient")
      if uIGradient2 then
        if uIGradient2:GetAttribute("src") == arg1_388 then
          return
        end
      end
      if uIGradient2 then
        uIGradient2:Destroy()
      end
      if arg1_388 then
        uIGradient2 = arg1_388:Clone()
        uIGradient2:SetAttribute("src", arg1_388)
        uIGradient2.Parent = v2268
      end
    end}
    tbl224.paint(arg2_141, arg3_42, arg4_14, arg7_3)
    tbl224.grad(arg6_8)
    tweenService2:Create(v2265, tweenInfo, {ImageTransparency = 0}):Play()
    arg5_12 = {v2266, v2268, v2270}
    for index108, item114 in ipairs(arg5_12) do
      tweenService2:Create(item114, tweenInfo, {TextTransparency = 0}):Play()
    end
    arg7_3 = {v2267, v2269, v2271}
    for index109, item115 in ipairs(arg7_3) do
      tweenService2:Create(item115, tweenInfo, {Transparency = 0.35}):Play()
    end
    tweenService2:Create(arg1_386, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Scale = v2263}):Play()
    tbl224.drop = function()
      tweenService2:Create(v2265, tweenInfo, {ImageTransparency = 1}):Play()
      local tbl225 = {v2266, v2268, v2270}
      for index110, item116 in ipairs(tbl225) do
        tweenService2:Create(item116, tweenInfo, {TextTransparency = 1}):Play()
      end
      tbl225 = {v2267, v2269, v2271}
      for index111, item117 in ipairs(tbl225) do
        tweenService2:Create(item117, tweenInfo, {Transparency = 1}):Play()
      end
      task.delay(0.26, function()
        v2264:Destroy()
      end)
    end
    return tbl224
  end
  local tbl226 = {}
  local v2272 = fn50({name = "ESP", gap = 0.5})
  local function fn344()
    v2272.clear = true
  end
  local function fn345(arg1_389, arg2_143)
    local v2273 = tbl226[arg1_389] or {}
    tbl226[arg1_389] = v2273
    for key54, item118 in next, arg2_143, nil do
      arg1_389 = v2273[key54]
      if arg1_389 then
        if arg1_389.b.Adornee ~= item118[1] then
          arg1_389.drop()
          arg1_389 = nil
        else
        end
      else
      end
      if arg1_389 then
        arg1_389.paint(item118[2], item118[3], item118[4], item118[7])
        arg1_389.grad(item118[6])
      else
        v2273[key54] = fn343(item118[1], item118[2], item118[3], item118[4], item118[5], item118[6], item118[7])
      end
    end
    for key55, item119 in next, v2273, nil do
      if not (arg2_143[key55]) then
        item119.drop()
        v2273[key55] = nil
      end
    end
  end
  tbl41 = tbl39.ESP:Section("Field eggs", "eye", 1)
  fn44(tbl41, "Egg ESP", "espEggs", false, fn344)
  local tbl227 = {Name = true, Value = true, Mutation = true}
  tbl41:Dropdown("Show", {"Icon", "Name", "Rarity", "Value", "Mutation", "Size", "Weight", "Area"}, {"Name", "Value", "Mutation"}, function(arg1_390)
    tbl227 = fn32(arg1_390) or {}
  end, true)
  local v2274 = fn38(tbl41, {rar = {"Mythic", "Cosmic", "Secret", "Eternal", "Divine"}, mut = "Mutations", wild = true, minV = "Min value /s"})
  fn49 = tbl39.ESP:Section("Others", "shield", 2)
  fn44(fn49, "Pen egg ESP", "espPen", false, fn344)
  fn44(fn49, "Other pens ESP", "espPens", false, fn344)
  fn44(fn49, "Guard ESP", "espGuards", false, fn344)
  fn44(fn49, "Hide sleeping guards", "espAwake", true, fn344)
  fn44(fn49, "Player ESP", "espPlayers", false, fn344)
  local function fn346(arg1_391)
    for key56, item120 in next, tbl226, nil do
      for key57, item121 in next, item120, nil do
        arg1_391(item121)
      end
    end
  end
  fn44(tbl41, "Fixed size", "espFixed", false, function()
    fn346(function(arg1_392)
      local s, v2275 = arg1_392.s, reg.slot21
      local v2276, v2277 = v2275.espFixed and 1
      if v2276 then
        v2277 = v2276
      else
        v2275 = reg.slot21
        v2277 = v2275.tagSize / 100
      end
      s.Scale = v2277
      fn342(arg1_392.b)
    end)
  end)
  fn47(fn49, "ESP size", "tagSize", 60, 160, 100, "%", 5, function(arg1_393)
    fn346(function(arg1_394)
      local v2278
      v2278, arg1_394.s.Scale = reg.slot21, (reg.slot21.espFixed and 1) or (arg1_393 / 100)
      fn342(arg1_394.b)
    end)
  end)
  local function fn347(arg1_395)
    local tbl228 = {}
    for index112, item122 in ipairs(arg1_395.m) do
      index112 = tbl82[item122]
      tbl228[#tbl228 + 1] = ("<font color=\"%s\">%s</font>"):format((index112 and fn340(index112)) or "#FFFFFF", (tbl10[item122] or item122):upper())
    end
    return table.concat(tbl228, "  ")
  end
  local function fn348(arg1_396)
    local v2279 = vm[53](fn15(arg1_396))
    return ("<font color=\"%s\">$%s/s</font>"):format(str10, vm:uT(v2279))
  end
  local function fn349(arg1_397)
    local v2280, v2281 = fn340(fn22(arg1_397.cat)), tbl7[arg1_397.r] or "?"
    return ("<font color=\"%s\">%s</font>"):format(v2280, v2281)
  end
  local function fn350(arg1_398, arg2_144)
    local tbl229 = {}
    if tbl227.Rarity then
      tbl229[#tbl229 + 1] = fn349(arg1_398)
    end
    if tbl227.Value then
      tbl229[#tbl229 + 1] = fn348(arg1_398.v)
    end
    if tbl227.Size then
      tbl229[#tbl229 + 1] = ("x%.2f"):format(arg1_398.s)
    end
    if tbl227.Weight then
      local v2282 = reg.callModule
      local v2283 = v2282("Rec", "WeightKgForScale", arg1_398.cat, arg1_398.s)
      if v2283 then
        tbl229[#tbl229 + 1] = fn15(v2283) .. "kg"
      end
    end
    if tbl227.Area then
      if arg2_144.AreaId then
        tbl229[#tbl229 + 1] = tostring(arg2_144.AreaId)
      end
    end
    local v2284, v2285 = (tbl227.Mutation and fn347(arg1_398)) or "", (tbl227.Name and arg1_398.n) or ""
    return v2284, v2285, table.concat(tbl229, "  ")
  end
  local function fn351(arg1_399, arg2_145, arg3_44)
    local v2286
    if arg3_44 then
      local v2287 = reg.callModule
      v2286 = v2287("Egg", "IsReadyToHatch", arg2_145.Uid) == true
    else
      v2286 = arg3_44
    end
    arg3_44 = (v2286 and 0) or fn14(arg2_145)
    local v2288, v2289, v2290, v2291 = ((arg3_44 <= 0) and ("<font color=\"%s\">READY</font>"):format(str10)) or fn13(arg3_44), fn350(arg1_399, arg2_145)
    return v2289, v2290, (((v2291 ~= "") and (v2291 .. "  ")) or "") .. v2288
  end
  local function fn352(arg1_400)
    if not (tbl227.Icon) then
      return
    end
    local icon2 = (fn16(arg1_400.cat) or {}).Icon
    return ((type(icon2) == "number") and ("rbxassetid://" .. icon2)) or icon2
  end
  local tbl230 = {Sleeping = {"Sleeping", Color3.fromRGB(120, 230, 160)}, Waking = {"Waking up", Color3.fromRGB(255, 205, 100)}, Chasing = {"Chasing", Color3.fromRGB(255, 100, 110)}}
  v2272.on = function()
    local v2292 = reg.slot21
    local espEggs, v2293 = v2292.espEggs
    if espEggs then
      v2293 = espEggs
    else
      v2292 = reg.slot21
      v2293 = v2292.espPen
    end
    v2292 = nil
    if v2293 then
      v2292 = v2293
    else
      espEggs = reg.slot21
      v2292 = espEggs.espPens
    end
    espEggs = nil
    if v2292 then
      espEggs = v2292
    else
      v2293 = reg.slot21
      espEggs = v2293.espGuards
    end
    v2292 = nil
    if espEggs then
      v2292 = espEggs
    else
      v2293 = reg.slot21
      v2292 = v2293.espPlayers
    end
    return v2292 or v2272.clear
  end
  v2272.fn = function()
    v2272.clear = false
    local tbl231, v2294 = {eggs = {}, pen = {}, pens = {}, guards = {}, players = {}}, reg.slot21
    if v2294.espEggs then
      local areaEggSlotsClient3, v2295, v2296 = workspace:FindFirstChild("AreaEggSlotsClient"), pairs, reg.slot19
      local v2297 = vm[53](v2296())
      for it1_93, it2_92 in v2295(vm:uT(v2297)) do
        it1_93 = (type(it2_92) == "table") and it2_92.Uid
        v2296 = it1_93 and it2_92.State
        local v2298 = (((v2296 == "Slot") or (v2296 == "Dropped")) or (v2296 == "Carried")) and ((areaEggSlotsClient3 and areaEggSlotsClient3:FindFirstChild(it1_93)) or workspace:FindFirstChild(it1_93))
        local v2299 = v2298 and (v2298:FindFirstChild("Hitbox") or v2298:FindFirstChildWhichIsA("BasePart", true))
        if v2299 then
          local v2300, v2301 = fn21(it2_92), reg.slot63
          if v2301(v2274, v2300) then
            local v2302, v2303, v2304 = fn350(v2300, it2_92)
            local v2305 = (v2296 == "Carried") and tonumber(it2_92.CarrierUserId)
            local v2306 = v2305 and (players:GetPlayerByUserId(v2305))
            if v2306 then
              v2305 = reg.localPlayer
              v2304 ..= ("  <font color=\"#FF8A5C\">%s</font>"):format(((v2306 == v2305) and "you have it") or (v2306.DisplayName .. " has it"))
            else
              v2304 = if v2296 == "Dropped" then v2304 .. "  <font color=\"#FFD25C\">dropped</font>" else v2304
            end
            tbl231.eggs[it1_93] = {v2299, v2302, v2303, v2304, 3.4, fn23(v2300.cat), fn352(v2300)}
          end
        end
      end
    end
    v2294 = reg.slot21
    if v2294.espPen then
      for key58, item123 in pairs(fn25()) do
        if type(item123) == "table" then
          if item123.Placement then
            local v2307 = fn122(key58)
            local v2308 = v2307 and (v2307.PrimaryPart or v2307:FindFirstChildWhichIsA("BasePart", true))
            if v2308 then
              v2307 = fn21(item123)
              local v2309, v2310, v2311 = fn351(v2307, item123, true)
              tbl231.pen[key58] = {v2308, v2309, v2310, v2311, 3.2, fn23(v2307.cat), fn352(v2307)}
            end
          end
        end
      end
    end
    v2294 = reg.slot21
    if v2294.espPens then
      local placedEggRenders2, v2312, v2313 = workspace:FindFirstChild("PlacedEggRenders"), ipairs, vm[53](players:GetPlayers())
      for it1_94, it2_93 in v2312(vm:uT(v2313)) do
        it1_94 = reg.localPlayer
        if (it2_93 ~= it1_94) and placedEggRenders2 then
          local v2314 = reg.callModule
          local v2315 = v2314("Egg", "ReadOwnerEggs", it2_93.UserId)
          for key59, item124 in pairs(((type(v2315) == "table") and v2315) or {}) do
            v2314 = (type(item124) == "table") and (item124.Uid or key59)
            key59 = item124.Placement and placedEggRenders2:FindFirstChild(it2_93.UserId .. ("_" .. tostring(v2314)))
            local v2316 = key59 and (key59.PrimaryPart or key59:FindFirstChildWhichIsA("BasePart", true))
            if v2316 then
              key59 = fn21(item124)
              local v2317, v2318, v2319 = fn351(key59, item124, false)
              tbl231.pens[it2_93.UserId .. ("_" .. tostring(v2314))] = {v2316, v2317, v2318, v2319 .. ("  " .. it2_93.DisplayName), 3.2, fn23(key59.cat), fn352(key59)}
            end
          end
        end
      end
    end
    v2294 = reg.slot21
    if v2294.espGuards then
      local v2320 = reg.findInWorld
      local v2321, v2322 = v2320("Areas", "GuardAreas"), ipairs
      v2320 = (v2321 and v2321:GetChildren()) or {}
      for it1_95, it2_94 in v2322(v2320) do
        it1_95 = it2_94:FindFirstChild("Guard")
        v2321 = it1_95 and (it1_95:FindFirstChild("HumanoidRootPart") or it1_95.PrimaryPart)
        if v2321 then
          local v2323 = reg.slot21
          if not (v2323.espAwake and (it1_95:GetAttribute("GuardState") == "Sleeping")) then
            local v2324, str11 = tbl230[it1_95:GetAttribute("GuardState")] or {tostring(it1_95:GetAttribute("GuardState") or "Idle"), Color3.fromRGB(160, 170, 210)}, tostring(it1_95:GetAttribute("TargetPlayer") or "")
            local v2325, v2326 = (str11 ~= "") and players:GetPlayerByUserId(tonumber(str11) or 0), fn340(v2324[2])
            str11 = ("<font color=\"%s\">%s</font>"):format(v2326, v2324[1])
            v2326 = nil
            if v2325 then
              v2324 = reg.localPlayer
              v2326 = ((v2325 == v2324) and "  you") or ("  " .. v2325.DisplayName)
            else
              v2326 = v2325
            end
            v2325 = str11 .. (v2326 or "")
            tbl231.guards[it2_94.Name] = {v2321, "", it2_94.Name .. " guard", v2325, 4.2}
          end
        end
      end
    end
    v2294 = reg.slot21
    if v2294.espPlayers then
      local v2327 = reg.getRoot
      local v2328, v2329, v2330 = v2327(), ipairs, vm[53](players:GetPlayers())
      for it1_96, it2_95 in v2329(vm:uT(v2330)) do
        v2327 = reg.localPlayer
        it1_96 = (it2_95 ~= v2327) and it2_95.Character
        local v2331 = it1_96 and (it1_96:FindFirstChild("Head") or it1_96:FindFirstChild("HumanoidRootPart"))
        if v2331 then
          local tool, v2332 = it2_95.Character:FindFirstChildOfClass("Tool"), (v2328 and math.floor((v2331.Position - v2328.Position).Magnitude)) or 0
          tbl231.players[it2_95.Name] = {v2331, "", it2_95.DisplayName, v2332 .. (" studs" .. (((tool and ("  " .. tool.Name)) or "") .. (((v2331.Name ~= "Head") and "  invisible") or ""))), 2.6}
        end
      end
    end
    fn33("esp", function()
      for key60, item125 in next, tbl231, nil do
        fn345(key60, item125)
      end
    end)
  end
end
do
  local section4, flag43 = tbl39.Move:Section("Movement", "wind"), false
  fn44(section4, "Speed boost", "boostOn", false, function(arg1_401)
    fn59("boost", arg1_401 and heartbeat, function()
      local v2333 = reg.getHumanoid
      local v2334, v2335 = v2333(), reg.getRoot
      v2333 = v2335()
      if reg.slot4 then
        flag43 = false
        return
      elseif v2334 then
        if v2333 then
          if v2333.Anchored then
            flag43 = false
            return
          elseif v2334.Sit then
            flag43 = false
            return
          elseif v2334.PlatformStand then
            flag43 = false
            return
          else
            v2335 = reg.isRagdolled
            if v2335() then
              flag43 = false
              return
            end
          end
        else
          flag43 = false
          return
        end
      else
        flag43 = false
        return
      end
      local moveDirection, y3 = v2334.MoveDirection, v2333.AssemblyLinearVelocity.Y
      if moveDirection.Magnitude > 0.1 then
        local v2336, v2337, v2338, v2339, v2340 = reg.vec3, moveDirection.X, reg.slot21, reg.vec3
        v2340, flag43 = (v2336(v2337, 0, moveDirection.Z).Unit * reg.slot21.boost) + reg.vec3(0, y3, 0), true
        v2333.AssemblyLinearVelocity = v2340
      elseif flag43 then
        v2334, v2335 = reg.vec3
        v2335, flag43 = v2334(0, y3, 0), false
        v2333.AssemblyLinearVelocity = v2335
      end
    end)
  end)
  fn47(section4, "Boost speed", "boost", 30, 1000, 120, "", 5)
  local flag44, num67 = false, 0
  fn2(heartbeat, function()
    local v2341 = reg.getHumanoid
    local v2342, v2343 = v2341(), reg.getRoot
    local v2344, v2345 = v2343(), (v2342 and v2342.Jump) or false
    v2343, v2341 = v2345 and v2344
    if v2343 then
      local v2346 = flag44
      local flag45 = not v2346
      if v2346 then
        local v2347 = reg.slot21
        v2341 = v2347.jump and (os.clock() > num67)
      else
        v2341 = flag45
      end
    else
      v2341 = v2343
    end
    if v2341 then
      num67 = os.clock() + 0.25
      local v2348, v2349 = v2344.Anchored and not reg.slot4
      if v2348 then
        v2343 = reg.state
        v2349 = (v2343.hold or 0) == 0
      else
        v2349 = v2348
      end
      v2348 = nil
      if v2349 then
        local v2350
        v2350, v2348 = reg.state, os.clock() > ((reg.state.doffAt or 0) + 0.6)
      else
        v2348 = v2349
      end
      if v2348 then
        v2349 = reg.state
        v2349.doffAt = os.clock()
        task.spawn(reg.invokeRemote, "RF/Treadmill/AskDoff")
      else
        local v2351 = reg.slot21
        if v2351.jump then
          if not (fn12()) then
            if not (v2344.Anchored) then
              v2342:ChangeState(Enum.HumanoidStateType.Jumping)
            end
          end
        end
      end
    end
    flag44 = v2345
  end)
  fn44(section4, "Infinite jump", "jump", false)
  fn44(section4, "God mode", "god", false, function(arg1_402)
    local v2352 = reg.getHumanoid
    local v2353 = v2352()
    if v2353 then
      if not (arg1_402) then
        fn62(v2353)
      end
    end
  end)
  local ok33, v2354 = pcall(require, replicatedStorage.Shared.Modules.Ragdoll)
  local tbl232 = {[Enum.HumanoidStateType.Physics] = true, [Enum.HumanoidStateType.Ragdoll] = true, [Enum.HumanoidStateType.FallingDown] = true}
  local function fn353()
    if fn12() then
      return true
    end
    local v2355 = reg.findInWorld
    local v2356, v2357 = v2355("RaceRallyPortal"), reg.getRoot
    local v2358, v2359 = v2357(), v2356 and (v2356:FindFirstChild("Hitbox"))
    return (((fn9() and v2359) and v2358) and ((v2358.Position - v2359.Position).Magnitude <= 40)) or false
  end
  local function fn354()
    local v2360 = reg.localPlayer
    local character15, v2361 = v2360.Character, reg.getHumanoid
    local v2362, v2363 = v2361(), reg.getRoot
    v2361 = v2363()
    if character15 then
      if v2362 then
        if v2361 then
          if fn353() then
            return
          else
            v2360 = reg.state
            if v2360.agBusy then
              return
            else
              v2363 = reg.localPlayer
              if v2363:GetAttribute("TrainEventTravelStage") == "Prepare" then
                return
              else
                local v2364 = reg.state
                if v2364.only then
                  local v2365 = reg.state
                  if v2365.only() == "Train" then
                    return
                  end
                end
              end
            end
          end
        else
          return
        end
      else
        return
      end
    else
      return
    end
    v2363, v2360 = v2361.AssemblyLinearVelocity, reg.vec3
    local v2366, v2367 = v2360(v2363.X, 0, v2363.Z), fn7() + 5
    v2366 = if v2366.Magnitude > v2367 then v2366.Unit * v2367 else v2366
    v2367 = reg.vec3
    v2361.AssemblyLinearVelocity = v2367(v2366.X, math.min(v2363.Y, 0), v2366.Z)
    if ok33 then
      pcall(v2354.ClearClientRagdoll)
      pcall(v2354.Unragdoll, character15)
    end
    for index113, child37 in ipairs(character15:GetDescendants()) do
      if child37:IsA("BallSocketConstraint") then
        child37:Destroy()
      elseif child37:IsA("NoCollisionConstraint") then
        child37:Destroy()
      elseif child37:IsA("HingeConstraint") then
        child37:Destroy()
      elseif child37:IsA("Motor6D") then
        if not (child37.Enabled) then
          child37.Enabled = true
        end
      elseif child37:IsA("AnimationConstraint") then
        if not (child37.Enabled) then
          child37.Enabled = true
        end
      end
    end
    if tbl232[v2362:GetState()] then
      v2362:ChangeState(Enum.HumanoidStateType.Running)
    end
    if not reg.slot4 then
      v2362.PlatformStand = false
    end
    workspace.CurrentCamera.CameraSubject = v2362
  end
  local function fn355()
    local v2368 = reg.state
    if v2368.rag then
      return
    end
    task.spawn(function()
      for i53 = 1, 15, 1 do
        pcall(fn354)
        task.wait(0.033)
      end
    end)
  end
  reg.state.burst = fn355
  tbl9 = tbl39.Move:Section("Protection", "shield")
  reg.state.prot = tbl9
  fn44(tbl9, "Anti ragdoll", "antiRag", true, function(arg1_403)
    local v2369
    if arg1_403 then
      local v2370 = reg.localPlayer
      v2369 = (v2370:GetAttributeChangedSignal("RagdollEndTime"))
    else
      v2369 = arg1_403
    end
    fn59("ragAttr", v2369, function()
      local v2371 = reg.isRagdolled
      if v2371() then
        fn355()
      end
    end)
    fn59("ragRemote", ((arg1_403 and ok33) and v2354.ClientRagdollRemote) and v2354.ClientRagdollRemote.OnClientEvent, fn355)
  end)
  local tbl233 = {}
  local function fn356(arg1_404)
    local v2372 = reg.localPlayer
    if arg1_404:GetAttribute("Owner") == v2372.Name then
      return
    end
    local v2373, tbl234 = ipairs, {arg1_404, table.unpack(arg1_404:GetDescendants())}
    for it1_97, it2_96 in v2373(tbl234) do
      if it2_96:IsA("BasePart") then
        if it2_96.CanTouch then
          tbl233[it2_96] = true
          it2_96.CanTouch = false
        end
      end
    end
  end
  local collectionService3 = fn("CollectionService")
  fn44(tbl9, "Ignore traps", "traps", true, function(arg1_405)
    fn59("trap", arg1_405 and collectionService3:GetInstanceAddedSignal("PlacedTrap"), function(arg1_406)
      task.defer(pcall, fn356, arg1_406)
    end)
    if arg1_405 then
      for index114, item126 in ipairs(collectionService3:GetTagged("PlacedTrap")) do
        pcall(fn356, item126)
      end
    else
      local v2374 = tbl233
      for key61 in next, v2374, nil do
        if key61.Parent then
          key61.CanTouch = true
        end
      end
      tbl233 = {}
    end
  end)
  local tbl235, tbl236, tbl237, flag46 = {}, {ClaimLostPart = true, CatchPrompt = true}, {}, false
  local function fn357(arg1_407)
    if not (arg1_407:IsA("ProximityPrompt")) then
      return
    end
    if arg1_407.Name == "CatchPrompt" then
      local v2375, v2376 = ipairs, (getconnections and getconnections(arg1_407.PromptButtonHoldEnded)) or {}
      for it1_98, it2_97 in v2375(v2376) do
        if not (tbl237[it2_97]) then
          tbl237[it2_97] = true
          pcall(it2_97.Disable, it2_97)
        end
      end
    elseif arg1_407.HoldDuration > 0 then
      if not (tbl236[arg1_407.Name]) then
        local v2377 = tbl235
        v2377[arg1_407] = v2377[arg1_407] or arg1_407.HoldDuration
        arg1_407.HoldDuration = 0
      end
    end
  end
  local function fn358(arg1_408)
    if arg1_408.Name ~= "CatchPrompt" then
      return
    elseif flag46 then
      return
    end
    fn357(arg1_408)
    flag46 = true
    task.spawn(function()
      local v2378 = reg.invokeRemote
      local v2379, v2380 = v2378("RF/ShootingStar/AskState")
      if (v2379 and (type(v2380) == "table")) and v2380.Id then
        local now16, flag47 = os.clock(), true
        while true do
          local v2381, v2382 = os.clock() - now16, tonumber
          if not (v2381 < ((v2382(v2380.HoldSeconds) or 1.6) + 0.3)) then
            break
          end
          v2382 = reg.getRoot
          v2378, v2381 = v2382(), arg1_408.Parent
          v2382 = (v2378 and v2381) and v2381:IsA("BasePart")
          if if v2382 then (v2378.Position - v2381.Position).Magnitude > (arg1_408.MaxActivationDistance + 2) else not v2382 then
            flag47 = false
            break
          end
          task.wait(0.1)
        end
        if flag47 then
          fn4("RE/ShootingStar/Catch", v2380.Id)
        else
          fn4("RE/ShootingStar/Hold", v2380.Id, false)
        end
      end
      flag46 = false
    end)
  end
  fn44(tbl9, "Instant prompts", "prompts", true, function(arg1_409)
    local proximityPromptService = fn("ProximityPromptService")
    fn59("prompt", arg1_409 and proximityPromptService.PromptShown, fn357)
    fn59("starTap", arg1_409 and proximityPromptService.PromptButtonHoldBegan, fn358)
    if not (arg1_409) then
      proximityPromptService = tbl235
      for key62, item127 in next, proximityPromptService, nil do
        if key62.Parent then
          key62.HoldDuration = item127
        end
      end
      local v2383 = tbl237
      for key63 in next, v2383, nil do
        pcall(key63.Enable, key63)
      end
      tbl235, tbl237 = {}, {}
    end
  end)
  local tbl238, v2384, tbl239 = {idle = {}, hop = {}}, setmetatable, {__index = function()
    return function()
    end
  end}
  local v2385 = v2384({}, tbl239)
  local function fn359()
    tbl238.act = {}
    local ok34, v2386 = pcall(getgc, false)
    for index115, item128 in ipairs((ok34 and v2386) or {}) do
      if (index115 % 400) == 0 then
        task.wait()
      end
      if (type(item128) == "function") and islclosure(item128) then
        local ok35, v2387 = pcall(debug.info, item128, "s")
        if (ok35 and (type(v2387) == "string")) and v2387:find("AntiAFK", 1, true) then
          local ok36, v2388 = pcall(debug.info, item128, "n")
          if (v2388 == "markActive") or (v2388 == "reportActiveFromInput") then
            tbl238.act[#tbl238.act + 1] = item128
          end
          v2388, index115 = pcall(debug.getupvalues, item128)
          for key64, item129 in next, (v2388 and index115) or {}, nil do
            if typeof(item129) == "Instance" then
              if item129.ClassName == "TeleportService" then
                if pcall(debug.setupvalue, item128, key64, v2385) then
                  tbl238.hop[#tbl238.hop + 1] = {item128, key64, item129}
                end
              end
            end
          end
        end
      end
    end
  end
  local function fn360(arg1_410)
    if arg1_410 then
      local v2389, v2390, v2391 = ipairs, getconnections
      if v2390 then
        local v2392
        v2392, v2391 = reg.localPlayer, getconnections(reg.localPlayer.Idled)
      else
        v2391 = v2390
      end
      for it1_99, it2_98 in v2389(v2391 or {}) do
        if pcall(it2_98.Disable, it2_98) then
          tbl238.idle[#tbl238.idle + 1] = it2_98
        end
      end
      return
    end
    for index116, item130 in ipairs(tbl238.idle) do
      pcall(item130.Enable, item130)
    end
    for index117, item131 in ipairs(tbl238.hop) do
      pcall(debug.setupvalue, item131[1], item131[2], item131[3])
    end
    tbl238.idle = {}
    tbl238.hop = {}
    tbl238.act = nil
  end
  fn44(tbl9, "Anti AFK", "afk", true, fn360)
  table.insert(reg.state.cleanup, function()
    fn360(false)
  end)
  local v2393 = fn50({name = "Afk", gap = 120, at = os.clock() + 20})
  v2393.on = function()
    local v2394 = reg.slot21
    return v2394.afk
  end
  v2393.fn = function()
    fn360(true)
    local act = tbl238.act
    if if act then (#tbl238.act == 0) and ((tbl238.tries or 0) < 6) else not act then
      tbl238.tries = (tbl238.tries or 0) + 1
      fn359()
    end
    for index118, item132 in ipairs(tbl238.act) do
      pcall(item132)
    end
  end
  fn2(reg.localPlayer.CharacterAdded, function()
    local v2395 = reg.slot21
    if v2395.afk then
      task.delay(1, fn360, true)
    end
  end)
end
do
  local prot, v2396 = reg.state.prot
  local flag48 = false
  fn44(prot, "Invisible", "invis", false, function(arg1_411)
    fn59("invisPin", arg1_411 and heartbeat, v2396)
  end)
  local tbl240 = {Mutate = true, Mech = true, Bloom = true, Combat = true, Machine = true, Banjo = true}
  reg.state.TOOLV = tbl240
  reg.state.doneVis = function(arg1_412)
    local v2397 = reg.slot21
    if v2397.invis then
      if not (tbl240[arg1_412.name]) then
        return
      end
    else
      return
    end
    if not (arg1_412.acted) then
      if (os.clock() - (arg1_412.t0 or 0)) < 5 then
        local ok37, v2398 = pcall(arg1_412.want)
        if ok37 then
          if v2398 then
            arg1_412.at = math.max(arg1_412.at, os.clock() + 30)
          end
        end
      end
    end
    for index119, item133 in ipairs(tbl31) do
      if item133.mover then
        if item133.want then
          if item133.at <= (os.clock() + 3) then
            if item133.on() then
              arg1_412, v2397 = pcall(item133.want)
              if arg1_412 then
                if v2397 then
                  if tbl240[item133.name] then
                    return
                  end
                  break
                end
              end
            end
          end
        end
      end
    end
    v2397 = reg.state
    v2397.visibleUntil = 0
  end
  local function fn361(arg1_413)
    local v2399 = reg.getHumanoid
    local v2400 = v2399()
    if v2400 then
      pcall(v2400.UnequipTools, v2400)
    end
    for index120, child38 in ipairs(arg1_413:GetChildren()) do
      if child38:IsA("Tool") then
        if fn24() then
          child38.Parent = fn24()
        end
      end
    end
    for i54 = 1, 3, 1 do
      arg1_413 = reg.heartbeatWait
      arg1_413()
    end
  end
  local function fn362(arg1_414)
    local v2401 = reg.localPlayer
    local character16, v2402 = v2401.Character, reg.getHumanoid
    local v2403 = v2402()
    if character16 and v2403 then
      if fn12() then
        if not (arg1_414) then
          return
        end
      end
    else
      return
    end
    v2401 = reg.state
    v2401.invisBusy = true
    fn61()
    fn361(character16)
    v2402 = reg.invokeRemote
    v2402("RF/Treadmill/AskDoff")
    pcall(function()
      v2403:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
      v2403.BreakJointsOnDeath = true
      v2403.RequiresNeck = true
      v2403.Health = 0
      v2403:ChangeState(Enum.HumanoidStateType.Dead)
      character16:BreakJoints()
    end)
    v2401 = os.clock() + 60
    while true do
      arg1_414 = reg.localPlayer
      if not ((arg1_414.Character == character16) and (os.clock() < v2401)) then
        break
      end
      fn4("RE/RigSync/AskRigWipe", character16)
      v2402 = os.clock() + 8
      while true do
        local v2404 = reg.localPlayer
        if not ((v2404.Character == character16) and (os.clock() < v2402)) then
          break
        end
        task.wait(0.2)
      end
    end
    v2401 = reg.state
    v2401.invisBusy = flag48
  end
  reg.state.respawn = fn362
  local flag49 = false
  local function fn363()
    if flag49 then
      return
    end
    flag49 = true
    local tbl241 = {"RE/GearSatchel/Lost", "RE/GearSatchel/Gained", "RE/RigSync/ProbeSatchel", "RE/RigSync/SeedSatchel", "RE/RigSync/CorrectionBegan", "RE/RigSync/Refresh", "RE/ToolTrigger/Trigger", "RE/BatSwing/Trigger"}
    for index121, item134 in ipairs(tbl241) do
      index121 = networking:FindFirstChild(item134)
      if index121 then
        fn2(index121.OnClientEvent, function()
        end)
      end
    end
    tbl241 = fn24()
    if tbl241 then
      fn2(tbl241.ChildAdded, function()
      end)
      fn2(tbl241.ChildRemoved, function()
      end)
    end
  end
  local function fn364(arg1_415)
    local v2405 = reg.state
    v2405.invisBusy = true
    local humanoid, humanoidRootPart = arg1_415:WaitForChild("Humanoid", 10), arg1_415:WaitForChild("HumanoidRootPart", 10)
    arg1_415:WaitForChild("Head", 10)
    if humanoid then
      if not (humanoidRootPart) then
        v2405 = reg.state
        flag48 = false
        v2405.invisBusy = false
        return
      end
    else
      local v2406 = reg.state
      flag48 = false
      v2406.invisBusy = false
      return
    end
    task.wait(0.05)
    pcall(humanoid.UnequipTools, humanoid)
    pcall(humanoid.UnequipTools, humanoid)
    for i55 = 1, 2, 1 do
      pcall(replicatesignal, humanoid.ServerBreakJoints)
    end
    local hipHeight, cFrame3 = humanoid.HipHeight, humanoidRootPart.CFrame
    humanoidRootPart.Anchored = true
    humanoid.HipHeight = 999
    for index122, child39 in ipairs(arg1_415:GetDescendants()) do
      if child39:IsA("Accessory") then
        child39.Parent = nil
      elseif child39:IsA("BasePart") then
        if child39 ~= humanoidRootPart then
          if not (child39:FindFirstAncestorOfClass("Accessory")) then
            child39.Parent = nil
          end
        end
      end
    end
    task.wait(0.12)
    humanoid, v2405 = Instance.new("Part"), reg.vec3
    humanoid.Name, humanoid.Size = "RightHand", v2405(0.2, 0.2, 0.2)
    humanoid.Transparency = 1
    humanoid.CanCollide = false
    humanoid.CanTouch = false
    humanoid.CanQuery = false
    humanoid.Massless = true
    humanoid.Parent = arg1_415
    local motor6D, v2407 = Instance.new("Motor6D"), reg.cframeNew
    motor6D.Name, motor6D.C0 = "RightWrist", v2407(1.2, 0, 0)
    motor6D.Part0 = humanoidRootPart
    motor6D.Part1 = humanoid
    motor6D.Parent = humanoidRootPart
    humanoidRootPart.CanCollide = false
    task.delay(0.2, function()
      if humanoidRootPart.Parent then
        humanoidRootPart.CanCollide = true
      end
    end)
    for index123, child40 in ipairs(arg1_415:GetChildren()) do
      if child40:IsA("Humanoid") then
        child40.AutomaticScalingEnabled = false
        child40.HipHeight = hipHeight
      end
    end
    arg1_415:SetAttribute("InvisHip", hipHeight)
    if humanoidRootPart.Position.Y > (cFrame3.Y + 5) then
      humanoidRootPart.CFrame = cFrame3
    end
    motor6D = reg.zeroVec
    humanoidRootPart.AssemblyLinearVelocity = motor6D
    humanoidRootPart.Anchored = false
    arg1_415:SetAttribute("InvisApplied", true)
    v2407 = reg.state
    v2407.invisSettle = os.clock() + 3.5
    arg1_415 = reg.state
    flag48 = false
    arg1_415.invisBusy = false
    task.delay(1, fn363)
  end
  reg.state.visibleUntil = 0
  local function fn365()
    local v2408 = reg.slot21
    local invis, v2409 = v2408.invis
    if invis then
      v2408 = nil
      v2408, v2409 = reg.state, os.clock() > reg.state.visibleUntil
    else
      v2409 = invis
    end
    invis, v2408 = v2409 and not (reg.slot4 and tbl240[reg.slot4.name])
    if invis then
      v2409 = reg.state
      local hwNeedVis, v2410 = v2409.hwNeedVis
      if hwNeedVis then
        local v2411 = reg.state
        v2410 = v2411.hwNeedVis()
      else
        v2410 = hwNeedVis
      end
      v2408 = not v2410
    else
      v2408 = invis
    end
    invis = nil
    if v2408 then
      v2409 = reg.state
      local hwKeep, v2412 = v2409.hwKeep
      if hwKeep then
        local v2413 = reg.state
        v2412 = v2413.hwKeep()
      else
        v2412 = hwKeep
      end
      invis = not v2412
    else
      invis = v2408
    end
    v2408 = nil
    if invis then
      v2409 = reg.state
      local inDim, v2414 = v2409.inDim
      if inDim then
        local v2415 = reg.state
        v2414 = v2415.inDim()
      else
        v2414 = inDim
      end
      v2408 = not v2414
    else
      v2408 = invis
    end
    return v2408
  end
  reg.state.invisWant = fn365
  local v2416, v2417
  local v2418 = fn50({name = "VisSettle", gap = 0.1})
  v2418.on = function()
    return true
  end
  v2418.fn = function()
    local v2419 = reg.localPlayer
    local character17 = v2419.Character
    v2419 = (character17 ~= nil) and (character17:GetAttribute("InvisApplied") == true)
    if (character17 ~= v2416) or (v2419 ~= v2417) then
      if v2416 then
        local v2420, v2421 = reg.state
        v2421, v2420.invisSettle = reg.state, math.max(reg.state.invisSettle or 0, os.clock() + 1)
      end
      v2416, v2417 = character17, v2419
    end
  end
  reg.state.needBody = function()
    local v2422 = reg.localPlayer
    local character18 = v2422.Character
    if character18 then
      if character18:GetAttribute("InvisApplied") then
        local v2423, v2424 = reg.state
        v2424, v2423.visibleUntil = reg.state, math.max(reg.state.visibleUntil, os.clock() + 25)
        return false
      end
    end
    v2422 = reg.slot21
    if v2422.invis then
      local v2425, v2426 = reg.state
      v2426, v2425.visibleUntil = reg.state, math.max(reg.state.visibleUntil, os.clock() + 25)
    end
    return true
  end
  fn2(reg.localPlayer.CharacterAdded, function(arg1_416)
    if fn365() then
      if not (fn12()) then
        local v2427 = reg.state
        flag48 = true
        v2427.invisBusy = true
        task.defer(fn364, arg1_416)
      end
    end
  end)
  v2396 = function()
    local v2428 = reg.localPlayer
    local character19 = v2428.Character
    if character19 then
      if not (character19:GetAttribute("InvisApplied")) then
        return
      end
    else
      return
    end
    local rightHand, tool2 = character19:FindFirstChild("RightHand"), character19:FindFirstChildOfClass("Tool")
    character19 = tool2 and (tool2:FindFirstChild("Handle"))
    if rightHand and character19 then
      for index124, child41 in ipairs(rightHand:GetChildren()) do
        if child41:IsA("JointInstance") then
          if child41.Name == "RightGrip" then
            child41.Enabled = false
          end
        end
      end
      character19.CFrame = rightHand.CFrame
      tool2 = reg.zeroVec
      character19.AssemblyLinearVelocity = tool2
    end
    tool2 = reg.getHumanoid
    character19, rightHand = tool2(), reg.getRoot
    v2428 = rightHand()
    if character19 then
      if v2428 then
        if reg.slot4 then
          if character19 then
            character19.AutoRotate = true
          end
        elseif v2428.Anchored then
          if character19 then
            character19.AutoRotate = true
          end
        elseif character19.MoveDirection.Magnitude > 0.1 then
          character19.AutoRotate = false
          v2428.CFrame = CFrame.lookAt(v2428.Position, v2428.Position + character19.MoveDirection)
        elseif character19 then
          character19.AutoRotate = true
        end
      elseif character19 then
        character19.AutoRotate = true
      end
    elseif character19 then
      character19.AutoRotate = true
    end
  end
  local v2429
  reg.state.invisFirst = function(arg1_417)
    local v2430 = reg.localPlayer
    local character20, v2431 = v2430.Character
    if character20 then
      v2430 = reg.localPlayer
      v2431 = v2430.Character:GetAttribute("InvisApplied")
    else
      v2431 = character20
    end
    if tbl240[arg1_417.name] then
      character20 = reg.slot21
      v2430 = character20.invis and v2431
      local flag50, v2432 = not v2430
      if v2430 then
        local v2433 = reg.slot29
        v2432 = (v2433())
      else
        v2432 = flag50
      end
      flag50 = (v2432 or fn12()) or (reg.slot4 and not reg.slot4.soft)
      if flag50 then
        return false
      elseif not (arg1_417.on()) then
        return false
      end
      v2432, flag50 = pcall(arg1_417.want)
      if v2432 then
        if not flag50 then
          return false
        end
      else
        return false
      end
      flag50, v2432 = reg.state
      v2432, flag50.visibleUntil, arg1_417.at = reg.state, math.max(reg.state.visibleUntil, os.clock() + 25), os.clock() + 0.5
      return true
    end
    arg1_417 = reg.slot21
    if arg1_417.invis then
      if fn365() then
        v2430 = reg.slot29
        if v2430() then
          v2429 = nil
          return false
        elseif fn12() then
          v2429 = nil
          return false
        elseif v2431 then
          v2429 = nil
          return false
        end
      else
        v2429 = nil
        return false
      end
    else
      v2429 = nil
      return false
    end
    v2429 = v2429 or os.clock()
    v2431 = os.clock() - v2429
    return v2431 < 10
  end
  local v2434, tbl242 = fn50({name = "Invis", gap = 1}), {}
  v2434.on = function()
    local v2435 = reg.slot21
    local invis2, v2436 = v2435.invis
    if invis2 then
      v2436 = invis2
    else
      v2435 = reg.localPlayer
      local character21 = v2435.Character
      if character21 then
        local v2437 = reg.localPlayer
        v2436 = v2437.Character:GetAttribute("InvisApplied")
      else
        v2436 = character21
      end
    end
    return v2436
  end
  v2434.fn = function()
    local v2438 = reg.localPlayer
    local character22, v2439, v2440 = v2438.Character, reg.slot4 and tbl240[reg.slot4.name]
    if v2439 then
      v2438 = reg.slot21
      v2440 = v2438.invis
    else
      v2440 = v2439
    end
    if v2440 then
      v2438, v2439 = reg.state
      v2439, v2438.visibleUntil = reg.state, math.max(reg.state.visibleUntil, os.clock() + 5)
    else
      local v2441, v2442, v2443 = reg.state, os.clock() < reg.state.visibleUntil
      if v2442 then
        local v2444 = reg.state
        local stealVis, v2445 = v2444.stealVis
        if stealVis then
          v2445 = stealVis
        else
          v2444 = reg.slot21
          v2445 = v2444.aura
        end
        v2443 = not v2445
      else
        v2443 = v2442
      end
      if v2443 then
        v2442 = nil
        for index125, item135 in ipairs(tbl31) do
          if tbl240[item135.name] then
            if item135.on() then
              local ok38, v2446 = pcall(item135.want)
              v2442 = v2442 or (ok38 and v2446)
            else
            end
          else
          end
        end
        if not v2442 then
          local v2447 = reg.state
          if v2447.hwNeedVis then
            local v2448 = reg.state
            if not (v2448.hwNeedVis()) then
              local v2449 = reg.state
              v2449.visibleUntil = 0
            end
          else
            local v2450 = reg.state
            v2450.visibleUntil = 0
          end
        end
      end
    end
    v2439, v2438 = character22 and (character22:GetAttribute("InvisApplied") == true), reg.state
    if v2438.hwKeep then
      character22 = reg.state
      if character22.hwKeep() then
        v2440 = reg.state
        if v2440.hwNeedVis then
          local v2451 = reg.state
          if not (v2451.hwNeedVis()) then
            return
          end
        else
          return
        end
      end
    end
    character22 = reg.state
    if character22.inDim then
      v2438 = reg.state
      if v2438.inDim() then
        v2440 = reg.state
        if v2440.hwNeedVis then
          local v2452 = reg.state
          if not (v2452.hwNeedVis()) then
            return
          end
        else
          return
        end
      end
    end
    v2438 = reg.state
    if v2438.invisBusy then
      return
    else
      character22 = reg.slot29
      if character22() then
        return
      elseif fn365() == v2439 then
        return
      elseif fn12() then
        return
      elseif reg.slot4 then
        if tbl240[reg.slot4.name] then
          return
        elseif not (reg.slot4.soft) then
          v2440 = reg.state
          if v2440.hwNeedVis then
            local v2453 = reg.state
            if not (v2453.hwNeedVis()) then
              return
            end
          else
            return
          end
        end
      end
    end
    v2440 = os.clock()
    while tbl242[1] and ((v2440 - tbl242[1]) > 60) do
      table.remove(tbl242, 1)
    end
    if #tbl242 >= 6 then
      return
    end
    tbl242[#tbl242 + 1] = v2440
    if reg.slot4 then
      fn51(reg.slot4)
    end
    fn362()
  end
end
do
  local section5, num68, num69, num70 = tbl39.Combat:Section("Hit aura", "swords"), 0, 0, 0
  local function fn366(arg1_418, arg2_146)
    local v2454 = reg.localPlayer
    if arg1_418 == v2454 then
      return
    elseif arg1_418.Parent ~= players then
      return
    end
    v2454 = arg1_418.Character
    local v2455, v2456 = v2454 and (v2454:FindFirstChildOfClass("Humanoid")), v2454 and (v2454:FindFirstChild("HumanoidRootPart"))
    if v2455 then
      if v2456 then
        if v2455.Health <= 0 then
          return
        elseif v2454:GetAttribute("IsTrapped") then
          return
        elseif arg1_418:GetAttribute("InBossArena") then
          return
        else
          local v2457 = reg.isBeforeSeparation
          if v2457(v2456.Position) then
            return
          end
        end
      else
        return
      end
    else
      return
    end
    if not (arg2_146) then
      if (tonumber(arg1_418:GetAttribute("RagdollEndTime")) or 0) > fn6() then
        return
      end
    end
    return v2456
  end
  local function fn367(arg1_419)
    if arg1_419 then
    else
      local v2458 = reg.state
      local bat2, v2459 = v2458.bat()
      arg1_419 = v2459
    end
    return ((17 + (arg1_419 or 0)) * ((workspace:GetAttribute("DragonEggEventActive") and 2.5) or 1)) - 1
  end
  local function fn368(arg1_420, arg2_147)
    if workspace:GetAttribute("PvPDisabled") then
      return
    end
    local v2460 = reg.state
    local bat3, v2461 = v2460.bat()
    v2460 = reg.getRoot
    local v2462, v2463 = v2460(), fn367(v2461)
    if bat3 then
      if v2462 then
        v2461 = reg.state
        if not (v2461.needBody()) then
          return
        end
      else
        return
      end
    else
      return
    end
    v2460 = reg.getHumanoid
    local v2464, v2465 = v2460(), reg.localPlayer
    if bat3.Parent ~= v2465.Character then
      if v2464 then
        pcall(v2464.EquipTool, v2464, bat3)
      end
    end
    v2460 = reg.localPlayer
    if bat3.Parent ~= v2460.Character then
      return
    end
    v2460 = reg.state
    if v2460.scrambler(bat3) then
      if (os.clock() - num70) > 0.3 then
        num70 = os.clock()
        pcall(bat3.Activate, bat3)
      end
      return
    end
    v2464 = reg.getPing
    v2460, v2461 = v2464(), v2462.Position - (v2462.AssemblyLinearVelocity * 0.18)
    if ((arg2_147.Position + (arg2_147.AssemblyLinearVelocity * v2460)) - v2461).Magnitude > v2463 then
      if (arg2_147.Position - v2461).Magnitude > v2463 then
        return
      end
    end
    if fn6() < ((tonumber(bat3:GetAttribute("CooldownEndTime")) or 0) - (v2460 * 0.5)) then
      return
    end
    if (os.clock() - num69) < math.max(0.12, v2460 * 1.5) then
      return
    end
    num69 = os.clock()
    num68 += 1
    v2460 = reg.localPlayer
    fn4("RE/BatSwing/Trigger", arg1_420, ("%d:%d:%d"):format(v2460.UserId, num68, math.floor(fn6() * 1000)))
    pcall(bat3.Activate, bat3)
  end
  reg.state.chase = function(arg1_421, arg2_148)
    local v2466, v2467 = fn366(arg1_421, arg2_148), reg.getRoot
    local v2468, v2469 = v2467(), reg.getHumanoid
    arg2_148 = v2469()
    if v2466 then
      if v2468 then
        if not arg2_148 then
          return false
        end
      else
        return false
      end
    else
      return false
    end
    arg2_148.PlatformStand = true
    arg2_148, v2469, v2467 = reg.getPing, reg.vec3, (v2466.Position + (v2466.AssemblyLinearVelocity * (reg.getPing() + 0.2))) + reg.vec3(0, 1.5, 0)
    local v2470, v2471 = v2466.AssemblyLinearVelocity + ((v2467 - v2468.Position) / 0.12), reg.slot21
    if v2470.Magnitude > (v2471.chase * 1.8) then
      v2467 = nil
      v2467, v2470 = reg.slot21, (v2470.Unit * reg.slot21.chase) * 1.8
    else
    end
    v2471 = nil
    v2471, v2468.CFrame = reg.vec3, CFrame.lookAt(v2468.Position, reg.vec3(v2466.Position.X, v2468.Position.Y, v2466.Position.Z))
    v2467 = reg.zeroVec
    v2468.AssemblyLinearVelocity = v2470
    v2468.AssemblyAngularVelocity = v2467
    fn368(arg1_421, v2466)
    return true
  end
  tbl9, tbl41 = setmetatable, {__mode = "k"}
  local v2472 = tbl9({}, tbl41)
  reg.state.huntStep = function(arg1_422, arg2_149, arg3_45)
    local v2473 = reg.getRoot
    local v2474, v2475 = v2473(), reg.getHumanoid
    v2473 = v2475()
    if v2474 then
      if not v2473 then
        return
      end
    else
      return
    end
    v2473.PlatformStand = true
    v2473 = v2472[arg1_422] or {}
    v2472[arg1_422] = v2473
    local v2476, v2477 = reg.vec3, arg2_149.AssemblyLinearVelocity * reg.vec3(1, 0, 1)
    v2473.s = (v2473.s and v2473.s:Lerp(v2477, 0.25)) or v2477
    if v2473.s.Magnitude > 1 then
      v2473.hd = ((v2473.hd and v2473.hd:Lerp(v2473.s.Unit, 0.25)) or v2473.s.Unit).Unit
    end
    local magnitude6, v2478, v2479, v2480, v2481 = v2473.s.Magnitude, reg.vec3, (v2474.Position - arg2_149.Position) * reg.vec3(1, 0, 1), v2473.hd
    if v2480 then
      v2481 = v2480
    else
      v2477 = (v2479.Magnitude > 0.1) and v2479.Unit
      if v2477 then
        v2481 = v2477
      else
        v2475 = reg.vec3
        v2481 = (v2475(0, 0, 1))
      end
    end
    v2480 = reg.getPing
    v2477, v2475, v2479 = arg2_149.Position + (v2473.s * (v2480() + 0.105)), (magnitude6 > 1) and (v2473.s.Unit * 3.6)
    if v2475 then
      v2479 = v2475
    else
      v2480 = reg.zeroVec
      v2479 = v2480
    end
    v2475, v2480 = v2477 + v2479, reg.vec3
    v2477 = v2480(-v2481.Z, 0, v2481.X)
    v2477 = if v2477:Dot(v2474.Position - v2475) < 0 then -v2477 else v2477
    v2480 = (os.clock() * 2) * 3.141592653589793
    local v2482, v2483, v2484 = reg.vec3, ((v2475 + (((v2481 * ((math.sin(v2480 / 1.1) * 0.5) + 0.5)) * math.max(5, math.min(fn367() * 0.7, 6 + (magnitude6 * 0.07)))) * 0.6)) + (v2477 * (((magnitude6 < 35) and 3) or 1.5))) + reg.vec3(0, math.sin(v2480 / 0.8) * 2.5, 0), reg.isRagdolled
    v2479, v2481 = v2484() and 1500
    if v2479 then
      v2481 = v2479
    else
      v2477, v2480 = nil
      v2477, v2480, v2481 = reg.slot21, reg.slot21, math.min(reg.slot21.chase + magnitude6, math.max(reg.slot21.chase, 1000))
    end
    v2475 = v2473.s + ((v2483 - v2474.Position) / math.max(0.12, arg3_45))
    v2475 = if v2475.Magnitude > v2481 then v2475.Unit * v2481 else v2475
    v2473, v2481 = reg.vec3, (arg2_149.Position - v2474.Position) * reg.vec3(1, 0, 1)
    if v2481.Magnitude > 0.05 then
      v2474.CFrame = CFrame.lookAt(v2474.Position, v2474.Position + v2481.Unit)
    end
    v2480, v2484 = reg.vec3
    v2484, v2474.AssemblyLinearVelocity = reg.zeroVec, v2475 + v2480(0, (workspace.Gravity * arg3_45) * 0.5, 0)
    v2474.AssemblyAngularVelocity = v2484
    fn368(arg1_422, arg2_149)
  end
  local v2485, tbl243 = setmetatable, {__mode = "k"}
  local v2486 = v2485({}, tbl243)
  local function fn369(arg1_423)
    task.spawn(function()
      local v2487, v2488, v2489, v2490 = reg.localPlayer, reg.localPlayer, pcall(reg.localPlayer.IsFriendsWith, reg.localPlayer, arg1_423.UserId)
      v2486[arg1_423] = v2489 and v2490
    end)
  end
  fn59("friends", players.PlayerAdded, fn369)
  for index126, item136 in ipairs(players:GetPlayers()) do
    fn369(item136)
  end
  local function fn370(arg1_424)
    local v2491 = reg.slot21
    return not (v2491.skipFr and v2486[arg1_424])
  end
  local function fn371(arg1_425, arg2_150)
    local v2492 = reg.getRoot
    local v2493, v2494 = v2492(), arg1_425 or math.huge
    if not (v2493) then
      return
    end
    v2492, arg1_425 = nil
    for index127, item137 in ipairs(players:GetPlayers()) do
      index127 = ((if arg2_150 then arg2_150[item137] else not arg2_150) and fn370(item137)) and fn366(item137)
      if index127 then
        if (index127.Position - v2493.Position).Magnitude < v2494 then
          local magnitude7 = (index127.Position - v2493.Position).Magnitude
          v2494, v2492, arg1_425 = magnitude7, item137, index127
        else
        end
      else
      end
    end
    return v2492, arg1_425
  end
  local num71 = 0
  fn44(section5, "Hit aura", "aura", false, function(arg1_426)
    fn59("aura", arg1_426 and heartbeat, function()
      if (os.clock() - num71) < 0.05 then
        return
      elseif reg.slot4 then
        if reg.slot4.name == "Steal" then
          return
        elseif reg.slot4.name == "Bloom" then
          return
        end
      end
      num71 = os.clock()
      local v2495, v2496 = fn371(fn367() + 6)
      if v2495 then
        fn368(v2495, v2496)
      end
    end)
  end)
  fn44(section5, "Skip friends", "skipFr", true)
  fn49, fn369, tbl243 = tbl39.Combat:Section("Weapons", "swords", 2), reg.state.ownedWeapons, function(arg1_427)
    local v2497 = reg.slot21
    v2497.weap = nil
    v2497 = ipairs
    for it1_100, it2_99 in v2497(arg1_427) do
      local v2498, v2499 = reg.slot21, reg.slot21
      v2498.weap = v2499.weap or {}
      v2498, it1_100 = reg.slot21
      it1_100, v2498.weap[reg.state.weaponId[it2_99] or it2_99] = reg.state, true
    end
  end
  fn49:Dropdown("Use weapons", fn369, {}, tbl243, true)
  fn47(fn49, "Hold each", "swapT", 0.2, 0.75, 0.35, function(arg1_428)
    return ("%.2fs"):format(arg1_428)
  end, 0.05)
  local v2500 = fn50({name = "Combat", mover = true, gap = 0.5, pri = 7, soft = true})
  section5 = tbl39.Combat:Section("Auto hit", "target")
  fn44(section5, "Auto hit", "combat", false, function(arg1_429)
    if not (arg1_429) then
      fn51(v2500)
    end
  end)
  fn46(section5, "Hit who", "hitWho", {"Nearest player", "Egg holders", "Chosen player"}, "Nearest player")
  local v2501
  local dropdown3 = section5:Dropdown("Chosen player", function()
    local tbl244, v2502, v2503 = {}, ipairs, vm[53](players:GetPlayers())
    for it1_101, it2_100 in v2502(vm:uT(v2503)) do
      it1_101 = reg.localPlayer
      if it2_100 ~= it1_101 then
        tbl244[#tbl244 + 1] = it2_100.DisplayName
      end
    end
    return tbl244
  end, nil, function(arg1_430)
    v2501 = arg1_430
  end)
  dropdown3.Skip = true
  fn2(players.PlayerRemoving, function(arg1_431)
    if arg1_431.DisplayName == v2501 then
      v2501 = nil
      fn33("chosen", function()
        dropdown3:Set(nil)
      end)
    end
  end)
  fn47(section5, "Chase speed", "chase", 100, 1000, 400, "", 10)
  local function fn372()
    local tbl245, v2504, v2505 = {}, pairs, reg.slot19
    local v2506 = vm[53](v2505())
    for it1_102, it2_101 in v2504(vm:uT(v2506)) do
      it1_102, v2505 = ((type(it2_101) == "table") and (it2_101.State == "Carried")) and tonumber(it2_101.CarrierUserId)
      if it1_102 then
        it2_101 = reg.localPlayer
        v2505 = it1_102 ~= it2_101.UserId
      else
        v2505 = it1_102
      end
      it2_101 = v2505 and (players:GetPlayerByUserId(it1_102))
      if it2_101 then
        tbl245[it2_101] = true
      end
    end
    return tbl245
  end
  local function fn373()
    local v2507 = reg.slot21
    if v2507.hitWho == "Egg holders" then
      return fn371(nil, fn372())
    end
    v2507 = reg.slot21
    if v2507.hitWho == "Chosen player" then
      local v2508, v2509 = ipairs, vm[53](players:GetPlayers())
      local v2510
      for it1_103, it2_102 in v2508(vm:uT(v2509)) do
        it1_103 = reg.localPlayer
        v2510 = if it2_102 ~= it1_103 then if it2_102.DisplayName == v2501 then it2_102 else v2510 else v2510
      end
      return fn371(nil, {[v2510 or 0] = (v2510 and true) or nil})
    end
    return fn371()
  end
  v2500.on = function()
    local v2511 = reg.slot21
    return v2511.combat
  end
  v2500.want = function()
    return fn373()
  end
  v2500.run = function(arg1_432, arg2_151)
    local v2512 = reg.state
    if v2512.needBody() then
      if reg.slot14(arg2_151) then
        local v2513 = reg.slot15
        if not (v2513(arg2_151)) then
          return
        end
      else
        return
      end
    else
      return
    end
    v2512 = os.clock()
    while arg2_151() do
      if (os.clock() - v2512) > 0.3 then
        v2512, arg1_432 = os.clock(), fn373()
        if not (arg1_432) then
          break
        end
      else
      end
      local v2514 = reg.state
      if not (v2514.chase(arg1_432)) then
        break
      end
      v2514 = reg.heartbeatWait
      v2514()
    end
    v2512 = reg.getHumanoid
    arg2_151 = v2512()
    if arg2_151 then
      arg2_151.PlatformStand = false
    end
  end
end
do
  tbl9 = tbl39.Server:Section("Server", "server")
  local text2 = tbl9:Text("--")
  fn46(tbl9, "Hop to", "hopMode", {"Least players", "Most players", "Random"}, "Least players")
  tbl9:Button("Hop server", "Hop", function()
    task.spawn(reg.state.hop)
  end, "gold")
  tbl9:Button("Rejoin this server", "Rejoin", function()
    local v2515, v2516, v2517 = reg.game, reg.game, reg.localPlayer
    pcall(teleportService.TeleportToPlaceInstance, teleportService, reg.game.PlaceId, reg.game.JobId, reg.localPlayer)
  end)
  tbl9:Button("Copy Job ID", "Copy", function()
    pcall(setclipboard, reg.game.JobId)
    local v2518 = reg.game
    fn34("Job ID copied", v2518.JobId, "ok")
  end)
  tbl41 = tbl39.Server:Section("Join and stay", "refresh")
  local input = tbl41:Input("Job ID", "Paste a Job ID")
  input.Skip = true
  tbl41:Button("Join that server", "Join", function()
    local match = tostring(input.Value):match("%x+%-%x+%-%x+%-%x+%-%x+")
    if match then
      local v2519, v2520 = reg.game, reg.localPlayer
      pcall(teleportService.TeleportToPlaceInstance, teleportService, reg.game.PlaceId, match, reg.localPlayer)
    end
  end)
  local flag51, num72 = false, 0
  fn2(reg.localPlayer.OnTeleport, function()
    num72 = os.clock()
  end)
  fn44(tbl41, "Rejoin on kick", "rejoin", true, function(arg1_433)
    fn59("kick", arg1_433 and fn("GuiService").ErrorMessageChanged, function(arg1_434)
      local lower = tostring(arg1_434):lower()
      if flag51 then
        return
      else
        local v2521 = reg.state
        if v2521.hopping then
          return
        elseif lower == "" then
          return
        elseif lower:find("teleport") then
          return
        elseif lower:find("full") then
          return
        elseif lower:find("ban") then
          return
        elseif lower:find("same account") then
          return
        elseif lower:find("duplicate") then
          return
        elseif (os.clock() - num72) < 60 then
          return
        end
      end
      flag51 = true
      task.spawn(function()
        local v2522 = (lower:find("shut") or lower:find("no longer")) or lower:find("closed")
        for i56 = 1, 1000, 1 do
          if v2522 or (i56 > 2) then
            local v2523, v2524 = reg.game, reg.localPlayer
            pcall(teleportService.Teleport, teleportService, reg.game.PlaceId, reg.localPlayer)
          else
            local v2525, v2526, v2527 = reg.game, reg.game, reg.localPlayer
            pcall(teleportService.TeleportToPlaceInstance, teleportService, reg.game.PlaceId, reg.game.JobId, reg.localPlayer)
          end
          task.wait((v2522 and 5) or 4)
        end
      end)
    end)
  end)
  local v2528 = ((queue_on_teleport or queueonteleport) or (syn and syn.queue_on_teleport)) or (fluxus and fluxus.queue_on_teleport)
  local function fn374(arg1_435)
    pcall(function()
      teleportService:SetTeleportSetting("__VenyxAutoLoad", arg1_435 == true)
    end)
    if arg1_435 and v2528 then
      if rawget(v4, "__VenyxAutoQueued") ~= true then
        if pcall(v2528, "local ok, on = pcall(function() return game:GetService(\"TeleportService\"):GetTeleportSetting(\"__VenyxAutoLoad\") end)\nif ok and on == true then\n  if not game:IsLoaded() then game.Loaded:Wait() end\n  loadstring(game:HttpGet(\"https://raw.githubusercontent.com/tienkhanh1/Venyx/refs/heads/main/VenyxHub\"))()\nend") then
          v4.__VenyxAutoQueued = true
        end
      end
    end
  end
  fn44(tbl41, "Auto load script", "autoExec", true, function(arg1_436)
    fn374(arg1_436)
    if arg1_436 then
      if not (v2528) then
        fn34("Auto load", "This executor cannot queue a script for the next server", "warn")
      end
    end
  end)
  reg.state.beforeTeleport = function()
    local v2529 = reg.slot21
    fn374(v2529.autoExec)
  end
  fn2(reg.localPlayer.OnTeleport, function(arg1_437)
    if arg1_437 == Enum.TeleportState.Started then
      local v2530 = reg.state
      v2530.beforeTeleport()
    end
  end)
  local tick = reg.state.tick
  reg.state.tick = function()
    text2:Set(("%d / %d players  -  %s"):format(#players:GetPlayers(), players.MaxPlayers, reg.game.JobId:sub(1, 13)))
    if tick then
      tick()
    end
  end
end
do
  tbl41 = tbl39.Webhook:Section("Discord webhook", "discord")
  local input2 = tbl41:Input("Webhook URL", "https://discord.com/api/webhooks/...")
  local v2531 = fn44(tbl41, "Ping everyone", "whPing", false)
  local function fn375(arg1_438)
    return tostring(arg1_438 or ""):match("%d%d%d%d%d+")
  end
  local function fn376(arg1_439)
    if fn375(arg1_439) then
      local v2532 = reg.slot21
      if v2532.whPing then
        v2531:Set(false)
      end
    end
  end
  local input3 = tbl41:Input("Ping user ID", "Discord user ID", fn376)
  local input4 = tbl41:Input("Ping role ID", "Discord role ID", fn376)
  local stats12 = tbl41:Stats({{"Posted", tbl17.check}, {"Waiting", tbl17.timer}})
  local function fn377()
    return (tostring(input2.Value):match("^%s*(.-)%s*$"))
  end
  local num73 = 0
  fn49 = tbl39.Webhook:Section("What to post", "star")
  fn44(fn49, "Post stolen eggs", "whSteal", false)
  fn44(fn49, "Post fused eggs", "whFuse", false)
  fn44(fn49, "Post when bag is full", "whFull", false)
  local v2533 = fn38(fn49, {rar = tbl7, minV = "Min value /s"})
  tbl41:Button("Send a test post", "Test", function()
    local v2534 = reg.state
    v2534.whTest = true
  end)
  local v2535 = fn50({name = "WebhookTest", gap = 0.3})
  v2535.on = function()
    local v2536 = reg.state
    return v2536.whTest
  end
  v2535.fn = function()
    local v2537 = reg.state
    v2537.whTest = nil
    local v2538, v2539 = reg.state
    for index128, item138 in ipairs(v2538.allEggs()) do
      v2539 = if v2539 then if item138.v > v2539.v then item138 else v2539 else item138
    end
    v2538 = reg.state
    if v2538.post("Egg Stolen! (test)", v2539 or {cat = "Test", n = "Venyx test", r = 7, v = 1000000000, s = 1, m = {}}, (v2539 and v2539.a) or "Test") == false then
      return fn34("Webhook", ((fn377() == "") and "Paste your Discord webhook link first") or "Check the webhook link", "warn")
    end
    fn34("Webhook", "Test post sent, check your Discord channel", "ok")
  end
  local v2540, v2541, v2542, v2543, v2544, v2545 = ((request or http_request) or (syn and syn.request)) or (http and http.request), {}, false, {}, {}
  local tbl246 = {}
  for i57 = 0, 255, 1 do
    fn376 = i57
    for i58 = 1, 8, 1 do
      fn376 = ((bit32.band(fn376, 1) == 1) and bit32.bxor(3988292384, bit32.rshift(fn376, 1))) or bit32.rshift(fn376, 1)
    end
    tbl246[i57] = fn376
  end
  local function fn378(arg1_440, arg2_152, arg3_46)
    local num74 = 4294967295
    for i59 = arg2_152, arg3_46, 1 do
      num74 = bit32.bxor(tbl246[bit32.band(bit32.bxor(num74, buffer.readu8(arg1_440, i59)), 255)], bit32.rshift(num74, 8))
    end
    return bit32.bxor(num74, 4294967295)
  end
  local function fn379(arg1_441, arg2_153, arg3_47)
    local v2546 = (arg2_153 * 4) + 1
    local v2547 = v2546 * arg3_47
    local v2548 = ((2 + (math.ceil(v2547 / 65535) * 5)) + v2547) + 4
    local create2, num75 = buffer.create((45 + v2548) + 12), 0
    local function fn380(arg1_442)
      buffer.writeu8(create2, num75, arg1_442)
      num75 += 1
    end
    local function fn381(arg1_443)
      for i60 = 24, 0, -8 do
        fn380(bit32.band(bit32.rshift(arg1_443, i60), 255))
      end
    end
    local tbl247 = {137, 80, 78, 71, 13, 10, 26, 10}
    for index129, item139 in ipairs(tbl247) do
      fn380(item139)
    end
    fn381(13)
    tbl247 = num75
    fn381(1229472850)
    fn381(arg2_153)
    fn381(arg3_47)
    local tbl248 = {8, 6, 0, 0, 0}
    for index130, item140 in ipairs(tbl248) do
      fn380(item140)
    end
    fn381(fn378(create2, tbl247, num75 - 1))
    tbl248 = buffer.create(v2547)
    for i61 = 0, arg3_47 - 1, 1 do
      buffer.copy(tbl248, (i61 * v2546) + 1, arg1_441, (i61 * arg2_153) * 4, arg2_153 * 4)
    end
    fn381(v2548)
    tbl247 = num75
    fn381(1229209940)
    fn380(120)
    fn380(1)
    v2548 = 0
    while v2548 < v2547 do
      arg3_47 = math.min(65535, v2547 - v2548)
      fn380((((v2548 + arg3_47) >= v2547) and 1) or 0)
      fn380(bit32.band(arg3_47, 255))
      fn380(bit32.rshift(arg3_47, 8))
      arg2_153 = bit32.band(bit32.bnot(arg3_47), 65535)
      fn380(bit32.band(arg2_153, 255))
      fn380(bit32.rshift(arg2_153, 8))
      buffer.copy(create2, num75, tbl248, v2548, arg3_47)
      num75 += arg3_47
      v2548 = v2548 + arg3_47
    end
    v2548, arg2_153 = 1, 0
    for i62 = 0, v2547 - 1, 1 do
      v2548 = (v2548 + buffer.readu8(tbl248, i62)) % 65521
      arg2_153 = (arg2_153 + v2548) % 65521
    end
    fn381((arg2_153 * 65536) + v2548)
    fn381(fn378(create2, tbl247, num75 - 1))
    fn381(0)
    tbl247 = num75
    fn381(1229278788)
    fn381(fn378(create2, tbl247, num75 - 1))
    return buffer.tostring(create2)
  end
  local function fn382(arg1_444)
    if v2543[arg1_444] == nil then
      local ok39, v2549 = pcall(function()
        local createEditableImageAsync = fn("AssetService"):CreateEditableImageAsync(Content.fromUri("rbxassetid://" .. arg1_444))
        local size = createEditableImageAsync.Size
        local floor, floor2, readPixelsBuffer = math.floor(size.X), math.floor(size.Y), createEditableImageAsync:ReadPixelsBuffer(Vector2.zero, size)
        pcall(createEditableImageAsync.Destroy, createEditableImageAsync)
        createEditableImageAsync = math.min(1, 200 / math.max(floor, floor2))
        local max11, max12 = math.max(1, math.floor(floor * createEditableImageAsync)), math.max(1, math.floor(floor2 * createEditableImageAsync))
        size = buffer.create((max11 * max12) * 4)
        for i63 = 0, max12 - 1, 1 do
          local min4 = math.min(floor2 - 1, math.floor(i63 / createEditableImageAsync))
          for i64 = 0, max11 - 1, 1 do
            buffer.copy(size, ((i63 * max11) + i64) * 4, readPixelsBuffer, ((min4 * floor) + math.min(floor - 1, math.floor(i64 / createEditableImageAsync))) * 4, 4)
          end
        end
        return fn379(size, max11, max12)
      end)
      v2543[arg1_444] = ((ok39 and (type(v2549) == "string")) and v2549) or false
    end
    return v2543[arg1_444] or nil
  end
  local function fn383(arg1_445, arg2_154)
    local v2550, v2551, v2552, v2553 = reg.game, reg.game, pcall(reg.game.HttpGet, reg.game, arg1_445)
    local v2554, v2555, v2556, v2557 = reg.httpService, reg.httpService, pcall(reg.httpService.JSONDecode, reg.httpService, (v2552 and v2553) or "")
    v2552 = ((v2556 and (type(v2557) == "table")) and (type(v2557.data) == "table")) and v2557.data[1]
    arg1_445 = ((type(v2552) == "table") and (v2552.state == "Completed")) and v2552.imageUrl
    return (((type(arg1_445) == "string") and (if arg2_154 then arg1_445:find("/Image/", 1, true) else not arg2_154)) and arg1_445) or nil
  end
  local function fn384(arg1_446)
    if v2544[arg1_446] == nil then
      v2544[arg1_446] = fn383("https://thumbnails.roblox.com/v1/assets?assetIds=" .. (arg1_446 .. "&returnPolicy=PlaceHolder&size=420x420&format=Png&isCircular=false"), true) or false
    end
    return v2544[arg1_446] or nil
  end
  local function fn385()
    if v2545 == nil then
      local v2558 = reg.localPlayer
      v2545 = fn383("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. (v2558.UserId .. "&size=150x150&format=Png&isCircular=false")) or false
    end
    local v2559 = v2545 or nil
    return v2559
  end
  local function fn386()
    if v2542 then
      return
    end
    v2542 = true
    while #v2541 > 0 do
      local remove, tbl249 = table.remove(v2541, 1), {Url = fn377(), Method = "POST"}
      if remove.png then
        local v2560 = reg.httpService
        local str12 = "Venyx" .. v2560:GenerateGUID(false):gsub("-", "")
        tbl249.Headers = {["Content-Type"] = "multipart/form-data; boundary=" .. str12}
        local concat, tbl250, v2561 = table.concat, {}, reg.httpService
        vm:yT(tbl250, 0, "--", str12, "\013\nContent-Disposition: form-data; name=\"payload_json\"\013\nContent-Type: application/json\013\n\013\n", reg.httpService:JSONEncode(remove.p), "\013\n--", str12, "\013\nContent-Disposition: form-data; name=\"files[0]\"; filename=\"egg.png\"\013\nContent-Type: image/png\013\n\013\n", remove.png, "\013\n--", str12, "--\013\n")
        tbl249.Body = concat(tbl250)
      else
        tbl249.Headers = {["Content-Type"] = "application/json"}
        local v2562 = reg.httpService
        tbl249.Body = v2562:JSONEncode(remove.p)
      end
      local ok40, v2563 = pcall(v2540, tbl249)
      tbl249 = (ok40 and (type(v2563) == "table")) and tonumber(v2563.StatusCode)
      if (tbl249 == 429) and ((remove.n or 0) < 3) then
        remove.n = (remove.n or 0) + 1
        table.insert(v2541, 1, remove)
        task.wait(3)
      elseif tbl249 ~= 200 then
        if tbl249 ~= 204 then
          if remove.png then
            remove.png, remove.p.attachments = nil, nil
            remove.p.embeds[1].thumbnail = (remove.alt and {url = remove.alt}) or nil
            table.insert(v2541, 1, remove)
          else
            num73 += 1
          end
        else
          num73 += 1
        end
      else
        num73 += 1
      end
      task.wait(1.2)
      fn36("wst", stats12, {Posted = tostring(num73), Waiting = tostring(#v2541)})
    end
    v2542 = false
  end
  local str13 = "  " .. (utf8.char(183) .. "  ")
  local function fn387(arg1_447)
    local v2564 = ((arg1_447 >= 1000) and ("%.0f"):format(arg1_447)) or ("%.2f"):format(arg1_447)
    local match2, v2565 = v2564:match("^(%d+)(.*)$")
    return match2:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "") .. (v2565 .. " kg")
  end
  local function fn388(arg1_448)
    local v2566 = reg.modules
    local areas2, v2567 = v2566.Areas
    if areas2 then
      v2566 = reg.modules
      v2567 = v2566.Areas.Directory
    else
      v2567 = areas2
    end
    areas2 = ((type(v2567) == "table") and arg1_448) and v2567[arg1_448]
    return (((type(areas2) == "table") and tostring(areas2.DisplayName or arg1_448)) or (arg1_448 and tostring(arg1_448))) or "Field"
  end
  local function fn389()
    return v2540 and fn377():match("^https://[%w%.]*discord[%w]*%.com/api/webhooks/%d+/[%w%-_]+/?%??[%w=&_%-]*$")
  end
  local function fn390(arg1_449, arg2_155)
    local tbl251, v2568 = {}, reg.localPlayer
    tbl251.name = v2568.DisplayName
    tbl251.icon_url = fn385()
    arg1_449.author = tbl251
    tbl251, v2568 = DateTime.now():ToIsoDate(), {}
    v2568.text, v2568.icon_url, arg1_449.timestamp = "Venyx" .. (str13 .. "Steal An Egg"), "https://media.discordapp.net/attachments/1181785068637790221/1560058241839398993/Venyx_Vx_icon_vector_3.png?ex=6ad154f5&is=6ad00375&hm=102a2e09b0f71280eb8cf126aeda932ed9aafcdf743248ef779ce62247b110c2&=&format=webp&quality=lossless", tbl251
    arg1_449.footer = v2568
    local tbl252, v2569, v2570 = {username = "Venyx", avatar_url = "https://media.discordapp.net/attachments/1181785068637790221/1560058241839398993/Venyx_Vx_icon_vector_3.png?ex=6ad154f5&is=6ad00375&hm=102a2e09b0f71280eb8cf126aeda932ed9aafcdf743248ef779ce62247b110c2&=&format=webp&quality=lossless", embeds = {arg1_449}}, arg2_155 and (fn382(arg2_155)), arg2_155 and (fn384(arg2_155))
    if v2569 then
      arg1_449.thumbnail = {url = "attachment://egg.png"}
      tbl252.attachments = {{id = 0, filename = "egg.png"}}
    elseif v2570 then
      arg1_449.thumbnail = {url = v2570}
    end
    v2568, tbl251 = fn375(input3.Value), fn375(input4.Value)
    if v2568 or tbl251 then
      tbl252.content, tbl252.allowed_mentions = ((v2568 and ("<@" .. (v2568 .. "> "))) or "") .. ((tbl251 and ("<@&" .. (tbl251 .. ">"))) or ""), {users = {v2568}, roles = {tbl251}}
    else
      arg1_449 = reg.slot21
      if arg1_449.whPing then
        tbl252.content, tbl252.allowed_mentions = "@everyone", {parse = {"everyone"}}
      end
    end
    if #v2541 >= 20 then
      table.remove(v2541, 1)
    end
    v2541[#v2541 + 1] = {p = tbl252, png = v2569, alt = v2570}
    task.spawn(fn386)
  end
  reg.state.post = function(arg1_450, arg2_156, arg3_48, arg4_16)
    if not (fn389()) then
      return false
    end
    task.spawn(function()
      local v2571 = fn16(arg2_156.cat)
      local v2572, tbl253 = (v2571 and v2571.Rarity) and v2571.Rarity.Color, {}
      for index131, item141 in ipairs(arg2_156.m) do
        tbl253[#tbl253 + 1] = tbl10[item141] or item141
      end
      local format4, v2573, num76 = ("x%.2f"):format(arg2_156.s), reg.callModule, tonumber(reg.callModule("Rec", "WeightKgForScale", arg2_156.cat, arg2_156.s))
      format4 = if num76 then format4 .. (str13 .. fn387(num76)) else format4
      local v2574, tbl254, concat2, tbl255, n, v2575 = v2571 and (((arg4_16 and v2571.Egg) and v2571.Egg.Icon) or v2571.Icon), {title = arg1_450, color = ((typeof(v2572) == "Color3") and (((math.floor((v2572.R * 255) + 0.5) * 65536) + (math.floor((v2572.G * 255) + 0.5) * 256)) + math.floor((v2572.B * 255) + 0.5))) or 9134335}, table.concat, {}, arg2_156.n, tbl7[arg2_156.r]
      v2571, v2572 = ("**%s**%s%s"):format(n, str13, v2575 or "?"), vm[53](fn15(arg2_156.v))
      v2575, n, num76 = ("<:sae_value:1551645680718581871> **Value:** $%s/s"):format(vm:uT(v2572)), ("<:sae_size:1551645444285800558> **Size:** %s"):format(format4), (#tbl253 > 0) and table.concat(tbl253, ", ")
      v2572, tbl253 = ("<:sae_mutation:1551677914146275478> **Mutation:** %s"):format(num76 or "None"), vm[53](fn388(arg3_48))
      vm:yT(tbl255, 0, v2571, v2575, n, v2572, ("<:sae_area:1551675973328441416> **Area:** %s"):format(vm:uT(tbl253)))
      tbl254.description = concat2(tbl255, "\n")
      fn390(tbl254, tonumber(tostring(v2574 or ""):match("%d+")))
    end)
  end
  local v2576, v2577
  task.spawn(function()
    local v2578 = reg.modules
    local egg4 = v2578.Egg
    if egg4 then
      if egg4.CarryChanged then
        fn2(egg4.CarryChanged, function(arg1_451)
          if (type(arg1_451) == "table") and arg1_451.IsCarrying then
            local v2579 = reg.slot21
            local v2580 = v2579.whSteal and (if v2576 then v2576.endAt else not v2576)
            if v2580 then
              v2577 = {}
              local v2581, v2582 = pairs, vm[53](fn25())
              for it1_104 in v2581(vm:uT(v2582)) do
                v2577[it1_104] = true
              end
            end
            v2576 = {cat = tostring(arg1_451.AssetCategory), uid = tostring(arg1_451.Uid), area = arg1_451.AreaId}
          elseif v2576 then
            local v2583 = v2576
            v2583.endAt = v2583.endAt or os.clock()
          end
        end)
      end
    end
  end)
  local flag52 = false
  local v2584 = fn50({name = "WebhookFull", gap = 2})
  v2584.on = function()
    local v2585 = reg.slot21
    return v2585.whFull
  end
  v2584.fn = function()
    local v2586 = reg.slot59
    local v2587, num77 = v2586(), 0
    for key65 in next, ((v2587 and (type(v2587.EggInventory) == "table")) and v2587.EggInventory) or {}, nil do
      num77 += 1
    end
    v2586 = reg.state
    v2587 = num77 >= (v2586.bagMax or 115)
    if v2587 then
      if not (flag52) then
        if fn389() then
          local tbl256, v2588 = {title = "Egg Bag Full!", color = 16732245}, reg.state
          tbl256.description = ("**Eggs:** %d / %d\nPlace, hatch or sell to make room."):format(num77, v2588.bagMax or 115)
          fn390(tbl256)
        end
      end
    end
    flag52 = v2587
  end
  local tbl257 = {}
  for key66 in pairs((fn25())) do
    tbl257[key66] = true
  end
  local v2589 = fn50({name = "WebhookSteal", gap = 1.5})
  v2589.on = function()
    local v2590 = reg.slot21
    local v2591 = ((v2590.whSteal and v2577) and v2576) and not (v2576.endAt and ((os.clock() - v2576.endAt) > 20))
    return v2591
  end
  v2589.fn = function()
    local v2592, tbl258, v2593, v2594 = v2576, {}, pairs, vm[53](fn25())
    for it1_105, it2_103 in v2593(vm:uT(v2594)) do
      if not (v2577[it1_105]) then
        if type(it2_103) == "table" then
          v2577[it1_105] = true
          tbl258[#tbl258 + 1] = {it1_105, it2_103}
        end
      end
    end
    if #tbl258 == 0 then
      return
    end
    v2594 = reg.slot59
    v2593 = v2594()
    local v2595, v2596 = (v2593 and (type(v2593.FusionEggReward) == "table")) and v2593.FusionEggReward.Uid, ipairs
    for it1_106, it2_104 in v2596(tbl258) do
      v2593 = (it2_104[1] ~= v2595) and ((it2_104[1] == v2592.uid) or (tostring(it2_104[2].AssetCategory) == v2592.cat))
      if v2593 then
        v2576 = nil
        v2594, it1_106 = fn21(it2_104[2]), reg.slot63
        if it1_106(v2533, v2594) then
          local v2597 = reg.state
          v2597.post("Egg Stolen!", v2594, v2592.area or it2_104[2].AreaId)
        end
        return
      end
    end
  end
  local v2598 = fn50({name = "Webhook", gap = 2})
  v2598.on = function()
    local v2599 = reg.slot21
    return v2599.whFuse
  end
  v2598.fn = function()
    local v2600 = reg.slot59
    local v2601 = v2600()
    local v2602, v2603 = (v2601 and (type(v2601.FusionEggReward) == "table")) and v2601.FusionEggReward
    if v2602 then
      v2603 = v2602
    else
      v2601 = reg.state
      v2603 = v2601.fuseRw
    end
    v2602 = reg.state
    v2602.fuseRw = nil
    v2602 = v2603 and v2603.Uid
    if v2602 then
      if tbl257[v2602] then
        return
      end
    else
      return
    end
    tbl257[v2602] = true
    v2601 = fn25()[v2602] or v2603.Egg
    if type(v2601) == "table" then
      v2603, v2602 = fn21(v2601), reg.slot63
      if v2602(v2533, v2603) then
        v2600 = reg.state
        v2600.post("Egg Fused!", v2603, "Fuse machine", true)
      end
    end
  end
end
do
  fn49, tbl41, tbl9 = tbl39.Optimizer:Section("Graphics", "eye", 1), tbl39.Optimizer:Section("Frame rate", "gauge", 2), tbl39.Optimizer:Section("Bases", "farm", 2)
  fn47(tbl41, "FPS cap", "fpsCap", 30, 360, 240, "", 10, function(arg1_452)
    pcall(setfpscap, (reg.slot21.no3d and math.min(arg1_452, 40)) or arg1_452)
  end)
  local v2604, tbl259 = setmetatable, {__mode = "k"}
  local v2605 = v2604({}, tbl259)
  local function fn391(arg1_453, arg2_157, arg3_49)
    local ok41, v2606 = pcall(function()
      return arg1_453[arg2_157]
    end)
    if not (ok41) then
      return
    end
    ok41 = v2605[arg1_453] or {}
    v2605[arg1_453] = ok41
    if ok41[arg2_157] == nil then
      ok41[arg2_157] = v2606
    end
    pcall(function()
      arg1_453[arg2_157] = arg3_49
    end)
  end
  local tbl260 = {"ParticleEmitter", "Trail", "Beam", "Fire", "Smoke", "Sparkles", "Light", "PostEffect"}
  local function fn392(arg1_454)
    for index132, item142 in ipairs(tbl260) do
      if arg1_454:IsA(item142) then
        if item142 == "ParticleEmitter" then
          fn391(arg1_454, "Rate", 0)
        elseif item142 == "Light" then
          fn391(arg1_454, "Brightness", 0)
        end
        return fn391(arg1_454, "Enabled", false)
      end
    end
    if (arg1_454:IsA("Decal") or arg1_454:IsA("Texture")) and (arg1_454.Name ~= "face") then
      fn391(arg1_454, "Transparency", 1)
    elseif arg1_454:IsA("SurfaceAppearance") then
      fn391(arg1_454, "Parent", nil)
    elseif arg1_454:IsA("BillboardGui") then
      fn391(arg1_454, "Enabled", false)
    elseif arg1_454:IsA("SurfaceGui") then
      fn391(arg1_454, "Enabled", false)
    else
      local isA = arg1_454:IsA("Accessory")
      local v2607
      if isA then
        local v2608 = reg.localPlayer
        local character23, v2609 = v2608.Character
        if character23 then
          v2608 = reg.localPlayer
          v2609 = arg1_454:IsDescendantOf(v2608.Character)
        else
          v2609 = character23
        end
        v2607 = not v2609
      else
        v2607 = isA
      end
      if v2607 then
        isA = arg1_454:FindFirstChildWhichIsA("BasePart")
        if isA then
          fn391(isA, "Transparency", 1)
        end
      elseif arg1_454:IsA("SpecialMesh") then
        fn391(arg1_454, "TextureId", "")
      elseif arg1_454:IsA("Explosion") then
        fn391(arg1_454, "Visible", false)
      else
        local isA2 = arg1_454:IsA("BasePart")
        local v2610
        if isA2 then
          local v2611 = reg.localPlayer
          local character24, v2612 = v2611.Character
          if character24 then
            v2611 = reg.localPlayer
            v2612 = arg1_454:IsDescendantOf(v2611.Character)
          else
            v2612 = character24
          end
          v2610 = not v2612
        else
          v2610 = isA2
        end
        if v2610 then
          if arg1_454:IsA("MeshPart") then
            fn391(arg1_454, "TextureID", "")
            fn391(arg1_454, "RenderFidelity", Enum.RenderFidelity.Performance)
          end
          fn391(arg1_454, "CastShadow", false)
          fn391(arg1_454, "Reflectance", 0)
          fn391(arg1_454, "Material", Enum.Material.SmoothPlastic)
        elseif arg1_454:IsA("Atmosphere") then
          fn391(arg1_454, "Density", 0)
          fn391(arg1_454, "Haze", 0)
          fn391(arg1_454, "Glare", 0)
        elseif arg1_454:IsA("Clouds") then
          fn391(arg1_454, "Cover", 0)
        end
      end
    end
  end
  local lighting = fn("Lighting")
  local terrain = workspace.Terrain
  local function fn393(arg1_455)
    local clock, v2613 = os.clock, ipairs
    local v2614 = clock()
    for it1_107, it2_105 in v2613(arg1_455) do
      clock = reg.slot21
      if not (clock.opt) then
        return
      end
      pcall(fn392, it2_105)
      if (os.clock() - v2614) > 0.003 then
        it1_107 = reg.heartbeatWait
        it1_107()
        v2614 = os.clock()
      else
      end
    end
  end
  local tbl261 = {}
  fn44(fn49, "Low graphics", "opt", false, function(arg1_456)
    fn59("opt", arg1_456 and workspace.DescendantAdded, function(arg1_457)
      tbl261[#tbl261 + 1] = arg1_457
    end)
    local v2615
    if arg1_456 then
      local v2616 = reg.runService
      v2615 = v2616.Heartbeat
    else
      v2615 = arg1_456
    end
    fn59("optDrain", v2615, function()
      local now17 = os.clock()
      while (#tbl261 > 0) and ((os.clock() - now17) < 0.003) do
        pcall(fn392, table.remove(tbl261))
      end
    end)
    table.clear(tbl261)
    if arg1_456 then
      v2615 = settings().Rendering
      fn391(v2615, "QualityLevel", Enum.QualityLevel.Level01)
      fn391(v2615, "MeshPartDetailLevel", Enum.MeshPartDetailLevel.Level01)
      pcall(function()
        fn391(UserSettings():GetService("UserGameSettings"), "SavedQualityLevel", Enum.SavedQualitySetting.QualityLevel1)
      end)
      fn391(lighting, "GlobalShadows", false)
      fn391(lighting, "ShadowSoftness", 0)
      fn391(lighting, "FogEnd", 9000000000)
      fn391(lighting, "EnvironmentDiffuseScale", 0)
      fn391(lighting, "EnvironmentSpecularScale", 0)
      fn391(terrain, "Decoration", false)
      fn391(terrain, "WaterWaveSize", 0)
      fn391(terrain, "WaterWaveSpeed", 0)
      fn391(terrain, "WaterReflectance", 0)
      fn391(terrain, "WaterTransparency", 1)
      task.spawn(function()
        fn393(lighting:GetDescendants())
        fn393(workspace:GetDescendants())
      end)
    else
      task.spawn(function()
        local v2617, num78 = next, 0
        for key67, item143 in v2617, v2605, nil do
          for key68, item144 in next, item143, nil do
            pcall(function()
              key67[key68] = item144
            end)
          end
          v2605[key67] = nil
          num78 += 1
          if (num78 % 300) == 0 then
            item143 = reg.heartbeatWait
            item143()
          end
        end
      end)
    end
  end)
  local v2618, v2619, tbl262 = fn3("Folder", {Name = "VenyxHidden"}), setmetatable, {__mode = "k"}
  local v2620, tbl263 = v2619({}, tbl262), {ClientRenderedAssets = true, PlacedEggRenders = true}
  reg.state.hidden = v2618
  local function fn394(arg1_458)
    local v2621 = reg.localPlayer
    return tonumber(arg1_458:GetAttribute("OwnerUserId") or arg1_458.Name:match("^(%d+)_")) == v2621.UserId
  end
  local function fn395(arg1_459)
    local v2622 = fn394(arg1_459)
    arg1_459 = nil
    if v2622 then
      local v2623 = reg.slot21
      arg1_459 = v2623.hideMine
    else
      arg1_459 = v2622
    end
    local v2624
    if arg1_459 then
      v2624 = arg1_459
    else
      local flag53 = not v2622
      if v2622 then
        v2624 = flag53
      else
        local v2625 = reg.slot21
        v2624 = v2625.hideOthers
      end
    end
    return v2624
  end
  local function fn396(arg1_460)
    if arg1_460.Parent ~= v2618 then
      if fn395(arg1_460) then
        v2620[arg1_460] = arg1_460.Parent
        arg1_460.Parent = v2618
      end
    end
  end
  local function fn397()
    for key69, item145 in next, v2620, nil do
      if not (fn395(key69)) then
        v2620[key69] = nil
        if item145.Parent then
          if key69.Parent == v2618 then
            key69.Parent = item145
          end
        end
      end
    end
    local v2626 = reg.slot21
    local hideMine, v2627 = v2626.hideMine
    if hideMine then
      v2627 = hideMine
    else
      v2626 = reg.slot21
      v2627 = v2626.hideOthers
    end
    for key70 in next, tbl263, nil do
      v2626 = workspace:FindFirstChild(key70)
      for index133, child42 in ipairs((v2626 and v2626:GetChildren()) or {}) do
        fn396(child42)
      end
      fn59("hide" .. key70, (v2626 and v2627) and v2626.ChildAdded, function(arg1_461)
        task.defer(fn396, arg1_461)
      end)
    end
    fn59("hideW", v2627 and workspace.ChildAdded, function(arg1_462)
      if tbl263[arg1_462.Name] then
        task.defer(fn397)
      end
    end)
  end
  fn44(tbl9, "Hide other players' pets and eggs", "hideOthers", false, fn397)
  fn44(tbl9, "Hide my pets and eggs", "hideMine", false, fn397)
  table.insert(reg.state.cleanup, function()
    local v2628, v2629 = reg.slot21, reg.slot21
    v2628.hideMine = false
    v2629.hideOthers = false
    fn397()
  end)
  local v2630 = fn3("ScreenGui", {Name = "VenyxBlack", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = -1000, Enabled = false, Parent = reg.localPlayer:FindFirstChildOfClass("PlayerGui")})
  local v2631 = fn3("Frame", {Parent = v2630, Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0})
  table.insert(reg.state.cleanup, function()
    v2630:Destroy()
  end)
  local v2632 = fn50({name = "Render", gap = 180, at = math.huge})
  local v2633
  fn44(fn49, "Disable 3D Render", "no3d", false, function(arg1_463)
    local v2634, v2635 = reg.runService, reg.runService
    pcall(reg.runService.Set3dRenderingEnabled, reg.runService, not arg1_463)
    local v2636, v2637, v2638 = pcall, setfpscap
    if arg1_463 then
      local v2639
      v2639, v2638 = reg.slot21, math.min(reg.slot21.fpsCap, 40)
    else
      v2638 = arg1_463
    end
    local v2640
    if v2638 then
      v2640 = v2638
    else
      local v2641 = reg.slot21
      v2640 = v2641.fpsCap
    end
    v2636(v2637, v2640)
    pcall(function()
      local rendering = settings().Rendering
      if arg1_463 then
        v2633 = v2633 or rendering.QualityLevel
        rendering.QualityLevel = Enum.QualityLevel.Level01
      elseif v2633 then
        local v2642 = reg.slot21
        if not (v2642.opt) then
          rendering.QualityLevel = v2633
          v2633 = nil
        end
      end
    end)
    v2630.Enabled = arg1_463
    v2632.at = (arg1_463 and (os.clock() + 180)) or math.huge
  end)
  fn46(fn49, "Background color", "no3dColor", {"Black", "White"}, "Black", function(arg1_464)
    v2631.BackgroundColor3 = ((arg1_464 == "White") and Color3.new(1, 1, 1)) or Color3.new(0, 0, 0)
  end)
  v2632.on = function()
    local v2643 = reg.slot21
    return v2643.no3d
  end
  v2632.fn = function()
    local v2644, v2645 = reg.runService, reg.runService
    pcall(reg.runService.Set3dRenderingEnabled, reg.runService, true)
    task.wait(2)
    local v2646 = reg.slot21
    if v2646.no3d then
      local v2647, v2648 = reg.runService, reg.runService
      pcall(reg.runService.Set3dRenderingEnabled, reg.runService, false)
    end
  end
  local starterGui, v2649, tbl264 = fn("StarterGui"), setmetatable, {__mode = "k"}
  local v2650, v2651, tbl265 = v2649({}, tbl264), setmetatable, {__mode = "k"}
  local v2652, tbl266, tbl267 = v2651({}, tbl265), {}, {}
  local function fn398(arg1_465)
    v2652[arg1_465] = (v2652[arg1_465] or 0) + 1
    arg1_465.Enabled = false
  end
  local function fn399(arg1_466)
    if arg1_466:IsA("LayerCollector") then
      if arg1_466 == v2630 then
        return
      elseif v2650[arg1_466] ~= nil then
        return
      end
    else
      return
    end
    v2650[arg1_466] = arg1_466.Enabled
    tbl266[#tbl266 + 1] = arg1_466:GetPropertyChangedSignal("Enabled"):Connect(function()
      local v2653 = reg.slot21
      if not (v2653.hideUI) then
        return
      end
      if arg1_466.Enabled then
        v2650[arg1_466] = true
        fn398(arg1_466)
      else
        v2653 = v2652[arg1_466]
        if v2653 then
          if v2653 > 0 then
            v2652[arg1_466] = v2652[arg1_466] - 1
          else
            v2650[arg1_466] = false
          end
        else
          v2650[arg1_466] = false
        end
      end
    end)
    if arg1_466.Enabled then
      fn398(arg1_466)
    end
  end
  fn44(fn49, "Hide game UI", "hideUI", false, function(arg1_467)
    local v2654 = reg.localPlayer
    local playerGui3 = v2654:FindFirstChildOfClass("PlayerGui")
    fn59("hideUI", (arg1_467 and playerGui3) and playerGui3.ChildAdded, fn399)
    if arg1_467 then
      for index134, child43 in ipairs((playerGui3 and playerGui3:GetChildren()) or {}) do
        fn399(child43)
      end
      local v2655, v2656 = ipairs, vm[53](Enum.CoreGuiType:GetEnumItems())
      for it1_108, it2_106 in v2655(vm:uT(v2656)) do
        if it2_106 ~= Enum.CoreGuiType.All then
          if starterGui:GetCoreGuiEnabled(it2_106) then
            v2654 = tbl267
            v2654[#v2654 + 1] = it2_106
            pcall(starterGui.SetCoreGuiEnabled, starterGui, it2_106, false)
          end
        end
      end
    else
      for index135, item146 in ipairs(tbl266) do
        item146:Disconnect()
      end
      for key71, item147 in next, v2650, nil do
        if key71.Parent then
          if item147 then
            key71.Enabled = true
          end
        end
      end
      local v2657 = tbl267
      for index136, item148 in ipairs(v2657) do
        pcall(starterGui.SetCoreGuiEnabled, starterGui, item148, true)
      end
      table.clear(v2650)
      table.clear(v2652)
      table.clear(tbl266)
      tbl267 = {}
    end
  end)
  local v2658 = fn3("ScreenGui", {Parent = (gethui and gethui()) or fn("CoreGui"), ResetOnSpawn = false, DisplayOrder = 99, Enabled = false})
  table.insert(reg.state.cleanup, function()
    v2658:Destroy()
  end)
  local v2659 = fn3("TextLabel", {Parent = v2658, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 8), Size = UDim2.fromOffset(170, 26), BackgroundColor3 = Color3.fromRGB(14, 16, 36), BackgroundTransparency = 0.2, TextColor3 = Color3.new(1, 1, 1), FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Medium), TextSize = 13, Text = ""})
  fn3("UICorner", {Parent = v2659, CornerRadius = UDim.new(1, 0)})
  local v2660
  v2659.Active = true
  v2659.InputBegan:Connect(function(arg1_468)
    local v2661 = reg.state
    if not (v2661.press(arg1_468)) then
      return
    end
    v2660 = {arg1_468.Position, v2659.Position}
    local v2662
    v2662 = arg1_468.Changed:Connect(function()
      if arg1_468.UserInputState == Enum.UserInputState.End then
        v2660 = nil
        v2662:Disconnect()
      end
    end)
  end)
  local tbl268 = {Value = "", Set = function(arg1_469, arg2_158)
    arg1_469.Value = tostring(arg2_158 or "")
    local match3, v2663, v2664, v2665 = arg1_469.Value:match("^([%-%d%.]+),([%-%d%.]+),([%-%d%.]+),([%-%d%.]+)$")
    if match3 then
      v2659.Position = UDim2.new(tonumber(match3), tonumber(v2663), tonumber(v2664), tonumber(v2665))
    end
  end}
  tbl41:Reg("FPS position", tbl268)
  local function fn400(arg1_470)
    local v2666 = reg.state
    if v2666.press(arg1_470) then
      local position5 = v2659.Position
      tbl268:Set(("%.4f,%d,%.4f,%d"):format(position5.X.Scale, position5.X.Offset, position5.Y.Scale, position5.Y.Offset))
    end
  end
  v2659.InputEnded:Connect(fn400)
  fn59("fpsDrag", fn("UserInputService").InputChanged, function(arg1_471)
    if v2660 then
      local v2667 = reg.state
      if v2667.drags(arg1_471) then
        local v2668 = arg1_471.Position - v2660[1]
        v2659.Position = v2660[2] + UDim2.fromOffset(v2668.X, v2668.Y)
      end
    end
  end)
  local num79 = 0
  fn44(tbl41, "Show FPS and ping", "fpsHud", true, function(arg1_472)
    v2658.Enabled = arg1_472
  end)
  v2658.Enabled = reg.slot21.fpsHud ~= false
  local v2669 = fn50({name = "Fps", gap = 1, t = os.clock()})
  v2669.on = function()
    local v2670 = reg.slot21
    return v2670.fpsHud
  end
  fn59("fpsC", reg.runService.RenderStepped, function()
    num79 += 1
  end)
  v2669.fn = function()
    local v2671 = os.clock() - v2669.t
    v2669.t = os.clock()
    local floor3, v2672 = math.floor, num79
    local v2673 = floor3((v2672 / math.max(v2671, 0.01)) + 0.5)
    num79 = 0
    v2672, floor3 = pcall(function()
      return fn("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    local v2674, v2675 = v2672 and math.floor(floor3)
    if v2674 then
      v2675 = v2674
    else
      floor3 = nil
      floor3, v2675 = reg.getPing, math.floor(reg.getPing() * 1000)
    end
    fn33("fps", function()
      v2659.Text = ("%d FPS  -  %d ms"):format(v2673, v2675)
    end)
  end
end
window:Settings(tbl39.Interface)
window:Quick(tbl39.Interface, {"/Movement/Speed boost", "/Movement/Boost speed"})
tbl9, tbl41 = tbl39.Interface, {}
vm:yT(tbl41, 0, {"Interface", "Theme", "Game HUD", "Defaults"}, {"Quick bars", "Pins and keybinds"})
tbl9:Arrange(tbl41)
window:Config(tbl39.Config)
task.spawn(vm:QT(19, 20, {[49] = reg, [69] = reg, [1] = reg, [70] = reg}, vm2, vm5, nil))
task.delay(3, function()
  local ok42, v2676 = pcall(readfile, "Venyx/FromChilli.json")
  if ok42 then
    if type(v2676) ~= "string" then
      return
    end
  else
    return
  end
  pcall(delfile, "Venyx/FromChilli.json")
  local v2677, v2678, v2679, v2680 = reg.httpService, reg.httpService, pcall(reg.httpService.JSONDecode, reg.httpService, v2676)
  if v2679 then
    if not (type(v2680) == "table") then
      return
    end
  else
    return
  end
  for key72, item149 in next, v2680, nil do
    ok42 = v121.Keys[key72]
    v2676 = ((ok42 and ok42.Multi) and (type(item149) == "table")) and (((type(ok42.Options) == "function") and ok42.Options()) or ok42.Options)
    if ok42 then
      if type(v2676) == "table" then
        local tbl269, tbl270 = {}, {}
        for index137, item150 in ipairs(v2676) do
          tbl269[((type(item150) == "table") and item150.v) or item150] = true
        end
        for index138, item151 in ipairs(item149) do
          item151 = tostring(item151)
          item151 = (tbl269[item151] and item151) or item151:match("^(.-) %[")
          if item151 then
            if tbl269[item151] then
              tbl270[#tbl270 + 1] = item151
            end
          end
        end
        v2680[key72] = tbl270
      end
    else
      v2680[key72] = nil
    end
  end
  if not (next(v2680)) then
    return
  end
  v121:Save("From Chilli", v2680)
  fn33("chilliImport", function()
    window:Dialog({Title = "Chilli Hub config found", Kind = "warn", Text = "Apply your Chilli Hub settings to Venyx now? You can also load them later from Config as \"From Chilli\".", Buttons = {{"Later", function()
      fn34("Config", "Saved as \"From Chilli\" in Config", "ok")
    end}, {"Apply", function()
      v121.busy = true
      for key73, item152 in next, v2680, nil do
        local v2681 = v121.Keys[key73]
        pcall(v2681.Set, v2681, item152)
      end
      v121.busy = false
      v121:Save()
      fn34("Config", "Chilli Hub settings applied", "ok")
    end, true}}})
  end)
end)
do
  local function fn401(arg1_473)
    local v2682 = reg.state
    return (v2682.rank[arg1_473.name] or arg1_473.pri) or 9
  end
  local function fn402(arg1_474)
    local ok43, v2683 = pcall(arg1_474.on)
    return ok43 and v2683
  end
  local function fn403(arg1_475)
    local v2684 = reg.state
    local only, v2685 = v2684.only
    if only then
      v2684 = reg.state
      v2685 = v2684.only()
    else
      v2685 = only
    end
    return (v2685 ~= nil) and (arg1_475.name ~= v2685)
  end
  local function fn404()
    table.sort(tbl31, function(arg1_476, arg2_159)
      local v2686, v2687 = (arg1_476.mover and fn401(arg1_476)) or 99, (arg2_159.mover and fn401(arg2_159)) or 99
      if v2686 ~= v2687 then
        return v2686 < v2687
      end
      return arg1_476.i < arg2_159.i
    end)
  end
  reg.state.order = fn404
  fn404()
  task.spawn(function()
    while true do
      local v2688 = reg.alive
      if not v2688 then
        break
      end
      local now18, v2689, v2690 = os.clock(), fn12(), reg.state
      local invisBusy2, v2691 = v2690.invisBusy
      if invisBusy2 then
        v2691 = invisBusy2
      else
        v2690 = reg.state
        v2691 = now18 < (v2690.invisSettle or 0)
      end
      v2688 = ipairs
      for it1_109, it2_107 in v2688(tbl31) do
        v2690, invisBusy2 = (reg.alive and not it2_107.busy) and (now18 >= it2_107.at)
        if v2690 then
          local mover, v2692 = it2_107.mover
          if mover then
            it1_109 = nil
            if v2691 then
              it1_109 = v2691
            else
              if v2689 then
                local v2693 = reg.state
                it1_109 = not v2693.free(it2_107)
              else
                it1_109 = v2689
              end
            end
            local v2694
            if it1_109 then
              v2694 = it1_109
            else
              local v2695 = reg.state
              v2694 = v2695.invisFirst(it2_107)
            end
            v2692 = v2694 or (fn403(it2_107))
          else
            v2692 = mover
          end
          invisBusy2 = not v2692
        else
          invisBusy2 = v2690
        end
        if (invisBusy2 and it2_107.on) and fn402(it2_107) then
          it2_107.at = now18 + it2_107.gap
          local tok = it2_107.tok
          local function fn405()
            local v2696, v2697 = ((reg.alive and (it2_107.tok == tok)) and it2_107.on()) and fn5()
            if v2696 then
              local v2698 = reg.state
              v2697 = v2698.free(it2_107) or not fn12()
            else
              v2697 = v2696
            end
            local v2699, v2700 = v2697 and not fn403(it2_107)
            if v2699 then
              v2696 = reg.state
              local invisBusy3, v2701 = v2696.invisBusy
              if invisBusy3 then
                v2701 = invisBusy3
              else
                v2697 = nil
                v2697, v2701 = reg.state, os.clock() < (reg.state.invisSettle or 0)
              end
              v2700 = not v2701
            else
              v2700 = v2699
            end
            return v2700
          end
          if it2_107.mover then
            local v2702 = reg.slot4
            local v2703 = fn5() and ((if v2702 then v2702.soft and (fn401(it2_107) < fn401(v2702)) else not v2702) or ((it2_107.urgent and (v2702 ~= it2_107)) and (v2702.name ~= "Steal")))
            if v2703 then
              local ok44, v2704 = pcall(it2_107.want)
              if ok44 and v2704 then
                if v2702 then
                  fn51(v2702)
                  while true do
                    local v2705 = v2702.busy and reg.alive
                    if not v2705 then
                      break
                    end
                    task.wait()
                  end
                end
                reg.slot4, it2_107.busy, it2_107.t0 = it2_107, true, os.clock()
                task.spawn(function()
                  local ok45, v2709 = pcall(function()
                    local v2706 = reg.state
                    if v2706.leaveDim then
                      if it2_107.name ~= "Halloween" then
                        if not ((type(v2704) == "table") and v2704.hw) then
                          if it2_107.name ~= "IslandWars" then
                            if it2_107.name ~= "Train" then
                              local v2707 = reg.state
                              if v2707.inDim() then
                                local v2708 = reg.state
                                if not (v2708.leaveDim(fn405)) then
                                  return
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    return it2_107.run(v2704, fn405)
                  end)
                  it2_107.acted = ok45 and (v2709 == true)
                  if not (ok45) then
                    local v2710 = reg.slot10
                    v2710(it2_107.name .. (": " .. tostring(v2709):sub(1, 60)), "err")
                  end
                  v2709 = reg.getHumanoid
                  local v2711, v2712 = v2709(), reg.getRoot
                  ok45 = v2712()
                  if not (fn12()) then
                    if v2711 then
                      if v2711.PlatformStand then
                        v2711.PlatformStand = false
                      end
                    end
                    if ok45 then
                      if not (ok45.Anchored) then
                        v2709 = reg.zeroVec
                        ok45.AssemblyLinearVelocity = v2709
                      end
                    end
                  end
                  it2_107.busy = false
                  if reg.slot4 == it2_107 then
                    reg.slot4 = nil
                  end
                  v2712 = reg.state
                  v2712.doneVis(it2_107)
                end)
              end
            end
          else
            it2_107.busy = true
            task.spawn(function()
              pcall(it2_107.fn)
              it2_107.busy = false
            end)
          end
        end
      end
      task.wait(0.25)
    end
  end)
  local v2713 = fn50({name = "Guard", gap = 0.5})
  v2713.on = function()
    local v2714, v2715 = (reg.slot4 ~= nil) and (reg.slot4.name ~= "Treadmill")
    if v2714 then
      local v2716 = reg.state
      v2715 = (v2716.hold or 0) == 0
    else
      v2715 = v2714
    end
    return v2715
  end
  v2713.fn = function()
    local v2717 = reg.getRoot
    local v2718 = v2717()
    if v2718 then
      if v2718.Anchored then
        v2713.n = (v2713.n or 0) + 1
        if v2713.n >= 2 then
          v2713.n = 0
          reg.slot14(function()
            return true
          end)
        end
      else
        v2713.n = 0
      end
    else
      v2713.n = 0
    end
  end
  local v2719 = fn50({name = "Info", gap = 1})
  v2719.on = function()
    return true
  end
  v2719.fn = function()
    local v2720 = fn27()
    local floor4 = math.floor(v2720 - 10)
    local v2721, v2722 = ((floor4 > 0) and ("%ds"):format(floor4)) or ("now, day in %ds"):format(math.max(math.ceil(v2720 + 5), 0)), reg.slot4
    local flag54, v2723 = not v2722
    if v2722 then
      v2723 = flag54
    else
      v2720 = nil
      v2720, v2723 = reg.state, (os.clock() - (reg.state.noteAt or 0)) > 1.5
    end
    local tbl271, v2724 = {}
    v2724, tbl271["Candy Corn"] = reg.slot59, fn15(tonumber((reg.slot59() or {}).HalloweenTokens) or 0)
    floor4 = reg.slot36
    tbl271["Last egg"] = floor4.last
    v2722 = nil
    v2722, tbl271.Placed = reg.slot36, tostring(reg.slot36.placed)
    tbl271["Money /s"] = (function()
      local v2725 = reg.localPlayer
      local leaderstats = v2725:FindFirstChild("leaderstats")
      leaderstats = leaderstats and (leaderstats:FindFirstChild("Money/s"))
      leaderstats = (leaderstats and leaderstats.Value) or 0
      v2725 = 10 ^ math.max(math.floor(math.log10(math.max(leaderstats, 1))) - 2, 0)
      return ((leaderstats > 0) and ("$" .. (fn15((leaderstats // v2725) * v2725) .. "/s"))) or "--"
    end)()
    tbl271["Night in"] = v2721
    tbl271["Session time"] = fn13(os.clock() - now2)
    v2721 = reg.slot36
    flag54, v2720 = v2721.best
    if flag54 then
      floor4 = reg.slot36
      v2720 = "$" .. (fn15(floor4.best) .. "/s")
    else
      v2720 = flag54
    end
    tbl271["Best steal"] = v2720 or "--"
    v2722 = reg.slot59
    local v2726, num80, num81 = v2722(), 0, 0
    for key74 in next, ((v2726 and (type(v2726.EggInventory) == "table")) and v2726.EggInventory) or {}, nil do
      num81 += 1
    end
    v2721, v2724 = next, ((v2726 and (type(v2726.Inventory) == "table")) and v2726.Inventory) or {}
    for key75 in v2721, v2724, nil do
      num80 += 1
    end
    v2721 = reg.state
    tbl271["Egg bag"] = num81 .. (" / " .. (v2721.bagMax or 115))
    fn33("info", function()
      local num82 = 250
      pcall(function()
        local v2727
        v2727, num82 = reg.localPlayer, tonumber(reg.localPlayer.PlayerGui.BackpackGui.Backpack.Main.Inventory.Capacity.Text:match("/%s*(%d+)")) or num82
      end)
      tbl271["Pet bag"] = num80 .. (" / " .. num82)
      local v2728 = next
      for key76, item153 in v2728, tbl271, nil do
        local v2729 = reg.state
        v2729.stats:Set(key76, item153)
      end
      v2728 = reg.slot36
      if v2728.lastCat then
        local v2730 = reg.state
        v2730.stats:Icon("Last egg", fn99(reg.slot36.lastCat))
      end
      v2728 = reg.slot36
      if v2728.bestCat then
        local v2731 = reg.state
        v2731.stats:Icon("Best steal", fn99(reg.slot36.bestCat))
      end
      if v2723 then
        window:Status("Idle")
      end
      v2728 = reg.state
      v2728.tick()
    end)
  end
end
v4.VenyxSAE = function()
  local v2732 = reg.localPlayer
  local character25, v2733 = v2732.Character
  if character25 then
    v2732 = reg.localPlayer
    v2733 = v2732.Character:GetAttribute("InvisApplied")
  else
    v2733 = character25
  end
  reg.alive = false
  character25 = reg.state
  for index139, item154 in ipairs(character25.cleanup or {}) do
    pcall(item154)
  end
  for index140, item155 in ipairs(tbl2) do
    pcall(item155.Disconnect, item155)
  end
  v2732 = reg.slot21
  v2732.god = false
  pcall(fn61)
  v2732 = reg.getHumanoid
  if v2732() then
    pcall(fn62, reg.getHumanoid())
  end
  pcall(window.Destroy, window)
  v4.VenyxSAE = nil
  task.spawn(function()
    for i65 = 1, 2, 1 do
      task.wait(0.5)
      i65 = reg.invokeRemote
      i65("RF/Treadmill/AskDoff")
    end
    if v2733 then
      local v2734 = reg.state
      v2734.respawn(true)
    end
  end)
end
