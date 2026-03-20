start = 0
finish = 0

function onCreate()
	makeLuaSprite('UpperBar', nil, 0, -200)
	makeGraphic('UpperBar', 1500, 200, '000000')
	setObjectCamera('UpperBar', 'hud')
	setObjectOrder('UpperBar', 0)
	addLuaSprite('UpperBar', false)
	
	makeLuaSprite('LowerBar', nil, 0, 730)
	makeGraphic('LowerBar', 1500, 200, '000000')
	setObjectCamera('LowerBar', 'hud')
	setObjectOrder('LowerBar', 0)
	addLuaSprite('LowerBar', false)
end

function onUpdate()
	if start == 1 then
		doTweenY('Cinematics1', 'UpperBar', -100, 0.2, 'Linear')
		doTweenY('Cinematics2', 'LowerBar', 630, 0.2, 'Linear')
		
		doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
		doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
		doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.25)
		doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.25)
		doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.25)
	end
	if finish == 2 then
		doTweenY('Cinematics1', 'UpperBar', -200, 0.5, 'Linear')
		doTweenY('Cinematics2', 'LowerBar', 730, 0.5, 'Linear')
		
		doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
		doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
		doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
		doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.25)
		doTweenAlpha('AlphaTween5', 'iconP2', 1, 0.25)
	end
	
	function onEvent(name, value1, value2)
		if name == 'Cinematics' then
			start = tonumber(value1)
			finish = tonumber(value2)
		end
	end
end