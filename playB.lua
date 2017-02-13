print ("play Levels Creator")
--print(" event.params in start="..event.params.level)

--composer.removeScene( “choce level”, false )
--composer.removeScene("chooselevel")
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------






---код приведения


local ghostAnimsheetInfo = require("ghostAnim")
local ghostAnimmyImageSheet = graphics.newImageSheet( "ghostAnim.png", ghostAnimsheetInfo:getSheet() )

local ghostAnimsequenceData = {
  { name = "go", start = 1, count = 1,  time = 1000,  loopCount = 0,  loopDirection = "forward" }
 
}


	






---код черепахи---------------------------------------------------------


local turtleWalksheetInfo = require("turtleWalk")
local turtleWalkmyImageSheet = graphics.newImageSheet( "turtleWalk.png", turtleWalksheetInfo:getSheet() )

local turtleWalksequenceData = {
  { name = "walk", frames={ 1,2,3,4,1}, time=200, loopCount=3 },  --add loopCount=4
  { name = "stay", frames={ 1} , time=250 }
}

 -- display.newSprite( turtleWalkmyImageSheet , turtleWalksequenceData ) ; turtleWalksprite.xScale=1/2; turtleWalksprite.yScale=1/2

--turtleWalksprite.x=200
--turtleWalksprite.y=200

--turtleWalksprite:setSequence( "walk" )
--turtleWalksprite:play()


function showSelector(event)
	
	if selectorGroup.isVisible  then
		 selectorGroup.isVisible=false
		 scene._globalSceneObj.isVisible=true 
		 else
		  scene._globalSceneObj.isVisible=false
		  selectorGroup.isVisible=true 
		 end
	
end

function selectItem(event)
	currentItem:removeEventListener( "tap", showSelector )
	currentItem:addEventListener( "tap", selectItem )
	currentItem.x=event.target.x
	currentItem.y=event.target.y
	selectorGroup:insert( currentItem )
selectorGroup.isVisible=false
 scene._globalSceneObj.isVisible=true 
currentItem=event.target
currentItem:removeEventListener( "tap",selectItem  )

currentItem.x=150
currentItem.y=100
gameFieldGroup:insert( currentItem ) 
--scene._globalSceneObj:insert( currentItem ) 
timer.performWithDelay( 1000, function() currentItem:addEventListener( "tap",showSelector  ) end  )


--print("hallo")
end

function setitem(event)
	--print("setitem current item"..currentItem.i)

if gameField [event.target.posex][event.target.posey].i~=0 and currentItem.i==36 then
gameField [event.target.posex][event.target.posey]:removeSelf()
gameField [event.target.posex][event.target.posey].i=0
end

if gameField [event.target.posex][event.target.posey].i==0 and currentItem.i<turtleSheetItem then  
	gameField [event.target.posex][event.target.posey]=display.newImageRect(imageSheet,currentItem.i,razmerSprites,razmerSprites)
gameField [event.target.posex][event.target.posey].i=currentItem.i
gameField [event.target.posex][event.target.posey].x=event.target.x
gameField [event.target.posex][event.target.posey].y=event.target.y
 gameFieldGroup:insert(  gameField [event.target.posex][event.target.posey] ) 
--scene._globalSceneObj:insert(  ) 
end

if gameField [event.target.posex][event.target.posey].i==0 and currentItem.i==turtleSheetItem then  
	gameField [event.target.posex][event.target.posey]=display.newSprite( turtleWalkmyImageSheet , turtleWalksequenceData ) 
gameField [event.target.posex][event.target.posey].xScale=1/3; gameField [event.target.posex][event.target.posey].yScale=1/3
gameField [event.target.posex][event.target.posey].i=currentItem.i
gameField [event.target.posex][event.target.posey].x=event.target.x
gameField [event.target.posex][event.target.posey].y=event.target.y
 gameFieldGroup:insert(  gameField [event.target.posex][event.target.posey] ) 
--scene._globalSceneObj:insert( gameField [event.target.posex][event.target.posey] ) 
end

if gameField [event.target.posex][event.target.posey].i==0 and currentItem.i==ghostSheetItem then  
	gameField [event.target.posex][event.target.posey]=display.newSprite( ghostAnimmyImageSheet , ghostAnimsequenceData ) 
