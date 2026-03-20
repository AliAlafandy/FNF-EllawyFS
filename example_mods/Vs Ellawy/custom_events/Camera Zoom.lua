function onEvent(name, value1, value2)
	if name == 'Camera Zoom' then
		setProperty('defaultCamZoom', value1);
	end
end