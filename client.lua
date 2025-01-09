open = false
local mdhash = GetHashKey("mp_m_freemode_01")
local oldmdhash
local Pourcent = 0.0
local IdentityInfos = {
	firstname = 'Modifier',
	lastname = 'Modifier',
	birthday = '01/01/2000',
	nationality = 'Modifier',
	height = 'Modifier',
	weight = 'Modifier',
	background = 'Modifier'
}

local Character = {
	["resemblance"] = 0.8,
	["skintone"] = 0.9,
	["ddad"] = 0,
	["dmom"] = 0,
	["mom"] = 21,
	["dad"] = 0,
	["gender"] = "Male",
	["ogd"] = "M",
	["lcgd"] = "male",
	["hair"] = 13,
	['hair_color_1'] = 0,
	["outfit"] = 1,
	["beard"] = 0,
	["beard_2"] = 1,
	["beard_3"] = 26,
	["eyebrows"] = 1,
	["eyebrows_2"] = 1,
	["eyebrows_3"] = 2,
	["blush_1"] = 0,
	["blush_2"] = 1,
	["blush_3"] = 0,
	["sun_1"] = 0,
	["sun_2"] = 1,
	["complexion_1"] = 0,
	["complexion_2"] = 1,
	["bodyb_1"] = 0,
	["bodyb_2"] = 1,
	["age_1"] = 0,
	["age_2"] = 1,
	["eye_color"] = 0,
	["makeup_1"] = 0,
	["makeup_2"] = 1,
	["makeup_3"] = 0,
	["lipstick_1"] = 0,
	["lipstick_2"] = 1,
	["lipstick_3"] = 0,
	["moles_1"] = 0,
	["moles_2"] = 1,
	['neck_thick'] = 0.0,
	['chin_hole'] = 0.0,
	['chin_width'] = 0.0,
	['chin_length'] = 0.0,
	['chin_height'] = 0.0,
	['jaw_1'] = 0.0,
	['jaw_2'] = 0.0,
	['lips_thick'] = 0.0,
	['eye_open'] = 0.0,
	['cheeks_3'] = 0.0,
	['cheeks_2'] = 0.0,
	['cheeks_1'] = 0.0,
	['eyebrows_6'] = 0.0,
	['eyebrows_5'] = 0.0,
	['nose_6'] = 0.0,
	['nose_5'] = 0.0,
	['nose_4'] = 0.0,
	['nose_3'] = 0.0,
	['nose_2'] = 0.0,
	['nose_1'] = 0.0,
	['glasses'] = 0,
}

if GetResourceKvpString('lbg-char-info') ~= nil then
	Character = json.decode(GetResourceKvpString('lbg-char-info'))
end

if Character["gender"] == "Female" then
	mdhash = GetHashKey("mp_f_freemode_01")
end

