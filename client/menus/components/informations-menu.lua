informations = {
    firstname = "",
    lastname = "",
    birthday = "",
    nationality = "",
    height = "",
    weight = "",
    background = "",
} 

CharacterCreator.Informations = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Informations",
        "Identité du personnage"),
    render = function()
        RageUI.Button("Prénom(s)", nil, {RightLabel = '~b~'..informations.firstname}, true, {
            onSelected = function()
                informations.firstname = Keyboard('Votre / Vos prénoms :', 30, informations.firstname)
            end
        })
        RageUI.Button("Nom", nil, {RightLabel = '~b~'..informations.lastname}, true, {
            onSelected = function()
                informations.lastname = Keyboard('Votre nom :', 30, informations.lastname)
            end
        })
        RageUI.Button("Date de naissance", nil, {RightLabel = '~b~'..informations.birthday}, true, {
            onSelected = function()
                informations.birthday = Keyboard('Votre anniversaire :', 30, informations.birthday)
            end
        })
        RageUI.Button("Nationalité", nil, {RightLabel = '~b~'..informations.nationality}, true, {
            onSelected = function()
                informations.nationality = Keyboard('Votre nationalité :', 30, informations.nationality)
            end
        })
        RageUI.Button("Taille (cm)", nil, {RightLabel = '~b~'..informations.height}, true, {
            onSelected = function()
                informations.height = Keyboard('Votre taille :', 30, informations.height)
            end
        })
        RageUI.Button("Poids (kg)", nil, {RightLabel = '~b~'..informations.weight}, true, {
            onSelected = function()
                informations.weight = Keyboard('Votre poids :', 30, informations.weight)
            end
        })
        RageUI.Button("Background", nil, {RightLabel = '~b~' .. informations.background}, true, {
            onSelected = function()
                informations.background = Keyboard('Votre background :', 5000, informations.background)
            end
        })
    end
}

function Keyboard(TextEntry, MaxStringLenght, Example)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", Example, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end