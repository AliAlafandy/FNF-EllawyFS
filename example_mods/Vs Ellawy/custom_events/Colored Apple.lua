converted = false

function onCreate()
	if lowQuality == true then
		customforsong = {'YourSong1', 'YourSong2'}
		
		x = -1000
		y = -600
		
		xs = 3
		ys = 3
		
		color = '000000'
		
		CustomBF = false
		CustomDAD = false
		CustomGF = false
		
		rgbbf = {0, 0, 0}
		rgbdad = {0, 0, 0}
		rgbgf = {0, 0, 0}
		
		for _, s in pairs(customforsong) do
			if songName == s then
				x = -1000
				y = -600
					
				xs = 3
				ys = 3
				
				color = '000000'
				
				CustomBF = false
				CustomGF = false
				CustomDAD = false
				
				rgbbf = {0, 0, 0}
				rgbdad = {0, 0, 0}	
				rgbgf = {0, 0, 0}
			end
		end
	end
end


function onCreatePost()
	if lowQuality == true then
		if version >= '0.7' then
			addHaxeLibrary('StageData', 'backend')
			ui = {'iconP1', 'iconP2', 'healthBar', 'healthBar.bg'}
		else	
			addHaxeLibrary('StageData')
			ui = {'iconP1', 'iconP2', 'healthBar', 'healthBarBG'}
		end
		
		runHaxeCode("setVar('stageData', StageData.getStageFile(PlayState.curStage));")
		
		bgshit()
		getcolor()
    end
end

function getcolor()
	if lowQuality == true then
		if not CustomBF then
			rgbbf = {getProperty('boyfriend.healthColorArray[0]'), getProperty('boyfriend.healthColorArray[1]'), getProperty('boyfriend.healthColorArray[2]')}
		end
		
		if not CustomDAD then
			rgbdad = {getProperty('dad.healthColorArray[0]'), getProperty('dad.healthColorArray[1]'), getProperty('dad.healthColorArray[2]')}
		end
		
		if not CustomGF then
			rgbgf = {getProperty('gf.healthColorArray[0]'), getProperty('gf.healthColorArray[1]'), getProperty('gf.healthColorArray[2]')}
		end
		
		if color == '000000' then	
			if rgbbf[1] == 0 and rgbbf[2] == 0 and rgbbf[3] == 0 then
				for i = 0, 3 do
					rgbbf[i] = 255
				end
			end
			if rgbdad[1] == 0 and rgbdad[2] == 0 and rgbdad[3] == 0 then
				for i = 0, 3 do
					rgbdad[i] = 255
				end
			end
			if rgbgf[1] == 0 and rgbgf[2] == 0 and rgbgf[3] == 0 then
				for i = 0, 3 do
					rgbgf[i] = 255
				end
			end
		elseif color == 'FFFFFF' then
			if rgbbf[1] == 255 and rgbbf[2] == 255 and rgbbf[3] == 255 then
				for i = 0, 3 do
					rgbbf[i] = 255
				end
			end
			if rgbdad[1] == 255 and rgbdad[2] == 255 and rgbdad[3] == 255 then
				for i = 0, 3 do
					rgbdad[i] = 255
				end
			end
			if rgbgf[1] == 255 and rgbgf[2] == 255 and rgbgf[3] == 255 then
				for i = 0, 3 do
					rgbgf[i] = 255
				end
			end
		end
	end
end

function bgshit()
	if lowQuality == true then
		makeLuaSprite('ov', '', x, y)
		makeGraphic('ov', 1, 1, color)
		scaleObject('ov', 2000 * xs, 2000 * ys)
		setProperty('ov.alpha', 0.0001)
		addLuaSprite('ov', false)
	end
end

function onEvent(name, value1, value2)
	if lowQuality == true then
		if name == 'Colored Apple' then
			if value1 == '' or value1 == '0' then
				value1 = 0.1
			end
			if value2 ~= '' then
				doTweenZoom('zoomingyey', 'camGame', value2, value1, 'sineInOut')
			end
			if not converted then
				for _, u in ipairs(ui) do
					doTweenAlpha('fading' .. u, u, 0.0001, value1)
				end
				
				doTweenAlpha('fadingov', 'ov', 1, value1)
				
				runHaxeCode([[
					FlxTween.tween(game.boyfriend.colorTransform, { redOffset: ]]..rgbbf[1]..[[, greenOffset: ]]..rgbbf[2]..[[, blueOffset: ]]..rgbbf[3]..[[, redMultiplier: 0, greenMultiplier: 0, blueMultiplier: 0 }, ]].. value1 ..[[);
					FlxTween.tween(game.dad.colorTransform, { redOffset: ]]..rgbdad[1]..[[, greenOffset: ]]..rgbdad[2]..[[, blueOffset: ]]..rgbdad[3]..[[, redMultiplier: 0, greenMultiplier: 0, blueMultiplier: 0 }, ]].. value1 ..[[);
				]])
				
				if getProperty('gf.visible') or getProperty('gf.alpha') > 0 and not getProperty('stageData.hide_girlfriend') then
					runHaxeCode([[
						FlxTween.tween(game.gf.colorTransform, { redOffset: ]]..rgbgf[1]..[[, greenOffset: ]]..rgbgf[2]..[[, blueOffset: ]]..rgbgf[3]..[[, redMultiplier: 0, greenMultiplier: 0, blueMultiplier: 0 }, ]].. value1 ..[[);
					]])
				end
			else
				for _, u in pairs(ui) do
					doTweenAlpha('fading' .. u, u, 1, value1)
				end
				
				doTweenAlpha('fadingov', 'ov', 0.0001, value1)
				
				runHaxeCode([[
					FlxTween.tween(game.boyfriend.colorTransform, { redOffset: 0, greenOffset: 0, blueOffset: 1, redMultiplier: 1, greenMultiplier: 1, blueMultiplier: 1 }, ]].. value1 ..[[);
					FlxTween.tween(game.dad.colorTransform, { redOffset: 0, greenOffset: 0, blueOffset: 0, redMultiplier: 1, greenMultiplier: 1, blueMultiplier: 1 }, ]].. value1 ..[[);
				]])
				
				if getProperty('gf.visible') or getProperty('gf.alpha') > 0 and not getProperty('stageData.hide_girlfriend') then
					runHaxeCode([[
						FlxTween.tween(game.gf.colorTransform, { redOffset: 0, greenOffset: 0, blueOffset: 0, redMultiplier: 1, greenMultiplier: 1, blueMultiplier: 1 }, ]].. value1 ..[[);
					]])
				end
			end
		elseif name == 'Change Character' then
			getcolor()
		end
	end
end

function onTweenCompleted(tag)
	if lowQuality == true then
		if tag == 'zoomingyey' then
			setProperty("defaultCamZoom", getProperty('camGame.zoom')) 
		elseif tag == 'fadingov' then
			converted = not converted
		end
	end
end