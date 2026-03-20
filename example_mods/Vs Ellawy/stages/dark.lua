function onCreate()
	-- background shit
	if lowQuality == false then
		makeLuaSprite('sky', 'darkSky', -600, -250)
		addLuaSprite('sky', false)
		setLuaSpriteScrollFactor('sky', 0.9, 0.9);
		
		makeLuaSprite('street', 'darkStreet', -600, -250)
		addLuaSprite('street', false)
		setLuaSpriteScrollFactor('street', 0.9, 0.9);
		
		makeLuaSprite('lighting', 'darkLighting', -600, -250)
		addLuaSprite('lighting', true)
		setLuaSpriteScrollFactor('lighting', 0.9, 0.9);
		
		makeLuaSprite('clouds', 'clouds', -600, -250)
		addLuaSprite('clouds', true)
		setLuaSpriteScrollFactor('clouds', 0.9, 0.9);
	else
		makeLuaSprite('street', 'streetOpt', -600, -250)
		addLuaSprite('street', false)
		setLuaSpriteScrollFactor('street', 0.9, 0.9);
		
		makeLuaSprite('clouds', 'clouds', -600, -250)
		addLuaSprite('clouds', true)
		setLuaSpriteScrollFactor('clouds', 0.9, 0.9);
	end
end

function onBeatHit()
	-- lol
end

function onStepHit()
	-- lol
end

function onUpdate()
	if getProperty('clouds.alpha') == 1 then
		doTweenAlpha('cloudy', 'clouds', 0, 4, 'lineal')
	end
	if getProperty('clouds.alpha') == 0 then
		doTweenAlpha('cloudy', 'clouds', 1, 3, 'lineal')
	end
end