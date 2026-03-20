function onUpdate()
	setProperty('timeTxt.color', getIconColor('dad'));
	setProperty('scoreTxt.color', getIconColor('dad'));
	setProperty('botplayTxt.color', getIconColor('dad'));
	
	-- setTimeBarColors('FFFFFF', '000000');
	setTimeBarColors('0000FF', '000000');
	-- setProperty('timeBar.color', getIconColor('dad'));
	-- setTimeBarColors(getIconColor('dad'), '000000');
end

function getIconColor(chr)
	local chr = chr or 'dad'
	return getColorFromHex(rgbToHex(getProperty(chr .. '.healthColorArray')))
end
	
function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end