gameField [event.target.posex][event.target.posey].xScale=1/2; gameField [event.target.posex][event.target.posey].yScale=1/2 
gameField [event.target.posex][event.target.posey].i=currentItem.i
gameField [event.target.posex][event.target.posey].x=event.target.x
gameField [event.target.posex][event.target.posey].y=event.target.y
 gameFieldGroup:insert(  gameField [event.target.posex][event.target.posey] ) 
--scene._globalSceneObj:insert( gameField [event.target.posex][event.target.posey] ) 
end


--print("setitem end="..gameField [event.target.posex][event.target.posey].i)

end




gameFieldGroup  = display.newGroup()
FieldGroup  = display.newGroup()


require( "testGame" )

function playLevel()
	
	--print ("play constructed level")
pauseButton.isVisible=true
playButton.isVisible=false
gameFieldGroup.isVisible=false
testGameGroup= display.newGroup()

testGame.start(testGameGroup,gameField)
end

function pauseLevel()
	
--	print ("pause constructed level")
pauseButton.isVisible=false
playButton.isVisible=true
gameFieldGroup.isVisible=true
testGame.stop()
testGameGroup:removeSelf()
end

---------------------------------------------
--local fileName="turtle.map"
local function textListener( event )
     if ( event.phase == "began" ) then
        -- user begins editing defaultField
      elseif ( event.phase == "ended" or event.phase == "submitted" ) then
    local loadsave = require("loadsave")
     mapTable[nextNum]={} 
 local i=1
  mapTable[nextNum][1]=event.target.text
 for x=1,xKletok,1 do
  	for y=1,yKletok,1 do
  		i=i+1
  	  mapTable [nextNum][i]=gameField [x][y].i
  	 end
 end
loadsave.saveTable(mapTable, fileName, system.DocumentsDirectory)
 
local alert = native.showAlert( "Good!", "Map is saved as  ".. mapTable[nextNum][1], { "OK" } )
 native.setKeyboardFocus( nil )
        defaultField:removeSelf()
     rect:removeSelf()
     FieldGroup.isVisible=true
    elseif ( event.phase == "editing" ) then
          -- local txt = event.text
              if(string.len(event.target.text)>21)then
                     event.target.text=string.sub(event.target.text, 1, 21)
              end
    end
end






UNcodeTable={}
UNcodeTable["A"]=1
UNcodeTable["B"]=2
UNcodeTable["C"]=3
UNcodeTable["D"]=4
UNcodeTable["E"]=5
UNcodeTable["F"]=6
UNcodeTable["G"]=7
UNcodeTable["H"]=8
UNcodeTable["I"]=9
UNcodeTable["J"]=10
UNcodeTable["K"]=11
UNcodeTable["L"]=12
UNcodeTable["M"]=13
UNcodeTable["N"]=14
UNcodeTable["O"]=15
UNcodeTable["P"]=16
UNcodeTable["Q"]=17
UNcodeTable["R"]=18
UNcodeTable["S"]=19
UNcodeTable["T"]=20
UNcodeTable["U"]=21
UNcodeTable["V"]=22
UNcodeTable["W"]=23
UNcodeTable["X"]=24
UNcodeTable["Y"]=25
UNcodeTable["Z"]=26
UNcodeTable["a"]=27
UNcodeTable["b"]=28
UNcodeTable["c"]=29
UNcodeTable["d"]=30
UNcodeTable["e"]=31
UNcodeTable["f"]=32
UNcodeTable["g"]=33
UNcodeTable["h"]=34
UNcodeTable["i"]=35
UNcodeTable["j"]=36
UNcodeTable["k"]=37
UNcodeTable["l"]=38
UNcodeTable["m"]=39
UNcodeTable["n"]=40
UNcodeTable["o"]=41
UNcodeTable["p"]=42
UNcodeTable["q"]=43
UNcodeTable["r"]=44
UNcodeTable["s"]=45
UNcodeTable["t"]=46
UNcodeTable["u"]=47
UNcodeTable["v"]=48
UNcodeTable["w"]=49
UNcodeTable["x"]=50
UNcodeTable["y"]=51
UNcodeTable["z"]=52



