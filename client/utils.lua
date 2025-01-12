SyncV = exports["sync-v"]:getSyncV()

local initpos = nil
cam, cam2, cam3, camSkin, isCameraActive = nil, nil, nil, nil, nil

models = { 'mp_m_freemode_01', 'mp_f_freemode_01' } 

moms = {"21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "45"} -- female heads
dads = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "42", "43", "44"} -- male heads

moutfitDefault = "Tenue 1"
foutfitDefault = "Tenue 1"

moutfits = {
	["Tenue 1"] = {
		[6] = {0, 10},
		[3] = {18, 0},
		[11] = {64, 0},
		[4] = {1, 0},
		[8] = {2, 1}
	},
	["Tenue 2"] = {
		[6] = {0, 10},
		[3] = {52, 0},
		[11] = {0, 0},
		[4] = {0, 0}
	},
	["Tenue 3"] = {
		[6] = {25, 0},
		[8] = {15, 0},
		[11] = {55, 0},
		[3] = {52, 0},
		[4] = {35, 0}
	},
	["Tenue 4"] = {
		[11] = {47, 0},
		[4] = {0, 0},
		[6] = {0, 10},
		[3] = {52, 0},
		[8] = {15, 0}
	}
}
foutfits = {
	["Tenue 1"] = {
		[3] = {60, 0},
		[11] = {8, 2},
		[8] = {0, 6},
		[4] = {11, 1},
		[6] = {4, 0}
	},
	["Tenue 2"] = {
		[6] = {4, 0},
		[3] = {64, 0},
		[11] = {31, 0},
		[4] = {25, 0},
		[8] = {5, 0}
	},
	["Tenue 3"] = {
		[6] = {0, 0},
		[3] = {63, 0},
		[11] = {0, 0},
		[4] = {0, 0}
	},
	["Tenue 4"] = {
		[6] = {25, 0},
		[8] = {15, 0},
		[11] = {48, 0},
		[3] = {70, 0},
		[4] = {34, 0}
	},
	["Tenue 5"] = {
		[6] = {1, 1},
		[11] = {9, 9},
		[4] = {11, 1},
		[3] = {67, 0},
		[8] = {8, 0}
	}
}

local Camera = {
	face = {x = 402.74, y = -1000.72, z = -98.45, fov = 10.00},
	body = {x = 402.92, y = -1000.72, z = -99.01, fov = 30.00},
}

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
    for k, v in pairs(CharacterCreator.Data.outfit) do
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
	local playerPed = PlayerPedId()
    DoScreenFadeOut(1000)
    Citizen.Wait(4000)
    DestroyAllCams(true)
	initpos = GetEntityCoords(PlayerPedId())
	
    -- Refresh model
    RefreshModel()

    -- ChangeComponents


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