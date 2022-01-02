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

RegisterNetEvent('AGDEvents:3DText')
AddEventHandler('AGDEvents:3DText', function(x, y, z, scl_factor, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
        SetTextScale(0.0, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end)