local function  inputLeveltextListener( event )
     if ( event.phase == "began" ) then
        -- user begins editing defaultField
      elseif ( event.phase == "ended" or event.phase == "submitted" ) then
     
     for x=1,xKletok,1 do
      for y=1,yKletok,1 do
      	if gameField [x][y].i~=0 then  gameField [x][y].i=0; gameField [x][y]:removeSelf()
      		 end
      end
     end
     
     
     -- gameFieldGroup:removeSelf()
    --  gameFieldGroup  = display.newGroup()
      local i=0     local mapText=event.target.text      mapText=mapText.."zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz" 
      for x=1,xKletok,1 do
      for y=1,yKletok,1 do
      	
      	i=i+1      	      	      	
      local   current=UNcodeTable[string.char(string.byte(mapText, i) )]      
     
      	  
      	 if  current<turtleSheetItem then  
	gameField [x][y]=display.newImageRect(imageSheet,current,razmerSprites,razmerSprites)

  	gameField [x][y].i=current	 
      gameField [x][y].x=x*razmerKletki-30
  	gameField [x][y].y=y*razmerKletki+150
      gameFieldGroup:insert(  gameField [x][y] )
  	elseif   current==turtleSheetItem then  
	 gameField [x][y]=display.newSprite( turtleWalkmyImageSheet , turtleWalksequenceData ) 
 gameField [x][y].xScale=1/3;  gameField [x][y].yScale=1/3
      gameField [x][y].i=current	 
      gameField [x][y].x=x*razmerKletki-30
  	gameField [x][y].y=y*razmerKletki+150
      gameFieldGroup:insert(  gameField [x][y] )
      elseif   current==ghostSheetItem then  
	 gameField [x][y]=display.newSprite( ghostAnimmyImageSheet , ghostAnimsequenceData ) 
 gameField [x][y].xScale=1/2;  gameField [x][y].yScale=1/2 
      gameField [x][y].i=current	 
      gameField [x][y].x=x*razmerKletki-30
  	gameField [x][y].y=y*razmerKletki+150
      gameFieldGroup:insert(  gameField [x][y] )
      	 end
      
      	end
end

   --gameField [x][y].i=event.target.text здесь декодировать текс в карту
-- 
  --	
  	--	i=i+1
 -- 	  mapTable [nextNum][i]=gameField [x][y].i
 -- 	 

 

 native.setKeyboardFocus( nil )
        defaultField:removeSelf()
     rect:removeSelf()
     FieldGroup.isVisible=true
    elseif ( event.phase == "editing" ) then
          -- local txt = event.text
              if(string.len(event.target.text)>36)then
                     event.target.text=string.sub(event.target.text, 1, 36)
              end
    end
end


codeTable={}
codeTable[1]="A"
codeTable[2]="B"
codeTable[3]="C"
codeTable[4]="D"
codeTable[5]="E"
codeTable[6]="F"
codeTable[7]="G"
codeTable[8]="H"
codeTable[9]="I"
codeTable[10]="J"
codeTable[11]="K"
codeTable[12]="L"
codeTable[13]="M"
codeTable[14]="N"
codeTable[15]="O"
codeTable[16]="P"
codeTable[17]="Q"
codeTable[18]="R"
codeTable[19]="S"
codeTable[20]="T"
codeTable[21]="U"
codeTable[22]="V"
codeTable[23]="W"
codeTable[24]="X"
codeTable[25]="Y"
codeTable[26]="Z"
codeTable[27]="a"
codeTable[28]="b"
codeTable[29]="c"
codeTable[30]="d"
codeTable[31]="e"
codeTable[32]="f"
codeTable[33]="g"
codeTable[34]="h"
codeTable[35]="i"
codeTable[36]="j"
codeTable[37]="k"
codeTable[38]="l"
codeTable[39]="m"
codeTable[40]="n"
codeTable[41]="o"
codeTable[42]="p"
codeTable[43]="q"
codeTable[44]="r"
codeTable[45]="s"
codeTable[46]="t"
codeTable[47]="u"
codeTable[48]="v"
codeTable[49]="w"
codeTable[50]="x"
codeTable[51]="y"
codeTable[52]="z"



