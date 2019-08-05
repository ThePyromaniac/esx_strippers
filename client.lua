TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local foodPeds = {
  { model="s_f_y_stripper_02", x=112.68, y=-1288.3, z=28.46, a=238.85, animation="mini@strip_club@private_dance@idle", animationName="priv_dance_idle"},
  { model="s_f_y_stripperlite", x=111.99, y=-1286.03, z=28.46, a=308.8, animation="mini@strip_club@lap_dance@ld_girl_a_song_a_p1", animationName="ld_girl_a_song_a_p1_f"},
--  { model="s_f_y_stripperlite", x=113.00, y=-1287.01, z=28.46, a=294.26, animation="mini@strip_club@pole_dance@pole_dance1", animationName="pd_dance_01"}
  { model="csb_stripper_01", x=108.72, y=-1289.33, z=28.86, a=295.53, animation="mini@strip_club@private_dance@part2", animationName="priv_dance_p2"},
  { model="s_f_y_stripper_01", x=103.21, y=-1292.59, z=29.26, a=296.21, animation="mini@strip_club@private_dance@part1", animationName="priv_dance_p1"},
  { model="s_f_y_stripper_02", x=104.66, y=-1294.46, z=29.26, a=287.12, animation="mini@strip_club@lap_dance@ld_girl_a_song_a_p1", animationName="ld_girl_a_song_a_p1_f"},
  { model="a_f_y_topless_01", x=102.26, y=-1289.92, z=29.26, a=292.05, animation="mini@strip_club@private_dance@idle", animationName="priv_dance_idle"},
}

ESX.TriggerServerCallback('callbackname', function( spawned )
	if not spawned then
			for k,v in ipairs(foodPeds) do
				RequestModel(GetHashKey(v.model))
				while not HasModelLoaded(GetHashKey(v.model)) do
					Wait(0)
				end
				RequestAnimDict(v.animation)
				while not HasAnimDictLoaded(v.animation) do
					Wait(1)
				end
				local storePed = CreatePed(4, GetHashKey(v.model), v.x, v.y, v.z, v.a, true, true)
				SetBlockingOfNonTemporaryEvents(storePed, false)
				SetPedFleeAttributes(storePed, 0, 0)
						SetPedArmour(storePed, 100)
						SetPedMaxHealth(storePed, 100)
				SetPedDiesWhenInjured(storePed, false)
				SetAmbientVoiceName(storePed, v.voice)

				TaskPlayAnim(storePed, v.animation, v.animationName, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
				SetModelAsNoLongerNeeded(GetHashKey(v.model))
			end
	end
end)
