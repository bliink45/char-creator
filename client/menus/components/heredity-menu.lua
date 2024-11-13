local mumList = { "Hannah", "Aubrey", "Jasmine", "Gisele", "Amelia", "Isabella", "Zoe", "Ava", "Camila", "Violet", "Sophia", "Evelyn", "Nicole", "Ashley", "Gracie", "Brianna", "Natalie", "Olivia", "Elizabeth", "Charlotte", "Emma" }
local dadList = { "Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony",  "Claude", "Niko" }

local dadIndex, momIndex = 1, 1
local heritageBody, heritageSkin = 1.0, 1.0

CharacterCreator.Heredity = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Hérédité",
        "Hérédité du personnage"),
    render = function()
        RageUI.Window.Heritage(momIndex - 1, dadIndex - 1)
        RageUI.List('Mère', mumList, momIndex, nil, {}, true, {
            onListChange = function(index, indexValue)
                momIndex = index
            end
        })
        RageUI.List('Père', dadList, dadIndex, nil, {}, true, {
            onListChange = function(index, indexValue)
                dadIndex = index
            end
        })
        RageUI.UISliderHeritage('Physique', heritageBody, nil, {
            onSliderChange = function(indexValue, index)
                heritageBody = index
            end
        })
        RageUI.UISliderHeritage('Peau', heritageSkin, nil, {
            onSliderChange = function(indexValue, index)
                heritageSkin = index
            end
        })
    end
}