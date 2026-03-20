xb = 430

function opponentNoteHit(id, data, type, sus)
    local health = getProperty('health')
    if health > 1.1 then
        setProperty('health', health - 0.008)
    end
end

function onCreate()
    setProperty('health', 2)
    doTweenAlpha('a5', 'healthBarBG', 0, 0.5, 'linear')
    doTweenAlpha('a6', 'healthBar', 0, 0.5, 'linear')
    doTweenAlpha('a8', 'iconP1', 0, 0.5, 'linear')
    doTweenAlpha('a9', 'iconP2', 0, 0.5, 'linear')
    doTweenX('asdba', 'healthBar', 100, 0.00000000001, 'linear')
    doTweenY('asdYYYba', 'healthBar', 100, 0.00000000001, 'linear')

    if not downscroll then
        makeLuaSprite('Bar3', 'Bar/Bar', 76, 610)
        addLuaSprite('Bar3', true)
        setProperty("Bar3.color", getColorFromHex("000000"))
        scaleObject('Bar3', 0.262 * 2.1, 0.25)
        setObjectCamera('Bar3', 'hud')

        makeLuaSprite('Bar', 'Bar/Bar', 430, 610)
        addLuaSprite('Bar', true)
        scaleObject('Bar', 0.262, 0.25)
        setObjectCamera('Bar', 'hud')

        makeLuaSprite('Bar2', 'Bar/Bar', 430, 610)
        addLuaSprite('Bar2', true)
        setProperty("Bar2.color", getColorFromHex("FF0000"))
        scaleObject('Bar2', 0.262, 0.25)
        setObjectCamera('Bar2', 'hud')

        makeLuaSprite('Silly_Healthbar', 'Bar/Silly_Healthbar', 0, 470)
        addLuaSprite('Silly_Healthbar', true)
        scaleObject('Silly_Healthbar', 0.5, 0.5)
        setObjectCamera('Silly_Healthbar', 'hud')

        makeLuaSprite('icon', 'Bar/icons/aishite/1', 250, 550)
        addLuaSprite('icon', true)
        setObjectCamera('icon', 'hud')

        makeLuaSprite('icon2', 'Bar/icons/aishite/2', 410, 545)
        addLuaSprite('icon2', true)
        setObjectCamera('icon2', 'hud')

        makeLuaSprite('icon3', 'Bar/icons/aishite/3', 260, 565)
        addLuaSprite('icon3', true)
        setObjectCamera('icon3', 'hud')

        makeLuaSprite('icon4', 'Bar/icons/aishite/4', 250 - 150, 565)
        addLuaSprite('icon4', true)
        setObjectCamera('icon4', 'hud')

        makeLuaSprite('icon5', 'Bar/icons/aishite/5', 250 - 150 - 150, 555)
        addLuaSprite('icon5', true)
        setObjectCamera('icon5', 'hud')

        makeLuaSprite('icon6', 'Bar/icons/aishite/6', 250 - 150 - 150 - 150, 565)
        addLuaSprite('icon6', true)
        setObjectCamera('icon6', 'hud')

        makeLuaSprite('icon7', 'Bar/icons/aishite/7', 250 - 150 - 150 - 150 - 160, 555)
        addLuaSprite('icon7', true)
        setObjectCamera('icon7', 'hud')

        setProperty('icon3.visible', false)
        setProperty('icon5.visible', false)
        setProperty('icon6.visible', false)
        setProperty('icon7.visible', false)

        setProperty('scoreTxt.x', -175)
        makeLuaSprite('bars', 'bars', -0, -0)
        scaleObject('bars', 1, 1)
        setObjectCamera('bars', 'hud')
        setObjectOrder('scoreTxt', 93)
    else
        makeLuaSprite('Bar3', 'Bar/Bar', 76, 610 - 550)
        addLuaSprite('Bar3', true)
        setProperty("Bar3.color", getColorFromHex("000000"))
        scaleObject('Bar3', 0.262 * 2.1, 0.25)
        setObjectCamera('Bar3', 'hud')

        makeLuaSprite('Bar', 'Bar/Bar', 430, 610 - 550)
        addLuaSprite('Bar', true)
        scaleObject('Bar', 0.262, 0.25)
        setObjectCamera('Bar', 'hud')

        makeLuaSprite('Bar2', 'Bar/Bar', 430, 610 - 550)
        addLuaSprite('Bar2', true)
        setProperty("Bar2.color", getColorFromHex("FF0000"))
        scaleObject('Bar2', 0.262, 0.25)
        setObjectCamera('Bar2', 'hud')

        makeLuaSprite('Silly_Healthbar', 'Bar/Silly_Healthbar', 0, 470 - 550)
        addLuaSprite('Silly_Healthbar', true)
        scaleObject('Silly_Healthbar', 0.5, 0.5)
        setObjectCamera('Silly_Healthbar', 'hud')

        makeLuaSprite('icon', 'Bar/icons/aishite/1', 250, 550 - 550)
        addLuaSprite('icon', true)
        setObjectCamera('icon', 'hud')

        makeLuaSprite('icon2', 'Bar/icons/aishite/2', 410, 545 - 550)
        addLuaSprite('icon2', true)
        setObjectCamera('icon2', 'hud')

        makeLuaSprite('icon3', 'Bar/icons/aishite/3', 260, 565 - 550)
        addLuaSprite('icon3', true)
        setObjectCamera('icon3', 'hud')

        makeLuaSprite('icon4', 'Bar/icons/aishite/4', 250 - 150, 565 - 550)
        addLuaSprite('icon4', true)
        setObjectCamera('icon4', 'hud')

        makeLuaSprite('icon5', 'Bar/icons/aishite/5', 250 - 150 - 150, 555 - 550)
        addLuaSprite('icon5', true)
        setObjectCamera('icon5', 'hud')

        makeLuaSprite('icon6', 'Bar/icons/aishite/6', 250 - 150 - 150 - 150, 565 - 550)
        addLuaSprite('icon6', true)
        setObjectCamera('icon6', 'hud')

        makeLuaSprite('icon7', 'Bar/icons/aishite/7', 250 - 150 - 150 - 150 - 160, 555 - 550)
        addLuaSprite('icon7', true)
        setObjectCamera('icon7', 'hud')

        setProperty('icon3.visible', false)
        setProperty('icon5.visible', false)
        setProperty('icon6.visible', false)
        setProperty('icon7.visible', false)

        setProperty('scoreTxt.x', -175)
        makeLuaSprite('bars', 'bars', -0, -0)
        scaleObject('bars', 1, 1)
        setObjectCamera('bars', 'hud')
        setObjectOrder('scoreTxt', 93)
    end
end
function onUpdate()
 -------
 local health = getProperty('health')
 local scaleFactor = 0.262
 local decrement = 0.0131
 
 if health <= 2 and health >= 1 then
	 local steps = math.floor((2 - health) / 0.05)
	 scaleObject('Bar', scaleFactor - (decrement * steps), 0.25)
 end
 if getProperty('health') < 1.25 then
	  setProperty('icon2.visible',false)
	  setProperty('icon.visible',true)
		 end
		 if getProperty('health') > 1.25 then
			 setProperty('icon2.visible',true)
			 setProperty('icon.visible',false)
				 end
 if getProperty('health') < 1 then
	 scaleObject('Bar',0.262-0.0131*20,0.25)
		 end
		 if getProperty('health') < 0.95 then
			 setProperty('health',0)
				 end
----------------------------------
local health = getProperty('health')
local scaleIncrement = 0.013
local baseX = xb - 17.5

if health >= 2 then
    scaleObject('Bar2', 0, 0.25)
else
    local steps = math.floor((2 - health) / 0.05)
    local scale = scaleIncrement * steps
    local newX = baseX - 17.5 * steps
    
    scaleObject('Bar2', scale, 0.25)
    setProperty('Bar2.x', newX)
end
end