local moutfits = {
	{
		[1] = {0, 0}, -- Mask
        [3] = {4, 1}, -- Torse
        [4] = {22, 2}, -- Pant
        [5] = {0, 0}, -- Bag
        [6] = {20, 0}, -- Shoes
        [7] = {0, 0}, -- Accesory
        [8] = {12, 0}, -- Sous t-shirt
        [9] = {0, 0}, -- Body Armor
        [10] = {0, 0}, -- Badge Logo
        [11] = {32, 0} -- Torse 2
	},
	{
		[6] = {0, 10},
		[3] = {18, 0},
		[11] = {64, 0},
		[4] = {1, 0},
		[8] = {2, 1}
	},
	{
		[6] = {0, 10},
		[3] = {52, 0},
		[11] = {0, 0},
		[4] = {0, 0}
	},
	{
		[6] = {25, 0},
		[8] = {15, 0},
		[11] = {55, 0},
		[3] = {52, 0},
		[4] = {35, 0}
	},
	{
		[11] = {47, 0},
		[4] = {0, 0},
		[6] = {0, 10},
		[3] = {52, 0},
		[8] = {15, 0}
	}
}
local foutfits = {
	{
		[3] = {60, 0},
		[11] = {8, 2},
		[8] = {0, 6},
		[4] = {11, 1},
		[6] = {4, 0}
	},
	{
		[6] = {4, 0},
		[3] = {64, 0},
		[11] = {31, 0},
		[4] = {25, 0},
		[8] = {5, 0}
	},
	{
		[6] = {0, 0},
		[3] = {63, 0},
		[11] = {0, 0},
		[4] = {0, 0}
	},
	{
		[6] = {25, 0},
		[8] = {15, 0},
		[11] = {48, 0},
		[3] = {70, 0},
		[4] = {34, 0}
	},
	{
		[6] = {1, 1},
		[11] = {9, 9},
		[4] = {11, 1},
		[3] = {67, 0},
		[8] = {8, 0}
	}
}
local hairbrowcolors = {{28, 31, 33, 255}, {39, 42, 44, 255}, {49, 46, 44, 255}, {53, 38, 28, 255}, {75, 50, 31, 255}, {92, 59, 36, 255}, {109, 76, 53, 255}, {107, 80, 59, 255}, {118, 92, 69, 255}, {127, 104, 78, 255}, {153, 129, 93, 255}, {167, 147, 105, 255}, {175, 156, 112, 255}, {187, 160, 99, 255}, {214, 185, 123, 255}, {218, 195, 142, 255}, {159, 127, 89, 255}, {132, 80, 57, 255}, {104, 43, 31, 255}, {97, 18, 12, 255}, {100, 15, 10, 255}, {124, 20, 15, 255}, {160, 46, 25, 255}, {182, 75, 40, 255}, {162, 80, 47, 255}, {170, 78, 43, 255}, {98, 98, 98, 255}}
hairDecorDefault = {'mpbeach_overlays', "FM_hair_fuzz"}
hairDecor = {
    ['M'] = {
        [0] = {"",""}, --who doesn't like a shiny head from time to time?
        [1] = {"multiplayer_overlays", "FM_M_Hair_001_a"},
        [2] = {"multiplayer_overlays", "NG_M_Hair_002"},
        [3] = {"multiplayer_overlays", "FM_M_Hair_003_a"},
        [4] = {"multiplayer_overlays", "NG_M_Hair_004"},
        [5] = {"multiplayer_overlays", "FM_M_Hair_long_a"},
        [6] = {"multiplayer_overlays", "FM_M_Hair_006_a"},
        [8] = {"multiplayer_overlays", "FM_M_Hair_008_a"},
        [9] = {"multiplayer_overlays", "NG_M_Hair_009"},
        [10] = {"multiplayer_overlays", "NG_M_Hair_013"},
        [11] = {"multiplayer_overlays", "NG_M_Hair_002"},
        [12] = {"multiplayer_overlays", "NG_M_Hair_011"},
        [13] = {"multiplayer_overlays", "NG_M_Hair_012"},
        [14] = {"multiplayer_overlays", "NG_M_Hair_014"},
        [15] = {"multiplayer_overlays", "NG_M_Hair_015"},
        [16] = {"multiplayer_overlays", "NGBea_M_Hair_000"},
        [17] = {"multiplayer_overlays", "NGBea_M_Hair_001"},
        [18] = {"mpbusiness_overlays", "FM_Bus_M_Hair_000_a"},
        [19] = {"mpbusiness_overlays", "FM_Bus_M_Hair_001_a"},
        [20] = {"mphipster_overlays", "FM_Hip_M_Hair_000_a"},
        [21] = {"mphipster_overlays", "FM_Hip_M_Hair_001_a"},
        [22] = {"multiplayer_overlays", "NGInd_M_Hair_000"},
            --23
        [24] = {"mplowrider_overlays", "LR_M_Hair_000"},
        [25] = {"mplowrider_overlays", "LR_M_Hair_001"},
        [26] = {"mplowrider_overlays", "LR_M_Hair_002"},
        [27] = {"mplowrider_overlays", "LR_M_Hair_003"},
        [28] = {"mplowrider2_overlays", "LR_M_Hair_004"},
        [29] = {"mplowrider2_overlays", "LR_M_Hair_005"},
        [30] = {"mplowrider2_overlays", "LR_M_Hair_006"},
        [31] = {"mpbiker_overlays", "MP_Biker_Hair_000_M"},
        [32] = {"mpbiker_overlays", "MP_Biker_Hair_001_M"},
        [33] = {"mpbiker_overlays", "MP_Biker_Hair_002_M"},
        [34] = {"mpbiker_overlays", "MP_Biker_Hair_003_M"},
        [35] = {"mpbiker_overlays", "MP_Biker_Hair_004_M"},
        [36] = {"mpbiker_overlays", "MP_Biker_Hair_005_M"},

        [72] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_M_000_M"},
        [73] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_M_001_M"},
        [74] = {"mpvinewood_overlays", "MP_Vinewood_Hair_M_000_M"},
        [75] = {"mptuner_overlays", "MP_Tuner_Hair_001_M"},
        [76] = {"mpsecurity_overlays", "MP_Security_Hair_001_M"},
    },
    ['F'] = {
        [0] = {"",""}, --who doesn't like a shiny head from time to time?
        [1] = {"multiplayer_overlays", "NG_F_Hair_001"},
        [2] = {"multiplayer_overlays", "NG_F_Hair_002"},
        [3] = {"multiplayer_overlays", "FM_F_Hair_003_a"},
        [4] = {"multiplayer_overlays", "NG_F_Hair_004"},
        [5] = {"multiplayer_overlays", "FM_F_Hair_005_a"},
        [6] = {"multiplayer_overlays", "FM_F_Hair_006_a"},
        [7] = {"multiplayer_overlays", "NG_F_Hair_007"},
        [8] = {"multiplayer_overlays", "NG_F_Hair_008"},
        [9] = {"multiplayer_overlays", "NG_F_Hair_009"},
        [10] = {"multiplayer_overlays", "NG_F_Hair_010"},
        [11] = {"multiplayer_overlays", "NG_F_Hair_011"},
        [12] = {"multiplayer_overlays", "NG_F_Hair_012"},
        [13] = {"multiplayer_overlays", "FM_F_Hair_013_a"},
        [14] = {"multiplayer_overlays", "FM_F_Hair_014_a"},
        [15] = {"multiplayer_overlays", "NG_M_Hair_015"},
        [16] = {"multiplayer_overlays", "NGBea_F_Hair_000"},
        [17] = {"mpbusiness_overlays", "FM_Bus_F_Hair_a"},
        [18] = {"multiplayer_overlays", "NG_F_Hair_007"},
        [19] = {"multiplayer_overlays", "NGBus_F_Hair_000"},
        [20] = {"multiplayer_overlays", "NGBus_F_Hair_001"},
        [21] = {"multiplayer_overlays", "NGBea_F_Hair_001"},
        [22] = {"mphipster_overlays", "FM_Hip_F_Hair_000_a"},
        [23] = {"multiplayer_overlays", "NGInd_F_Hair_000"},
        --24
        [25] = {"mplowrider_overlays", "LR_F_Hair_000"},
        [26] = {"mplowrider_overlays", "LR_F_Hair_001"},
        [27] = {"mplowrider_overlays", "LR_F_Hair_002"},
        [29] = {"mplowrider2_overlays", "LR_F_Hair_003"},
        [30] = {"mplowrider2_overlays", "LR_F_Hair_004"},
        [31] = {"mplowrider2_overlays", "LR_F_Hair_006"},
        [32] = {"mpbiker_overlays", "MP_Biker_Hair_000_F"},
        [33] = {"mpbiker_overlays", "MP_Biker_Hair_001_F"},
        [34] = {"mpbiker_overlays", "MP_Biker_Hair_002_F"},
        [35] = {"mpbiker_overlays", "MP_Biker_Hair_003_F"},
        [38] = {"mpbiker_overlays", "MP_Biker_Hair_004_F"},
        [36] = {"mpbiker_overlays", "MP_Biker_Hair_005_F"},
        [37] = {"mpbiker_overlays", "MP_Biker_Hair_005_F"},

        [76] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_F_000_F"},
        [77] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_F_001_F"},
        [78] = {"mpvinewood_overlays", "MP_Vinewood_Hair_F_000_F"},
        [79] = {"mptuner_overlays", "MP_Tuner_Hair_000_F"},
        [80] = {"mpsecurity_overlays", "MP_Security_Hair_000_F"},
    },
}

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function ChangeComponents(shouldChangeModel)
	--the shouldChangeModel parameter is here for legacy purposes, because I am lazy to change up any lines of code
	--containing it. it is not requires, as it is not used.
	SetPedDefaultComponentVariation(PlayerPedId())
	SetPedHeadBlendData(PlayerPedId(), Character["mom"], Character["dad"], nil, Character["mom"], Character["dad"], nil, Character["resemblance"], Character["skintone"], nil, true)
	SetPedComponentVariation(PlayerPedId(), 2, Character["hair"], 0, 2)
	SetPedHairColor(PlayerPedId(),Character['hair_color_1'], 0)

	ClearPedDecorations(PlayerPedId())
	if hairDecor[Character["ogd"]][Character["hair"]] ~= nil then
		AddPedDecorationFromHashes(PlayerPedId(), hairDecor[Character["ogd"]][GetPedDrawableVariation(PlayerPedId(), 2)][1], hairDecor[Character["ogd"]][GetPedDrawableVariation(PlayerPedId(), 2)][2])
	else
		AddPedDecorationFromHashes(PlayerPedId(), hairDecorDefault[1], hairDecorDefault[2])
	end
	SetPedHeadOverlay(PlayerPedId(), 8,Character['lipstick_1'],Character['lipstick_2'])
	SetPedHeadOverlayColor(PlayerPedId(), 8, 1,Character['lipstick_3'],0)
	SetPedHeadOverlay(PlayerPedId(), 2,Character['eyebrows'],Character['eyebrows_2'])
	SetPedHeadOverlayColor(PlayerPedId(), 2, 1,Character['eyebrows_3'],0)
	SetPedHeadOverlay(PlayerPedId(), 3,Character['age_1'],Character['age_2'])
	SetPedHeadOverlay(PlayerPedId(), 7,Character['sun_1'],Character['sun_2'])
	SetPedHeadOverlay(PlayerPedId(), 6,Character['complexion_1'],Character['complexion_2'])
	SetPedHeadOverlay(PlayerPedId(), 9,Character['moles_1'],Character['moles_2'])
	SetPedEyeColor(PlayerPedId(), Character['eye_color'], 0, 1)
	SetPedHeadOverlay(PlayerPedId(), 4,Character['makeup_1'],Character['makeup_2'])
	SetPedHeadOverlayColor(PlayerPedId(), 4, 1,Character['makeup_3'],0)
	SetPedFaceFeature(PlayerPedId(), 19, Character['neck_thick'])
	SetPedFaceFeature(PlayerPedId(), 18, Character['chin_hole'])
	SetPedFaceFeature(PlayerPedId(), 17, Character['chin_width'])
	SetPedFaceFeature(PlayerPedId(), 16, Character['chin_length'])
	SetPedFaceFeature(PlayerPedId(), 15, Character['chin_height'])
	SetPedFaceFeature(PlayerPedId(), 14, Character['jaw_2'])
	SetPedFaceFeature(PlayerPedId(), 13, Character['jaw_1'])
	SetPedFaceFeature(PlayerPedId(), 12, Character['lips_thick'])
	SetPedFaceFeature(PlayerPedId(), 11, Character['eye_open'])
	SetPedFaceFeature(PlayerPedId(), 10, Character['cheeks_3'])
	SetPedFaceFeature(PlayerPedId(), 9, Character['cheeks_2'])
	SetPedFaceFeature(PlayerPedId(), 8, Character['cheeks_1'])
	SetPedFaceFeature(PlayerPedId(), 6, Character['eyebrows_6'])
	SetPedFaceFeature(PlayerPedId(), 7, Character['eyebrows_5'])
	SetPedFaceFeature(PlayerPedId(), 5, Character['nose_6'])
	SetPedFaceFeature(PlayerPedId(), 4, Character['nose_5'])
	SetPedFaceFeature(PlayerPedId(), 3, Character['nose_4'])
	SetPedFaceFeature(PlayerPedId(), 2, Character['nose_3'])
	SetPedFaceFeature(PlayerPedId(), 1, Character['nose_2'])
	SetPedFaceFeature(PlayerPedId(), 0, Character['nose_1'])
	if Character["gender"] == "Male" then
		for k, v in pairs(moutfits[Character["outfit"]]) do
			SetPedComponentVariation(PlayerPedId(), k, v[1], v[2], 2)
		end
		SetPedHeadOverlay(PlayerPedId(), 1,Character['beard'],Character['beard_2'])
		SetPedHeadOverlayColor(PlayerPedId(), 1, 1,	Character['beard_3'],0)
	elseif Character["gender"] == "Female" then
		for k, v in pairs(foutfits[Character["outfit"]]) do
			SetPedComponentVariation(PlayerPedId(), k, v[1], v[2], 2)
		end
		SetPedHeadOverlay(PlayerPedId(), 5,Character['blush_1'],Character['blush_2'])
		SetPedHeadOverlayColor(PlayerPedId(), 5, 2,	Character['blush_3'],0)
	end
	local glassDR
	if Character["glasses"] == 0 then
		if Character["gender"] == "Male" then
			SetPedPropIndex(PlayerPedId(), 1, 11, 0, false)
		else
			SetPedPropIndex(PlayerPedId(), 1, 5, 0, false)
		end
	else
		if Character["gender"] == "Male" then
			SetPedPropIndex(PlayerPedId(), 1, 5, 0, false)
		else
			SetPedPropIndex(PlayerPedId(), 1, 11, 0, false)
		end
	end
