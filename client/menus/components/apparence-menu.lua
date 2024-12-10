CharacterCreator.Data.apparence = {
    hair = {
        index = 1,
        colors = {
            primary = {
                MinimumIndex = 1,
                CurrentIndex = 1
            },
            secondary =  {
                MinimumIndex = 1,
                CurrentIndex = 1
            },
        }
    },
    eyebrows = {
        index = 1,
        colors = {
            primary =  {
                MinimumIndex = 1,
                CurrentIndex = 1
            },
            secondary =  {
                MinimumIndex = 1,
                CurrentIndex = 1
            },
        }
    },
    bear = {
        index = 1,
        colors = {
            primary = {
                MinimumIndex = 1,
                CurrentIndex = 1
            },
            secondary =  {
                MinimumIndex = 1,
                CurrentIndex = 1
            },
        }
    },
    eyes = {
        index = 1,
        colors = {
            primary = {
                MinimumIndex = 1,
                CurrentIndex = 1
            }
        }
    },
    frickles = {
        index = 1,
    },
    wrinkles = {
        index = 1,
    },
    sunDamage = {
        index = 1,
    }
}

currentColorPanel = CharacterCreator.Data.apparence.hair.colors
currentPanelColour = RageUI.PanelColour.HairCut

CharacterCreator.Apparence = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Apparence",
        "Apparence du personnage"),
    render = function()
        RageUI.List('Cheveux', { 1, 2, 3, 4 }, CharacterCreator.Data.apparence.hair.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.apparence.hair.colors
                currentPanelColour = RageUI.PanelColour.HairCut
            end,
            onListChange = function(index, indexValue)
                CharacterCreator.Data.apparence.hair.index = index
            end
        })
        RageUI.List('Sourcils', { 1, 2, 3, 4 }, CharacterCreator.Data.apparence.eyebrows.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.apparence.eyebrows.colors
                currentPanelColour = RageUI.PanelColour.HairCut
            end,
            onListChange = function(index, indexValue)
                CharacterCreator.Data.apparence.eyebrows.index = index
            end
        })
        RageUI.List('Barbes', { 1, 2, 3, 4 }, CharacterCreator.Data.apparence.bear.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.apparence.bear.colors
                currentPanelColour = RageUI.PanelColour.HairCut
            end,
            onListChange = function(index, indexValue)
                CharacterCreator.Data.apparence.bear.index = index
            end
        })
        RageUI.List('Yeux', { 1 }, CharacterCreator.Data.apparence.eyes.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.apparence.eyes.colors
                currentPanelColour = RageUI.PanelColour.Eyes
            end,
            onListChange = function(index, indexValue)
                CharacterCreator.Data.apparence.eyes.index = index
            end
        })
        RageUI.List('Taches de rousseurs', { 1, 2, 3, 4 }, CharacterCreator.Data.apparence.frickles.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.apparence.frickles.colors
            end,
            onListChange = function(index, indexValue)
                CharacterCreator.Data.apparence.frickles.index = index
            end
        })
        RageUI.List('Rides', { 1, 2, 3, 4 }, CharacterCreator.Data.apparence.wrinkles.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.apparence.wrinkles.colors
            end,
            onListChange = function(index, indexValue)
                CharacterCreator.Data.apparence.wrinkles.index = index
            end
        })
        RageUI.List('Coups de soleil', { 1, 2, 3, 4 }, CharacterCreator.Data.apparence.sunDamage.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.apparence.sunDamage.colors
            end,
            onListChange = function(index, indexValue)
                CharacterCreator.Data.apparence.sunDamage.index = index
            end
        })

        if currentColorPanel ~= nil then
            if currentColorPanel.primary ~= nil then
                RageUI.ColourPanel("Couleur Principale", currentPanelColour, currentColorPanel.primary.MinimumIndex, currentColorPanel.primary.CurrentIndex, {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        currentColorPanel.primary.MinimumIndex = MinimumIndex
                        currentColorPanel.primary.CurrentIndex = CurrentIndex
                    end
                }, RageUI.CurrentMenu.Index, {})
            end
            if currentColorPanel.secondary ~= nil then
                RageUI.ColourPanel("Couleur Secondaire", currentPanelColour, currentColorPanel.secondary.MinimumIndex, currentColorPanel.secondary.CurrentIndex, {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        currentColorPanel.secondary.MinimumIndex = MinimumIndex
                        currentColorPanel.secondary.CurrentIndex = CurrentIndex
                    end
                }, RageUI.CurrentMenu.Index, {})
            end
        end
    end
}
