CharacterCreator.Data.Model.features = { nose = { x = 0.5, y = 0.5 }, noseProfile = { x = 0.5, y = 0.5 },
            nosePeak = { x = 0.5, y = 0.5 }, eyebrows = { x = 0.5, y = 0.5 },
            cheekbones = { x = 0.5, y = 0.5 }, cheeks = { x = 0.5, y = 0.5 },
            eyes = { x = 0.5, y = 0.5 }, Lips = { x = 0.5, y = 0.5 },
            jaws = { x = 0.5, y = 0.5 }, chin = { x = 0.5, y = 0.5 },
            chinSize = { x = 0.5, y = 0.5 }, neckThickness = { x = 0.5, y = 0.5 }}

currentFeature = "NOSE"
currentGrid = CharacterCreator.Data.Model.features.nose
currentGridText = {
    left = "Gauche", right = "Droite", top = "Haut", bottom = "Bas"
}

CharacterCreator.Features = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu,
        "Traits du visage", "Détails faciaux du personnage"),
    render = function()
        RageUI.Button("Nez", nil, {}, true, {
            onActive = function()
                currentFeature = "NOSE"
                currentGrid = CharacterCreator.Data.Model.features.nose
                SetPedFaceFeature(PlayerPedId(), 0, CharacterCreator.Data.Model.features.nose.x)
                SetPedFaceFeature(PlayerPedId(), 1, CharacterCreator.Data.Model.features.nose.y)

                currentGridText.left = "Large"
                currentGridText.right = "Étroit"
                currentGridText.top = "Haut"
                currentGridText.bottom = "Bas"
            end
        })
        RageUI.Button("Profil du nez", nil, {}, true, {
            onActive = function()
                currentFeature = "NOSE_PROFILE"
                currentGrid = CharacterCreator.Data.Model.features.noseProfile
                SetPedFaceFeature(PlayerPedId(), 3, CharacterCreator.Data.Model.features.noseProfile.y)

                currentGridText.top = "Convexe"
                currentGridText.bottom = "Concave"
            end
        })
        RageUI.Button("Pointe du nez", nil, {}, true, {
            onActive = function()
                currentFeature = "NOSE_PEAK"
                currentGrid = CharacterCreator.Data.Model.features.nosePeak
                SetPedFaceFeature(PlayerPedId(), 5, CharacterCreator.Data.Model.features.nosePeak.x)
                SetPedFaceFeature(PlayerPedId(), 4, CharacterCreator.Data.Model.features.nosePeak.y)

                currentGridText.left = "Droit"
                currentGridText.right = "Courbé"
                currentGridText.top = "Relevé"
                currentGridText.bottom = "Bas"
            end
        })
        RageUI.Button("Sourcils", nil, {}, true, {
            onActive = function()
                currentFeature = "EYEBROWS"
                currentGrid = CharacterCreator.Data.Model.features.eyebrows
                SetPedFaceFeature(PlayerPedId(), 6, CharacterCreator.Data.Model.features.eyebrows.y)

                currentGridText.top = "Épais"
                currentGridText.bottom = "Fin"
            end
        })
        RageUI.Button("Pommettes", nil, {}, true, {
            onActive = function()
                currentFeature = "CHEEKBONES"
                currentGrid = CharacterCreator.Data.Model.features.cheekbones
                SetPedFaceFeature(PlayerPedId(), 8, CharacterCreator.Data.Model.features.cheekbones.x)
                SetPedFaceFeature(PlayerPedId(), 9, CharacterCreator.Data.Model.features.cheekbones.y)

                currentGridText.left = "Large"
                currentGridText.right = "Fin"
                currentGridText.top = "Haut"
                currentGridText.bottom = "Bas"
            end
        })
        RageUI.Button("Joues", nil, {}, true, {
            onActive = function()
                currentFeature = "CHEEKS"
                currentGrid = CharacterCreator.Data.Model.features.cheeks
                SetPedFaceFeature(PlayerPedId(), 10, CharacterCreator.Data.Model.features.cheeks.x)

                currentGridText.left = "Rond"
                currentGridText.right = "Creusé"
            end
        })
        RageUI.Button("Yeux", nil, {}, true, {
            onActive = function()
                currentFeature = "EYES"
                currentGrid = CharacterCreator.Data.Model.features.eyes
                SetPedFaceFeature(PlayerPedId(), 11, CharacterCreator.Data.Model.features.eyes.y)

                currentGridText.top = "Ouverts"
                currentGridText.bottom = "Fermés"
            end
        })
        RageUI.Button("Levres", nil, {}, true, {
            onActive = function()
                currentFeature = "LIPS"
                currentGrid = CharacterCreator.Data.Model.features.Lips
                SetPedFaceFeature(PlayerPedId(), 12, CharacterCreator.Data.Model.features.Lips.x)

                currentGridText.left = "Épais"
                currentGridText.right = "Fin"
            end
        })
        RageUI.Button("Machoire", nil, {}, true, {
            onActive = function()
                currentFeature = "JAWS"
                currentGrid = CharacterCreator.Data.Model.features.jaws
                SetPedFaceFeature(PlayerPedId(), 13, CharacterCreator.Data.Model.features.jaws.x)
                SetPedFaceFeature(PlayerPedId(), 14, CharacterCreator.Data.Model.features.jaws.y)

                currentGridText.left = "Fin"
                currentGridText.right = "Large"
                currentGridText.top = "Avancé"
                currentGridText.bottom = "Reculé"
            end
        })
        RageUI.Button("Menton", nil, {}, true, {
            onActive = function()
                currentFeature = "CHIN"
                currentGrid = CharacterCreator.Data.Model.features.chin
                SetPedFaceFeature(PlayerPedId(), 15, CharacterCreator.Data.Model.features.chin.x)
                SetPedFaceFeature(PlayerPedId(), 16, CharacterCreator.Data.Model.features.chin.y)

                currentGridText.left = "Fin"
                currentGridText.right = "Large"
                currentGridText.top = "Reculé"
                currentGridText.bottom = "Avancé"
            end
        })
        RageUI.Button("Taille du Menton", nil, {}, true, {
            onActive = function()
                currentFeature = "CHIN_SIZE"
                currentGrid = CharacterCreator.Data.Model.features.chinSize
                SetPedFaceFeature(PlayerPedId(), 17, CharacterCreator.Data.Model.features.chinSize.x)
                SetPedFaceFeature(PlayerPedId(), 18, CharacterCreator.Data.Model.features.chinSize.y)

                currentGridText.left = "Large"
                currentGridText.right = "Fin"
                currentGridText.top = "Avancé"
                currentGridText.bottom = "Reculé"
            end
        })
        RageUI.Button("Epaisseur du cou", nil, {}, true, { -- Mettre un grid simple.
            onActive = function()
                currentFeature = "NECK_THICKNESS"
                currentGrid = CharacterCreator.Data.Model.features.neckThickness
                SetPedFaceFeature(PlayerPedId(), 19, CharacterCreator.Data.Model.features.neckThickness.x)

                currentGridText.left = "Fin"
                currentGridText.right = "Épais"
            end
        })

        if currentFeature == "CHEEKS" or currentFeature == "NECK_THICKNESS" or currentFeature == "LIPS" then
            RageUI.GridHorizontal(currentGrid.x, currentGridText.left, currentGridText.right, {
                onPositionChange = function(X, _)
                    currentGrid.x = X
                end
            }, RageUI.CurrentMenu.Index)
        elseif currentFeature == "EYES" or currentFeature == "NOSE_PROFILE" or currentFeature == "EYEBROWS" then
            RageUI.GridVertical(currentGrid.y, currentGridText.top, currentGridText.bottom, {
                onPositionChange = function(_, Y)
                    currentGrid.y = Y
                end
            }, RageUI.CurrentMenu.Index)
        else
            RageUI.Grid(currentGrid.x, currentGrid.y, currentGridText.top, currentGridText.bottom, -- Noms adaptatifs en fonction du grid.
                    currentGridText.left, currentGridText.right, {
                        onPositionChange = function(X, Y)
                            currentGrid.x = X
                            currentGrid.y = Y
                        end
                    }, RageUI.CurrentMenu.Index)
        end
    end
}
