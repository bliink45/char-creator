CharacterCreator.Data.features = { nose = { x = 0.5, y = 0.5 }, noseProfile = { x = 0.5, y = 0.5 },
            nosePeak = { x = 0.5, y = 0.5 }, eyebrows = { x = 0.5, y = 0.5 },
            cheekbones = { x = 0.5, y = 0.5 }, cheeks = { x = 0.5, y = 0.5 },
            eyes = { x = 0.5, y = 0.5 }, Lips = { x = 0.5, y = 0.5 },
            jaws = { x = 0.5, y = 0.5 }, chin = { x = 0.5, y = 0.5 },
            chinSize = { x = 0.5, y = 0.5 }, neckThickness = { x = 0.5, y = 0.5 }}

currentGrid = CharacterCreator.Data.features.nose

CharacterCreator.Features = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu,
        "Traits du visage", "Détails faciaux du personnage"),
    render = function()
        RageUI.Button("Nez", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.features.nose
                SetPedFaceFeature(PlayerPedId(), 0, CharacterCreator.Data.features.nose.x)
                SetPedFaceFeature(PlayerPedId(), 1, CharacterCreator.Data.features.nose.y)
            end
        })
        RageUI.Button("Profil du nez", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.features.noseProfile
                SetPedFaceFeature(PlayerPedId(), 2, CharacterCreator.Data.features.noseProfile.x)
                SetPedFaceFeature(PlayerPedId(), 3, CharacterCreator.Data.features.noseProfile.y)
            end
        })
        RageUI.Button("Pointe du nez", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.features.nosePeak
                SetPedFaceFeature(PlayerPedId(), 4, CharacterCreator.Data.features.nosePeak.x)
                SetPedFaceFeature(PlayerPedId(), 5, CharacterCreator.Data.features.nosePeak.y)
            end
        })
        RageUI.Button("Sourcils", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.features.eyebrows
                SetPedFaceFeature(PlayerPedId(), 7, CharacterCreator.Data.features.eyebrows.x)
                SetPedFaceFeature(PlayerPedId(), 6, CharacterCreator.Data.features.eyebrows.y)
            end
        })
        RageUI.Button("Pommettes", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.features.cheekbones
                SetPedFaceFeature(PlayerPedId(), 8, CharacterCreator.Data.features.cheekbones.x)
                SetPedFaceFeature(PlayerPedId(), 9, CharacterCreator.Data.features.cheekbones.y)
            end
        })
        RageUI.Button("Joues", nil, {}, true, { -- Mettre un grid simple.
            onActive = function()
                currentGrid = CharacterCreator.Data.features.cheeks
                SetPedFaceFeature(PlayerPedId(), 10, CharacterCreator.Data.features.cheeks.x) 
            end
        })
        RageUI.Button("Yeux", nil, {}, true, { -- Mettre un grid simple.
            onActive = function()
                currentGrid = CharacterCreator.Data.features.eyes
                SetPedFaceFeature(PlayerPedId(), 11, CharacterCreator.Data.features.eyes.x)
            end
        })
        RageUI.Button("Levres", nil, {}, true, { -- Mettre un grid simple.
            onActive = function()
                currentGrid = CharacterCreator.Data.features.Lips
                SetPedFaceFeature(PlayerPedId(), 12, CharacterCreator.Data.features.Lips.x)
            end
        })
        RageUI.Button("Machoire", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.features.jaws
                SetPedFaceFeature(PlayerPedId(), 13, CharacterCreator.Data.features.jaws.x)
                SetPedFaceFeature(PlayerPedId(), 14, CharacterCreator.Data.features.jaws.y)
            end
        })
        RageUI.Button("Menton", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.features.chin
                SetPedFaceFeature(PlayerPedId(), 15, CharacterCreator.Data.features.chin.x)
                SetPedFaceFeature(PlayerPedId(), 16, CharacterCreator.Data.features.chin.y)
            end
        })
        RageUI.Button("Taille du Menton", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.features.chinSize
                SetPedFaceFeature(PlayerPedId(), 17, CharacterCreator.Data.features.chinSize.x)
                SetPedFaceFeature(PlayerPedId(), 18, CharacterCreator.Data.features.chinSize.y)
            end
        })
        RageUI.Button("Epaisseur du cou", nil, {}, true, { -- Mettre un grid simple.
            onActive = function()
                currentGrid = CharacterCreator.Data.features.neckThickness
                SetPedFaceFeature(PlayerPedId(), 19, CharacterCreator.Data.features.neckThickness.x)
            end
        })
        RageUI.Grid(currentGrid.x, currentGrid.y, "Haut", "Bas", -- Noms adaptatifs en fonction du grid.
                "Etroit", "Large", {
                    onPositionChange = function(X, Y)
                        currentGrid.x = X
                        currentGrid.y = Y
                    end
                }, RageUI.CurrentMenu.Index)
    end
}
