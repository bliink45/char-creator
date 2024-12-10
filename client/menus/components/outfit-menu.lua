CharacterCreator.Data.outfit = {
    -- Structure to be defined
}

CharacterCreator.Outfit = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Vêtements",
        "Tenue du personnage"),
    render = function()
        RageUI.Button("Tenue 1", nil, {}, true, {
            onActive = function()
                -- set outfit index
            end
        })
        RageUI.Button("Tenue 2", nil, {}, true, {
            onActive = function()
            end
        })
        RageUI.Button("Tenue 3", nil, {}, true, {
            onActive = function()
            end
        })
        RageUI.Button("Tenue 4", nil, {}, true, {
            onActive = function()
            end
        })
        RageUI.Button("Tenue 5", nil, {}, true, {
            onActive = function()
            end
        })
        RageUI.Button("Tenue 6", nil, {}, true, {
            onActive = function()
            end
        })
        RageUI.Button("Tenue 7", nil, {}, true, {
            onActive = function()
            end
        })
        RageUI.Button("Tenue 8", nil, {}, true, {
            onActive = function()
            end
        })
        RageUI.Button("Tenue 9", nil, {}, true, {
            onActive = function()
            end
        })
        RageUI.Button("Tenue 10", nil, {}, true, {
            onActive = function()
            end
        })
    end
}
