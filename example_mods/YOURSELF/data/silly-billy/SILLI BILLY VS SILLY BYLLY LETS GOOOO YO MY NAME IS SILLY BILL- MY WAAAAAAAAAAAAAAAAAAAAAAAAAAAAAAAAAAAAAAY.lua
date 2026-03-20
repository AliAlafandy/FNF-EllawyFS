function onSongStart()
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
                setObjectOrder('notes.members[0]',3)
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

    if (getProperty('idk.animation.curAnim.finished')) == true then
		makeAnimatedLuaSprite('idk2','Bar/icons/lirycsspritesthatifoundonawiki,idonotknowwhomadethemsorry2',770,410)
		addAnimationByPrefix('idk2', 'idle', 'lirycs', 31, false);
		addLuaSprite('idk2',true)
		removeLuaSprite('idk',true)
		setProperty('idk2.antialiasing', false);
		  scaleObject('idk2',2.4,2.4)
	end
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

 makeLuaSprite('broken_mirrorx','bg/broken_mirror',0,0)
addLuaSprite('broken_mirrorx')
 scaleObject('broken_mirrorx',1,1)

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
    function onStepHit()
        if curStep == 3481 then
            setProperty("defaultCamZoom",1.2)
    doTweenAlpha('xdxdxdxd','camGame',0,0.25,'lineal')
        end
        if curStep> 3336 and curStep<3883 then
            doTweenAlpha('a', 'timeBar', 0, 0.5, 'linear') 
            doTweenAlpha('a8', 'icon6', 0, 0.5, 'linear') 
            doTweenAlpha('a9', 'icon7', 0, 0.5, 'linear') 
            doTweenAlpha('a9asd', 'icon', 0, 0.5, 'linear') 
            doTweenAlpha('a9zzzzz', 'icon2', 0, 0.5, 'linear') 
            doTweenAlpha('a2', 'timeBarBG', 0, 0.5, 'linear') 
            doTweenAlpha('a3', 'timeTxt', 0, 0.5, 'linear') 
            doTweenAlpha('a4', 'scoreTxt', 0, 0.5, 'linear') 
            doTweenAlpha('a5', 'Bar', 0, 0.5, 'linear') 
            doTweenAlpha('a6', 'Bar2',0, 0.5, 'linear') 
            doTweenAlpha('a6213XDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD', 'Bar3',0, 0.5, 'linear') 
            doTweenAlpha('a6EMMANUELALFREDOMOJICA', 'Silly_Healthbar',0, 0.5, 'linear') 
            noteTweenAlpha('Esadasd',4 , 0, 0.5, 'lineal')
            noteTweenAlpha('Fsadasd',5 , 0 ,0.5, 'lineal')
            noteTweenAlpha('Gsadasd',6 , 0 , 0.5,'lineal')
            noteTweenAlpha('Hsadasd',7 , 0 , 0.5,'lineal')
        end
        
        if curStep > 3624 then
            noteTweenAlpha('Esadasd',4 , 1, 0.5, 'lineal')
                noteTweenAlpha('Fsadasd',5 , 1 ,0.5, 'lineal')
                noteTweenAlpha('Gsadasd',6 , 1 , 0.5,'lineal')
                noteTweenAlpha('Hsadasd',7 , 1 , 0.5,'lineal')
        end
        if curStep> 3495 and curStep<3883 then
        
            if not middlescroll then
                noteTweenX('playadada', 4, 415, 1,        'lineal')
                noteTweenX('playadadaa', 5, 525, 1,        'lineal')
                noteTweenX('playadaaaad', 6, 635, 1,       'lineal')
                noteTweenX('playaaaaaaaaaadad', 7, 745, 1, 'lineal')
            end       
        end
        if curStep> 4176 then
            noteTweenAlpha('Esadasd',4 , 0, 0.5, 'lineal')
            noteTweenAlpha('Fsadasd',5 , 0 ,0.5, 'lineal')
            noteTweenAlpha('Gsadasd',6 , 0 , 0.5,'lineal')
            noteTweenAlpha('Hsadasd',7 , 0 , 0.5,'lineal')
        setProperty('camGame.alpha',0)
        end
        if curStep == 3888 then
            removeLuaSprite('idk2',true)
            setProperty('dad.alpha',1)
            doTweenAlpha('dasd','videoSprite',0,0.125,'lineal')
            doTweenAlpha('xdxdxdxd','camGame',1,1,'lineal')
            --
            runHaxeCode('game.camGame.setFilters([new ShaderFilter(game.modchartSprites["blueShader"].shader)]);')
            runHaxeCode('game.camHUD.setFilters([new ShaderFilter(game.modchartSprites["blueShader"].shader)]);')
            noteTweenAlpha('A',4 , 760 , 1, quintOut)
            noteTweenAlpha('B',5 , 870 , 1, quintOut)
            noteTweenAlpha('C',6 , 980 , 1, quintOut)
            noteTweenAlpha('D',7 , 1090 , 1, quintOut)
            if not middlescroll then
                noteTweenX('playadada', 4,          760 , 1,        'lineal')
                noteTweenX('playadadaa', 5,         870 , 1,        'lineal')
                noteTweenX('playadaaaad', 6,        980 , 1,       'lineal')
                noteTweenX('playaaaaaaaaaadad', 7,  1090, 1, 'lineal')
        
        end
        end
    if curStep == 3440 then
        doTweenAlpha('aSDasdasdasdDd','INTRO',1,0.065,'lineal')
    end
    if curStep == 3443 then
        playSound('mirror_break')
        removeLuaSprite('bgAssetsx')
    end
    if curStep == 3445 then
        doTweenAlpha('aSDasdasdasdDd','INTRO',0,0.5,'lineal')
    end
        if curStep == 3363 then
            makeAnimatedLuaSprite('idk','Bar/icons/lirycsspritesthatifoundonawiki,idonotknowwhomadethemsorry',770,410)
            addAnimationByPrefix('idk', 'idle', 'lirycs', 31, false);
             addLuaSprite('idk',false)
              scaleObject('idk',2.4,2.4)
              setProperty('idk.antialiasing', false);
    setProperty('dad.alpha',0)
        end
        if curStep > 133 and curStep < 3495 then
            doTweenAlpha('dasd','videoSprite',0,0.125,'lineal')
            end
            if curStep == 3495 then
                makeVideoSprite('myCutscene', 'SO_STAY_FINAL', 0, 0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
                setProperty('myCutscene_video.alpha', 1) -- The _video is **REQUIRED**
                scaleObject('myCutscene_video',1,1)
                setObjectOrder('myCutscene_video', 2)
                setProperty('myCutscene_video.antialiasing', true);
                end
            
    end