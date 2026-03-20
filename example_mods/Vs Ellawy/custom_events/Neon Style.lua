function onEvent(name, value1, value2)
	if lowQuality == false then
		if name == 'Neon Style' then
			if value1 == 'on' then
				setProperty('sky.alpha', 0);
				setProperty('street.alpha', 0);
				setProperty('lighting.alpha', 0);
				setProperty('viewers.alpha', 0);
				
				setProperty('sky2.alpha', 1);
				setProperty('street2.alpha', 1);
				setProperty('lighting2.alpha', 1);
				setProperty('gf.alpha', 0);
				triggerEvent('Change Character', 'BF', 'bf-neon');
				triggerEvent('Change Character', 'Dad', 'allawy-neon');
			elseif value1 == 'off' then
				setProperty('sky.alpha', 1);
				setProperty('street.alpha', 1);
				setProperty('lighting.alpha', 1);
				setProperty('viewers.alpha', 1);
				
				setProperty('sky2.alpha', 0);
				setProperty('street2.alpha', 0);
				setProperty('lighting2.alpha', 0);
				setProperty('gf.alpha', 1);
				triggerEvent('Change Character', 'BF', 'bf');
				triggerEvent('Change Character', 'Dad', 'allawy');
			end
		end
	end
end