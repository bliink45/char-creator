apparence = {
    hair = 1,
    eyebrows = 1,
    bear = 1,
    eyeColor = 1,
    frickles = 1,
    wrinkles = 1,
    sunDamage = 1
}

CharacterCreator.Apparence = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Apparence",
        "Apparence du personnage"),
    render = function()
        RageUI.List('Cheveux', { 1, 2, 3, 4 }, apparence.hair, nil, {}, true, {
            onListChange = function(index, indexValue)
                apparence.hair = index
            end
        })
        RageUI.List('Sourcils', { 1, 2, 3, 4 }, apparence.eyebrows, nil, {}, true, {
            onListChange = function(index, indexValue)
                apparence.eyebrows = index
            end
        })
        RageUI.List('Barbes', { 1, 2, 3, 4 }, apparence.bear, nil, {}, true, {
            onListChange = function(index, indexValue)
                apparence.bear = index
            end
        })
        RageUI.List('Couleurs des yeux', { 1, 2, 3, 4 }, apparence.eyeColor, nil, {}, true, {
            onListChange = function(index, indexValue)
                apparence.eyeColor = index
            end
        })
        RageUI.List('Taches de rousseurs', { 1, 2, 3, 4 }, apparence.frickles, nil, {}, true, {
            onListChange = function(index, indexValue)
                apparence.frickles = index
            end
        })
        RageUI.List('Rides', { 1, 2, 3, 4 }, apparence.wrinkles, nil, {}, true, {
            onListChange = function(index, indexValue)
                apparence.wrinkles = index
            end
        })
        RageUI.List('Coups de soleil', { 1, 2, 3, 4 }, apparence.sunDamage, nil, {}, true, {
            onListChange = function(index, indexValue)
                apparence.sunDamage = index
            end
        })
        RageUI.ColourPanel("Couleur Principale", RageUI.PanelColour.HairCut, 1, 1, {}, RageUI.CurrentMenu.Index, {})
        RageUI.ColourPanel("Couleur Secondaire", RageUI.PanelColour.HairCut, 1, 1, {}, RageUI.CurrentMenu.Index, {})
    end
}
