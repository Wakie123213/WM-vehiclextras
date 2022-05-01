--[[
=============================================================
               Made By: Wakie Modifications 
=============================================================
--]]
if Config.Module.UseQBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterCommand('extra', function(source, args, rawCommand)
    if Config.Module.ExtraCommand then
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local extraId = tonumber(args[1])
            TriggerEvent('wm-vehiclextras:client:extras', extraId)
        else
            if Config.Module.UseQBCore then
                QBCore.Functions.Notify(Config.Localization.NotInVehicle, 'error')
            else
                print(Config.Localization.NotInVehicle)
            end
        end
    else
        if Config.Module.UseQBCore then
            QBCore.Functions.Notify(Config.Localization.CommandDisabled, 'error')
        else
            print(Config.Localization.CommandDisabled)
        end
    end
end)

RegisterNetEvent('wm-vehiclextras:client:extras', function(extraId)
        local veh = GetVehiclePedIsIn(PlayerPedId())
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
                    if not extraToggled then
                        if Config.Module.UseQBCore then
                            QBCore.Functions.Notify(Config.Localization.ExtraChangeOne..extraId..Config.Localization.ExtraChangeTwo, 'success')
                        else
                            print(Config.Localization.ExtraChangeOne..extraId..Config.Localization.ExtraChangeTwo)
                        end
                    else
                        if Config.Module.UseQBCore then
                            QBCore.Functions.Notify(Config.Localization.ExtraChangeOne..extraId..Config.Localization.ExtraChangeThr, 'error')
                        else
                            print(Config.Localization.ExtraChangeOne..extraId..Config.Localization.ExtraChangeThr)
                        end
                    end
                else
                    if Config.Module.UseQBCore then
                        QBCore.Functions.Notify(Config.Localization.NoToggleExtraDmg, 'error')
                    else
                        print(Config.Localization.NoToggleExtraDmg)
                    end
                end
            else
                if Config.Module.UseQBCore then
                    QBCore.Functions.Notify(Config.Localization.NoToggleExtraDmg, 'error')
                else
                    print(Config.Localization.NoToggleExtraDmg)
                end
            end
        else
            SetVehicleExtra(veh, extraId, extraToggled)
            if not extraToggled then
                if Config.Module.UseQBCore then
                    QBCore.Functions.Notify(Config.Localization.ExtraChangeOne..extraId..Config.Localization.ExtraChangeTwo, 'success')
                else
                    print(Config.Localization.ExtraChangeOne..extraId..Config.Localization.ExtraChangeTwo)
                end
            else
                if Config.Module.UseQBCore then
                    QBCore.Functions.Notify(Config.Localization.ExtraChangeOne..extraId..Config.Localization.ExtraChangeThr, 'error')
                else
                    print(Config.Localization.ExtraChangeOne..extraId..Config.Localization.ExtraChangeThr)
                end
            end
        end
end)

RegisterCommand('livery', function(source, args, rawCommand)
    if Config.Module.LiveryCommand then
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local veh = GetVehiclePedIsIn(PlayerPedId())
            local liveryId = tonumber(args[1])
    
            SetVehicleLivery(veh, liveryId)

            if Config.Module.UseQBCore then
                QBCore.Functions.Notify(Config.Localization.LiveryChanged, 'success')
            else
                print(Config.Localization.LiveryChanged)
            end
        else
            if Config.Module.UseQBCore then
                QBCore.Functions.Notify(Config.Localization.NotInVehicle, 'error')
            else
                print(Config.Localization.NotInVehicle)
            end
        end
    else
        if Config.Module.UseQBCore then
            QBCore.Functions.Notify(Config.Localization.CommandDisabled, 'error')
        else
            print(Config.Localization.CommandDisabled)
        end
    end
end)

RegisterCommand('wash', function(source, rawCommand)
    if Config.Module.WashCommand then
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            local veh = GetVehiclePedIsIn(PlayerPedId())
    
            SetVehicleDirtLevel(veh, 0.0)

            if Config.Module.UseQBCore then
                QBCore.Functions.Notify(Config.Localization.VehicleWashed, 'success')
            else
                print(Config.Localization.VehicleWashed)
            end

        else
            if Config.Module.UseQBCore then
                QBCore.Functions.Notify(Config.Localization.NotInVehicle, 'error')
            else
                print(Config.Localization.NotInVehicle)
            end
        end
    else
        if Config.Module.UseQBCore then
            QBCore.Functions.Notify(Config.Localization.CommandDisabled, 'error')
        else
            print(Config.Localization.CommandDisabled)
        end
    end
end)