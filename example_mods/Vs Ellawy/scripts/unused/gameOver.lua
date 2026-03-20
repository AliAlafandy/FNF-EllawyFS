local deathChar = 'bf-dead'
local endSoundEffect = 'gameOverEnd'

local tweenTime = 2

local workingScript = true
local okstoppls = false
local doit = false
local selectedyeah = true
local selectedno = false
local remove = true

function onCreatePost()
	if workingScript == false then
		close(true)
	end
	
	runHaxeCode('FlxG.sound.music.volume = ' .. 1)
	
	makeLuaText('boozoo', 'Game Over...', 999, 100, 200)
	setTextSize('boozoo', 85)
	setObjectCamera('boozoo', 'other')
	setTextAlignment('boozoo', 'left')
	setTextColor('boozoo', '808080')
	setProperty('boozoo.alpha', 0)
	addLuaText('boozoo')
	
	makeLuaText('tryagainfucker', 'Try again?', 999, 200, 350)
	setTextSize('tryagainfucker', 50)
	setObjectCamera('tryagainfucker', 'other')
	setTextAlignment('tryagainfucker', 'left')
	setProperty('tryagainfucker.alpha', 0)
	addLuaText('tryagainfucker')
	
	makeLuaText('yeah', 'Yes', 999, 100, 450)
	setTextSize('yeah', 50)
	setObjectCamera('yeah', 'other')
	setTextAlignment('yeah', 'left')
	setTextColor('yeah', '66FF66')
	setProperty('yeah.alpha', 0)
	addLuaText('yeah')
	
	makeLuaText('nah', 'No', 999, 550, 450)
	setTextSize('nah', 50)
	setObjectCamera('nah', 'other')
	setTextAlignment('nah', 'left')
	setTextColor('nah', 'FF6666')
	setProperty('nah.alpha', 0)
	addLuaText('nah')
	
	makeLuaSprite('bg', '', 0, 0)
	setScrollFactor('bg', 0, 0)
	makeGraphic('bg', 3840, 2160, '000000')
	addLuaSprite('bg', false)
	setProperty('bg.alpha', 0)
	screenCenter('bg', 'xy')
	
	if buildTarget == 'android' then
		makeAnimatedLuaSprite('leftoButton', 'buttons/left', 3, 582.5);
		addAnimationByPrefix('leftoButton', 'nonPress', 'nonPress', 24, false);
		addAnimationByPrefix('leftoButton', 'Pressed', 'Pressed', 12, false);
		addLuaSprite('leftoButton', false);
		setObjectCamera('leftoButton', 'other');
		
		makeAnimatedLuaSprite('rightoButton', 'buttons/right', 130, 582.5);
		addAnimationByPrefix('rightoButton', 'nonPress', 'nonPress', 24, false);
		addAnimationByPrefix('rightoButton', 'Pressed', 'Pressed', 12, false);
		addLuaSprite('rightoButton', false);
		setObjectCamera('rightoButton', 'other');
		
		makeAnimatedLuaSprite('aButton', 'buttons/a', 1150, 582.5);
		addAnimationByPrefix('aButton', 'nonPress', 'nonPress', 24, false);
		addAnimationByPrefix('aButton', 'Pressed', 'Pressed', 12, false);
		addLuaSprite('aButton', false);
		setObjectCamera('aButton', 'other');
		
		if remove then
			removeLuaSprite('leftoButton');
			removeLuaSprite('rightoButton');
			removeLuaSprite('aButton');
		end
	end
end

function onGameOver()
	remove = false
	return Function_Stop;
end

