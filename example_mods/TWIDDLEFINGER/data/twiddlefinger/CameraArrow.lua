local campointx = 0
local campointy = 0
local bfturn = false
local camMovement = 15
local velocity = 1
skibidiCount=0
op=1.9
function onMoveCamera(focus)
    if curStep <= 2080 or curStep >= 2208 then
        if curStep < 2528 then
    if focus == 'boyfriend' then
    campointx = getProperty('camFollow.x')
    campointy = getProperty('camFollow.y')
    bfturn = true
    elseif focus == 'dad' then
    campointx = getProperty('camFollow.x')
    campointy = getProperty('camFollow.y')
    bfturn = false
    setProperty('cameraSpeed', 0.5)
    end
    end
end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
    if curStep < 2528 then
    if bfturn then
        if direction == 0 then
            setProperty('camFollow.x', campointx - camMovement)
        elseif direction == 1 then
            setProperty('camFollow.y', campointy + camMovement)
        elseif direction == 2 then
            setProperty('camFollow.y', campointy - camMovement)
        elseif direction == 3 then
            setProperty('camFollow.x', campointx + camMovement)
        end
        setProperty('cameraSpeed', velocity) 
end
end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if curStep <= 2080 or curStep >= 2208 then
        if curStep < 2528 then
    if not bfturn then
        if direction == 0 then
            setProperty('camFollow.x', campointx - camMovement)
        elseif direction == 1 then
            setProperty('camFollow.y', campointy + camMovement)
        elseif direction == 2 then
            setProperty('camFollow.y', campointy - camMovement)
        elseif direction == 3 then
            setProperty('camFollow.x', campointx + camMovement)
        end
        setProperty('cameraSpeed', velocity)
    end    
end
end
end
function onSongStart()
    setProperty('camFollow.x',3700)
end
function onCreatePost()
    precacheImage('bgasset')
    initLuaShader('scary') makeLuaSprite('scary') setObjectCamera('scary', 'hud') setSpriteShader('scary', 'scary')  
    setProperty('sha.x',1)
    setProperty('sha2.x',0) 
end
function onCreate()
    makeLuaSprite('sha', '', 5, -600)
    addLuaSprite('sha', false)

    makeLuaSprite('sha2', '', 5, -600)
    addLuaSprite('sha2', false)

    makeLuaSprite('White', '', 0,0)
    makeGraphic('White', 1200, 3000, '000000')
    addLuaSprite('White', false)
    setObjectCamera('White', 'other')

makeLuaSprite('hpbar', 'hpbar', 468,674)
if downscroll then

    makeLuaSprite('hpbar', 'hpbar', 468,674-700)
end
addLuaSprite('hpbar', true)
scaleObject('hpbar',1,1)
setObjectCamera('hpbar', 'hud')

setProperty('iconP1.y',getProperty('iconP1.y')+85)
setProperty('iconP2.y',getProperty('iconP2.y')+95)
end

