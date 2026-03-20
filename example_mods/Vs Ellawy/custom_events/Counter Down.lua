function onEvent(name, value1, value2)
	if name == 'Counter Down' then
		runTimer('two', crochet / 1000);
	end
end

function onTimerCompleted(tag)
	if tag == 'two' then
		makeLuaSprite('two', 'ready', 289, 199);
		setObjectCamera('two', 'hud');
		setObjectOrder('two', 100);
		addLuaSprite('two', true);
		doTweenAlpha('twoAlpha', 'two', 0, crochet / 1000, 'cubeInOut');
		runTimer('one', crochet / 1000);
	elseif tag == 'one' then
		makeLuaSprite('one', 'set', 289, 199);
		setObjectCamera('one', 'hud');
		setObjectOrder('one', 100);
		addLuaSprite('one', true);
		doTweenAlpha('oneAlpha', 'one', 0, crochet / 1000, 'cubeInOut');
		runTimer('go', crochet / 1000);
	elseif tag == 'go' then
		makeLuaSprite('yoo', 'go', 361, 145);
		setObjectCamera('yoo', 'hud');
		setObjectOrder('yoo', 100);
		addLuaSprite('yoo', true);
		doTweenAlpha('yooAlpha', 'yoo', 0, crochet / 1000, 'cubeInOut');
	end
end