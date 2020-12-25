ESX              = nil
local PlayerData = {}
local isShopOpen = false   

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)





local display = false

Citizen.CreateThread(function()
    local playerPed = PlayerPedId()

    while true do
       local coords = GetEntityCoords(playerPed)
       Citizen.Wait(4)
       DrawMarker(2, Config.MarkerCoords.x, Config.MarkerCoords.y, Config.MarkerCoords.z,  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, .6,.6, .6, 0, 140, 255, 110, 0, 1, 0, 1)

       if Vdist(coords, Config.MarkerCoords) < 1 then

        if isShopOpen == false then

            ESX.ShowHelpNotification("Drücke ~INPUT_CONTEXT~ um denn Shop zu öffnen")
            
        end

        if IsControlJustReleased(0, 51) then
            if isShopOpen == false then
     
                isShopOpen = true
                SetDisplay(not display)
            end
        end

       end  

    end
    
end)
RegisterCommand("nui", function(source, args)
    SetDisplay(not display)
end)

--very important cb 
RegisterNUICallback("exit", function(data)
    isShopOpen = false
    SetDisplay(false)
end)

-- this cb is used as the main route to transfer data back 
-- and also where we hanld the data sent from js
RegisterNUICallback("main", function(data)
    chat(data.text, {0,255,0})
    SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
    chat(data.error, {255,0,0})
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end


-- ITEMS TRIGGER SIDE --

RegisterNUICallback("buyBread", function(data)

   
    TriggerServerEvent("rc-shop:buybread")
end)

RegisterNUICallback("buyWater", function(data)

   
    TriggerServerEvent("rc-shop:buyWater")
end)

RegisterNUICallback("buyIron", function(data)

   
    TriggerServerEvent("rc-shop:buyIron")
end)

RegisterNUICallback("buyPickAxe", function(data)

   
    TriggerServerEvent("rc-shop:buyPickAxe")
end)

RegisterNUICallback("buyBag", function(data)

   
    TriggerServerEvent("rc-shop:buyBag")
end)

RegisterNUICallback("buyGold", function(data)

   
    TriggerServerEvent("rc-shop:buyGold")
end)

RegisterNUICallback("buyNumberplate", function(data)

   
    TriggerServerEvent("rc-shop:buyNumberplate")
end)


















Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        -- https://runtime.fivem.net/doc/natives/#_0xFE99B66D079CF6BC
        --[[ 
            inputGroup -- integer , 
	        control --integer , 
            disable -- boolean 
        ]]
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end