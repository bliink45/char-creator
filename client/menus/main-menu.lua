CharacterCreator = {}

CharacterCreator.Main = {
    menu = RageUI.CreateMenu("Créateur", "Options de personnage", 0, 90,
        'colors', 'apple_green'),
}

function CharacterCreator.Main.initRender(menus)
    local modelIndex = 1
    CharacterCreator.Main.render = function()
        RageUI.List("Modèle", { "Homme", "Femme" }, modelIndex,
        "Sexe de votre personnage", {}, true, {
            onListChange = function(index, value)
                modelIndex = index
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
    end
end