end

function RefreshModel()
	Citizen.CreateThread(function()
		--replaces the player's current model if it wasn't the supposed one already
		if GetEntityModel(PlayerPedId()) ~= mdhash then
			while not HasModelLoaded(mdhash) do
				RequestModel(mdhash)
				Wait(0)
			end
			SetPlayerModel(PlayerId(), mdhash)
			SetPedHeadBlendData(PlayerPedId(), Character["mom"], Character["dad"], nil, Character["mom"], Character["dad"], nil, Character["resemblance"], Character["skintone"], nil, true)
			ChangeComponents()
		end
	end)
end

RegisterNetEvent('lbg-refreshComponents')
AddEventHandler('lbg-refreshComponents', ChangeComponents)
RegisterNetEvent('lbg-refreshModel')
AddEventHandler('lbg-refreshModel', RefreshModel)


local enable = false

local Camera = {
	face = {x = 402.74, y = -1000.72, z = -98.45, fov = 10.00},
	body = {x = 402.92, y = -1000.72, z = -99.01, fov = 30.00},
}

cam, cam2, cam3, camSkin, isCameraActive = nil, nil, nil, nil, nil
lastCam = 'body'

function Collision()
    for i=1,256 do
        if NetworkIsPlayerActive(i) then
            SetEntityVisible(GetPlayerPed(i), false, false)
            SetEntityVisible(PlayerPedId(), true, true)
            SetEntityNoCollisionEntity(GetPlayerPed(i), PlayerPedId(), false)
        end
    end
