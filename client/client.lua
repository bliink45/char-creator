local initpos = nil
cam, cam2, cam3, camSkin, isCameraActive = nil, nil, nil, nil, nil

local mdhash = GetHashKey("mp_m_freemode_01")

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

function RefreshModel()
	Citizen.CreateThread(function()
		--replaces the player's current model if it wasn't the supposed one already
		if GetEntityModel(PlayerPedId()) ~= mdhash then
			while not HasModelLoaded(mdhash) do
				RequestModel(mdhash)
				Wait(0)
			end
			SetPlayerModel(PlayerId(), mdhash)
			SetPedHeadBlendData(PlayerPedId(), "22", "00", nil, "22", "00", nil, CharacterCreator.Data.heredity.heritageBody, CharacterCreator.Data.heredity.heritageSkin, nil, true)
		end
	end)
end

function AnimCam()
	local playerPed = PlayerPedId()
    DoScreenFadeOut(1000)
    Citizen.Wait(4000)
    DestroyAllCams(true)
	initpos = GetEntityCoords(PlayerPedId())
	
    -- Refresh model

    -- ChangeComponents

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

    -- open menu

    Citizen.Wait(1000)
    FreezeEntityPosition(PlayerPedId(), true)
end

RegisterCommand("char_creator:anim", function()
    enable = true
	DisplayRadar(false)
    AnimCam()

    while enable == true do
        Citizen.Wait(0)
        --DisableAllControlActions(0)
        for i=1,256 do
            if NetworkIsPlayerActive(i) then
                SetEntityVisible(GetPlayerPed(i), false, false)
                SetEntityVisible(PlayerPedId(), true, true)
                SetEntityNoCollisionEntity(GetPlayerPed(i), PlayerPedId(), false)
            end
        end
    end
end, false)