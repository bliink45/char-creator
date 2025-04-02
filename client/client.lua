RegisterCommand("char_creator:anim", function()
    playerIsolated = true
	DisplayRadar(false)
    AnimCam()
    DisplayMenu()
end, false)

Citizen.CreateThread(function()
    while true do
        if playerIsolated then
            disableMovement()
            disableForeignEntities()
        end
        Citizen.Wait(0)
    end
end)