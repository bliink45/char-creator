enable = false

RegisterCommand("char_creator:anim", function()
    enable = true
	DisplayRadar(false)
    AnimCam()
    DisplayMenu()
end, false)

Citizen.CreateThread(function()
    while true do
        if (enable) then
            disableMovement()
            disableForeignEntities()
        end
        Citizen.Wait(0)
    end
end)