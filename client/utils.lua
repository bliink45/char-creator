SyncV = exports["sync-v"]:getSyncV()

local initpos
cam, cam2, cam3, camSkin, isCameraActive = nil, nil, nil, nil, nil

models = { 'mp_m_freemode_01', 'mp_f_freemode_01' }

moms = {"21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "45"} -- female heads
dads = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "42", "43", "44"} -- male heads

moutfitsLabels = { 'Décontracté', 'Formel', 'Costard', 'Motard', 'Grand Froid' }
foutifitsLabels = { 'Décontracté', 'Formel', 'Motarde', 'Grand Froid', 'Robe' }

moutfitDefault = 'Décontracté'
foutfitDefault = 'Décontracté'

moutfits = {
	['Décontracté'] = {
		[1] = {0, 0}, -- Masque
		[3] = {0, 0}, -- Torse (UpperBody)
		[4] = {0, 3}, -- Pantalon
		[5] = {0, 0}, -- Sac
		[6] = {1, 1}, -- Chaussures
		[7] = {0, 0}, -- Accessoire
		[8] = {15, 0}, -- Sous t-shirt (Shirt Accesory)
		[9] = {0, 0}, -- Gilet pare-balles
		[10] = {0, 0}, -- Badge Logo
		[11] = {0, 4}, -- Torse 2 (Shirt Overlay)

		[12] = {0, 0}, -- Chapeau
		[13] = {0, 0}, -- Lunettes
		[14] = {0, 0} -- Oreilles
	},
	['Formel'] = {
		[1] = {0, 0}, -- Masque
		[3] = {11, 0}, -- Torse (UpperBody)
		[4] = {10, 0}, -- Pantalon
		[5] = {0, 0}, -- Sac
		[6] = {15, 0}, -- Chaussures
		[7] = {0, 0}, -- Accessoire
		[8] = {150, 0}, -- Sous t-shirt (Shirt Accesory)
		[9] = {0, 0}, -- Gilet pare-balles
		[10] = {0, 0}, -- Badge Logo
		[11] = {72, 2}, -- Torse 2 (Shirt Overlay)

		[12] = {0, 0}, -- Chapeau
		[13] = {6, 4}, -- Lunettes
		[14] = {0, 0} -- Oreilles
	},
	['Costard'] = {
		[1] = {0, 0}, -- Masque
		[3] = {4, 0}, -- Torse (UpperBody)
		[4] = {10, 0}, -- Pantalon
		[5] = {0, 0}, -- Sac
		[6] = {10, 0}, -- Chaussures
		[7] = {38, 0}, -- Accessoire
		[8] = {178, 0}, -- Sous t-shirt (Shirt Accesory)
		[9] = {0, 0}, -- Gilet pare-balles
		[10] = {0, 0}, -- Badge Logo
		[11] = {4, 0}, -- Torse 2 (Shirt Overlay)

		[12] = {0, 0}, -- Chapeau
		[13] = {0, 0}, -- Lunettes
		[14] = {0, 0} -- Oreilles
	},
	['Motard'] = {
		[1] = {0, 0}, -- Masque
		[3] = {4, 0}, -- Torse (UpperBody)
		[4] = {0, 4}, -- Pantalon
		[5] = {0, 0}, -- Sac
		[6] = {24, 0}, -- Chaussures
		[7] = {17, 0}, -- Accessoire
		[8] = {0, 2}, -- Sous t-shirt (Shirt Accesory)
		[9] = {0, 0}, -- Gilet pare-balles
		[10] = {0, 0}, -- Badge Logo
		[11] = {172, 1}, -- Torse 2 (Shirt Overlay)

		[12] = {0, 0}, -- Chapeau
		[13] = {0, 0}, -- Lunettes
		[14] = {0, 0} -- Oreilles
	},
	['Grand Froid'] = {
		[1] = {0, 0}, -- Masque
		[3] = {1, 0}, -- Torse (UpperBody)
		[4] = {9, 7}, -- Pantalon
		[5] = {0, 0}, -- Sac
		[6] = {27, 0}, -- Chaussures
		[7] = {0, 0}, -- Accessoire
		[8] = {173, 0}, -- Sous t-shirt (Shirt Accesory)
		[9] = {0, 0}, -- Gilet pare-balles
		[10] = {0, 0}, -- Badge Logo
		[11] = {167, 3}, -- Torse 2 (Shirt Overlay)

		[12] = {0, 0}, -- Chapeau
		[13] = {0, 0}, -- Lunettes
		[14] = {0, 0} -- Oreilles
	}
}
foutfits = {
	['Décontracté'] = {
		[1] = {0, 0}, -- Masque
		[3] = {15, 0}, -- Torse (UpperBody)
		[4] = {75, 0}, -- Pantalon
		[5] = {0, 0}, -- Sac
		[6] = {132, 0}, -- Chaussures
		[7] = {0, 0}, -- Accessoire
		[8] = {15, 0}, -- Sous t-shirt (Shirt Accesory)
		[9] = {0, 0}, -- Gilet pare-balles
		[10] = {0, 0}, -- Badge Logo
		[11] = {169, 0}, -- Torse 2 (Shirt Overlay)

		[12] = {0, 0}, -- Chapeau
		[13] = {0, 0}, -- Lunettes
		[14] = {0, 0} -- Oreilles
	},
	['Formel'] = {
		[1] = {0, 0}, -- Masque
		[3] = {3, 0}, -- Torse (UpperBody)
		[4] = {4, 3}, -- Pantalon
		[5] = {0, 0}, -- Sac
		[6] = {29, 0}, -- Chaussures
		[7] = {0, 0}, -- Accessoire
		[8] = {217, 0}, -- Sous t-shirt (Shirt Accesory)
		[9] = {0, 0}, -- Gilet pare-balles
		[10] = {0, 0}, -- Badge Logo
		[11] = {7, 0}, -- Torse 2 (Shirt Overlay)

		[12] = {0, 0}, -- Chapeau
		[13] = {0, 0}, -- Lunettes
		[14] = {0, 0} -- Oreilles
	},
	['Grand Froid'] = {
		[1] = {0, 0}, -- Masque
		[3] = {5, 0}, -- Torse (UpperBody)
		[4] = {0, 0}, -- Pantalon
		[5] = {0, 0}, -- Sac
		[6] = {28, 0}, -- Chaussures
		[7] = {0, 0}, -- Accessoire
		[8] = {59, 1}, -- Sous t-shirt (Shirt Accesory)
		[9] = {0, 0}, -- Gilet pare-balles
		[10] = {0, 0}, -- Badge Logo
		[11] = {65, 0}, -- Torse 2 (Shirt Overlay)

		[12] = {0, 0}, -- Chapeau
		[13] = {0, 0}, -- Lunettes
		[14] = {0, 0} -- Oreilles
	},
	['Motarde'] = {
		[1] = {0, 0}, -- Masque
		[3] = {14, 0}, -- Torse (UpperBody)
		[4] = {43, 0}, -- Pantalon
		[5] = {0, 0}, -- Sac
		[6] = {10, 0}, -- Chaussures
		[7] = {38, 0}, -- Accessoire
		[8] = {201, 1}, -- Sous t-shirt (Shirt Accesory)
		[9] = {0, 0}, -- Gilet pare-balles
		[10] = {0, 0}, -- Badge Logo
		[11] = {385, 1}, -- Torse 2 (Shirt Overlay)

		[12] = {0, 0}, -- Chapeau
		[13] = {0, 0}, -- Lunettes
		[14] = {0, 0} -- Oreilles
	},
	['Robe'] = {
		[1] = {0, 0}, -- Masque
		[3] = {11, 0}, -- Torse (UpperBody)
		[4] = {14, 0}, -- Pantalon
		[5] = {0, 0}, -- Sac
		[6] = {42, 0}, -- Chaussures
		[7] = {0, 0}, -- Accessoire
		[8] = {15, 0}, -- Sous t-shirt (Shirt Accesory)
		[9] = {0, 0}, -- Gilet pare-balles
		[10] = {0, 0}, -- Badge Logo
		[11] = {322, 0}, -- Torse 2 (Shirt Overlay)

		[12] = {0, 0}, -- Chapeau
		[13] = {0, 0}, -- Lunettes
		[14] = {0, 0} -- Oreilles
	}
}

