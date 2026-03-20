local fireVideo
local videoGood
local videoBad
local finaleBad
local finaleGood

local shader

local tiktokCam

local helpBarT
local helpBarB
local helpMeButton
local helpButtonAllowedToScale = false
local helpButtonClickCap = 75
local helpButtonCount = 0

local subtitles

local helpMeMode = false
local succeededHelping = false

local batteryBar
local batteryColor

local scale = 2.25

local fakeBG

local mainBG = {}

local zoomTween
local shaderTweens = {}

local bfOGPos = {}

local goodImage
local badImage

function generateBG()
  
end

function onCreate()
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
    
    --
    tiktokCam = makeLuaCamera('tiktokCam')
    setProperty('tiktokCam.bgColor', 0x0)
    setObjectCamera('tiktokCam', 'other')
    addLuaCamera('tiktokCam', true)

    generateBG()

    addCharacterToList('nugget', 'dad')
    addCharacterToList('nugget_hat', 'dad')
    addCharacterToList('maxpro', 'boyfriend')

    addCharacterToList('rednughat', 'dad')
    addCharacterToList('rednugget', 'dad')
    addCharacterToList('redmax', 'boyfriend')

    fakeBG = makeLuaSprite('fakeBG', 'og', 2000, 1200)
    scaleObject(fakeBG, 1.75, 1.75)
    setProperty('fakeBG.antialiasing', true)
    addLuaSprite(fakeBG, false)

    shader = createRuntimeShader('scary')
    setShaderFloat('shader', 'strength', 1)
    setShaderFloat('shader', 'darkness', 0.0)
    addShader('shader')

    fireVideo = makeLuaSprite('fireVideo', 'fire', 0, 0)
    setProperty('fireVideo.antialiasing', true)
    setProperty('fireVideo.alpha', 0.3)
    setProperty('fireVideo.scrollFactor.x', 1.1)
    setProperty('fireVideo.scrollFactor.y', 1.1)
    addLuaSprite(fireVideo, false)

    videoBad = makeLuaSprite('videoBad', 'lyrics_bad', 0, 0)
    videoGood = makeLuaSprite('videoGood', 'lyrics_good', 0, 0)
    finaleBad = makeLuaSprite('finaleBad', 'bad_finale', 0, 0)
    finaleGood = makeLuaSprite('finaleGood', 'good_finale', 0, 0)

    setProperty('finaleBad.antialiasing', true)
    setProperty('finaleGood.antialiasing', true)
    setProperty('videoGood.antialiasing', true)
    setProperty('videoBad.antialiasing', true)

    addLuaSprite(videoBad, false)
    addLuaSprite(videoGood, false)
    addLuaSprite(finaleBad, false)
    addLuaSprite(finaleGood, false)

    -- set up HUD and other initializations here
end

function setupHUD()
    setProperty('showCombo', false)
    setProperty('showRating', false)
    setProperty('showComboNum', false)

    for i = 0, getProperty('opponentStrums.length') - 1 do
        setPropertyFromGroup('opponentStrums', i, 'x', -1000)
    end

    setProperty('healthBar.visible', false)
    setProperty('scoreTxt.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)


    for i = 0, getProperty('playerStrums.length') - 1 do
        setPropertyFromGroup('playerStrums', i, 'y', getPropertyFromGroup('playerStrums', i, 'y') - 100)
    end

    batteryBar = makeLuaSprite('batteryBar', 'hpbar', 0, 0)
    screenCenter(batteryBar, 'x')
    setProperty('batteryBar.y', getProperty('screenHeight') - getProperty('batteryBar.height') + 50)
    setProperty('batteryBar.antialiasing', true)
    addLuaSprite(batteryBar, true)

    batteryColor = makeLuaSprite('batteryColor', 'barwhiteohio', 0, 0)
    screenCenter(batteryColor, 'x')
    setProperty('batteryColor.y', getProperty('screenHeight') - getProperty('batteryBar.height') + 50)
    setProperty('batteryColor.x', getProperty('batteryBar.x') + 22)
    setProperty('batteryColor.y', getProperty('batteryBar.y') + 47)
    setProperty('batteryColor.color', getColor())
    setProperty('batteryColor.antialiasing', true)
    addLuaSprite(batteryColor, true)

    -- more HUD setup here
end

function onCreatePost()
    precacheImage('bgasset')
    setupHUD()
    setProperty('camOffset', 25)

    cacheHelpMe()

    bfOGPos = {getProperty('boyfriend.x'), getProperty('boyfriend.y')}
    setProperty('boyfriend.x', getProperty('boyfriend.x') - 700)
    for i, bg in ipairs(mainBG) do
        setProperty(bg .. '.alpha', 0.01)
    end

    introCam()

    subtitles = makeLuaText('subtitles', '', getProperty('screenWidth'), 0, getProperty('screenHeight') - 100)
    setTextSize(subtitles, 48)
    setTextAlignment(subtitles, 'center')
    setTextFont(subtitles, 'mottrfmn.ttf')
    addLuaText(subtitles)
end

function onUpdatePost(elapsed)
    if helpMeMode and not succeededHelping then
        local s = lerp(getProperty('helpMeButton.scale.x'), 0.35, elapsed * 30)
        scaleObject('helpMeButton', s, s)
        if math.abs(s - 0.35) < 0.01 then
            helpButtonAllowedToScale = false
        end
    end

    local numValue = lerp(getProperty('batteryColor.scale.x'), math.clamp(helpButtonCount / helpButtonClickCap, 0.01, 1), elapsed * 5)
    scaleObject('batteryColor', numValue, getProperty('batteryColor.scale.y'))

    if helpButtonCount == helpButtonClickCap then
        succeededHelping = true
        helpButtonCount = helpButtonCount + 1
        setProperty('helpMeButton.alpha', 0)
        setProperty('helpMeButton.active', false)
    end
end