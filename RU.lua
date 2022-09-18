if not isfolder("Runebase") then
    makefolder("Runebase")
end

repeat
    task.wait()
until game.GameId ~= 0

if Runebase and Runebase.isLoaded then
    print("Script is Already Running!")
end

local PlayerService = game:GetService("Players")
local RunService = game:GetService("RunService")
repeat task.wait() until PlayerService.LocalPlayer
local LocalPlayer = PlayerService.LocalPlayer
local LoadArgs = {...}

local function getGame() 
    local Game
    for i,v in pairs(Runebase.SupportedGames) do
        if(tostring(game.GameId) == i) then
            Game = v break
        end
    end if not Game then
        Game = Runebase.SupportedGames.Universal
    end return Game
end

local function findScript(Script) 
    return readfile("Runebase/" .. Script .. ".lua")
end

local function execute(Script)
    return loadstring(Runebase.Debug and readfile("Runebase/" .. Script .. ".lua")
    or game:HttpGetAsync("https://raw.githubusercontent.com/Bubbajohn1/Runebase/main/" .. Script .. ".lua"))()
end

getgenv().Runebase = {
    Debug = LoadArgs[1],
    isLoaded = false,
    Utils = {},
    SupportedGames = {
        ["580765040"] = {
            Name = "Ragdoll Universe",
            Script = "RU"
        },
        ["Universal"] = {
            Name = "Universal",
            Script = "Universal"
        }
    }
}

Runebase.Utils.UI = execute("Utils/UI")

local isSupported = getGame()
if(isSupported) then
    Runebase.Game = isSupported.Name
    execute(isSupported.Script)
    Runebase.Utils.UI:NNotification({
        Title = "Runebase",
        Desc = isSupported.Name .. " Loaded!",
        Time = 2
    }); Runebase.isLoaded = true
end