ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("rc-shop:buybread")
AddEventHandler("rc-shop:buybread", function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)

    
    xPlayer.removeMoney(Config.Prices.bread)
    xPlayer.addInventoryItem("bread", 1)
    

end)

RegisterNetEvent("rc-shop:buyWater")
AddEventHandler("rc-shop:buyWater", function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)

    
    xPlayer.removeMoney(Config.Prices.water)
    xPlayer.addInventoryItem("water", 1)
    

end)

RegisterNetEvent("rc-shop:buyIron")
AddEventHandler("rc-shop:buyIron", function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)

    
    xPlayer.removeMoney(Config.Prices.iron)
    xPlayer.addInventoryItem("iron", 1)
    

end)

RegisterNetEvent("rc-shop:buyPickAxe")
AddEventHandler("rc-shop:buyPickAxe", function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)

    
    xPlayer.removeMoney(Config.Prices.pickaxe)
    xPlayer.addInventoryItem("pickaxe", 1)
    

end)

RegisterNetEvent("rc-shop:buyBag")
AddEventHandler("rc-shop:buyBag", function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)

    
    xPlayer.removeMoney(Config.Prices.bag)
    xPlayer.addInventoryItem("bag", 1)
    

end)

RegisterNetEvent("rc-shop:buyGold")
AddEventHandler("rc-shop:buyGold", function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)

    
    xPlayer.removeMoney(Config.Prices.gold)
    xPlayer.addInventoryItem("gold", 1)
    

end)



RegisterNetEvent("rc-shop:buyNumberplate")
AddEventHandler("rc-shop:buyNumberplate", function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)

    
    xPlayer.removeMoney(Config.Prices.numberplate)
    xPlayer.addInventoryItem("numberplate", 1)
    

end)