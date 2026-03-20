local defaultHudX = 0
local camHudAngle = 0

game = 'camGame'
hud = 'camHUD'
other = 'camOther'

function onEvent(name, value1, value2)
	if name == "Swinging" then
		if value1 == "on" then
			doTweenAngle('gameTurn', game, 1.5, crochet / 400, 'sineInOut')
			doTweenAngle('hudTurn', hud, 1.5, crochet / 400, 'sineInOut')
			doTweenAngle('otherTurn', other, 1.5, crochet / 400, 'sineInOut')
			
			function onTweenCompleted(tag)
				if tag == 'gameTurn' then
					doTweenAngle('gameTurn1', game, -1.5, crochet / 400, 'sineInOut')
					doTweenAngle('hudTurn1', hud, -1.5, crochet / 400, 'sineInOut')
					doTweenAngle('otherTurn1', other, -1.5, crochet / 400, 'sineInOut')
				end
				if tag == 'gameTurn1' then
					doTweenAngle('gameTurn', game, 1.5, crochet / 400, 'sineInOut')
					doTweenAngle('hudTurn', hud, 1.5, crochet / 400, 'sineInOut')
					doTweenAngle('otherTurn', other, 1.5, crochet / 400, 'sineInOut')
				end
			end
		end
		if value1 == "off" then
			setProperty('camGame.angle', 0);
			setProperty('camHUD.angle', 0);
			setProperty('camOther.angle', 0);
			
			function onTweenCompleted(tag)
				if tag == 'gameTurn' then
					setProperty('camGame.angle', 0);
					setProperty('camHUD.angle', 0);
					setProperty('camOther.angle', 0);
				end
				if tag == 'gameTurn1' then
					setProperty('camGame.angle', 0);
					setProperty('camHUD.angle', 0);
					setProperty('camOther.angle', 0);
				end
			end
		end
	end
end