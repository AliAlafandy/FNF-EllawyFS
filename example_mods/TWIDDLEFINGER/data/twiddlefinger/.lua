
luaDebugMode = true

function onCreatePost()
addCharacterToList('nugget');
addCharacterToList('nugget_hat');
addCharacterToList('maxpro');
addCharacterToList('rednughat');
addCharacterToList('rednugget');
addCharacterToList('redmax');
    if downscroll then
        setProperty('iconP1.y',-40)
        setProperty('iconP2.y',-40)
        for i = 0, getProperty('playerStrums.length') - 1 do
            setPropertyFromGroup('playerStrums', i, 'y', getPropertyFromGroup('playerStrums', i, 'y') + 200)
        end
    end
    --
    setProperty('camHUD.zoom',0.8)
end

local hudZoom = 0.8

function lerp(a, b, t)
    return a + (b - a) * t
end

function onUpdatePost(elapsed)
 
    if getProperty('camZooming') then
        setProperty('camHUD.zoom', lerp(hudZoom, getProperty('camHUD.zoom'), math.exp(-elapsed * 3.125 * getProperty('camZoomingDecay') * playbackRate)))
    end
end

function onSongStart()
    hudZoom = 0.6
end


function onCreate()
    
makeLuaSprite('batteryColor', 'barwhiteohio', 490, 721)
if downscroll then
    makeLuaSprite('batteryColor', 'barwhiteohio', 490, 721-700)
end
    setProperty('batteryColor.antialiasing', true)
    setObjectCamera('batteryColor', 'hud')
    addLuaSprite('batteryColor', true)
end
function onUpdate()
    local health = getProperty('health')
    setProperty('batteryColor.color',so)
    if health >= 2 then
       so = 0x21EF36 
    elseif health >= 1.5 then
     so = 0x92EF58
    elseif health >= 1 then
        so = 0xF1DB5C
    elseif health >= 0.5 then
        so = 0xCA5427 
    else
        so = 0xCD3323
    end
end