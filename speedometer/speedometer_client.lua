function text(content)
    SetTextFont(2)
    SetTextScale(1, 0.5)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(content .. " KPH")
    EndTextCommandDisplayText(0.21, 0.95)
end

CreateThread(function()
    while true do
        Wait(2)
        local playerPed = PlayerPedId()
        local userEntity = GetVehiclePedIsIn(playerPed, false)
        local speed = GetEntitySpeed(userEntity)*3.6
        if IsPedInAnyVehicle(playerPed, false) then
            --print(speed)
            text(math.floor(speed))
        end
    end
end)