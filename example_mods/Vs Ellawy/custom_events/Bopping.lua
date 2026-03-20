game = 'camGame'
hud = 'camHUD'
other = 'camOther'

function onEvent(name, value1, value2)
	if name == 'Bopping' then
		function onBeatHit()
			if curBeat % 2 == 0 then
				setProperty('camGame.angle', value1 * 5)
				doTweenAngle('gameTween', game, 0, 0.5, 'backOut')
				
				setProperty('camHUD.angle', value1 * 5)
				doTweenAngle('hudTween', hud, 0, 0.5, 'backOut')
				
				setProperty('camOther.angle', value1 * 5)
				doTweenAngle('otherTween', other, 0, 0.5, 'backOut')
			else
				setProperty('camGame.angle', value1 * -5)
				doTweenAngle('gameTween', game, 0, 0.5, 'backOut')
				
				setProperty('camHUD.angle', value1 * -5)
				doTweenAngle('hudTween', hud, 0, 0.5, 'backOut')
				
				setProperty('camOther.angle', value1 * -5)
				doTweenAngle('otherTween', other, 0, 0.5, 'backOut')
			end
		end
	end
end