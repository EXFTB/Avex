if (not game:IsLoaded()) then
    game.Loaded:Wait();
end

local function LoadScript(Script)
    return loadstring(game:HttpGet(Script..".lua"), Script)()
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
        ["8343259840"] = {Name = "Criminality"          Script = "Games/CR"  },
        ["2262441883"] = {Name = "Electric State"       Script = "Games/ES"   }
    }
}

Avex.Game = GetGameInformation()
LoadScript(Avex.Game.Script)
