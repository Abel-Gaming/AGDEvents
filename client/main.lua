RegisterNetEvent('AGDEvents:ErrorMessage')
AddEventHandler('AGDEvents:ErrorMessage', function(errorMessage)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~r~[ERROR]~w~ ' .. errorMessage)
	DrawNotification(false, true)
end)

RegisterNetEvent('AGDEvents:InfoMessage')
AddEventHandler('AGDEvents:InfoMessage', function(infoMessage)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~y~[INFO]~w~ ' .. infoMessage)
	DrawNotification(false, true)
end)

RegisterNetEvent('AGDEvents:SuccessMessage')
AddEventHandler('AGDEvents:SuccessMessage', function(successMessage)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName('~g~[SUCCESS]~w~ ' .. successMessage)
	DrawNotification(false, true)
end)

RegisterNetEvent('AGDEvents:SpawnVehicle')
AddEventHandler('AGDEvents:SpawnVehicle', function(modelName, warpInto)
	local ModelHash = modelName
	
	if not IsModelInCdimage(ModelHash) then return end
		RequestModel(ModelHash)
		while not HasModelLoaded(ModelHash) do
  		Citizen.Wait(10)
	end
	
	local MyPed = PlayerPedId()
	local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false)
	
	SetModelAsNoLongerNeeded(ModelHash)
	
	if (warpInto) then
		TaskWarpPedIntoVehicle(MyPed, Vehicle, -1)
	end
end)