RegisterCommand('+errormessage', function(source, args)
	local message = args[1]

	if message == nil then
		TriggerEvent("AGDEvents:ErrorMessage", "You must enter a message")
	else
		TriggerEvent("AGDEvents:ErrorMessage", message)
	end
end, false)

RegisterCommand('+infomessage', function(source, args)
	local message = args[1]

	if message == nil then
		TriggerEvent("AGDEvents:ErrorMessage", "You must enter a message")
	else
		TriggerEvent("AGDEvents:InfoMessage", message)
	end
end, false)

RegisterCommand('+successmessage', function(source, args)
	local message = args[1]

	if message == nil then
		TriggerEvent("AGDEvents:ErrorMessage", "You must enter a message")
	else
		TriggerEvent("AGDEvents:SuccessMessage", message)
	end
end, false)

RegisterCommand('+spawnVehicle', function(source, args)
	local vehicleModel = args[1]
    local warp = args[2]

	if vehicleModel == nil then
		TriggerEvent("AGDEvents:ErrorMessage", "You must enter a model")
	else
        if warp == 'true' then
            TriggerEvent("AGDEvents:SpawnVehicle", vehicleModel, true)
        else
            TriggerEvent("AGDEvents:SpawnVehicle", vehicleModel, false)
        end
	end
end, false)