function codeLevel()
local levelString=""

 for x=1,xKletok,1 do
 	  	for y=1,yKletok,1 do
 	  		  
 	  		
 	  		
  	if gameField [x][y].i==0 then  levelString=levelString..codeTable[math.random(38,52)]
  		else 
  		levelString=levelString..codeTable[gameField [x][y].i]
  		 end
  	 end
 end

return levelString
end

function inputLevel(event)

 FieldGroup.isVisible=false

rect=display.newRect(0,0,display.actualContentWidth, display.actualContentHeight)
--anchor.TopLeft( rect)
rect:setFillColor(0)
rect.alpha=0.6
rect.x= display.contentCenterX
rect.y=display.contentCenterY

 defaultField =native.newTextField( display.contentWidth/2, display.contentHeight/3, 450, 100)
 defaultField.size=50
defaultField:setReturnKey( "done" )
                                                 -----здесь кодировать текущюю карту
defaultField.text = codeLevel()
defaultField:setSelection( 0, 36 )
defaultField:addEventListener( "userInput", inputLeveltextListener )
native.setKeyboardFocus( defaultField )
rect:addEventListener ( "tap", function() native.setKeyboardFocus( nil ); defaultField:removeSelf(); FieldGroup.isVisible=true; rect:removeSelf() end )



end




function enterMapName(event)
local loadsave = require("loadsave")
isTurtle=false
 for x=1,xKletok,1 do
 	  	for y=1,yKletok,1 do
  	if gameField [x][y].i== turtleSheetItem then  isTurtle=true end
  	 end
 end
if isTurtle then
 mapTable= {}
 nextNum=1

if  loadsave.loadTable(fileName, system.DocumentsDirectory) ~=nil then
mapTable = loadsave.loadTable(fileName, system.DocumentsDirectory)
nextNum=#mapTable+1
 end


--mapName=    ----------------------------  mapName= сюда имя карты перед записью ????? 
 FieldGroup.isVisible=false

rect=display.newRect(0,0,display.actualContentWidth, display.actualContentHeight)
--anchor.TopLeft( rect)
rect:setFillColor(0)
rect.alpha=0.6
rect.x= display.contentCenterX
rect.y=display.contentCenterY

 defaultField =native.newTextField( display.contentWidth/2, display.contentHeight/3, 450, 100)
 defaultField.size=50
defaultField:setReturnKey( "done" )
defaultField.text = "Map name "..nextNum
defaultField:setSelection( 0, 11 )
defaultField:addEventListener( "userInput", textListener )
native.setKeyboardFocus( defaultField )
rect:addEventListener ( "tap", function() native.setKeyboardFocus( nil ); defaultField:removeSelf(); FieldGroup.isVisible=true; rect:removeSelf() end )
else 
local alert = native.showAlert( "Warning!", "Where is turtle?", { "OK" } )
return
end
end










-- "scene:create()"
function scene:create( event )

 local sceneGroup = self.view
scene._globalSceneObj = sceneGroup
    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
   -- print(" event.params in create="..event.params.level)


---рисуем игровое поле 

gameField= {}

 for x=1,xKletok,1 do
 	gameField[x]={}
  	for y=1,yKletok,1 do

  	gameField [x][y]=display.newRect( 0, 0, 95, 95 )
  	gameField [x][y].x=x*razmerKletki-30
  	gameField [x][y].y=y*razmerKletki+150
  	gameField [x][y].posex=x
	  gameField [x][y].posey=y
	  gameField [x][y].i=0
  	gameField [x][y].alpha=0.2
  gameField [x][y]:addEventListener( "tap", setitem) 
  	 FieldGroup:insert(  gameField [x][y] ) 
 end
 end

gameFieldGroup:insert( FieldGroup ) 
sceneGroup:insert(  gameFieldGroup ) 
--
closeButton=display.newImageRect("close.png",razmerSprites/2,razmerSprites/2)
closeButton.x=600
closeButton.y=100
closeButton:addEventListener( "tap", function () composer.gotoScene( "menu", {effect = 'slideRight', time =500}) end) 
gameFieldGroup:insert( closeButton ) 





