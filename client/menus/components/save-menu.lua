local isCharCreated = false

local loadingComplete = false
local loadingLabel = nil
local loadingSpeed = nil
local percent = nil

local operationInProgress = false

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
        RageUI.Button("Confirmer", nil, {RightLabel = ">", Color = {33, 66, 49, 255}}, true, {
            onSelected = function()
                if (operationInProgress == false) then
                    operationInProgress = true
                    isCharCreated = true
                    loadingLabel = LoadingStage[1].label
                    loadingSpeed = LoadingStage[1].speed
                    percent = 0.0
                    loadingComplete = false

                    Citizen.CreateThread(function()
                        while (not loadingComplete) do
                            Citizen.Wait(50)
                        end

                        local personageId = SyncV.Core.PersonageManager.create(
                                SyncV.Utility.encodeJson(CharacterCreator.Data.Identity),
                                SyncV.Utility.encodeJson(CharacterCreator.Data.Model),
                                nil)

                        local outfitId = SyncV.Core.OutfitManager.create(
                                personageId,
                                CharacterCreator.Data.Outfit.name,
                                SyncV.Utility.encodeJson(CharacterCreator.Data.Outfit.clothes)
                        )

                        SyncV.Core.PersonageManager.update(personageId, { ["currentOutfit"]=outfitId })

                        local playerEntity = SyncV.Core.SessionManager.getPlayerByLicenseId(
                                SyncV.Core.PlayerManager.getPlayerLicenseId()
                        )

                        SyncV.Core.PlayerManager.update(playerEntity.id, { ["currentPersonageId"]=personageId })
                        RageUI.Visible(CharacterCreator.Save.menu, false)

                        EndCharCreator()
                        operationInProgress = false
                    end)
                end
            end
        })
        RageUI.Button("Annuler", nil, {RightLabel = ">", Color = {130, 34, 34, 255}}, true, {}, CharacterCreator.Main.menu)
        if isCharCreated and not loadingComplete then
            RageUI.PercentagePanel(percent or 0.0, loadingLabel, '', '', {})
            updateProgressBar()
        end
    end
}

function updateProgressBar()
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

function decreaseProgressBar(value, time)
    oldLoadingSpeed = loadingSpeed
    Citizen.CreateThread(function()
        loadingSpeed = loadingSpeed - value
        Citizen.Wait(time)
        loadingSpeed = oldLoadingSpeed
    end)
end