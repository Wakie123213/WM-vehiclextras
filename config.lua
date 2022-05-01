--[[
=============================================================
               Made By: Wakie Modifications 
=============================================================
--]]

Config = {
    Module = {
        UseQBCore = true, -- Enables the usage of QBCore if set to true QBCore will be required, but if set to false this script will be standalone. (If QBCore Is enabled you will get QBCore Notifications)
        ExtraCommand = true, -- Enables or disables the extra command.
        LiveryCommand = true, -- Enables or disables the livery command.
        WashCommand = true, -- Enables or disables the wash command.
    },
    ExtraVehDamageCheck = {
        Module = true, -- Enables or disables the vehicle damage check module for the extra command. (This prevents people from repairing their car, by toggling extras.)
        MinEngineHealth = 990.00, -- Minimum Engine Health Required To Toggle Extras.  (Max Veh Health: 1000.00)
        MinBodyHealth = 990.00, -- Minimum Body Health Required To Toggle Extras. (Max Veh Health: 1000.00)
    },
    Localization = {
        CommandDisabled = "This command is disabled..",
        NotInVehicle = "You are not in a vehicle..",
        LiveryChanged = "Livery has been changed!",
        VehicleWashed = "The vehicle has been washed!",
        ExtraChangeOne = "Extra ",
        NoToggleExtraDmg = "You cannot toggle vehicle extras, while your vehicle is damaged..",
        ExtraChangeTwo = " Has Been Activated!",
        ExtraChangeThr = " Has Been Deactivated..",
    }
}