local Camera = {
	face = {x = 402.74, y = -1000.72, z = -98.45, fov = 10.00},
	body = {x = 402.92, y = -1000.72, z = -99.01, fov = 30.00},
}

nationalityIndex = 1
heightIndex = 1
weightIndex = 1

nationalityList = {
	"Français", "Anglais", "Américain", "Espagnol", "Allemand",
	"Italien", "Canadien", "Brésilien", "Chinois", "Japonais",
	"Russe", "Australien", "Indien", "Mexicain", "Coréen",
	"Portugais", "Argentin", "Néerlandais", "Suisse", "Suédois"
}

function createIntegerList(a, b)
	local list = {}
	if a > b then
		return list
	end
	for i = a, b do
		table.insert(list, i)
	end
	return list
end

dayIndex = 1
monthIndex = 1
yearIndex = 1

heightList = createIntegerList(150, 210)
weightList = createIntegerList(40, 180)

dayList = createIntegerList(1, 31)
monthList = createIntegerList(1, 12)
yearList = createIntegerList(1950, 2025)

hairList = createIntegerList(1, 82)
eyeList = createIntegerList(1, 30)
beardList = createIntegerList(1, 29)
eyebrowsList = createIntegerList(1, 34)
frecklesList = createIntegerList(1, 18)
ageingList = createIntegerList(1, 15)
sunDamageList = createIntegerList(1, 11)