function onBeatHit()
    if curBeat == 448 and quegodwe then
        triggerEvent('Change Character','0','nugget_hat')
        triggerEvent('Play Animation','hatapear','bf')
    end

    if curBeat == 449 then
        doTweenX('scaleX2', 'helpMeButton.scale', 0, 0.25, 'EasiInElastic')
        doTweenY('scaleY2', 'helpMeButton.scale', 0, 0.25, 'EasiInElastic')
    end
    if curBeat == 392 then
        makeLuaSprite('helpMeButton', 'here2', 645, 150)
        setProperty('helpMeButton.scale.x', 0)
        setProperty('helpMeButton.scale.y', 0)
        updateHitbox('helpMeButton')
        setObjectCamera('helpMeButton', 'camOther')
        setProperty('helpMeButton.antialiasing', true)
        addLuaSprite('helpMeButton')
        doTweenX('scaleX', 'helpMeButton.scale', 0.3, 1, 'ElasticOut')
        doTweenY('scaleY', 'helpMeButton.scale', 0.3, 1, 'ElasticOut')
    end
    if curBeat == 390 then
        doTweenAlpha('ca','uiGroup',0,1,'linear')
        doTweenAlpha('hpbar','hpbar',0,1,'linear')
        doTweenAlpha('batteryColor','batteryColor',0,1,'linear')
    local fadeOutTime = 1 
    for i = 0, 7 do
        noteTweenAlpha('noteFadeOut' .. i, i, 0, fadeOutTime, 'linear')
    end
    end
    if curBeat == 328 then
        cameraFlash('game','FF0000',0.5)
    end
    
    if curBeat == 264 then
        cameraFlash('game','FF0000',0.5)
        doTweenX('asdasd','sha',5,0.1,'EaseInOutCubic')
        doTweenX('asdaksd','sha2',0.6,0.1,'EaseInOutCubic')
        if buildTarget == 'android' then
            local videoPath = callMethodFromClass('backend.Paths', 'video', {'fire'})
            createInstance('myCutscene', 'backend.VideoSpriteManager', {165, 100, 3 * op, 3 * op})
            addInstance('myCutscene', true)
            callMethod('myCutscene.startVideo', {videoPath, true, 0})
            setProperty('myCutscene.alpha', 1)
            setBlendMode('myCutscene','add')
            scaleObject('myCutscene', 2 * op*2, 2 * op*2)
            setObjectCamera('myCutscene','hud')
            setProperty('myCutscene.alpha', 0.8)
            setObjectOrder('myCutscene', getObjectOrder('dadGroup')-10)
            setProperty('myCutscene.antialiasing', true)
        else
            makeVideoSprite('myCutscene', 'fire', 165, 100, 'hud', true)
            setBlendMode('myCutscene','add')
            scaleObject('myCutscene', 2 * op*2, 2 * op*2)
            setProperty('myCutscene.alpha', 0.8)
            setObjectOrder('myCutscene', getObjectOrder('dadGroup')-10)
            setProperty('myCutscene.antialiasing', true)
        end        
    end
if curBeat == 68 then
    doTweenAlpha('ca','uiGroup',0.5,1,'linear')
    doTweenAlpha('hpbar','hpbar',0.5,1,'linear')
    doTweenAlpha('batteryColor','batteryColor',0.5,1,'linear')
    doTweenX('asdasd','sha',5,1,'linear')
doTweenX('asdaksd','sha2',0.6,1,'linear')
local fadeOutTime = 1 
for i = 0, 7 do
    noteTweenAlpha('noteFadeOut' .. i, i, 0.5, fadeOutTime, 'linear')
end
elseif curBeat == 72 then
local fadeInTime =0.5 
for i = 0, 7 do
    noteTweenAlpha('noteFadeIn' .. i, i, 1, fadeInTime, 'linear')
end
doTweenX('asdasd','sha',1,0.5,'EaseInOutCubic')
doTweenX('asdaksd','sha2',0,0.5,'EaseInOutCubic')
doTweenAlpha('batteryColor','batteryColor',1,0.3,'linear')
    doTweenAlpha('hpbar','hpbar',1,0.3,'linear')
    doTweenAlpha('ca','uiGroup',1,0.3,'linear')
end
    scaleObject('iconP1', 1)
    scaleObject('iconP2', 1)

end
quegodwe=false
function onUpdatePost()
    if skibidiCount>=75 then
quegodwe=true
    end
    if curStep >1575 and curStep <1792 then
        if mouseReleased() then
            if getMouseX('other') >476 and getMouseX('other') <816 and getMouseY('other' )> 110 and getMouseY('other') <182 then
                cameraShake('other', 0.0025,0.1)
                doTweenX('scaleX', 'helpMeButton.scale', 0.325, 0.15, 'linear')
                doTweenY('scaleY', 'helpMeButton.scale', 0.325, 0.15, 'linear')
                runTimer('so',0.15)
                skibidiCount=skibidiCount+1
            end
        end
        
end  
    setProperty('iconP1.x',800)
    setProperty('iconP2.x',340)
setObjectOrder('iconP2',getObjectOrder('hpbar')+2)
end
function onTimerCompleted(tag)
if tag == 'so' then
    doTweenX('scaleX2', 'helpMeButton.scale', 0.3, 0.5, 'ElasticOut')
    doTweenY('scaleY2', 'helpMeButton.scale', 0.3, 0.5, 'ElasticOut')
end
end

function onUpdate()
    setShaderFloat('scary', 'strength', getProperty('sha.x')) 
    setShaderFloat('scary', 'darkness', getProperty('sha2.x'))
    if curStep > 2580 then
