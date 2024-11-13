CharacterCreator.Main.initRender(CharacterCreator)
local openMenu = false

RegisterCommand("char_creator:open", function()
    openMenu = not openMenu
    RageUI.Visible(CharacterCreator.Main.menu, openMenu)
end, false)

Citizen.CreateThread(function()
    while true do
        if openMenu then
            CharacterCreator.display()
        elseif CharacterCreator.Main.menu.Open then
            RageUI.Visible(mainMenu, false)
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