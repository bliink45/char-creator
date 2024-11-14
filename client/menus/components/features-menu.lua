features = { nose = { x = 0.5, y = 0.5 }, noseProfile = { x = 0.5, y = 0.5 },
            nosePeak = { x = 0.5, y = 0.5 }, eyebrows = { x = 0.5, y = 0.5 },
            cheekbones = { x = 0.5, y = 0.5 }, cheeks = { x = 0.5, y = 0.5 },
            eyes = { x = 0.5, y = 0.5 }, Lips = { x = 0.5, y = 0.5 },
            jaws = { x = 0.5, y = 0.5 }, chin = { x = 0.5, y = 0.5 },
            chinSize = { x = 0.5, y = 0.5 }, neckThickness = { x = 0.5, y = 0.5
        }}

currentGrid = features.nose

CharacterCreator.Features = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu,
        "Traits du visage", "Détails faciaux du personnage"),
    render = function()
        RageUI.Button("Nez", nil, {}, true, {
            onActive = function()
                currentGrid = features.nose
            end
        })
        RageUI.Button("Profil du nez", nil, {}, true, {
            onActive = function()
                currentGrid = features.noseProfile
            end
        })
        RageUI.Button("Pointe du nez", nil, {}, true, {
            onActive = function()
                currentGrid = features.nosePeak
            end
        })
        RageUI.Button("Sourcils", nil, {}, true, {
            onActive = function()
                currentGrid = features.eyebrows
            end
        })
        RageUI.Button("Pommettes", nil, {}, true, {
            onActive = function()
                currentGrid = features.cheekbones
            end
        })
        RageUI.Button("Joues", nil, {}, true, {
            onActive = function()
                currentGrid = features.cheeks
            end
        })
        RageUI.Button("Yeux", nil, {}, true, {
            onActive = function()
                currentGrid = features.eyes
            end
        })
        RageUI.Button("Levres", nil, {}, true, {
            onActive = function()
                currentGrid = features.Lips
            end
        })
        RageUI.Button("Machoire", nil, {}, true, {
            onActive = function()
                currentGrid = features.jaws
            end
        })
        RageUI.Button("Menton", nil, {}, true, {
            onActive = function()
                currentGrid = features.chin
            end
        })
        RageUI.Button("Taille du Menton", nil, {}, true, {
            onActive = function()
                currentGrid = features.chinSize
            end
        })
        RageUI.Button("Epaisseur du cou", nil, {}, true, {
            onActive = function()
                currentGrid = features.neckThickness
            end
        })
        RageUI.Grid(currentGrid.x, currentGrid.y, "Haut", "Bas",
                "Etroit", "Large", {
                    onPositionChange = function(X, Y)
                        -- set values by index
                    end
                }, RageUI.CurrentMenu.Index)
    end
}
