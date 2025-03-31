CharacterCreator.Data.Model.apparence = {
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
            }
        }
    },
    bear = {
        index = 1,
        colors = {
            primary = {
                MinimumIndex = 1,
                CurrentIndex = 1
            }
        }
    },
    eyes = {
        index = 1
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

currentColorPanel = CharacterCreator.Data.Model.apparence.hair.colors
currentPanelColour = RageUI.PanelColour.HairCut
apparenceCategory = nil

CharacterCreator.Apparence = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Apparence",
        "Apparence du personnage"),
    render = function()
        RageUI.List('Cheveux', hairList, CharacterCreator.Data.Model.apparence.hair.index, nil, {}, true, {
            onActive = function()
                apparenceCategory = 'HAIRS'
                currentColorPanel = CharacterCreator.Data.Model.apparence.hair.colors
                currentPanelColour = RageUI.PanelColour.HairCut
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.hair.index = index
                SetPedComponentVariation(PlayerPedId(), 2, index - 1, 0, 2)
            end
        })
        RageUI.List('Sourcils', eyebrowsList, CharacterCreator.Data.Model.apparence.eyebrows.index, nil, {}, true, {
            onActive = function()
                apparenceCategory = 'EYEBROWS'
                currentColorPanel = CharacterCreator.Data.Model.apparence.eyebrows.colors
                currentPanelColour = RageUI.PanelColour.HairCut
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.eyebrows.index = index
                SetPedHeadOverlay(PlayerPedId(), 2, index - 1, 1.0)
            end
        })
        RageUI.List('Barbes', beardList, CharacterCreator.Data.Model.apparence.bear.index, nil, {}, true, {
            onActive = function()
                apparenceCategory = 'BEARDS'
                currentColorPanel = CharacterCreator.Data.Model.apparence.bear.colors
                currentPanelColour = RageUI.PanelColour.HairCut
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.bear.index = index
                SetPedHeadOverlay(PlayerPedId(), 1, index - 1, 1.0)
            end
        })
        RageUI.List('Yeux', eyeList, CharacterCreator.Data.Model.apparence.eyes.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.Model.apparence.eyes.colors
                currentPanelColour = RageUI.PanelColour.Eyes
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.eyes.index = index
                SetPedEyeColor(PlayerPedId(), index - 1, 0, 1)
            end
        })
        RageUI.List('Taches de rousseurs', frecklesList, CharacterCreator.Data.Model.apparence.frickles.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.Model.apparence.frickles.colors
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.frickles.index = index
                SetPedHeadOverlay(PlayerPedId(), 9, index - 1, 1.0)
            end
        })
        RageUI.List('Rides', ageingList, CharacterCreator.Data.Model.apparence.wrinkles.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.Model.apparence.wrinkles.colors
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.wrinkles.index = index
                SetPedHeadOverlay(PlayerPedId(), 3, index - 1, 1.0)
            end
        })
        RageUI.List('Coups de soleil', sunDamageList, CharacterCreator.Data.Model.apparence.sunDamage.index, nil, {}, true, {
            onActive = function()
                currentColorPanel = CharacterCreator.Data.Model.apparence.sunDamage.colors
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.sunDamage.index = index
                SetPedHeadOverlay(PlayerPedId(), 7, index - 1, 1.0)
            end
        })

        if currentColorPanel ~= nil then
            if currentColorPanel.primary ~= nil then
                RageUI.ColourPanel("Couleur Principale", currentPanelColour, currentColorPanel.primary.MinimumIndex, currentColorPanel.primary.CurrentIndex, {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        currentColorPanel.primary.MinimumIndex = MinimumIndex
                        currentColorPanel.primary.CurrentIndex = CurrentIndex
                        if apparenceCategory == 'HAIRS' then
                            SetPedHairColor(PlayerPedId(), CurrentIndex - 1, 0)
                        elseif apparenceCategory == 'EYEBROWS' then
                            SetPedHeadOverlayColor(PlayerPedId(), 2, 1,	CurrentIndex - 1, 0)
                        elseif apparenceCategory == 'BEARDS' then
                            SetPedHeadOverlayColor(PlayerPedId(), 1, 1,	CurrentIndex - 1, 0)
                        end
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
