local mumList = {"Hannah", "Audrey", "Jasmine", "Giselle", "Amelia", "Isabella", "Zoe", "Ava", "Camila", "Violet", "Sophia", "Evelyn", "Nicole", "Ashley", "Grace", "Brianna", "Natalie", "Olivia", "Elizabeth", "Charlotte", "Emma", "Misty"}
local dadList = {"Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Claude", "Niko", "John"}


CharacterCreator.Data.Model.heredity = {
    dadIndex = 1,
    momIndex = 1,
    heritageBody = 1.0,
    heritageSkin = 1.0
}

CharacterCreator.Heredity = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Hérédité",
        "Hérédité du personnage"),
    render = function()
        RageUI.Window.Heritage(CharacterCreator.Data.Model.heredity.momIndex - 1, CharacterCreator.Data.Model.heredity.dadIndex - 1)
        RageUI.List('Mère', mumList, CharacterCreator.Data.Model.heredity.momIndex, nil, {}, true, {
            onListChange = function(index, indexValue)
                CharacterCreator.Data.Model.heredity.momIndex = index
                UpdateHeritage()
            end
        })
        RageUI.List('Père', dadList, CharacterCreator.Data.Model.heredity.dadIndex, nil, {}, true, {
            onListChange = function(index, indexValue)
                CharacterCreator.Data.Model.heredity.dadIndex = index
                UpdateHeritage()
            end
        })
        RageUI.UISliderHeritage('Physique', CharacterCreator.Data.Model.heredity.heritageBody, nil, {
            onSliderChange = function(indexValue, index)
                CharacterCreator.Data.Model.heredity.heritageBody = index
                UpdateHeritage()
            end
        })
        RageUI.UISliderHeritage('Peau', CharacterCreator.Data.Model.heredity.heritageSkin, nil, {
            onSliderChange = function(indexValue, index)
                CharacterCreator.Data.Model.heredity.heritageSkin = index
                UpdateHeritage()
            end
        })
    end
}