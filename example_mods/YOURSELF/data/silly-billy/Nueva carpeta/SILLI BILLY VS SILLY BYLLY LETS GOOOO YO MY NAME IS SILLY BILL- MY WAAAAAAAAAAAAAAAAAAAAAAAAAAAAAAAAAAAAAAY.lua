function onSongStartl()
    makeVideoSprite('myCutscene', 'open', 200, 125, 'other', false) -- tag, videoFile, x, y, camera, shouldLoop
    setProperty('myCutscene_video.alpha', 1) -- The _video is **REQUIRED**
    scaleObject('myCutscene_video',1.55,1.55)
    setProperty('myCutscene_video.antialiasing', true);
end
function onBeatHit()
	if curBeat % 1 == 0 and curStep >2065 and curStep <3363 then
		triggerEvent('Add Camera Zoom','','')
		end
	if curBeat %2 == 0 then
		function onSpawnNote(id,noteData,noteType,isSustainNote)
            if not getProperty('notes.members[0].mustPress') then
                setObjectOrder('notes.members[0]', 3)
            else
                callMethod('add', {instanceArg('notes.members[0]')})
                setObjectCamera('notes.members[0]', 'hud')
            end
			if not getPropertyFromGroup('notes', i, 'mustPress') then
			if noteData == 3 then
				setPropertyFromGroup('notes',i,'multSpeed',0.65)
			end
			if noteData == 2 then
				setPropertyFromGroup('notes',i,'multSpeed',0.65)
			end
			if noteData== 1 then
				setPropertyFromGroup('notes',i,'multSpeed',0.65)
			end
			if noteData == 0 then
				setPropertyFromGroup('notes',i,'multSpeed',0.65)
			end
		end
			end
	end
	if curBeat %4 == 0 then
		function onSpawnNote(id,noteData,noteType,isSustainNote)
            if not getProperty('notes.members[0].mustPress') then
                setObjectOrder('notes.members[0]', 3)
            else
                callMethod('add', {instanceArg('notes.members[0]')})
                setObjectCamera('notes.members[0]', 'hud')
            end
			if not getPropertyFromGroup('notes', i, 'mustPress') then
			if noteData == 3 then
				setPropertyFromGroup('notes',i,'multSpeed',1.35)
				end
			if noteData == 2 then
				setPropertyFromGroup('notes',i,'multSpeed',1.35)
				end
			if noteData== 1 then
				setPropertyFromGroup('notes',i,'multSpeed',1.35)
			end
			if noteData == 0 then
				setPropertyFromGroup('notes',i,'multSpeed',1.35)
			end
		end
			end
	   end
end
function onCreatePost()
    runHaxeCode([[
	
    for (no in game.unspawnNotes)
    {
        if(!no.mustPress)
        no.cameras = [game.camGame];
        no.scrollFactor.set(1, 1);
    }

    // opponent and player strums
    for (n in game.opponentStrums)
    {
        n.cameras = [game.camGame];
        n.scrollFactor.set(1, 1);
    }
   
]])
callMethod('noteGroup.remove', {instanceArg('notes')})
end
function onSpawnNote()
    if not getProperty('notes.members[0].mustPress') then
        setObjectOrder('notes.members[0]', 3)
    else
        callMethod('add', {instanceArg('notes.members[0]')})
        setObjectCamera('notes.members[0]', 'hud')
    end
end
function onCreate()
    setObjectOrder('dadGroup',300)
    setProperty('skipCountdown',true)
    stage()
end


function onUpdate()
   
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes',i,'x',getProperty('dadGroup.x') + (-10)+ (200 * (i % 4)))
        setPropertyFromGroup('strumLineNotes',i,'y',getProperty('dadGroup.y') - (downscroll and -300 or 300))
end


    for i = 0,3 do
		setPropertyFromGroup('strumLineNotes', i, 'scale.x', 1)
		setPropertyFromGroup('strumLineNotes', i, 'scale.y', 1)
		setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
		setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.5)
		end
		for i=0, getProperty('notes.length')-1 do
			if not getPropertyFromGroup('notes', i, 'mustPress') then
			if getPropertyFromGroup('notes', i, 'noteType') == '' then
				setPropertyFromGroup('notes', i, 'scale.x', 1-0.1)
				setPropertyFromGroup('notes', i, 'scale.y', 1-0.1)
				if  getPropertyFromGroup('notes',i,'isSustainNote')  then
					setPropertyFromGroup('notes', i, 'scale.x', 1.25-0.1)
					setPropertyFromGroup('notes', i, 'scale.y', 1.25-0.1)
				end
			end
		end
	end
	if getProperty('Silly_clouds.alpha') == 1 then
		doTweenAlpha('asdasdasdasdasdasdasdasdoz','Silly_clouds',0,4,'lineal')
			end
			if getProperty('Silly_clouds.alpha') == 0 then
				doTweenAlpha('asdasdasdasdasdasdasdasdoz','Silly_clouds',1,3,'lineal')
					end

end
function stage()
--
makeLuaSprite('bars','bars',-0,-0)
scaleObject('bars',1,1)
setObjectCamera('bars','hud')

makeLuaSprite('broken_mirror','bg/broken_mirror',0,0)
addLuaSprite('broken_mirror')
 scaleObject('broken_mirror',1,1)

 
  makeLuaSprite('bgAssetsx','bg/silly_mirror',0,0)
  addLuaSprite('bgAssetsx')
   scaleObject('bgAssetsx',1,1)

   makeLuaSprite('INTRO', '', -950, -600)
   luaSpriteMakeGraphic('INTRO', 4000, 3000, 'FFFFFF')
   addLuaSprite('INTRO', false)
setProperty('INTRO.alpha',0)



  makeAnimatedLuaSprite('bgAssets','bg/bgAssets',0,0)
  addAnimationByPrefix('bgAssets', 'idle', 'Silly_floor', 24, true);
   addLuaSprite('bgAssets')
    scaleObject('bgAssets',1,1)


	makeAnimatedLuaSprite('bgAssets2','bg/bgAssets',0,0)
	addAnimationByPrefix('bgAssets2', 'idle', 'Silly_idk_1', 24, true);
	 addLuaSprite('bgAssets2')
	  scaleObject('bgAssets2',1,1)

	  makeAnimatedLuaSprite('bgAssets3','bg/bgAssets',0,0)
	  addAnimationByPrefix('bgAssets3', 'idle', 'Silly_idk_2', 24, true);
	   addLuaSprite('bgAssets3')
		scaleObject('bgAssets3',1,1)

		makeLuaSprite('Silly_clouds','bg/Silly_clouds',0,0)
addLuaSprite('Silly_clouds')
 scaleObject('Silly_clouds',1,1)

--
			  makeLuaSprite('vignette','vignette',0,0)
	   addLuaSprite('vignette',false)
	   setObjectCamera('vignette','hud')
		scaleObject('vignette',1,1)
		addLuaSprite('bars')
	end