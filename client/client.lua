enable = false

RegisterCommand("char_creator:anim", function()
    enable = true
	DisplayRadar(false)
    AnimCam()
    DisplayMenu()
end, false)

Citizen.CreateThread(function()
    while enable == true do
        Citizen.Wait(0)
        DisableAllControlActions(0)
        for i=1,256 do
            if NetworkIsPlayerActive(i) then
                SetEntityVisible(GetPlayerPed(i), false, false)
                SetEntityVisible(PlayerPedId(), true, true)
                SetEntityNoCollisionEntity(GetPlayerPed(i), PlayerPedId(), false)
            end
        end
    end
end)