setProperty('cameraSpeed',0.3)
    end
    if buildTarget ~= 'android' then
    if curStep >= 1568 and curStep <= 1804 then
        setPropertyFromClass('flixel.FlxG', 'mouse.visible', true)
    else
        setPropertyFromClass('flixel.FlxG', 'mouse.visible', false)
    end
end
    if curStep >= 1563 and curStep <2070 then

        local boyfriendX = getProperty('boyfriend.x')+150
        local boyfriendY = getProperty('boyfriend.y')+145
    
        triggerEvent('Camera Follow Pos',boyfriendX,boyfriendY)
    end
    if quegodwe then
    if curStep >= 2070 and curStep <2336 then  
        local boyfriendX = getProperty('boyfriend.x')+250
        local boyfriendY = getProperty('boyfriend.y')-330
    triggerEvent('Camera Follow Pos',boyfriendX,boyfriendY)
    end
else
    if curStep >= 2070 and curStep <2336 then  
        local boyfriendX = getProperty('boyfriend.x')+200
        local boyfriendY = getProperty('boyfriend.y')-420
    triggerEvent('Camera Follow Pos',boyfriendX,boyfriendY)
    end
end
    if curStep == 0 then
      

    setProperty('cameraSpeed', 99)
    setProperty('camGame.zoom',0.85)
    local boyfriendX = getProperty('boyfriend.x')+225
    local boyfriendY = getProperty('boyfriend.y')-100

    setProperty('camFollow.x', boyfriendX)
    setProperty('camFollow.y', boyfriendY)
    else
        doTweenAlpha('asdad','White',0,0.25,'linear')
        setProperty('cameraSpeed', 1)
    end
end 
function onStepHit()
    if curStep == 1811 and quegodwe then
        for i = 1, 3 do
            removeLuaSprite('bg' .. i, false)
        end
        removeLuaSprite('sky', false)        
    end
    if curStep == 2336 and quegodwe then
        makeAnimatedLuaSprite('sky', 'bgasset', 0, 0)
        addAnimationByPrefix('sky', 'i', 'sky', 24, true)
        scaleObject('sky', 2.25*2, 2.25*2)
        addLuaSprite('sky', false)
        
        makeAnimatedLuaSprite('bg1', 'bgasset', 0, 0)
        addAnimationByPrefix('bg1', 'i', 'bg1', 24, true)
        scaleObject('bg1', 2.25*2, 2.25*2)
        addLuaSprite('bg1', false)
        
        makeAnimatedLuaSprite('bg2', 'bgasset', 0, 0)
        addAnimationByPrefix('bg2', 'i', 'bg2', 24, true)
        scaleObject('bg2',2.25*2, 2.25*2)
        addLuaSprite('bg2', false)
        
        makeAnimatedLuaSprite('bg3', 'bgasset', 0, 0)
        addAnimationByPrefix('bg3', 'i', 'bg3', 24, true)
        scaleObject('bg3', 2.25*2, 2.25*2)
        addLuaSprite('bg3', false)
        
        makeAnimatedLuaSprite('tree1', 'bgasset', -1200, 400)
        addAnimationByPrefix('tree1', 'i', 'tree', 24, true)
        setProperty('tree1.scrollFactor.x', 1.2)
        setProperty('tree1.scrollFactor.y', 1.2)
        setProperty('tree1.alpha', 0.9)
        scaleObject('tree1',2.25*2, 2.25*2)
        addLuaSprite('tree1', false)
        
        makeAnimatedLuaSprite('tree2', 'bgasset', 4000, 400)
        addAnimationByPrefix('tree2', 'i', 'tree', 24, true)
        setProperty('tree2.scrollFactor.x', 1.2)
        setProperty('tree2.scrollFactor.y', 1.2)
        setProperty('tree2.alpha', 0.9)
        scaleObject('tree2', 2.25*2, 2.25*2)
        addLuaSprite('tree2', false)
    end
    if curStep > 1811 and not quegodwe then
        for i = 1, 3 do
            removeLuaSprite('bg' .. i, false)
        end
        removeLuaSprite('sky', false)        
    end
    if curStep == 270 or curStep == 1050 then
        runHaxeCode([[ game.camGame.setFilters([ new ShaderFilter(game.getLuaObject('scary').shader) ]); game.camHUD.setFilters([]); ]])
    end
    if curStep == 308 then
        runHaxeCode([[ game.camGame.setFilters([]); game.camHUD.setFilters([]); ]])
    end
    ---
    if quegodwe then
        if curStep == 1813 then
            runHaxeCode([[ game.camGame.setFilters([]); game.camHUD.setFilters([]); ]])
        end
        if curStep == 2338 then
            runHaxeCode([[ game.camGame.setFilters([ new ShaderFilter(game.getLuaObject('scary').shader) ]); game.camHUD.setFilters([]); ]])
        end
    else
        if curStep == 1813 then
            runHaxeCode([[ game.camGame.setFilters([]); game.camHUD.setFilters([]); ]])
        end 
