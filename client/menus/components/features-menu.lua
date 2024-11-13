local noseProfile = {
    x = 0.5,
    y = 0.5
}

CharacterCreator.Features = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu,
        "Traits du visage", "Détails faciaux du personnage"),
    render = function()
        RageUI.Button("Profil du nez", "", {}, true, {
            onActive = function()
                RageUI.Grid(noseProfile.x, noseProfile.y, "Courber", "Incurver", "Long", "Court", {}, 1)
            end
        })
    end
}
