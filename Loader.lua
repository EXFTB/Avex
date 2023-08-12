if (not getgenv().WLKey) then return warn("Missing key!") end

script_key = getgenv().WLKey

if (not game:IsLoaded()) then
    game.Loaded:Wait();
end

local function CheckCompatibility(Table)
    if (not getfenv()["identifyexecutor"]) then return game:GetService("Players").LocalPlayer:Kick("Executor not compatible with Avex.") end

    if table.find(Table, tostring(identifyexecutor())) then
        return true
    end

    return game:GetService("Players").LocalPlayer:Kick("Executor not compatible with Avex.")
end

local function LoadScript(Source, Script)
    return loadstring(game:HttpGet(Source..Script..".lua"), Script)()
end

local function GetGameInformation()
    for Id, Information in pairs(Avex.Games) do
        if tostring(game.PlaceId) == Id then
            return Information
        end
    end 
end

getgenv().Avex = {
    Source = "https://raw.githubusercontent.com/EXFTB/Avex/main/",
    Games = {
        ["8343259840"] = {Name = "Criminality",          Script = "Games/CR"  },
        ["2262441883"] = {Name = "Electric State",       Script = "Games/ES"  },
    },
    Executors = {
        "Fluxus",
        "Syn",
        "Valyse",
        "Electron",
    }
}

do
    CheckCompatibility(Avex.Executors)

    Avex.Game = GetGameInformation()
    LoadScript(Avex.Source, Avex.Game.Script)
end
