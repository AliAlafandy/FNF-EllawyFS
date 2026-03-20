function onCreate()
	-- background shit
	if lowQuality == false then
		makeLuaSprite('sky', 'sky', -600, -250)
		addLuaSprite('sky', false)
		setLuaSpriteScrollFactor('sky', 0.9, 0.9);
		
		makeLuaSprite('street', 'street', -600, -250)
		addLuaSprite('street', false)
		setLuaSpriteScrollFactor('street', 0.9, 0.9);
		
		makeLuaSprite('lighting', 'lighting', -600, -250)
		addLuaSprite('lighting', false)
		setLuaSpriteScrollFactor('lighting', 0.9, 0.9);
		
		makeAnimatedLuaSprite('viewers', 'viewers_assets', -550, -400)
		addAnimationByPrefix('viewers', 'idle', 'idle beat name0', 24, true)
		addLuaSprite('viewers', false)
		setLuaSpriteScrollFactor('viewers', 0.9, 0.9);
		
		makeLuaSprite('sky2', 'neonSky', -600, -250)
		addLuaSprite('sky2', false)
		setLuaSpriteScrollFactor('sky2', 0.9, 0.9);
		setProperty('sky2.alpha', 0);
		
		makeLuaSprite('street2', 'neonStreet', -600, -250)
		addLuaSprite('street2', false)
		setLuaSpriteScrollFactor('street2', 0.9, 0.9);
		setProperty('street2.alpha', 0);
		
		makeLuaSprite('lighting2', 'neonLighting', -600, -250)
		addLuaSprite('lighting2', false)
		setLuaSpriteScrollFactor('lighting2', 0.9, 0.9);
		setProperty('lighting2.alpha', 0);
	else
		makeLuaSprite('street', 'streetOpt', -600, -250)
		addLuaSprite('street', false)
		setLuaSpriteScrollFactor('street', 0.9, 0.9);
	end
end

function onBeatHit()
	-- lol
end

function onStepHit()
	-- lol
end

function onUpdate()
	-- lol
end