CharacterCreator.Main.initRenderers(CharacterCreator)
local openMenu = false

function DisplayMenu()
    openMenu = true
    RageUI.Visible(CharacterCreator.Main.menu, true)
end

function CloseMenu()
    openMenu = false
    RageUI.Visible(CharacterCreator.Main.menu, false)
end

RegisterCommand("char_creator:open", function()
    DisplayMenu()
end, false)

Citizen.CreateThread(function()
    while true do
        if openMenu then
            CharacterCreator.display()
        end
        Citizen.Wait(0)
    end
end)

function CharacterCreator.display()
    for _, UI in pairs(CharacterCreator) do
        if type(UI) == 'table' then
            RageUI.IsVisible(UI.menu, UI.render)
        end
    end
end