function onUpdate(el)
	local frameScale = el * 60
	
	if getProperty('healthBar.percent') < 1 and okstoppls == false and getProperty('playbackRate') > 0 then
		setProperty('playbackRate', getProperty('playbackRate') - (0.01 * frameScale))
		breaksDown()
		
		doTweenAlpha('ohnodarkscazry', 'bg', 1, 0.15, 'quadInOut')
		doTweenAlpha('ohnodarkscazrygf', 'gf', 0, 0.15, 'quadInOut')
		doTweenAlpha('ohnodarkscazrydad', 'dad', 0, 0.15, 'quadInOut')
		
		runTimer('youlostloser', 1)
	end
	if getProperty('bg.alpha') < 1 and getProperty('healthBar.percent') < 1 and okstoppls == false then
		triggerEvent('Camera Follow Pos', getProperty('boyfriend.x') + 225,  getProperty('boyfriend.y') + 200)
	end
	
	function breaksDown()
		doTweenAngle('ohnoangleomggg', 'camHUD', getProperty('camHUD.angle') + 0.5, 0.01 * frameScale, 'quadInOut')
		doTweenY('ohnnooaaa', 'camHUD', getProperty('camHUD.y') + 10, 0.01 * frameScale, 'quadInOut')
		triggerEvent('Screen Shake', '0.5, 0.005', '0.5, 0.0005');
		
		function onPause()
			return Function_Stop;
		end
		
		function onEndSong()
			return Function_Stop;
		end
	end
	
	if okstoppls == true then
		triggerEvent('Camera Follow Pos', getProperty('boyfriend.x') - 25,  getProperty('boyfriend.y') + 175)
		
		runHaxeCode('FlxG.sound.music.time = ' .. 0)
		runHaxeCode('FlxG.sound.music.volume = ' .. 0)
		
		if keyboardJustPressed('SPACE') or keyboardJustPressed('ENTER') and selectedyeah == true and doit == true then
			characterPlayAnim('bf', 'deathConfirm', true)
			playSound(endSoundEffect, 0.5)
			runTimer('restartyippe', 2)
			
			doit = false
			
			doTweenAlpha('noooo', 'nah', 0, 0.5, 'quadInOut')
			doTweenAlpha('omgtryagainfr', 'tryagainfucker', 0, 0.5, 'quadInOut')
			doTweenAlpha('booozoo!!', 'boozoo', 0, 0.5, 'quadInOut')
		end
		if keyboardJustPressed('SPACE') or keyboardJustPressed('ENTER') and selectedno == true and doit == true then
			runTimer('goodbye:3', 2)
			playSound('cancelMenu', 0.5)
			
			doit = false
			
			doTweenAlpha('yeahhh', 'yeah', 0, 0.5, 'quadInOut')
			doTweenAlpha('omgtryagainfr', 'tryagainfucker', 0, 0.5, 'quadInOut')
			doTweenAlpha('booozoo!!', 'boozoo', 0, 0.5, 'quadInOut')
			doTweenAlpha('deaded', 'boyfriend', 0, 0.5, 'quadInOut')
		end
	end
	if doit == true then
		if keyboardJustPressed('RIGHT') and selectedyeah == true then
			selectedyeah = false
			selectedno = true
			playSound('scrollMenu', 0.5)
		end
		if keyboardJustPressed('LEFT') and selectedno == true then
			selectedyeah = true 
			selectedno = false
			playSound('scrollMenu', 0.5)
		end
		if selectedyeah == true then
			doTweenAlpha('yeahhh', 'yeah', 1, 0.1, 'quadInOut')
			doTweenAlpha('noooo', 'nah', 0.5, 0.1, 'quadInOut')
		else
			doTweenAlpha('yeahhh', 'yeah', 0.5, 0.1, 'quadInOut')
			doTweenAlpha('noooo', 'nah', 1, 0.1, 'quadInOut')
		end
	end
	if buildTarget == 'android' then
		if okstoppls == true then
			if (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and mousePressed('left')) and selectedyeah == true and doit == true then
				objectPlayAnimation('aButton', 'Pressed', true);
				characterPlayAnim('bf', 'deathConfirm', true)
				playSound(endSoundEffect, 0.5)
				runTimer('restartyippe', 2)
				
				doit = false
				remove = true
				
				doTweenAlpha('noooo', 'nah', 0, 0.5, 'quadInOut')
				doTweenAlpha('omgtryagainfr', 'tryagainfucker', 0, 0.5, 'quadInOut')
				doTweenAlpha('booozoo!!', 'boozoo', 0, 0.5, 'quadInOut')
			else
				objectPlayAnimation('aButton', 'nonPress', true);
			end
			if (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and mousePressed('left')) and selectedno == true and doit == true then
				objectPlayAnimation('aButton', 'Pressed', true);
				runTimer('goodbye:3', 2)
				playSound('cancelMenu', 0.5)
				
				doit = false
				remove = true
				
				doTweenAlpha('yeahhh', 'yeah', 0, 0.5, 'quadInOut')
				doTweenAlpha('omgtryagainfr', 'tryagainfucker', 0, 0.5, 'quadInOut')
				doTweenAlpha('booozoo!!', 'boozoo', 0, 0.5, 'quadInOut')
				doTweenAlpha('deaded', 'boyfriend', 0, 0.5, 'quadInOut')
			else
				objectPlayAnimation('aButton', 'nonPress', true);
			end
			if doit == true then
				if (getMouseX('camHUD') > 130 and getMouseX('camHUD') < 257) and (getMouseY('camHUD') > 582.5 and mousePressed('left')) and selectedyeah == true then
					objectPlayAnimation('rightoButton', 'Pressed', true);
					selectedyeah = false
					selectedno = true
					playSound('scrollMenu', 0.5)
				else
					objectPlayAnimation('rightoButton', 'nonPress', true);
				end
				if (getMouseX('camHUD') > 3 and getMouseX('camHUD') < 130) and (getMouseY('camHUD') > 582.5 and mousePressed('left')) and selectedno == true then
					objectPlayAnimation('leftoButton', 'Pressed', true);
					selectedyeah = true 
					selectedno = false
					playSound('scrollMenu', 0.5)
				else
					objectPlayAnimation('leftoButton', 'nonPress', true);
				end
			end
		end
	end
end

function onTimerCompleted(gameOVERBITCH)
	if gameOVERBITCH == 'youlostloser' then
		doTweenZoom('bozozoom', 'camGame', 1.2, tweenTime, 'quadInOut')
		okstoppls = true
	end
	if gameOVERBITCH == 'restartyippe' and doit == false then
		restartSong(false)
	end
	if gameOVERBITCH == 'textyippe' then
		doTweenAlpha('booozoo!!', 'boozoo', 0.7, 1.5, 'quadInOut')
		runTimer('tryagainffs', 2)
	end
	if gameOVERBITCH == 'tryagainffs' then
		doTweenAlpha('omgtryagainfr', 'tryagainfucker', 1, 1.5, 'quadInOut')
		runTimer('thechoice')
	end
	if gameOVERBITCH == 'thechoice' then
		doit = true
	end
	if gameOVERBITCH == 'goodbye:3' then
		exitSong(false)
	end
end

function onTweenCompleted(tweenie)
	if tweenie == 'bozozoom' then
		triggerEvent('Screen Shake', '0.5, 0.005', '0.5, 0.0005');
		
		setProperty('playbackRate', 1)
		setProperty('cameraSpeed', 0.25)
		setProperty('defaultCamZoom', 1.2)
		
		triggerEvent('Change Character', 'bf', deathChar)
		playSound('fnf_loss_sfx', 0.5)
		characterPlayAnim('bf', 'firstDeath', true)
		runTimer('textyippe', 2)
	end
end