function Keyboard(TextEntry, MaxStringLenght, Example)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	blockinput = true
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", Example, "", "", "", MaxStringLenght)
	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Wait(500)
		blockinput = false
		return result
	else
		Wait(500)
		blockinput = false
		return ""
	end
end

function getBirthdate()
	if CharacterCreator.Data.Identity.informations.birthdate.day == nil
			or CharacterCreator.Data.Identity.informations.birthdate.month == nil
			or CharacterCreator.Data.Identity.informations.birthdate.year == nil then
		return ""
	else
		return '~b~'..CharacterCreator.Data.Identity.informations.birthdate.day.."/"
				..CharacterCreator.Data.Identity.informations.birthdate.month.."/"
				..CharacterCreator.Data.Identity.informations.birthdate.year
	end
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
      RequestAnimDict(dict)
      Wait(10)
    end
end

function isMalePed()
    return GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01")
end

function UpdateHeritage()
    SetPedHeadBlendData(
        PlayerPedId(),
        tonumber(moms[CharacterCreator.Data.Model.heredity.momIndex]),
        tonumber(dads[CharacterCreator.Data.Model.heredity.dadIndex]),
        nil, 
        tonumber(moms[CharacterCreator.Data.Model.heredity.momIndex]),
        tonumber(dads[CharacterCreator.Data.Model.heredity.dadIndex]),
        nil, 
        tonumber(CharacterCreator.Data.Model.heredity.heritageBody)/10, 
        tonumber(CharacterCreator.Data.Model.heredity.heritageSkin)/10,
        nil, 
        true
    )
end

function UpdateApparence()
    -- Hair
    SetPedComponentVariation(PlayerPedId(), 2, CharacterCreator.Data.Model.apparence.hair.index - 1, 0, 2)
    SetPedHairColor(PlayerPedId(), CharacterCreator.Data.Model.apparence.hair.colors.primary.CurrentIndex - 1, 0)

    -- Bear
    SetPedHeadOverlay(PlayerPedId(), 1, CharacterCreator.Data.Model.apparence.bear.index - 2, 1.0)
    SetPedHeadOverlayColor(PlayerPedId(), 1, 1,	CharacterCreator.Data.Model.apparence.bear.colors.primary.CurrentIndex - 1, 0)

    -- Eyes
    SetPedEyeColor(PlayerPedId(), CharacterCreator.Data.Model.apparence.eyes.index - 1, 0, 1)

    -- Eyebrows
    SetPedHeadOverlayColor(PlayerPedId(), 2, 1,	CharacterCreator.Data.Model.apparence.eyebrows.colors.primary.CurrentIndex - 1, 0)
end

function UpdateFeatures()
    SetPedFaceFeature(PlayerPedId(), 0, CharacterCreator.Data.Model.features.nose.x)
    SetPedFaceFeature(PlayerPedId(), 1, CharacterCreator.Data.Model.features.nose.y)
    SetPedFaceFeature(PlayerPedId(), 2, CharacterCreator.Data.Model.features.noseProfile.x)
    SetPedFaceFeature(PlayerPedId(), 3, CharacterCreator.Data.Model.features.noseProfile.y)
    SetPedFaceFeature(PlayerPedId(), 4, CharacterCreator.Data.Model.features.nosePeak.x)
    SetPedFaceFeature(PlayerPedId(), 5, CharacterCreator.Data.Model.features.nosePeak.y)
    SetPedFaceFeature(PlayerPedId(), 7, CharacterCreator.Data.Model.features.eyebrows.x)
    SetPedFaceFeature(PlayerPedId(), 6, CharacterCreator.Data.Model.features.eyebrows.y)
    SetPedFaceFeature(PlayerPedId(), 8, CharacterCreator.Data.Model.features.cheekbones.x)
    SetPedFaceFeature(PlayerPedId(), 9, CharacterCreator.Data.Model.features.cheekbones.y)
    SetPedFaceFeature(PlayerPedId(), 10, CharacterCreator.Data.Model.features.cheeks.x) 
    SetPedFaceFeature(PlayerPedId(), 11, CharacterCreator.Data.Model.features.eyes.x)
    SetPedFaceFeature(PlayerPedId(), 12, CharacterCreator.Data.Model.features.Lips.x)
    SetPedFaceFeature(PlayerPedId(), 13, CharacterCreator.Data.Model.features.jaws.x)
    SetPedFaceFeature(PlayerPedId(), 14, CharacterCreator.Data.Model.features.jaws.y)
    SetPedFaceFeature(PlayerPedId(), 15, CharacterCreator.Data.Model.features.chin.x)
    SetPedFaceFeature(PlayerPedId(), 16, CharacterCreator.Data.Model.features.chin.y)
    SetPedFaceFeature(PlayerPedId(), 17, CharacterCreator.Data.Model.features.chinSize.x)
    SetPedFaceFeature(PlayerPedId(), 18, CharacterCreator.Data.Model.features.chinSize.y)
    SetPedFaceFeature(PlayerPedId(), 19, CharacterCreator.Data.Model.features.neckThickness.x)
