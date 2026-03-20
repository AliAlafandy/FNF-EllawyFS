function onEvent(name,value1,value2)

    if name == "" then
        
        if value1 == 'setZoom' then
      	  setProperty("defaultCamZoom",value2)

	else
            doTweenZoom('camz','camGame',tonumber(value2),tonumber(value1),'sineInOut')
	end
	if value1 == 'zoomin' then
		setProperty("defaultCamZoom",value2+0.5)

end

end
end
function onTweenCompleted(name)

	if name == 'camz' then


		setProperty("defaultCamZoom",getProperty('camGame.zoom')) 

end
end