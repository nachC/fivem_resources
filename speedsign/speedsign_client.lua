-- position of the sign (at the begining of a tunnel close to Poleto)
local signPosition = vector3(2108.259, 6021.653, 50.8116)

function text(content)
    --print(content)
    SetTextFont(2)
    SetTextScale(1, 0.5)
    SetDrawOrigin(signPosition.x, signPosition.y, signPosition.z, 0)
    BeginTextCommandDisplayText("STRING")
    --AddTextComponentSubstringPlayerName("SPEED " .. content .. "KPH")
    AddTextComponentSubstringPlayerName(content)
    EndTextCommandDisplayText(0, 0)    
    ClearDrawOrigin()
end

CreateThread(function()
    while true do
        Wait(2)
        local playerPed = PlayerPedId()
        local vehicleEntity = GetVehiclePedIsIn(playerPed, false)
        local speed = GetEntitySpeed(vehicleEntity)*3.6
        -- check if the player is in the vehicle
        if IsPedInAnyVehicle(playerPed, false) then
            local playerPosition = GetEntityCoords(GetPlayerPed(-1))
            local dist = playerPosition - signPosition
            local unitVector = dist / #dist
            print(" " .. unitVector)
            --check if the player is close to the sign
            if #dist < 100 then
                --print(speed)
                --text(math.floor(speed))
                text(GetEntityHeading(GetPlayerPed(-1)))
            end
        end
    end
end)