CharacterCreator.Data.Identity.informations = {
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
        RageUI.Button("Date de naissance", nil, {RightLabel = '~b~'..CharacterCreator.Data.Identity.informations.birthday}, true, {
            onSelected = function()
                CharacterCreator.Data.Identity.informations.birthday = Keyboard('Votre anniversaire :', 30, CharacterCreator.Data.Identity.informations.birthday)
            end
        })
        RageUI.Button("Nationalité", nil, {RightLabel = '~b~'..CharacterCreator.Data.Identity.informations.nationality}, true, {
            onSelected = function()
                CharacterCreator.Data.Identity.informations.nationality = Keyboard('Votre nationalité :', 30, CharacterCreator.Data.Identity.informations.nationality)
            end
        })
        RageUI.Button("Taille (cm)", nil, {RightLabel = '~b~'..CharacterCreator.Data.Identity.informations.height}, true, {
            onSelected = function()
                CharacterCreator.Data.Identity.informations.height = Keyboard('Votre taille :', 30, CharacterCreator.Data.Identity.informations.height)
            end
        })
        RageUI.Button("Poids (kg)", nil, {RightLabel = '~b~'..CharacterCreator.Data.Identity.informations.weight}, true, {
            onSelected = function()
                CharacterCreator.Data.Identity.informations.weight = Keyboard('Votre poids :', 30, CharacterCreator.Data.Identity.informations.weight)
            end
        })
        RageUI.Button("Background", nil, {RightLabel = '~b~' .. CharacterCreator.Data.Identity.informations.background}, true, {
            onSelected = function()
                CharacterCreator.Data.Identity.informations.background = Keyboard('Votre background :', 5000, CharacterCreator.Data.Identity.informations.background)
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