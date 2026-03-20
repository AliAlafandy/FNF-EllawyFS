function onCreate()
    makeLuaText('waterMark', "Ported By Ali Alafandy", 0, 860, 13);
    setTextColor('waterMark', 'FFFFFF')
    setTextSize('waterMark', 30);
    addLuaText('waterMark');
end

function onUpdate()
	setProperty('waterMark.color', getIconColor('dad'));
end

function getIconColor(chr)
	local chr = chr or "dad"
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end
	
function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end