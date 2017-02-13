print ('choce level')
--composer.removeScene("play",false)
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------


loadedlevel =1local levelTable={}
--загрузка пройденных уровней здесьlocal loadsave = require("loadsave")

if  loadsave.loadTable("turtle.hs", system.DocumentsDirectory) ~=nil then
levelTable = loadsave.loadTable("turtle.hs", system.DocumentsDirectory)elselevelTable[1]=0loadsave.saveTable(levelTable,"turtle.hs", system.DocumentsDirectory)end
loadedlevel= #levelTable
--	song=tonumber(datavars[2])
	






-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
	







local level={} 

local i=0
for y=0,6,1 do
for x=0,40,10 do
	
i=i+1
if i==13 then i=i+1 end
level[x+y+1]=display.newImageRect( "stone.png",100, 99 )
level[x+y+1].x=11*x+100
level[x+y+1].y=110*y+140
level[x+y+1].rotation=math.random(360)
level[x+y+1].alpha=0.5
level[x+y+1].number=i

if level[x+y+1].number<=loadedlevel then 
	 level[x+y+1].alpha=1

--if level[x+y+1].number==15 then level[x+y+1].number="level6"  end
	
	  level[x+y+1]:addEventListener( "touch", function ()  composer.gotoScene( "play", {effect = 'slideLeft', time = 500, params ={level=level[x+y+1].number}}) end) 
 end

sceneGroup:insert(level[x+y+1])
display.newText( sceneGroup,  level[x+y+1].number, level[x+y+1].x, level[x+y+1].y, native.systemFontBold, 50 )

if levelTable[i]==1 then	local star= display.newImageRect(sceneGroup,"star.png",70,70)	star.x=level[x+y+1].x+30	star.y=level[x+y+1].y+30	 end


end


end

--[[
closeButton=display.newImageRect("close.png",razmerSprites/2,razmerSprites/2)
closeButton.x=600
closeButton.y=100
closeButton:addEventListener( "tap", function () composer.gotoScene( "menu", {effect = 'slideRight', time = 800}) end) 
sceneGroup:insert( closeButton ) 
--]]
	

end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene
