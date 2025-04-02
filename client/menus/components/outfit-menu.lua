CharacterCreator.Outfit = {
    index = 1,
    render = function()
        local outfitsLabels = moutfitsLabels
        local outfits = moutfits

        if not isMalePed() then
            outfitsLabels = foutifitsLabels
            outfits = foutfits
        end


        RageUI.List("Tenue", outfitsLabels, CharacterCreator.Outfit.index,
        "Tenue du personnage", {}, true, {
                    onListChange = function(index, value)
                        setCam("body")
                        CharacterCreator.Outfit.index = index
                        CharacterCreator.Data.Outfit.name = value
                        CharacterCreator.Data.Outfit.clothes = outfits[value]
                        UpdateOutfit()
                    end
        })
    end
}