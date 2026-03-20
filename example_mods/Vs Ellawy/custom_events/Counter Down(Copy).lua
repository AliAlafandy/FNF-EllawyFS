function onEvent(name, value1, value2)
	if name == 'Counter Down' then
		if value1 == 'three' then
			makeLuaSprite('three', '', 0, 0);
			scaleObject('three', 1, 1);
			addLuaSprite('three', true);
			doTweenAlpha('threeAlpha', 'three', 0, 1, 'cubeOut');
		elseif value1 == 'two' then
			makeLuaSprite('two', 'ready', 300, 200);
			scaleObject('two', 1, 1);
			addLuaSprite('two', true);
			doTweenAlpha('twoAlpha', 'two', 0, 1, 'cubeOut');
		elseif value1 == 'one' then
			makeLuaSprite('one', 'set', 300, 200);
			scaleObject('one', 1, 1);
			addLuaSprite('one', true);
			doTweenAlpha('oneAlpha', 'one', 0, 1, 'cubeOut');
		elseif value1 == 'go' then
			makeLuaSprite('yoo', 'go', 360, 160);
			scaleObject('yoo', 1, 1);
			addLuaSprite('yoo', true);
			doTweenAlpha('yooAlpha', 'yoo', 0, 1, 'cubeOut');
		end
		if value2 == 'three' then
			setProperty('three.visible', false)
		elseif value2 == 'two' then
			setProperty('two.visible', false)
		elseif value2 == 'one' then
			setProperty('one.visible', false)
		elseif value2 == 'go' then
			setProperty('yoo.visible', false)
		end
		
		setObjectCamera('three', 'hud')
		setObjectCamera('two', 'hud')
		setObjectCamera('one', 'hud')
		setObjectCamera('yoo', 'hud')
	end
end