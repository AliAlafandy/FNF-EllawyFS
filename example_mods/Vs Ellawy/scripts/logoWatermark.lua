function onCreate()
	makeAnimatedLuaSprite('logo', 'logoBumpin', 920, 20);
	addAnimationByPrefix('logo', 'logo', 'logo bumpin0', 24, true)
	addLuaSprite('logo', false)
	scaleObject('logo', 0.4, 0.4);
	setObjectCamera('logo', 'other')
	setProperty('logo.alpha', 0.6)
end

function onBeat()
	objectPlayAnimation('logo', 'logo bumpin0')
end