---------------------------------------------------------------------- save button



saveButton=display.newImageRect("disk.png",razmerSprites/2,razmerSprites/2)--display.newImage("disk.png")
saveButton.x=500
saveButton.y=100
saveButton:addEventListener( "tap", enterMapName) 
gameFieldGroup:insert( saveButton ) 
--sceneGroup

inputButton=display.newImageRect("input.png",razmerSprites/2,razmerSprites/2)--display.newImage("disk.png")
inputButton.x=300
inputButton.y=100
inputButton:addEventListener( "tap", inputLevel) 
gameFieldGroup:insert( inputButton ) 


playButton=display.newImageRect("play.png",razmerSprites/2,razmerSprites/2)--display.newImage("disk.png")
playButton.x=400
playButton.y=100
playButton:addEventListener( "tap", playLevel) 
sceneGroup:insert( playButton ) 

pauseButton=display.newImageRect("pause.png",razmerSprites/2,razmerSprites/2)
pauseButton.x=400
pauseButton.y=100
pauseButton.isVisible=false
pauseButton:addEventListener( "tap", pauseLevel) 
sceneGroup:insert( pauseButton ) 

selectorGroup = display.newGroup()

selector=display.newRect(330,400 , 600, 610 )
selectorGroup:insert( selector)
--gameFieldGroup:insert( selectorGroup ) 


local  options =
{
    --required parameters
    width = 200,
    height = 200,
    numFrames = gameItems,

    --optional parameters; used for scaled content support
    sheetContentWidth =1200 ,  -- width of original 1x size of entire sheet
    sheetContentHeight = 1200 -- height of original 1x size of entire sheet
}
imageSheet = graphics.newImageSheet( "zagotovki.png", options )  

local nabor
 local i=0
 for x=1,xKletok,1 do
   	for y=1,yKletok,1 do

 i=i+1
if i<=gameItems then
  	nabor=display.newImageRect(imageSheet,i,razmerSprites,razmerSprites)
  	nabor.i=i
  	nabor:addEventListener( "tap", selectItem )
  	nabor.x=x*razmerKletki-30
  	nabor.y=y*razmerKletki+50
  	 elseif  i==gameItems+1 then 
  	  nabor=display.newSprite( turtleWalkmyImageSheet , turtleWalksequenceData ) 
nabor.xScale=1/3; nabor.yScale=1/3
nabor.i=gameItems+1
------ добавили черепаху
  	  nabor:addEventListener( "tap", selectItem )
  	  nabor.x=x*razmerKletki-30
  	nabor.y=y*razmerKletki+50
  		elseif  i==gameItems+2 then 
  	  nabor=display.newSprite( ghostAnimmyImageSheet , ghostAnimsequenceData ) 
nabor.xScale=1/2; nabor.yScale=1/2  
nabor.i=gameItems+2
--- добавили привидение 
  	  nabor:addEventListener( "tap", selectItem )
  	  nabor.x=x*razmerKletki-30
  	nabor.y=y*razmerKletki+50
  	elseif  i==gameItems+3 then 
  	  nabor=display.newImageRect("delete.png",razmerSprites/2+10,razmerSprites/2+10)--display.newImage("delete.png")
  	  nabor:addEventListener( "tap", selectItem )
  	  nabor.i=gameItems+3 -----------is delete icon
  	  nabor.x=x*razmerKletki-30
  	nabor.y=y*razmerKletki+50
  	elseif  i==gameItems+4 then 
  	  break
  end
    	selectorGroup:insert( nabor )

 end
 end
--  sceneGroup:insert( selectorGroup ) 

currentItem=nabor
currentItem.x=150
currentItem.y=100
currentItem:removeEventListener( "tap",selectItem  )
currentItem:addEventListener( "tap",showSelector  )
gameFieldGroup:insert( currentItem ) 
--sceneGroup
selectorGroup.isVisible=false

 -- selectorGroup.isVisible = false 
end
 

------нарисовали игровое поле    

    

    
    
    



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

	
 

  
  



return scene
