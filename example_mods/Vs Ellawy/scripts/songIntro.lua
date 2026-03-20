textSize = 25
subTextSize = 30
tagWidth = 35

function onCreate()
	makeLuaSprite('boxTag', '', -305 - tagWidth, 15)
	makeGraphic('boxTag', 300 + tagWidth, 100, 'FFFFFF')
	setObjectCamera('boxTag', 'other')
	addLuaSprite('boxTag', true)
	
	makeLuaSprite('box', '', -305 - tagWidth, 15)
	makeGraphic('box', 300, 100, '000000')
	setObjectCamera('box', 'other')
	addLuaSprite('box', true)
	
	makeLuaText('boxText', 'By Ali Alafandy', 300, -305 - tagWidth, 30)
	setTextAlignment('boxText', 'left')
	setObjectCamera('boxText', 'other')
	setTextSize('boxText', textSize)
	addLuaText('boxText')
	
	makeLuaText('boxSubText', songName, 300, -305 - tagWidth, 60)
	setTextAlignment('boxSubText', 'left')
	setObjectCamera('boxSubText', 'other')
	setTextSize('boxSubText', subTextSize)
	addLuaText('boxSubText')
end

function onUpdate()
	setProperty('boxTag.color', getIconColor('dad'));
end

function onSongStart()
	doTweenX('moveInOne', 'boxTag', 0, 1, 'CircInOut')
	doTweenX('moveInTwo', 'box', 0, 1, 'CircInOut')
	doTweenX('moveInThree', 'boxText', 0, 1, 'CircInOut')
	doTweenX('moveInFour', 'boxSubText', 0, 1, 'CircInOut')
	
	runTimer('boxWait', 3, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'boxWait' then
		doTweenX('moveOutOne', 'boxTag', -450, 1.5, 'CircInOut')
		doTweenX('moveOutTwo', 'box', -450, 1.5, 'CircInOut')
		doTweenX('moveOutThree', 'boxText', -450, 1.5, 'CircInOut')
		doTweenX('moveOutFour', 'boxSubText', -450, 1.5, 'CircInOut')
	end
end

function getIconColor(character)
	local character = character or "dad"
	return getColorFromHex(rgbToHex(getProperty(character .. ".healthColorArray")))
end
	
function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end