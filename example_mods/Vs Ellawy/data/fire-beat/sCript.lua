local allowCountdown = false

function onStartCountdown()
	if not allowCountdown then
		triggerEvent('Hud Fade', '0', '0');
		allowCountdown = true;
	end
end