function onCreate()
	makeLuaSprite('videoMark', 'waterMark', 0, 0);
	addLuaSprite('videoMark');
	scaleObject('videoMark', 1, 1);
	setObjectCamera('videoMark', 'other');
	setObjectOrder('videoMark', 0);
end

function onUpdatePost()
	setProperty('timeBar.y', 640);
	setProperty('timeBar.scale.x', 3);
	setObjectCamera('timeBar', 'other');
	setTimeBarColors('FF0000', 'FFFFFF');
	
	setTextFont('timeTxt', 'Google.ttf')
	setTextBorder('timeTxt', 0, 'FFFFFF')
	setTextString('timeTxt', formatTime(getSongPosition() - noteOffset) .. ' / ' .. formatTime(songLength))
	setProperty('timeTxt.x', -15);
	setProperty('timeTxt.y', 665);
	setObjectCamera('timeTxt', 'other');
	
	setProperty('iconP1.x', 1040);
	setProperty('iconP2.x', 100);
	
	setHealthBarColors('0000FF', '5DED2A')
	
	if downscroll == false then
		setProperty('scoreTxt.y', 610);
		setProperty('iconP1.y', 500);
		setProperty('iconP2.y', 500);
		setProperty('healthBar.y', 560);
		setProperty('healthBarBG.y', 580);
	else
		setProperty('scoreTxt.y', 610 - 450);
		setProperty('iconP1.y', 500 - 450);
		setProperty('iconP2.y', 500 - 450);
		setProperty('healthBar.y', 560 - 450);
		setProperty('healthBarBG.y', 580 - 450);
		
		for i = 0, getProperty('unspawnNotes.length') - 1 do
			setPropertyFromGroup('playerStrums', i, 'y', 520)
			setPropertyFromGroup('opponentStrums', i, 'y', 520)
		end
	end
end

function formatTime(ms)
	s = math.floor(ms / 1000);
	return string.format('%01d:%02d', (s / 60) % 60, s % 60);
end 