end

function Visible()
    while enable == true do
        Citizen.Wait(0)
        --DisableAllControlActions(0)
        Collision()
    end
end

function CharCreatorAnimation()
	enable = true
	DisplayRadar(false)
	AnimCam()
	Visible()
end

local camSkin

function CreateSkinCam(camera)
	if camSkin then
		local newCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Camera[camera].x, Camera[camera].y, Camera[camera].z, 0.00, 0.00, 0.00, Camera[camera].fov, false, 0)
		PointCamAtCoord(newCam, Camera[camera].x, Camera[camera].y, Camera[camera].z)
   		SetCamActiveWithInterp(newCam, camSkin, 250, true, true)
   		camSkin = newCam
	else
		camSkin = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Camera[camera].x, Camera[camera].y, Camera[camera].z, 0.00, 0.00, 0.00, Camera[camera].fov, false, 0)
	    SetCamActive(cam2, true)
	    RenderScriptCams(true, false, 2000, true, true) 
	end
end

local initpos = nil

function AnimCam()
	local playerPed = PlayerPedId()
    DoScreenFadeOut(1000)
    Citizen.Wait(4000)
    DestroyAllCams(true)
	initpos = GetEntityCoords(PlayerPedId())
	RefreshModel()
    ChangeComponents(true)
	cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Camera['body'].x, Camera['body'].y, Camera['body'].z, 0.00, 0.00, 0.00, Camera['body'].fov, false, 0)
    SetCamActive(cam2, true)
    RenderScriptCams(true, false, 2000, true, true) 
    Citizen.Wait(500)
    DoScreenFadeIn(2000)
    SetEntityCoords(PlayerPedId(), 405.59, -997.18, -99.00, 0.0, 0.0, 0.0, true)
    SetEntityHeading(PlayerPedId(), 90.00)
    -- TriggerEvent('skinchanger:loadSkin', {sex = 0})
    Citizen.Wait(500)
    cam3 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.99, -998.02, -99.00, 0.00, 0.00, 0.00, 50.00, false, 0)
    PointCamAtCoord(cam3, 402.99, -998.02, -99.00)
    SetCamActiveWithInterp(cam2, cam3, 5000, true, true)
    LoadAnim("mp_character_creation@customise@male_a")
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "intro", 1.0, 1.0, 4050, 0, 1, 0, 0, 0)
	Citizen.Wait(5500)
	loopanim = true
    local coords = GetEntityCoords(PlayerPedId())
    if GetDistanceBetweenCoords(coords, 402.89, -996.87, -99.0, true) > 0.5 then
    	SetEntityCoords(PlayerPedId(), 402.89, -996.87, -99.0, 0.0, 0.0, 0.0, true)
    	SetEntityHeading(PlayerPedId(), 173.97)
    end
    Citizen.Wait(100)
	openCharCreatorMenu()
    Citizen.Wait(1000)
    FreezeEntityPosition(PlayerPedId(), true)
