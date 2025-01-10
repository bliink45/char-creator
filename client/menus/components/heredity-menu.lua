local mumList = {"Hannah", "Audrey", "Jasmine", "Giselle", "Amelia", "Isabella", "Zoe", "Ava", "Camila", "Violet", "Sophia", "Evelyn", "Nicole", "Ashley", "Grace", "Brianna", "Natalie", "Olivia", "Elizabeth", "Charlotte", "Emma", "Misty"}
local dadList = {"Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Claude", "Niko", "John"}
local moms = {"21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "45"} -- female heads
local dads = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "42", "43", "44"} -- male heads
local mdhash = GetHashKey("mp_m_freemode_01")

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


function UpdateHeritage()
    SetPedHeadBlendData(
        PlayerPedId(),
        tonumber(moms[CharacterCreator.Data.Model.heredity.momIndex]),
        tonumber(dads[CharacterCreator.Data.Model.heredity.dadIndex]),
        nil, 
        tonumber(moms[CharacterCreator.Data.Model.heredity.momIndex]),
        tonumber(dads[CharacterCreator.Data.Model.heredity.dadIndex]),
        nil, 
        tonumber(CharacterCreator.Data.Model.heredity.heritageBody)/10, 
        tonumber(CharacterCreator.Data.Model.heredity.heritageSkin)/10,
        nil, 
        true
    )
end