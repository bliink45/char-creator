CharacterCreator = {
    Main = {
        menu = RageUI.CreateMenu("Créateur", "Options de personnage", 0, 90,
            'colors', 'apple_green'),
    },
    Data = {
        Identity = {},
        Model = {
            gender = nil
        }
    }
}

local genders = { "Homme", "Femme" }

function CharacterCreator.Main.initRenderers(menus)    
    CharacterCreator.Main.menu.Closable = false
    menus.Features.menu.EnableMouse = true
    menus.Apparence.menu.EnableMouse = true

    CharacterCreator.Data.Model.gender = 1

    if not isMalePed() then
        CharacterCreator.Data.Model.gender = 2
    end

    CharacterCreator.Main.render = function()
        RageUI.List("Modèle", genders, CharacterCreator.Data.Model.gender,
        "Sexe de votre personnage", {}, true, {
            onListChange = function(index, value)
                CharacterCreator.Data.Model.gender = index

                if index == 1 then
                    CharacterCreator.Data.outfit = moutfits[moutfitDefault]
                else
                    CharacterCreator.Data.outfit = foutfits[foutfitDefault]
                end

                RefreshModel()
            end
        })
    RageUI.Button("Hérédité", "Parents du personnage", {}, true, {},
        menus.Heredity.menu)
    RageUI.Button("Traits du visage", "Détails faciaux du personnage", {},
        true, {}, menus.Features.menu)
    RageUI.Button("Apparence", "Apparence du personnage", {}, true, {},
        menus.Apparence.menu)
    RageUI.Button("Tenue", "Tenue du personnage", {}, true, {},
        menus.Outfit.menu)
    RageUI.Button("Informations", "Identité du personnage", {}, true, {},
        menus.Informations.menu)
        RageUI.Button(" Enregistrer et quitter",
        "Sélectionnez pour enregistrer votre personnage",
        {RightLabel = ">", Color = {100, 119, 171, 120,
        HightLightColor = {100, 119, 171, 120}}}, true, {}, menus.Save.menu)
    end
end
