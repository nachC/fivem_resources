function createPortal()
    local portalPos = GetEntityCoords(GetPlayerPed(-1))
    local x,y,z = table.unpack(portalPos)
    local heading = GetEntityHeading(GetPlayerPed(-1))
    local portalModel = "prop_mp_cone_01"

    RequestModel(portalModel)

    while not HasModelLoaded(portalModel) do
        Wait(500)
    end

    local portal = CreateObject(portalModel, x, y, z - 0.2, true, true, true)

    PlaceObjectOnGroundProperly(portal)
    SetEntityHeading(portal, heading)
    -- release the model
    SetModelAsNoLongerNeeded(portalModel)
end

RegisterCommand("setportal", function(source, args)
    -- here we'll spawn a portal in front of the player
    --local playerPed = PlayerPedId()
    --local playerPos = GetEntityCoords(GetPlayerPed(-1))
    --local forwardVector = GetEntityForwardVector(GetPlayerPed(-1))
    --local portalPos = forwardVector
    --print("forwardVector: " .. forwardVector)
    createPortal()

end, false)