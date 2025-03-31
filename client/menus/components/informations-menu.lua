CharacterCreator.Data.Identity.informations = {
    firstname = "",
    lastname = "",
    birthdate = {},
    nationality = "",
    height = 0,
    weight = 0,
    background = "",
}

local informationsMenu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Informations",
        "Identité du personnage")

CharacterCreator.Informations = {
    menu = informationsMenu,
    render = function()
        RageUI.Button("Prénom(s)", nil, {RightLabel = '~b~'..CharacterCreator.Data.Identity.informations.firstname}, true, {
            onSelected = function()
                CharacterCreator.Data.Identity.informations.firstname = Keyboard('Votre / Vos prénoms :', 30, CharacterCreator.Data.Identity.informations.firstname)
            end
        })
        RageUI.Button("Nom", nil, {RightLabel = '~b~'..CharacterCreator.Data.Identity.informations.lastname}, true, {
            onSelected = function()
                CharacterCreator.Data.Identity.informations.lastname = Keyboard('Votre nom :', 30, CharacterCreator.Data.Identity.informations.lastname)
            end
        })
        RageUI.Button("Date de naissance", nil, {RightLabel = getBirthdate()}, true, {},
                CharacterCreator.Informations.SubMenu.Birthdate.menu)
        RageUI.List('Nationalité', nationalityList, nationalityIndex, nil, {}, true, {
            onListChange = function(index, indexValue)
                nationalityIndex = index
                CharacterCreator.Data.Identity.informations.nationality = indexValue
            end
        })
        RageUI.List('Taille (cm)', heightList, heightIndex, nil, {}, true, {
            onListChange = function(index, indexValue)
                heightIndex = index
                CharacterCreator.Data.Identity.informations.height = indexValue
            end
        })
        RageUI.List('Poids (kg)', weightList, weightIndex, nil, {}, true, {
            onListChange = function(index, indexValue)
                weightIndex = index
                CharacterCreator.Data.Identity.informations.weight = indexValue
            end
        })
        RageUI.Button("Background", nil, {RightLabel = '~b~' .. CharacterCreator.Data.Identity.informations.background}, true, {
            onSelected = function()
                CharacterCreator.Data.Identity.informations.background = Keyboard('Votre background :', 5000, CharacterCreator.Data.Identity.informations.background)
            end
        })
    end,
    SubMenu = {
        Birthdate = {
            menu = RageUI.CreateSubMenu(informationsMenu, "Date de naissance",
                    "Date de naissance"),
            render = function()
                RageUI.List('Jour', dayList, dayIndex, nil, {}, true, {
                    onListChange = function(index, indexValue)
                        dayIndex = index
                        CharacterCreator.Data.Identity.informations.birthdate.day = string.format("%02d", indexValue)
                    end
                })
                RageUI.List('Mois', monthList, monthIndex, nil, {}, true, {
                    onListChange = function(index, indexValue)
                        monthIndex = index
                        CharacterCreator.Data.Identity.informations.birthdate.month = string.format("%02d", indexValue)
                    end
                })
                RageUI.List('Année', yearList, yearIndex, nil, {}, true, {
                    onListChange = function(index, indexValue)
                        yearIndex = index
                        CharacterCreator.Data.Identity.informations.birthdate.year = indexValue
                    end
                })
            end
        }
    }
}