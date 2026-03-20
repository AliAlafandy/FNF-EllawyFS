luaDebugMode = true

local dih = 0
local rainbow = false
local bounceEnabled = false
local velocityY = -100
local gravity = 800
local groundY = 460
local isBouncing = false

function onCreate()
	makeLuaSprite('gummiVoid', 'gummiVoid/gummiVoid', -845, -967)
	scaleObject('gummiVoid', 1, 1)
	setScrollFactor('gummiVoid', 0.9, 0.9)
	addLuaSprite('gummiVoid')
	
	makeAnimatedLuaSprite('crowdBack', 'gummiVoid/crowdBack', -487, 302)
	scaleObject('crowdBack', 1, 1)
	setScrollFactor('crowdBack', 0.8, 0.8)
	addAnimationByPrefix('crowdBack', 'dance', 'crowd back instance 1', 24, true)
	addLuaSprite('crowdBack')
	
	makeLuaSprite('gummiFloor', 'gummiVoid/gummiFloor', -979, 696)
	scaleObject('gummiFloor', 1, 1)
	setScrollFactor('gummiFloor', 1, 1)
	addLuaSprite('gummiFloor')
	
	makeLuaSprite('gradient', 'gummiVoid/gummyGradient', -829, -164)
	scaleObject('gradient', 1, 1)
	setScrollFactor('gradient', 1, 1)
	setProperty('gradient.alpha', 0)
	setProperty('gradient.blend', 0)
	addLuaSprite('gradient', true)
	
	makeAnimatedLuaSprite('crowdFront', 'gummiVoid/crowdFront', -644, 567)
	scaleObject('crowdFront', 1, 1)
	setScrollFactor('crowdFront', 1.1, 1.1)
	addAnimationByPrefix('crowdFront', 'dance', 'crowd fron instance 1', 24, true)
	addLuaSprite('crowdFront', true)
end

function onCreatePost()
	makeLuaSprite('cameraBorder', 'gummiVoid/cameraBorder', -165, -60)
	scaleObject('cameraBorder', 0.6, 0.6)
	setProperty('cameraBorder.flipX', true)
	setObjectCamera('cameraBorder', 'hud')
	addLuaSprite('cameraBorder')
	
	if shadersEnabled then
		local h, s, c, b = -15, -5, 5, -5
		
		for _,char in pairs({'dad', 'gf', 'boyfriend'}) do
			setSpriteShader(char, 'adjustColor')
			setShaderFloat(char, 'hue', h)
			setShaderFloat(char, 'saturation', s)
			setShaderFloat(char, 'contrast', c)
			setShaderFloat(char, 'brightness', b)
		end
		
		setSpriteShader('gradient', 'adjustColor')
		setShaderFloat('gradient', 'saturation', 0)
		setShaderFloat('gradient', 'contrast', 0)
		setShaderFloat('gradient', 'brightness', 0)
	end
end

function onUpdatePost()
	if rainbow and shadersEnabled then
		setShaderFloat('gradient', 'hue', dih)
dih = 1 + math.sin((getSongPosition() / 250) * 1) * 100
	end
end

function onBeatHit()
	if curBeat == 48 then
		rainbow = true
		doTweenAlpha('raibox0', 'gradient', 1, 0.5)
	elseif curBeat == 112 then
		rainbow = false
		doTweenAlpha('raibox1', 'gradient', 0, 0.5)
	elseif curBeat == 208 then
		rainbow = true
		doTweenAlpha('raibox2', 'gradient', 1, 0.5)
	elseif curBeat == 340 then
		rainbow =false
		doTweenAlpha('raibox3', 'gradient', 0, 0.5)
	end
    if curBeat >= 340 then
        bounceEnabled = false
        isBouncing = false
        
        setProperty('crowdFront.y', groundY)
        setProperty('crowdBack.y', groundY - 150)
    elseif curBeat >= 276 and curBeat % 2 == 0 then
        bounceEnabled = true
        startBounce()
        
        setProperty('crowdFront.y', groundY)
        setProperty('crowdBack.y', groundY - 150)
    elseif curBeat >= 272 then
        bounceEnabled = false
        isBouncing = false
        
        setProperty('crowdFront.y', groundY)
        setProperty('crowdBack.y', groundY - 150)
    elseif curBeat >= 208 then
        bounceEnabled = true
        startBounce()
        
        setProperty('crowdFront.y', groundY)
        setProperty('crowdBack.y', groundY - 150)
    elseif curBeat >= 112 then
        bounceEnabled = false
        isBouncing = false
    elseif curBeat >= 80 and curBeat % 2 == 0 then
        bounceEnabled = true
        startBounce()
    end
end

function onStepHit()
	if curStep == 4 or curStep == 8 or curStep == 20 or curStep == 24 or curStep == 34 or curStep == 46 then
		cameraFlash('camGame', 'FFFFFF', 0.3)
	end
end

function onComplete()
	bounceEnabled = false
	isBouncing = false
	
	setProperty('crowdFront.y', groundY)
	setProperty('crowdBack.y', groundY - 150)
end

function startBounce()
	if not bounceEnabled then
		return
	end
	if not isBouncing then
		isBouncing = true
		velocityY = -300
	end
end

function onUpdate(elapsed)
	if isBouncing then
		velocityY = velocityY + gravity * elapsed * 2
		setProperty('crowdFront.y', getProperty('crowdFront.y') + velocityY * elapsed)
		setProperty('crowdBack.y', getProperty('crowdBack.y') + velocityY * elapsed)
		if getProperty('crowdFront.y') >= groundY then
			setProperty('crowdFront.y', groundY)
			velocityY = 0
			isBouncing = false
		end
		if getProperty('crowdBack.y') >= groundY - 150 then
			setProperty('crowdBack.y', groundY - 150)
			velocityY = 0
			isBouncing = false
		end
	end
end