end
    --
    if curStep >2528 and curStep <2588 then
        triggerEvent('Camera Follow Pos',3500,3000)
    end
    if curStep >2588 then
        triggerEvent('Camera Follow Pos',3500,2000)
    end
    if curStep ==2588 then
        cameraFade('hud', '000000', 1, true)
        cameraFade('camGame', '000000', 2,true)
        triggerEvent('Camera Follow Pos',3500,2000)
    end
    if curStep == 2664 then
        if quegodwe then
        makeLuaSprite('Waterfall', 'goodEND', 40, 0);
        scaleObject('Waterfall', 0.6, 0.6);
        addLuaSprite('Waterfall', false);
        setObjectCamera('Waterfall','other')
        setProperty('Waterfall.alpha',0)
        doTweenAlpha('asdasd','Waterfall',1,2,'s')
        else
            makeLuaSprite('Waterfall', 'badEND', 166, 0);
            scaleObject('Waterfall',1, 1);
            addLuaSprite('Waterfall', false);
            setObjectCamera('Waterfall','other')
            setProperty('Waterfall.alpha',0)
            doTweenAlpha('asdasd','Waterfall',1,2,'s')
        end
    end
    if curStep == 2078 then
cameraFlash('other','FFFFFF',1)
if quegodwe then
    makeLuaSprite('mierda', '', 1550, -600)
    makeGraphic('mierda', 4200, 5000, '000000')
    addLuaSprite('mierda', false)
    setObjectCamera('mierda', 'game')
    updateHitbox('mierda')
    setProperty('s2.alpha',0)
    triggerEvent('Change Character','0','rednughat')
else

    makeLuaSprite('mierda', '', 1550, -600)
    makeGraphic('mierda', 4200, 5000, '000000')
    addLuaSprite('mierda', false)
    setObjectCamera('mierda', 'game')
    updateHitbox('mierda')
    setProperty('myCutscene.alpha',0)
    setProperty('s2.alpha',0)
    setProperty('myGraphic.alpha',0)
    triggerEvent('Change Character','1','redmax')
    triggerEvent('Change Character','0','rednugget')
    setProperty('dad.x', getProperty('dad.x') + 400)
    setProperty('dad.alpha', 0.5)
    setProperty('boyfriend.x', getProperty('boyfriend.x') - 1050)
    setProperty('boyfriend.y', getProperty('boyfriend.y') + 500)