end

function EndCharCreator()
	RageUI.CloseAll()
	open = false
	FreezeEntityPosition(PlayerPedId(), false)
	if Character["gender"] == "Male" then
		LoadAnim("mp_character_creation@lineup@male_b")
		TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@male_b", "outro", 0.225, 1.0, 6000, 0, 1, 0, 0, 0)
	elseif Character["gender"] == "Female" then
		LoadAnim("mp_character_creation@lineup@female_a")
		TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@female_a", "outro", 0.225, 1.0, 6000, 0, 1, 0, 0, 0)
	end
	Citizen.Wait(4275)
	local playerPed = PlayerPedId()
	DoScreenFadeOut(1000)
	Wait(1000)
	SetEntityCoords(playerPed, initpos.x, initpos.y, initpos.z, true, false, false, true)
	SetCamActive(camSkin,  false)
	RenderScriptCams(false,  false,  0,  true,  true)
	enable = false
	DisplayRadar(true)
	Wait(1000)
	ChangeComponents(false)
	DoScreenFadeOut(10)
	Wait(1000)
	SetCamActive(camSkin,  false)
	RenderScriptCams(false,  false,  0,  true,  true)
	enable = false
	EnableAllControlActions(0)
    FreezeEntityPosition(PlayerPedId(), false)
	Wait(1000)
	SetResourceKvp('lbg-char-info', json.encode(Character))
	TriggerServerEvent('lbg-chardone', Character)
	DisplayRadar(true)
	DoScreenFadeIn(1000)
	Wait(1000)