end

function UpdateOutfit()
    for k, v in pairs(CharacterCreator.Data.Outfit.clothes) do
        SetPedComponentVariation(PlayerPedId(), k, v[1], v[2], 2)
    end
end

function RefreshModel()
	Citizen.CreateThread(function()
        local model = models[CharacterCreator.Data.Model.gender]

		while not HasModelLoaded(model) do
            RequestModel(model)
            Wait(0)
        end

        SetPlayerModel(PlayerId(), model)

        UpdateHeritage()
        UpdateApparence()
        UpdateFeatures()
        UpdateOutfit()
	end)
end

function AnimCam()
    DoScreenFadeOut(1000)
    Citizen.Wait(4000)
    DestroyAllCams(true)
	initpos = GetEntityCoords(PlayerPedId())
	
    -- Refresh model
    RefreshModel()

	local cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Camera['body'].x, Camera['body'].y, Camera['body'].z, 0.00, 0.00, 0.00, Camera['body'].fov, false, 0)
    SetCamActive(cam2, true)
    RenderScriptCams(true, false, 2000, true, true) 
    
    Citizen.Wait(500)
    
    DoScreenFadeIn(2000)
    SetEntityCoords(PlayerPedId(), 405.59, -997.18, -99.00, 0.0, 0.0, 0.0, true)
    SetEntityHeading(PlayerPedId(), 90.00)
   
    -- TriggerEvent('skinchanger:loadSkin', {sex = 0})
    Citizen.Wait(500)
    
    local cam3 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.99, -998.02, -99.00, 0.00, 0.00, 0.00, 50.00, false, 0)
    PointCamAtCoord(cam3, 402.99, -998.02, -99.00)
    SetCamActiveWithInterp(cam2, cam3, 5000, true, true)
    LoadAnim("mp_character_creation@customise@male_a")
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "intro", 1.0, 1.0, 4050, 0, 1, 0, 0, 0)
	
    Citizen.Wait(4500)

    local coords = GetEntityCoords(PlayerPedId())
    if GetDistanceBetweenCoords(coords, 402.89, -996.87, -99.0, true) > 0.5 then
    	SetEntityCoords(PlayerPedId(), 402.89, -996.87, -99.0, 0.0, 0.0, 0.0, true)
    	SetEntityHeading(PlayerPedId(), 173.97)
    end

    FreezeEntityPosition(PlayerPedId(), true)
end

function EndCharCreator()
    CloseMenu()
	FreezeEntityPosition(PlayerPedId(), false)

	if CharacterCreator.Data.Model.gender == 1 then
		LoadAnim("mp_character_creation@lineup@male_b")
		TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@male_b", "outro", 0.225, 1.0, 6000, 0, 1, 0, 0, 0)
	else
		LoadAnim("mp_character_creation@lineup@female_a")
		TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@female_a", "outro", 0.225, 1.0, 6000, 0, 1, 0, 0, 0)
	end
	Citizen.Wait(5000)
	DoScreenFadeOut(1000)
    enable = false
    RenderScriptCams(false,  false,  0,  true,  true)
	EnableAllControlActions(0)
    FreezeEntityPosition(PlayerPedId(), false)
	DisplayRadar(true)
	Citizen.Wait(5000)
	DoScreenFadeIn(1000)
    Citizen.Wait(1000)
    ClearFocus()
end