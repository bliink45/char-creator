local mumList = { "Hannah", "Aubrey", "Jasmine", "Gisele", "Amelia", "Isabella", "Zoe", "Ava", "Camila", "Violet", "Sophia", "Evelyn", "Nicole", "Ashley", "Gracie", "Brianna", "Natalie", "Olivia", "Elizabeth", "Charlotte", "Emma" }
local dadList = { "Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony",  "Claude", "Niko" }

CharacterCreator.Data.heredity = {
    dadIndex = 1,
    momIndex = 1,
    heritageBody = 1.0,
    heritageSkin = 1.0
}

CharacterCreator.Heredity = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Hérédité",
        "Hérédité du personnage"),
    render = function()
        RageUI.Window.Heritage(CharacterCreator.Data.heredity.momIndex - 1, CharacterCreator.Data.heredity.dadIndex - 1)
        RageUI.List('Mère', mumList, CharacterCreator.Data.heredity.momIndex, nil, {}, true, {
            onListChange = function(index, indexValue)
                CharacterCreator.Data.heredity.momIndex = index
            end
        })
        RageUI.List('Père', dadList, CharacterCreator.Data.heredity.dadIndex, nil, {}, true, {
            onListChange = function(index, indexValue)
                CharacterCreator.Data.heredity.dadIndex = index
            end
        })
        RageUI.UISliderHeritage('Physique', CharacterCreator.Data.heredity.heritageBody, nil, {
            onSliderChange = function(indexValue, index)
                CharacterCreator.Data.heredity.heritageBody = index
            end
        })
        RageUI.UISliderHeritage('Peau', CharacterCreator.Data.heredity.heritageSkin, nil, {
            onSliderChange = function(indexValue, index)
                CharacterCreator.Data.heredity.heritageSkin = index
            end
        })
    end
}