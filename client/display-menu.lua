local openMenu = false

CharacterCreator.Main.render = function()
    HelperRageUI.List("Modèle", { "Homme", "Femme" },
        "Sexe de votre personnage", {}, {})
    RageUI.Button("Hérédité", "Parents du personnage", {}, true, {},
        CharacterCreator.Hereditymenu)
    RageUI.Button("Traits du visage", "Détails faciaux du personnage", {},
        true, {}, CharacterCreator.Features)
    RageUI.Button("Apparence", "Apparence du personnage", {}, true, {},
        CharacterCreator.Apparence)
    RageUI.Button("Tenue", "Tenue du personnage", {}, true, {},
        CharacterCreator.Outfit)
    RageUI.Button("Informations", "Identité du personnage", {}, true, {},
        CharacterCreator.Informations)
end

RegisterCommand("char_creator:open", function()
    openMenu = not openMenu
end, false)

Citizen.CreateThread(function()
    while true do
        if openMenu then
            RageUI.Visible(CharacterCreator.Main.menu, true)
            CharacterCreator.display()
        else
            RageUI.Visible(mainMenu, false)
        end
        Citizen.Wait(0)
    end
end)

function CharacterCreator.display()
    for _, UI in pairs(CharacterCreator) do
        RageUI.IsVisible(UI.menu, UI.render)
    end
end