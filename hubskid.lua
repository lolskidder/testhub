local GameList = {
    [114326934417838] = "https://vxezestudio.online/api/scripts/script_7duMHGZTfKaWU/stream/init", -- Break And Steal An Egg
    [113290951185459] = "https://vxezestudio.online/api/scripts/script_82HVMJlLn6Omw/stream/init", -- Anime Dice 
    [142823291] = "https://vxezestudio.online/api/scripts/script_r0VeAauEuUxPg/stream/init", -- Murder Mystery 2
    [98502499119821] = "https://vxezestudio.online/api/scripts/script_58QYU7BTt9Dg/stream/init", -- Heavyweight Fishing
    [119091355492870] = "https://api.xhider.xyz/files/v4/loaders/130f93dd6546535517210dc28869d19a.lua", -- RockFruit
    [82878101790702] = "https://api.xhider.xyz/files/v4/loaders/130f93dd6546535517210dc28869d19a.lua", -- RockFruit
    [132854526011923] = "https://api.xhider.xyz/files/v4/loaders/130f93dd6546535517210dc28869d19a.lua", -- RockFruit
}

local pid = game.PlaceId
local url = GameList[pid]

if url and url ~= "LINK_SCRIPT" then
    loadstring(game:HttpGet(url))()
else
    warn("Chưa có link script cho PlaceId:", pid)
end
