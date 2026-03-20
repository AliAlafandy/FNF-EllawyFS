local campointx = 0
local campointy = 0
local bfturn = bool
local camMovement = 25
local velocity = 2.5

function onSongStart()
    campointx = getProperty('camFollow.x')
    campointy = getProperty('camFollow.y')
end    

function onMoveCamera(focus)
	if focus == 'boyfriend' then
            campointx = getProperty('camFollow.x')
            campointy = getProperty('camFollow.y')
            bfturn = true
	elseif focus == 'dad' then
            campointx = getProperty('camFollow.x')
            campointy = getProperty('camFollow.y')
            bfturn = false
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
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
    end
end   

-- delete this if you dont want the oponent to move the camera
function opponentNoteHit(id, direction, noteType, isSustainNote)
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
    end
end