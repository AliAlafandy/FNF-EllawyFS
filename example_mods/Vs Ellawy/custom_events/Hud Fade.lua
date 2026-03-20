function onEvent(name, value1, value2)
	if name == 'Hud Fade' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end
		
		targetAlpha = tonumber(value2);
		if duration == 0 then
			setProperty('camGame.alpha', targetAlpha);
		else
			doTweenAlpha('hudFadeEventTween', 'camGame', targetAlpha, duration, 'linear');
		end
	end
end