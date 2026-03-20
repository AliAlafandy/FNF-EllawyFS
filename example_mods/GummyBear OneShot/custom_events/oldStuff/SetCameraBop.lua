local rate = 4
local intensity = 0

function onBeatHit()
	if curBeat % rate == 0 then
		setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.015 * intensity)
		setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03 * intensity)
	end
end

function onEvent(name, value1, value2)
	if name == 'SetCameraBop' then
		rate = tonumber(value1)
		intensity = tonumber(value2)
	end
end