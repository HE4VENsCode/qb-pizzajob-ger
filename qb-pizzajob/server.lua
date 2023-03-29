local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('RoutePizza:Payment')
AddEventHandler('RoutePizza:Payment', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.AddMoney("cash", 8, "sold-pizza")
    TriggerClientEvent("QBCore:Notify", _source, "Sie haben 4500$ erhalten", "success")
end)

RegisterServerEvent('RoutePizza:TakeDeposit')
AddEventHandler('RoutePizza:TakeDeposit', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.RemoveMoney("bank", _source, "pizza-deposit")
    TriggerClientEvent("QBCore:Notify", _source, "Ihnen wurde eine Kaution in Höhe von 100 $ berechnet", "error")
end)

RegisterServerEvent('RoutePizza:ReturnDeposit')
AddEventHandler('RoutePizza:ReturnDeposit', function(info)
	local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    
    if info == 'cancel' then
        Player.Functions.AddMoney("cash", 25, "pizza-return-vehicle")
        TriggerClientEvent("QBCore:Notify", _source, "Sie haben das Fahrzeug zurückgegeben und Ihre Kaution zurückerhalten", "success")
    elseif info == 'end' then
        Player.Functions.AddMoney("cash", 50, "pizza-return-vehicle")
        TriggerClientEvent("QBCore:Notify", _source, "Sie haben das Fahrzeug zurückgegeben und Ihre Kaution zurückerhalten", "success")
    end
end)
