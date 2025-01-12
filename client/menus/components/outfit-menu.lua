CharacterCreator.Data.outfit = {
    [6] = {0, 10},
    [3] = {18, 0},
    [11] = {64, 0},
    [4] = {1, 0},
    [8] = {2, 1}
}

CharacterCreator.Outfit = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Vêtements",
        "Tenue du personnage"),
    render = function()
        outfits = moutfits

        if not isMalePed() then
            outfits = foutfits
        end
        
        for outfitName, outfit in pairs(outfits) do
            RageUI.Button(outfitName, nil, {}, true, {
                onActive = function()
                    CharacterCreator.Data.outfit = outfit
                    UpdateOutfit()
                end
            })
        end
    end
}