ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

local blips = {
    {title="Location Bateaux", colour=63, id=529, x = -801.79, y = -1503.48, z = 1.59},
}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)
local nLoc = {

        Base = {  Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {228, 233, 228}, Title = "Location Bateaux",  Blocked = false },
        Data = { currentMenu = "Location Bateaux", "" },
        Events = {
             onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
                if btn.name == "Bateaux" then
                    OpenMenu('Bateaux')
                 elseif btn.name == "Bateaux Luxe" then
                      TriggerServerEvent('nLoc:buy', 5000, "Jetmax", "Bateaux Luxe")
                      ESX.ShowNotification('Merci ! Votre Bateau vous attend !')
                      Citizen.Wait(1)
                      spawnCar("Jetmax")
                 elseif btn.name == "Bateaux Ancien" then
                    TriggerServerEvent('nLoc:buy', 1000, "Speeder", "Bateaux Ancien")
                    ESX.ShowNotification('Merci ! Votre Bateau vous attend !')
                    Citizen.Wait(1)
                    spawnCar("Speeder")
                elseif btn.name == "Bateaux Visite" then
                    TriggerServerEvent('nLoc:buy', 1700, "Suntrap", "Bateaux Visite")
                    ESX.ShowNotification('Merci ! Votre Bateau vous attend !')
                    Citizen.Wait(1)
                    spawnCar("Suntrap")
                elseif btn.name == "Jet-Ski" then
                    TriggerServerEvent('nLoc:buy', 500, "seashark", "Jet-Ski")
                    ESX.ShowNotification('Merci ! Votre Jet-Ski vous attend !')
                    Citizen.Wait(1)
                    spawnCar("seashark")
            end
      end,
  },

    Menu = {
        ["Location Bateaux"] = {
            b = {
                {name = "Bateaux", ask = "~b~→", askX = true},
            }
        },
       
        ["Bateaux"] = {
            b = {
                {name = "Bateaux Luxe", ask = "~g~5000 $ ~b~→", askX = true},
                {name = "Bateaux Ancien", ask = "~g~1000 $ ~b~→", askX = true},
                {name = "Bateaux Visite", ask = "~g~1700 $ ~b~→", askX = true},
                {name = "Jet-Ski", ask = "~g~500 $ ~b~→", askX = true},


            }
        },
    }
}


spawnCar = function(car)
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end
     Vehicle = CreateVehicle(car, -789.9, -1500.24, -0.47, 105.12, true, false)
    SetEntityAsMissionEntity(Vehicle, true, true)
    SetVehicleNumberPlateText(Vehicle, "Location")
end

local aLoc = {
    { x = -767.02, y = -1501.27, z = 3.51},

}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k, v in pairs(aLoc) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, aLoc[k].x, aLoc[k].y, aLoc[k].z)
            DrawMarker(29, v.x, v.y, 44.28, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 66, 238, 13,  155, false, true, 2, true, nil, nil, false)
            if dist <= 1.5 then
				ESX.ShowHelpNotification("~~Appuyez    ~INPUT_CONTEXT~ pour parler avec Jack")
                if IsControlJustPressed(1,51) then
                    CreateMenu(nLoc)
                    Citizen.Wait(40)
				end
            end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("mp_m_waremech_01")

    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end


    ped = CreatePed("PED_TYPE_CIVMALE", "mp_m_waremech_01",-767.02,  -1501.27,  2.5, 297.83, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)


end)
print("^1==   Merci  Ninoo#9999 Ce code à été inspiré de  Ninoo#9999 , mais crée par Jack De La Fontaine#2297 ! ==^1")
--- Voilà ! Ce code à été inspiré de  Ninoo#9999 , mais crée par Jack De La Fontaine#2297 ! ---
  