end

function LoadAnim(dict)
  while not HasAnimDictLoaded(dict) do
    RequestAnimDict(dict)
    Wait(10)
  end
end

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
        return nil
    end
end

function openCharCreatorMenu()
	-- Menus
	local charCreatorMenu = RageUI.CreateMenu("Créateur", "Options de personnage", 0, 90, 'colors', 'apple_green')
	local identity = RageUI.CreateSubMenu(charCreatorMenu, "Identité", "Options d'identité")
	local heritage = RageUI.CreateSubMenu(charCreatorMenu, "Héritage", "Options d'héritage")
	local appearance = RageUI.CreateSubMenu(charCreatorMenu, "Apparence", "Options d'apparence")
	local details = RageUI.CreateSubMenu(charCreatorMenu, "Détails", "Options de détails")
	local clothes = RageUI.CreateSubMenu(charCreatorMenu, "Vêtements", "Options de vêtements")
	local save = RageUI.CreateSubMenu(charCreatorMenu, "Enregistrer", "Sauvegarder et quitter ?")
	-- Items
	local isCharCreated = false
	local LabelBackground = IdentityInfos.background
	local MumAction, DadAction = 1, 1
	local MumChar, DadChar = 1, 1
	local SexIndex = 1
	local HeritageBody, HeritageSkin = 0.9, 0.8
	local MumList = { "Hannah", "Aubrey", "Jasmine", "Gisele", "Amelia", "Isabella", "Zoe", "Ava", "Camila", "Violet", "Sophia", "Evelyn", "Nicole", "Ashley", "Gracie", "Brianna", "Natalie", "Olivia", "Elizabeth", "Charlotte", "Emma" }
    local DadList = { "Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony",  "Claude", "Niko" }

	local position = 5

	charCreatorMenu.Closable = false

	charCreatorMenu.Closed = function() 
		open = false 
	end

	if open then
		open = false
		RageUI.Visible(charCreatorMenu, false)
		return 
	else
		open = true
		RageUI.Visible(charCreatorMenu, true)
		CreateThread(function()
			while open do
				Wait(0)
				RageUI.IsVisible(charCreatorMenu, function()
					RageUI.Button(" Identité", "Données identitaires du personnage", {RightLabel = ">"}, true, {}, identity)
					RageUI.Button(" Héritage", "Parents du personnage", {RightLabel = ">"}, true, {}, heritage)
					RageUI.Button(" Apparence", "Apparence du personnage", {RightLabel = ">"}, true, {}, appearance)
					RageUI.Button(" Détails", "Détails faciaux du personnage", {RightLabel = ">"}, true, {}, details)
					RageUI.Button(" Vêtements", "Détails faciaux du personnage", {RightLabel = ">"}, true, {}, clothes)
					RageUI.Button(" Enregistrer et quitter", "Sélectionnez pour enregistrer votre personnage", {RightLabel = ">", Color = {100, 119, 171, 120, HightLightColor = {100, 119, 171, 120}}}, true, {}, save)
				end)
				RageUI.IsVisible(identity, function()
					RageUI.List(' Sexe', {'Homme', 'Femme'}, SexIndex, nil, {}, true, {
						onListChange = function(Index, Item)
							SexIndex = Index
							if Index == 1 then
								Character['gender'] = 'Male'
								mdhash = GetHashKey("mp_m_freemode_01")
							end
							if Index == 2 then
								Character['gender'] = 'Female'
								mdhash = GetHashKey("mp_f_freemode_01")
							end
							RefreshModel()
						end
					})
					RageUI.Button(" Prénom(s)", nil, {RightLabel = '~b~'..IdentityInfos.firstname}, true, {
						onSelected = function()
							IdentityInfos.firstname = Keyboard('Votre / Vos prénoms :', 30, IdentityInfos.firstname)
						end
					})
					RageUI.Button(" Nom", nil, {RightLabel = '~b~'..IdentityInfos.lastname}, true, {
						onSelected = function()
							IdentityInfos.lastname = Keyboard('Votre nom :', 30, IdentityInfos.lastname)
						end
					})
					RageUI.Button(" Date de naissance", nil, {RightLabel = '~b~'..IdentityInfos.birthday}, true, {
						onSelected = function()
							IdentityInfos.birthday = Keyboard('Votre anniversaire :', 30, IdentityInfos.birthday)
						end
					})
					RageUI.Button(" Nationalité", nil, {RightLabel = '~b~'..IdentityInfos.nationality}, true, {
						onSelected = function()
							IdentityInfos.nationality = Keyboard('Votre nationalité :', 30, IdentityInfos.nationality)
						end
					})
					RageUI.Button(" Taille (cm)", nil, {RightLabel = '~b~'..IdentityInfos.height}, true, {
						onSelected = function()
							IdentityInfos.height = Keyboard('Votre taille :', 30, IdentityInfos.height)
						end
					})
					RageUI.Button(" Poids (kg)", nil, {RightLabel = '~b~'..IdentityInfos.weight}, true, {
						onSelected = function()
							IdentityInfos.weight = Keyboard('Votre poids :', 30, IdentityInfos.weight)
						end
					})
					RageUI.Button(" Background", nil, {RightLabel = '~b~' .. LabelBackground}, true, {
						onSelected = function()
							IdentityInfos.background = Keyboard('Votre background :', 5000, IdentityInfos.background)
							LabelBackground = '[...]'
						end
					})
				end)
				RageUI.IsVisible(heritage, function()
					RageUI.Window.Heritage(MumChar, DadChar)
					RageUI.List(' Mère', MumList, MumAction, nil, {}, true, {
						onListChange = function(Index, Item)
							MumChar = Index - 1
							MumAction = Index
							Character['mom'] = Index
							ChangeComponents()
						end
					})
					RageUI.List(' Père', DadList, DadAction, nil, {}, true, {
						onListChange = function(Index, Item)
							DadChar = Index - 1
							DadAction = Index
							Character['dad'] = Index
							ChangeComponents()
						end
					})
					RageUI.UISliderHeritage(' Physique', HeritageBody, nil, {
						onSliderChange = function(Index, Item)
							HeritageBody = Item
							Character['resemblance'] = Index
							ChangeComponents()
						end
					})
					RageUI.UISliderHeritage(' Peau', HeritageSkin, nil, {
						onSliderChange = function(Index, Item)
							HeritageSkin = Item
							Character['skintone'] = Index
							ChangeComponents()
						end
					})
				end)
				RageUI.IsVisible(appearance, function()
					RageUI.Slider("Largeur du nez", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Hauteur du sommet du nez", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Longueur du sommet du nez", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Hauteur de l'os du nez", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Abaissement du sommet du nez", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Rotation de l'os du nez", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Profondeur des sourcils", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Hauteur des sourcils", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Hauteur des pommettes", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Largeur des pommettes", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Largeur des joues", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Ouverture des yeux", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Épaisseur des lèvres", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Largeur de la mâchoire", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Profondeur de la mâchoire", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Hauteur du menton", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Profondeur du menton", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Largeur du menton", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Taille du creux du menton", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
					RageUI.Slider("Épaisseur du cou", position, 10, "Apportez des modifications à vos caractéristiques physiques.", true, {}, true, {
						onSliderChange = function(currentPosition)
							position = currentPosition
						end
					})
				end)
				RageUI.IsVisible(details, function()	 
					RageUI.ColourPanel("Color", { RageUI.ItemsColour.PureWhite }, 0, 0, {}, 0, {})
				end)
				RageUI.IsVisible(clothes, function()end)
				RageUI.IsVisible(save, function()
					RageUI.Button(" Confirmer", nil, {RightLabel = ">", Color = {80, 176, 119, 120, HightLightColor = {80, 176, 119, 120}}}, true, {
						onSelected = function()
							isCharCreated = true
						end
					})
					RageUI.Button(" Annuler", nil, {RightLabel = ">", Color = {220, 94, 94, 120, HightLightColor = {220, 94, 94, 120}}}, true, {}, charCreatorMenu)
					if isCharCreated then
						if Pourcent < 1.0 then
							RageUI.PercentagePanel(Pourcent or 0.0, 'Chargement des données ...', '', '', {})
							Pourcent = Pourcent + 0.002
						else
							EndCharCreator()
							-- Envoi des données DB.
						end
					end
				end)
			end
		end)
	end
end



RegisterNetEvent('CALVERN:openCharCreator')
AddEventHandler('CALVERN:openCharCreator', function()
	CharCreatorAnimation()
	CreateThread(function()
		while not isSelected do
			openCharCreatorMenu()
		end
	end)
end)

RegisterCommand("charcreator", function()
    TriggerEvent('CALVERN:openCharCreator')
end, false)