end
    end
    if curStep == 2208 then
        cameraFlash('other','FF0000',1)
        if quegodwe then
            setProperty('dad.alpha',0)
            if buildTarget == 'android' then
                -- Configuración específica para Android usando createInstance y callMethod
                local videoPath = callMethodFromClass('backend.Paths', 'video', {'good_finale'})
            
                createInstance('myCutscene3', 'backend.VideoSpriteManager', {11 + 330, 46 + 170, 1.5 * 2, 1.5 * 2})
                addInstance('myCutscene3', true)
                callMethod('myCutscene3.startVideo', {videoPath, false, 0})
                setProperty('myCutscene3.alpha', 1)
                setScrollFactor('myCutscene3', 0, 0)
                scaleObject('myCutscene3', 1.5 * 2, 1.5 * 2)
                setProperty('myCutscene3.alpha', 1)
                setProperty('s2.alpha', 1)
                setObjectOrder('myCutscene3', getObjectOrder('dadGroup') + 50)
                setProperty('myCutscene3.antialiasing', true)
            else
                -- Configuración para otras plataformas usando makeVideoSprite
                makeVideoSprite('myCutscene3', 'good_finale', 11 + 330, 46 + 170, 'game', false)
                setProperty('myCutscene3.alpha', 1)
                scaleObject('myCutscene3', 1.5 * 2, 1.5 * 2)
                setScrollFactor('myCutscene3', 0, 0)
                setProperty('myCutscene3.alpha', 1)
                setProperty('s2.alpha', 1)
                setObjectOrder('myCutscene3', getObjectOrder('dadGroup') + 50)
                setProperty('myCutscene3.antialiasing', true)
            end
            
        else
            setProperty('dad.alpha',0)
            setProperty('boyfriend.alpha',0)
            setProperty('s2.alpha',1)
            setProperty('myGraphic.alpha',1)
            if buildTarget == 'android' then
                -- Configuración específica para Android usando createInstance y callMethod
                local videoPath = callMethodFromClass('backend.Paths', 'video', {'bad_finale'})
            
                createInstance('myCutscene3', 'backend.VideoSpriteManager', {-340 + 480, -200 + 270, 1.2 * 2, 1.2 * 2})
                addInstance('myCutscene3', true)
                callMethod('myCutscene3.startVideo', {videoPath, false, 0})
                setProperty('myCutscene3.alpha', 1)
                scaleObject('myCutscene3', 1.2 * 2, 1.2 * 2)
                setScrollFactor('myCutscene3', 0, 0)
                setProperty('myCutscene3.alpha', 1)
                setObjectOrder('myCutscene3', getObjectOrder('dadGroup') + 50)
                setProperty('myCutscene3.antialiasing', true)
            else
                -- Configuración para otras plataformas usando makeVideoSprite
                makeVideoSprite('myCutscene3', 'bad_finale', -340 + 480, -200 + 270, 'game', false)
                setProperty('myCutscene3.alpha', 1)
                scaleObject('myCutscene3', 1.2 * 2, 1.2 * 2)
                setScrollFactor('myCutscene3', 0, 0)
                setProperty('myCutscene3.alpha', 1)
                setObjectOrder('myCutscene3', getObjectOrder('dadGroup') + 50)
                setProperty('myCutscene3.antialiasing', true)
            end
            
        end
            end
            if curStep == 2336 then
                cameraFlash('other','FF0000',1)
                if quegodwe then
                    if buildTarget == 'android' then
                        local videoPath = callMethodFromClass('backend.Paths', 'video', {'fire'})
                        createInstance('myCutscenef', 'backend.VideoSpriteManager', {165, 100, 3 * op, 3 * op})
                        addInstance('myCutscenef', true)
                        callMethod('myCutscenef.startVideo', {videoPath, true, 0})
                        setProperty('myCutscenef.alpha', 1)
                        setBlendMode('myCutscenef','add')
                        scaleObject('myCutscenef', 2 * op*2, 2 * op*2)
                        setObjectCamera('myCutscenef','hud')
                        setProperty('myCutscenef.alpha', 0.8)
                        setObjectOrder('myCutscenef', getObjectOrder('dadGroup')-10)
                        setProperty('myCutscenef.antialiasing', true)
                    else
                        makeVideoSprite('myCutscene', 'fire', 165, 100, 'hud', true)
                        setBlendMode('myCutscene','add')
                        scaleObject('myCutscene', 2 * op*2, 2 * op*2)
                        setProperty('myCutscene.alpha', 0.8)
                        setObjectOrder('myCutscene', getObjectOrder('dadGroup')-10)
                        setProperty('myCutscene.antialiasing', true)
                    end
                    doTweenX('asdasd','sha',5,0.1,'EaseInOutCubic')
                    doTweenX('asdaksd','sha2',0.6,0.1,'EaseInOutCubic')
                    
                    setProperty('dad.alpha',1)
                    triggerEvent('Change Character','0','nugget_hat')
                    setProperty('s2.alpha',0)
                    setProperty('mierda.alpha',0)
                    setProperty('myGraphic.alpha',0)
                    setObjectOrder('myCutscene3',getObjectOrder('dadGroup')+50)
                    setProperty('myCutscene3.antialiasing', true);
                end
                    end
    if curStep ==1806 then
        doTweenX('asdasd','sha',1,0.1,'EaseInOutCubic')
