local isCharCreated = false

local loadingComplete = false
local loadingLabel = nil
local loadingSpeed = nil
local percent = nil

local LoadingStage = {
    { label = "Initialisation ...", speed = 0.0005 },
    { label = "Chargement des données ...", speed = 0.007 },
    { label = "Sauvegarde ...", speed = 0.002 },
    { label = "Finalisation ...", speed = 0.008 },
    { label = "Terminé", speed = 0.001 }
}

CharacterCreator.Save = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Enregistrer", "Sauvegarder et quitter ?"),
    render = function()
        RageUI.Button("Confirmer", nil, {RightLabel = ">", Color = {80, 176, 119, 120, HightLightColor = {80, 176, 119, 120}}}, true, {
            onSelected = function()
                isCharCreated = true
                loadingLabel = LoadingStage[1].label
                loadingSpeed = LoadingStage[1].speed
                percent = 0.0
                loadingComplete = false
            end
        })
        RageUI.Button("Annuler", nil, {RightLabel = ">", Color = {220, 94, 94, 120, HightLightColor = {220, 94, 94, 120}}}, true, {}, CharacterCreator.Main.menu)
        if isCharCreated and not loadingComplete then
            RageUI.PercentagePanel(percent or 0.0, loadingLabel, '', '', {})

            if percent >= 0.02 and percent < 0.5 then
                loadingSpeed = LoadingStage[2].speed
                loadingLabel = LoadingStage[2].label
            elseif percent >= 0.5 and percent < 0.7 then
                loadingSpeed = LoadingStage[3].speed
                loadingLabel = LoadingStage[3].label
            elseif percent >= 0.7 and percent < 0.95 then
                loadingSpeed = LoadingStage[4].speed
                loadingLabel = LoadingStage[4].label
            elseif percent >= 0.95 then
                loadingSpeed = LoadingStage[5].speed
                loadingLabel = LoadingStage[5].label
                Citizen.CreateThread(function()
                    Citizen.Wait(1000)
                    loadingComplete = true
                end)
            end

            percent = percent + loadingSpeed
        end
    end
}

function decreaseProgressBar(value, time)
    oldLoadingSpeed = loadingSpeed
    Citizen.CreateThread(function()
        loadingSpeed = loadingSpeed - value
        Citizen.Wait(time)
        loadingSpeed = oldLoadingSpeed
    end)
end