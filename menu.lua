

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------


  
-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view


logo=display.newImage("logo.png")
logo.x=display.contentCenterX; logo.y = display.actualContentHeight/5;
   sceneGroup:insert(logo);
 
 

 --------кнопка STORY

  local  tap1 = widget.newButton{
 width = display.actualContentWidth,
  --  height = 120,
    defaultFile = "story.png",
     onEvent = function ()  
      	 composer.gotoScene( true, "chooselevel", "slideLeft", 500  )
      	  end,
  }
  tap1.x = display.contentCenterX; tap1.y = display.actualContentHeight/2-50;
  sceneGroup:insert(tap1);





local loadedlevel =1
--загрузка пройденных уровней здесь
loadedlevel =1local levelTable={}
--загрузка пройденных уровней здесьlocal loadsave = require("loadsave")

if  loadsave.loadTable("turtle.hs", system.DocumentsDirectory) ~=nil then
levelTable = loadsave.loadTable("turtle.hs", system.DocumentsDirectory)elselevelTable[1]=0loadsave.saveTable(levelTable,"turtle.hs", system.DocumentsDirectory)end
loadedlevel= #levelTable


-----кнопка ARCADE
  local  tap2 = widget.newButton{
 width = display.actualContentWidth,
  --  height = 120,
    defaultFile = "arcade.png",
     }
  tap2.x = display.contentCenterX; tap2.y = display.actualContentHeight/2+100;
tap2.alpha = 0.5
 if loadedlevel>35 then
 	tap2.alpha = 1
  tap2:addEventListener( "touch", function ()  audio.stop( ); composer.gotoScene( true, "chooselevelA", "slideLeft", 500  ) end) 
end
  sceneGroup:insert(tap2);



local options = 
{
    --parent = textGroup,
text = [[
©2015 vadim.lyakh@gmail.com
 freemusic.fr, all-free-download.com]],     
    x = display.contentCenterX,
    y =display.actualContentHeight-300,
    width = 440,     --required for multi-line and alignment
    font = native.systemFontBold,   
    fontSize = 20,
    align = "center"  --new alignment parameter
}

local tap3 = display.newText( options )
tap3:setFillColor( 0, 0, 0 )
anchor.TopCenter(tap3)



sceneGroup:insert(tap3);
    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
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
		
if song==0 then
          

--textMute.text="SONG ON"
audio.stop (  )
               elseif song==1 then
            
	songPu = audio.loadSound("pu.wav")
songFit = audio.loadSound("fit.wav")
backgroundMusicChannel = audio.play(soundtrack, {loops = -1})
--textMute.text="SONG OFF"
              end
        
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