doTweenX('asdaksd','sha2',0,0.1,'EaseInOutCubic')
        cameraFlash('hud','000000',0.5)
        scaleObject('myCutscene',0,0)
        stopVideoSprite('myCutscene')
        makeLuaSprite('myGraphic', '',  -500, -1620);
        makeGraphic('myGraphic', 1791*1.5, 1080*1.5, '000000')
        setObjectCamera('myGraphic', 'hud') 
        addLuaSprite('myGraphic', false) 
    
            makeLuaSprite('s2', '',  -500, 700);
            makeGraphic('s2', 1791*1.5, 1080*1.5, '000000')
            setObjectCamera('s2', 'hud') 
            addLuaSprite('s2', false) 

            if quegodwe == true then
                if buildTarget == 'android' then
                    -- Configuración específica para Android usando createInstance y callMethod
                    local videoPath = callMethodFromClass('backend.Paths', 'video', {'lyrics_good'})
                
                    createInstance('myCutscene2', 'backend.VideoSpriteManager', {140, 70, 1.2 * op, 1.2 * op})
                    addInstance('myCutscene2', true)
                    callMethod('myCutscene2.startVideo', {videoPath, false, 0})
                    setProperty('myCutscene2.alpha', 1)
                    scaleObject('myCutscene2', 1.2 * op, 1.2 * op)
                    setScrollFactor('myCutscene2', 0, 0)
                    setObjectOrder('myCutscene2', getObjectOrder('dadGroup') + 50)
                    setProperty('myCutscene2.antialiasing', true)
                else
                    -- Configuración para otras plataformas usando makeVideoSprite
                    makeVideoSprite('myCutscene2', 'lyrics_good', 140, 70, 'game', false)
                    setProperty('myCutscene2.alpha', 1)
                    scaleObject('myCutscene2', 1.2 * op, 1.2 * op)
                    setScrollFactor('myCutscene2', 0, 0)
                    setProperty('myCutscene2.alpha', 1)
                    setObjectOrder('myCutscene2', getObjectOrder('dadGroup') + 50)
                    setProperty('myCutscene2.antialiasing', true)
                end
                
            end
            if quegodwe == false then
                if buildTarget == 'android' then
                    -- Configuración específica para Android usando createInstance y callMethod
                    local videoPath = callMethodFromClass('backend.Paths', 'video', {'lyrics_bad'})
                
                    createInstance('myCutscene2', 'backend.VideoSpriteManager', {140, 70, 1.2 * op, 1.2 * op})
                    addInstance('myCutscene2', true)
                    callMethod('myCutscene2.startVideo', {videoPath, false, 0})
                    setProperty('myCutscene2.alpha', 1)
                    setScrollFactor('myCutscene2', 0, 0)
                    scaleObject('myCutscene2', 1.2 * op, 1.2 * op)
                    setObjectOrder('myCutscene2', getObjectOrder('dadGroup') + 50)
                    setProperty('myCutscene2.antialiasing', true)
                else
                    -- Configuración para otras plataformas usando makeVideoSprite
                    makeVideoSprite('myCutscene2', 'lyrics_bad', 140, 70, 'game', false)
                    setProperty('myCutscene2.alpha', 1)
                    scaleObject('myCutscene2', 1.2 * op, 1.2 * op)
                    setScrollFactor('myCutscene2', 0, 0)
                    setObjectOrder('myCutscene2', getObjectOrder('dadGroup') + 50)
                    setProperty('myCutscene2.antialiasing', true)
                end
                
            end
end
    if curStep ==1936 then
    for i = 0, 7 do
        noteTweenAlpha('noteFadeOut' .. i, i, 1, 1, 'linear')
    end
end
end
function onEvent(name, value1, value2)
        if value1 == 'subs' then
            makeLuaText('subsxd', value2, 1200, 50, 720)
            setTextSize('subsxd', 58)

            setTextAlignment('subsxd', 'center')
            setObjectCamera('subsxd', 'camHUD')
            setProperty('subsxd.alpha', 1)
            setTextFont('subsxd', 'mottrfmn.ttf')
            addLuaText('subsxd', false)
            setObjectOrder('subsxd', getObjectOrder('uiGroup') -1)
        end
end
