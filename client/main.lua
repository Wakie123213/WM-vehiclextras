--[[
=============================================================
               Made By: Wakie Modifications 
=============================================================
--]]

RegisterCommand('extra', function(source, args, rawCommand)
    if Config.Module.ExtraCommand then
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    local extraId = tonumber(args[1])
    local extraToggled = IsVehicleExtraTurnedOn(veh, extraId)

    if extraToggled == 1 then
        extraToggled = true
    else
        extraToggled = false
    end

    if Config.ExtraVehDamageCheck.Module then
        local vehenghealth = GetVehicleEngineHealth(veh)
        local vehbodyhealth = GetVehicleBodyHealth(veh)
        if vehenghealth > Config.ExtraVehDamageCheck.MinEngineHealth then
            if vehbodyhealth > Config.ExtraVehDamageCheck.MinBodyHealth then
                SetVehicleExtra(veh, extraId, extraToggled)
            else
                print('You cannot toggle vehicle extras, while your vehicle is damaged..')
            end
        else
            print('You cannot toggle vehicle extras, while your vehicle is damaged..')
        end
    else
        SetVehicleExtra(veh, extraId, extraToggled)
    end


    else
        print('This command is disabled..')
    end
end)

RegisterCommand('livery', function(source, args, rawCommand)
    if Config.Module.LiveryCommand then
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    local liveryId = tonumber(args[1])
    
    SetVehicleLivery(veh, liveryId)

    else
        print('This command is disabled..')
    end
end)

RegisterCommand('wash', function(source, rawCommand)
    if Config.Module.WashCommand then
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1))
    
    SetVehicleDirtLevel(veh, 0.0)

    else
        print('This command is disabled..')
    end
end)