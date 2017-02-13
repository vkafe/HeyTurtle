--
-- Project: main.lua
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2014 . All Rights Reserved.
-- 
local _M = {}
 
local mFloor = math.floor
local sGetInfo = system.getInfo
local sGetTimer = system.getTimer
 
local prevTime = 0
_M.added = true
local function createText()
    local memory = display.newText('00 00.00 000',10,0, 'Helvetica', 50);
   -- memory:setReferencePoint(display.TopCenterReferencePoint)   anchor.TopCenter(memory)
    memory.x, memory.y = display.contentCenterX, display.screenOriginY
    function memory:tap ()
        collectgarbage('collect')
        if _M.added then
            Runtime:removeEventListener('enterFrame', _M.labelUpdater)
            _M.added = false
        else
            Runtime:addEventListener('enterFrame', _M.labelUpdater)
            _M.added = true
        end
    end
    memory:addEventListener('tap', memory)
    return memory
end
 
function _M.labelUpdater(event)
    local curTime = sGetTimer()
    _M.text.text = tostring(mFloor( 1000 / (curTime - prevTime))) .. ' ' ..
            tostring(mFloor(sGetInfo('textureMemoryUsed') * 0.0001) * 0.01) .. ' ' ..
            tostring(mFloor(collectgarbage('count')))
    _M.text:toFront()
    prevTime = curTime
end
 
function _M:newPerformanceMeter()
    self.text = createText(self)
    Runtime:addEventListener('enterFrame', _M.labelUpdater)
end
 
return _M