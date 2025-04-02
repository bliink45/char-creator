CharacterCreator.Data.Model.apparence = {
    hair = {
        name = "HAIRS",
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
        name = "EYEBROWS",
        colors = {
            primary =  {
                MinimumIndex = 1,
                CurrentIndex = 1
            }
        },
        opacity = 1.0
    },
    beard = {
        index = 1,
        name = "BEARD",
        colors = {
            primary = {
                MinimumIndex = 1,
                CurrentIndex = 1
            }
        },
        opacity = 1.0
    },
    eyes = {
        index = 1,
        name = "EYES",
        opacity = 1.0
    },
    frickles = {
        index = 1,
        name = "FRICKLES",
        opacity = 1.0
    },
    wrinkles = {
        index = 1,
        name = "WRINKLES",
        opacity = 1.0
    },
    sunDamage = {
        index = 1,
        name = "SUN_DAMAGE",
        opacity = 1.0
    }
}

currentColorPanel = CharacterCreator.Data.Model.apparence.hair.colors
currentPanelColour = RageUI.PanelColour.HairCut

CharacterCreator.Apparence = {
    menu = RageUI.CreateSubMenu(CharacterCreator.Main.menu, "Apparence",
        "Apparence du personnage"),
    render = function()
        RageUI.List('Cheveux', hairList, CharacterCreator.Data.Model.apparence.hair.index, nil, {}, true, {
            onActive = function()
                currentApparence = CharacterCreator.Data.Model.apparence.hair
                currentPanelColour = RageUI.PanelColour.HairCut
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.hair.index = index
                SetPedComponentVariation(PlayerPedId(), 2, index - 1, 0, 2)
            end
        })
        RageUI.List('Sourcils', eyebrowsList, CharacterCreator.Data.Model.apparence.eyebrows.index, nil, {}, true, {
            onActive = function()
                currentApparence = CharacterCreator.Data.Model.apparence.eyebrows
                currentPanelColour = RageUI.PanelColour.HairCut
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.eyebrows.index = index
                SetPedHeadOverlay(PlayerPedId(), 2, index - 1, CharacterCreator.Data.Model.apparence.eyebrows.opacity)
            end
        })
        RageUI.List('Barbes', beardList, CharacterCreator.Data.Model.apparence.beard.index, nil, {}, true, {
            onActive = function()
                currentApparence = CharacterCreator.Data.Model.apparence.beard
                currentPanelColour = RageUI.PanelColour.HairCut
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.beard.index = index
                SetPedHeadOverlay(PlayerPedId(), 1, index - 1, CharacterCreator.Data.Model.apparence.beard.opacity)
            end
        })
        RageUI.List('Yeux', eyeList, CharacterCreator.Data.Model.apparence.eyes.index, nil, {}, true, {
            onActive = function()
                currentApparence = CharacterCreator.Data.Model.apparence.eyes
                currentPanelColour = RageUI.PanelColour.Eyes
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.eyes.index = index
                SetPedEyeColor(PlayerPedId(), index - 1, 0, 1)
            end
        })
        RageUI.List('Taches de rousseurs', frecklesList, CharacterCreator.Data.Model.apparence.frickles.index, nil, {}, true, {
            onActive = function()
                currentApparence = CharacterCreator.Data.Model.apparence.frickles
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.frickles.index = index
                SetPedHeadOverlay(PlayerPedId(), 9, index - 1, CharacterCreator.Data.Model.apparence.frickles.opacity)
            end
        })
        RageUI.List('Rides', ageingList, CharacterCreator.Data.Model.apparence.wrinkles.index, nil, {}, true, {
            onActive = function()
                currentApparence = CharacterCreator.Data.Model.apparence.wrinkles
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.wrinkles.index = index
                SetPedHeadOverlay(PlayerPedId(), 3, index - 1, CharacterCreator.Data.Model.apparence.wrinkles.opacity)
            end
        })
        RageUI.List('Coups de soleil', sunDamageList, CharacterCreator.Data.Model.apparence.sunDamage.index, nil, {}, true, {
            onActive = function()
                currentApparence = CharacterCreator.Data.Model.apparence.sunDamage
            end,
            onListChange = function(index, _)
                CharacterCreator.Data.Model.apparence.sunDamage.index = index
                SetPedHeadOverlay(PlayerPedId(), 7, index - 1, CharacterCreator.Data.Model.apparence.sunDamage.opacity)
            end
        })

        if currentApparence.colors ~= nil then
            if currentApparence.colors.primary ~= nil then
                RageUI.ColourPanel("Couleur Principale", currentPanelColour,
                        currentApparence.colors.primary.MinimumIndex, currentApparence.colors.primary.CurrentIndex, {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        currentApparence.colors.primary.MinimumIndex = MinimumIndex
                        currentApparence.colors.primary.CurrentIndex = CurrentIndex
                        if currentApparence.name == 'HAIRS' then
                            SetPedHairColor(PlayerPedId(), currentApparence.colors.primary.CurrentIndex - 1, currentApparence.colors.secondary.CurrentIndex - 1)
                        elseif currentApparence.name == 'EYEBROWS' then
                            SetPedHeadOverlayColor(PlayerPedId(), 2, 1,	currentApparence.colors.primary.CurrentIndex - 1, 0)
                        elseif currentApparence.name == 'BEARDS' then
                            SetPedHeadOverlayColor(PlayerPedId(), 1, 1,	currentApparence.colors.primary.CurrentIndex - 1, 0)
                        end
                    end
                }, RageUI.CurrentMenu.Index, {})
            end
            if currentApparence.colors.secondary ~= nil then
                RageUI.ColourPanel("Couleur Secondaire", currentPanelColour,
                        currentApparence.colors.secondary.MinimumIndex, currentApparence.colors.secondary.CurrentIndex, {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        currentApparence.colors.secondary.MinimumIndex = MinimumIndex
                        currentApparence.colors.secondary.CurrentIndex = CurrentIndex

                        if currentApparence.name == "HAIRS" then
                            SetPedHairColor(PlayerPedId(), currentApparence.colors.primary.CurrentIndex - 1, currentApparence.colors.secondary.CurrentIndex - 1)
                        end
                end}, RageUI.CurrentMenu.Index, {})
            end
        end

        if currentApparence.name == "EYEBROWS" or currentApparence.name == "BEARD" or currentApparence.name == "FRICKLES"
                or currentApparence.name == "WRINKLES" or currentApparence.name == "SUN_DAMAGE" then
            RageUI.PercentagePanel(currentApparence.opacity, "Opacité", "0%", "100%", {
                onProgressChange = function(percent)
                    currentApparence.opacity = percent
                    if (currentApparence.name == "EYEBROWS") then
                        SetPedHeadOverlay(PlayerPedId(), 2, CharacterCreator.Data.Model.apparence.eyebrows.index - 1, percent)
                    elseif (currentApparence.name == "BEARD") then
                        SetPedHeadOverlay(PlayerPedId(), 1, CharacterCreator.Data.Model.apparence.beard.index - 1, percent)
                    elseif (currentApparence.name == "FRICKLES") then
                        SetPedHeadOverlay(PlayerPedId(), 9, CharacterCreator.Data.Model.apparence.frickles.index - 1, percent)
                    elseif (currentApparence.name == "WRINKLES") then
                        SetPedHeadOverlay(PlayerPedId(), 3, CharacterCreator.Data.Model.apparence.wrinkles.index - 1, percent)
                    elseif (currentApparence.name == "SUN_DAMAGE") then
                        SetPedHeadOverlay(PlayerPedId(), 7, CharacterCreator.Data.Model.apparence.sunDamage.index - 1, percent)
                    end
            end}, RageUI.CurrentMenu.Index)
        end
    end
}
