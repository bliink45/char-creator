CharacterCreator.Data.Model.features = { nose = { x = 0.5, y = 0.5 }, noseProfile = { x = 0.5, y = 0.5 },
            nosePeak = { x = 0.5, y = 0.5 }, eyebrows = { x = 0.5, y = 0.5 },
            cheekbones = { x = 0.5, y = 0.5 }, cheeks = { x = 0.5, y = 0.5 },
            eyes = { x = 0.5, y = 0.5 }, Lips = { x = 0.5, y = 0.5 },
            jaws = { x = 0.5, y = 0.5 }, chin = { x = 0.5, y = 0.5 },
            chinSize = { x = 0.5, y = 0.5 }, neckThickness = { x = 0.5, y = 0.5 }}

currentGrid = CharacterCreator.Data.Model.features.nose

CharacterCreator.Features = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu,
        "Traits du visage", "Détails faciaux du personnage"),
    render = function()
        RageUI.Button("Nez", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.nose
                SetPedFaceFeature(PlayerPedId(), 0, CharacterCreator.Data.Model.features.nose.x)
                SetPedFaceFeature(PlayerPedId(), 1, CharacterCreator.Data.Model.features.nose.y)
            end
        })
        RageUI.Button("Profil du nez", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.noseProfile
                SetPedFaceFeature(PlayerPedId(), 2, CharacterCreator.Data.Model.features.noseProfile.x)
                SetPedFaceFeature(PlayerPedId(), 3, CharacterCreator.Data.Model.features.noseProfile.y)
            end
        })
        RageUI.Button("Pointe du nez", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.nosePeak
                SetPedFaceFeature(PlayerPedId(), 4, CharacterCreator.Data.Model.features.nosePeak.x)
                SetPedFaceFeature(PlayerPedId(), 5, CharacterCreator.Data.Model.features.nosePeak.y)
            end
        })
        RageUI.Button("Sourcils", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.eyebrows
                SetPedFaceFeature(PlayerPedId(), 7, CharacterCreator.Data.Model.features.eyebrows.x)
                SetPedFaceFeature(PlayerPedId(), 6, CharacterCreator.Data.Model.features.eyebrows.y)
            end
        })
        RageUI.Button("Pommettes", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.cheekbones
                SetPedFaceFeature(PlayerPedId(), 8, CharacterCreator.Data.Model.features.cheekbones.x)
                SetPedFaceFeature(PlayerPedId(), 9, CharacterCreator.Data.Model.features.cheekbones.y)
            end
        })
        RageUI.Button("Joues", nil, {}, true, { -- Mettre un grid simple.
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.cheeks
                SetPedFaceFeature(PlayerPedId(), 10, CharacterCreator.Data.Model.features.cheeks.x) 
            end
        })
        RageUI.Button("Yeux", nil, {}, true, { -- Mettre un grid simple.
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.eyes
                SetPedFaceFeature(PlayerPedId(), 11, CharacterCreator.Data.Model.features.eyes.x)
            end
        })
        RageUI.Button("Levres", nil, {}, true, { -- Mettre un grid simple.
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.Lips
                SetPedFaceFeature(PlayerPedId(), 12, CharacterCreator.Data.Model.features.Lips.x)
            end
        })
        RageUI.Button("Machoire", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.jaws
                SetPedFaceFeature(PlayerPedId(), 13, CharacterCreator.Data.Model.features.jaws.x)
                SetPedFaceFeature(PlayerPedId(), 14, CharacterCreator.Data.Model.features.jaws.y)
            end
        })
        RageUI.Button("Menton", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.chin
                SetPedFaceFeature(PlayerPedId(), 15, CharacterCreator.Data.Model.features.chin.x)
                SetPedFaceFeature(PlayerPedId(), 16, CharacterCreator.Data.Model.features.chin.y)
            end
        })
        RageUI.Button("Taille du Menton", nil, {}, true, {
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.chinSize
                SetPedFaceFeature(PlayerPedId(), 17, CharacterCreator.Data.Model.features.chinSize.x)
                SetPedFaceFeature(PlayerPedId(), 18, CharacterCreator.Data.Model.features.chinSize.y)
            end
        })
        RageUI.Button("Epaisseur du cou", nil, {}, true, { -- Mettre un grid simple.
            onActive = function()
                currentGrid = CharacterCreator.Data.Model.features.neckThickness
                SetPedFaceFeature(PlayerPedId(), 19, CharacterCreator.Data.Model.features.neckThickness.x)
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
