print ("playC")
--print(" event.params in start="..event.params.level)

--composer.removeScene( “choce level”, false )
--composer.removeScene("chooselevel")
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------








gameOver=false
function loose()
--	print ("loo00000000000000oose")
	gameOver=true
		for numTurtle=1, #turtleItem,1 do
	--	print("deadt")
	audio.play(songCok)
		turtleItem[numTurtle]:setSequence( "death" )
		turtleItem[numTurtle]:play()
	end
	
end

---код приведения


local ghostAnimsheetInfo = require("ghostAnim")
local ghostAnimmyImageSheet = graphics.newImageSheet( "ghostAnim.png", ghostAnimsheetInfo:getSheet() )

local ghostAnimsequenceData = {
  { name = "go", start = 1, count = 8,  time = 1000,  loopCount = 0,  loopDirection = "forward" }
 
}



vectorghost=1
function ghostAnim(event)



 --   print( params.myParam1 )



if  ghostPlay==true  then


for numGhost=1, #ghostItem,1 do
	
if vectorghost>8 then
	vectorghost=1
end



----------------------ghost вправо
if   (vectorghost==1 or vectorghost==7) and ghostItem[numGhost].xpos<xKletok and (gameField[ghostItem[numGhost].xpos+1][ghostItem[numGhost].ypos].typeKletki=="pusto" or gameField[ghostItem[numGhost].xpos+1][ghostItem[numGhost].ypos].typeKletki== "turtle" ) then 
	
	if gameField[ghostItem[numGhost].xpos+1][ghostItem[numGhost].ypos].typeKletki=="turtle" then
		loose()
	end
	
												
							gameField[ghostItem[numGhost].xpos+1][ghostItem[numGhost].ypos].typeKletki="ghost"
 transition.to( ghostItem[numGhost], { time=300,   alpha=0 } )
	transition.to( ghostItem[numGhost], { time=200, delay =300, alpha=0.6,   x=(ghostItem[numGhost].xpos+1)*razmerKletki-30, y=ghostItem[numGhost].ypos*razmerKletki+150 } )						
 				
  						
								 gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos].typeKletki="pusto"
								 ghostItem[numGhost].xpos=ghostItem[numGhost].xpos+1
							return	 
					end

	


----------------------ghost влево

if  (vectorghost==5 or vectorghost==3) and ghostItem[numGhost].xpos>1 and (gameField[ghostItem[numGhost].xpos-1][ghostItem[numGhost].ypos].typeKletki=="pusto" or gameField[ghostItem[numGhost].xpos-1][ghostItem[numGhost].ypos].typeKletki== "turtle" ) then 
	
	if gameField[ghostItem[numGhost].xpos-1][ghostItem[numGhost].ypos].typeKletki=="turtle" then
		loose()
	end
	
													
							gameField[ghostItem[numGhost].xpos-1][ghostItem[numGhost].ypos].typeKletki="ghost"
 transition.to( ghostItem[numGhost], { time=300,   alpha=0 } )
	transition.to( ghostItem[numGhost], { time=200, delay =300, alpha=0.6,   x=(ghostItem[numGhost].xpos-1)*razmerKletki-30, y=ghostItem[numGhost].ypos*razmerKletki+150 } )						
  	
  						
								 gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos].typeKletki="pusto"
								 ghostItem[numGhost].xpos=ghostItem[numGhost].xpos-1
							return	 
					end
	
	
	
		----------------------ghost вниз
if  (vectorghost==4 or vectorghost==8) and ghostItem[numGhost].ypos<yKletok and (gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos+1].typeKletki=="pusto" or gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos+1].typeKletki== "turtle" ) then 
	
	if gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos+1].typeKletki=="turtle" then
		loose()
	end
	
													
							gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos+1].typeKletki="ghost"
 transition.to( ghostItem[numGhost], { time=300,   alpha=0 } )
	transition.to( ghostItem[numGhost], { time=200, delay =300, alpha=0.6,   x=(ghostItem[numGhost].xpos)*razmerKletki-30, y=(ghostItem[numGhost].ypos+1)*razmerKletki+150 } )						
  		
  						
								 gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos].typeKletki="pusto"
								ghostItem[numGhost].ypos=ghostItem[numGhost].ypos+1
							return	 
					end
	
	
	
	----------------------ghost вверх
if  (vectorghost==2 or vectorghost==6) and ghostItem[numGhost].ypos>1 and (gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos-1].typeKletki=="pusto" or gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos-1].typeKletki== "turtle" ) then 
	
	if gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos-1].typeKletki=="turtle" then
		loose()
	end
	
						gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos-1].typeKletki="ghost"
 transition.to( ghostItem[numGhost], { time=300,   alpha=0 } )
	transition.to( ghostItem[numGhost], { time=200, delay =300, alpha=0.6,   x=(ghostItem[numGhost].xpos)*razmerKletki-30, y=(ghostItem[numGhost].ypos-1)*razmerKletki+150 } )						
  		
  						
								 gameField[ghostItem[numGhost].xpos][ghostItem[numGhost].ypos].typeKletki="pusto"
								 ghostItem[numGhost].ypos=ghostItem[numGhost].ypos-1
							return	 
					end
	


	
	
	vectorghost=vectorghost+1
end	
end
	
	return
end






---код черепахи---------------------------------------------------------


local turtleWalksheetInfo = require("turtleWalk")
local turtleWalkmyImageSheet = graphics.newImageSheet( "turtleWalk.png", turtleWalksheetInfo:getSheet() )

local turtleWalksequenceData = {
  { name = "walk", frames={ 1,2,3,4,1}, time=200, loopCount=3 },  --add loopCount=4
  { name = "amm", frames={ 1,5,6,7,1}, time=500, loopCount=1 },
  { name = "stay", frames={ 1} , time=250 },
  { name = "death", frames={ 8} , time=2500 }
}

--turtleWalksprite= display.newSprite( turtleWalkmyImageSheet , turtleWalksequenceData ) ; turtleWalksprite.xScale=1/2; turtleWalksprite.yScale=1/2
--turtleWalksprite.x=200
--turtleWalksprite.y=200
--turtleWalksprite:setSequence( "amm" )
--turtleWalksprite:play()


function TurttleWalkAnim()

--print("transactto compleet")
--turtle:setSequence( "stay" )
--turtle:play()
audio.play(songFit)

 turtleTimer=timer.performWithDelay( 500, turtleEv, 0 )
end



vectorTurtle=1
function turtleEv()


for numTurtle=1, #turtleItem,1 do

if vectorTurtle>8 then
	vectorTurtle=1
end

local amm=true

----------------------turtle вправо
if   (vectorTurtle==1 or vectorTurtle==7) and turtleItem[numTurtle].xpos<xKletok and (gameField[turtleItem[numTurtle].xpos+1][turtleItem[numTurtle].ypos].typeKletki=="pusto" or gameField[turtleItem[numTurtle].xpos+1][turtleItem[numTurtle].ypos].typeKletki=="food") then 
	
	timer.cancel( turtleTimer ) 
						--	print("right")
							turtleItem[numTurtle].rotation= 90
							
							
	if gameField[turtleItem[numTurtle].xpos+1][turtleItem[numTurtle].ypos].typeKletki=="food" then
		gameField[turtleItem[numTurtle].xpos+1][turtleItem[numTurtle].ypos]:removeSelf()
		turtleItem[numTurtle]:setSequence( "amm" )
		turtleItem[numTurtle]:play()
		transition.to( turtleItem[numTurtle], { time=400,   x=(turtleItem[numTurtle].xpos+1)*razmerKletki-30, y=turtleItem[numTurtle].ypos*razmerKletki+150, onComplete=TurttleWalkAnim() } )
		amm=false
		audio.play(songPu)
		foods=foods-1
	end
	 gameField[turtleItem[numTurtle].xpos+1][turtleItem[numTurtle].ypos].typeKletki="turtle"
							if amm then
	 					 turtleItem[numTurtle]:setSequence( "walk" )
													
							turtleItem[numTurtle]:play()
	 					 transition.to( turtleItem[numTurtle], { time=400,   x=(turtleItem[numTurtle].xpos+1)*razmerKletki-30, y=turtleItem[numTurtle].ypos*razmerKletki+150, onComplete=TurttleWalkAnim() } )
							 --  turtle.x=(turtle.xpos+1)*razmerKletki-30
								-- turtle.y=turtle.ypos*razmerKletki+150
							end
								 gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos].typeKletki="pusto"
								 
								turtleItem[numTurtle].xpos=turtleItem[numTurtle].xpos+1
								-- TurttleWalkAnim()
							return	 
					end

	


----------------------turtle влево

	if   (vectorTurtle==5 or vectorTurtle==3) and turtleItem[numTurtle].xpos>1 and (gameField[turtleItem[numTurtle].xpos-1][turtleItem[numTurtle].ypos].typeKletki=="pusto" or gameField[turtleItem[numTurtle].xpos-1][turtleItem[numTurtle].ypos].typeKletki=="food") then 
	 timer.cancel( turtleTimer ) 
						--	print("left")
							turtleItem[numTurtle].rotation= -90
						
							
	if gameField[turtleItem[numTurtle].xpos-1][turtleItem[numTurtle].ypos].typeKletki=="food" then
		gameField[turtleItem[numTurtle].xpos-1][turtleItem[numTurtle].ypos]:removeSelf()
		turtleItem[numTurtle]:setSequence( "amm" )
		turtleItem[numTurtle]:play()
		 transition.to( turtleItem[numTurtle], { time=400,   x=(turtleItem[numTurtle].xpos-1)*razmerKletki-30, y=turtleItem[numTurtle].ypos*razmerKletki+150, onComplete=TurttleWalkAnim() } )
		amm=false
		audio.play(songPu)
		foods=foods-1
	end
		gameField[turtleItem[numTurtle].xpos-1][turtleItem[numTurtle].ypos].typeKletki="turtle"
	if amm then
							
	 					 turtleItem[numTurtle]:setSequence( "walk" )
													
							turtleItem[numTurtle]:play()
	 						 transition.to( turtleItem[numTurtle], { time=400,   x=(turtleItem[numTurtle].xpos-1)*razmerKletki-30, y=turtleItem[numTurtle].ypos*razmerKletki+150, onComplete=TurttleWalkAnim() } )
							--   turtle.x=(turtle.xpos-1)*razmerKletki-30
								-- turtle.y=turtle.ypos*razmerKletki+150
	end
								 gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos].typeKletki="pusto"
								turtleItem[numTurtle].xpos=turtleItem[numTurtle].xpos-1
								-- TurttleWalkAnim()
							return	 
					end
	
		----------------------turtle вниз
	if   (vectorTurtle==4 or vectorTurtle==8) and turtleItem[numTurtle].ypos<yKletok and (gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos+1].typeKletki=="pusto" or gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos+1].typeKletki=="food") then 
	
	 timer.cancel( turtleTimer ) 
						--	print("down")
							turtleItem[numTurtle].rotation= 180
							
	
	if gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos+1].typeKletki=="food" then
		gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos+1]:removeSelf()
		turtleItem[numTurtle]:setSequence( "amm" )
		turtleItem[numTurtle]:play()
		 transition.to( turtleItem[numTurtle], { time=400,   x=(turtleItem[numTurtle].xpos)*razmerKletki-30, y=(turtleItem[numTurtle].ypos+1)*razmerKletki+150, onComplete=TurttleWalkAnim() } )
amm=false
audio.play(songPu)
		foods=foods-1
	end
	
	gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos+1].typeKletki="turtle"
if amm then
							
	 						 turtleItem[numTurtle]:setSequence( "walk" )
													
							turtleItem[numTurtle]:play()
	 					 transition.to( turtleItem[numTurtle], { time=400,   x=(turtleItem[numTurtle].xpos)*razmerKletki-30, y=(turtleItem[numTurtle].ypos+1)*razmerKletki+150, onComplete=TurttleWalkAnim() } )
							--   turtle.x=(turtle.xpos)*razmerKletki-30
							--	 turtle.y=(turtle.ypos+1)*razmerKletki+150
end		 
								 gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos].typeKletki="pusto"
								turtleItem[numTurtle].ypos=turtleItem[numTurtle].ypos+1
							--	 TurttleWalkAnim()
							return	 
					end
	
	----------------------turtle вверх
	if   (vectorTurtle==2 or vectorTurtle==6) and turtleItem[numTurtle].ypos>1 and (gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos-1].typeKletki=="pusto" or gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos-1].typeKletki=="food") then 
	timer.cancel( turtleTimer ) 
					--		print("up")
							turtleItem[numTurtle].rotation= 0
							
							
	if gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos-1].typeKletki=="food" then
		gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos-1]:removeSelf()
		turtleItem[numTurtle]:setSequence( "amm" )
		turtleItem[numTurtle]:play()	
		 transition.to( turtleItem[numTurtle], { time=400,   x=(turtleItem[numTurtle].xpos)*razmerKletki-30, y=(turtleItem[numTurtle].ypos-1)*razmerKletki+150, onComplete=TurttleWalkAnim() } )	
amm=false
audio.play(songPu)
		foods=foods-1
	end
	gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos-1].typeKletki="turtle"
	if amm then
							
	 						 turtleItem[numTurtle]:setSequence( "walk" )
													
							turtleItem[numTurtle]:play()
	 						 transition.to( turtleItem[numTurtle], { time=400,   x=(turtleItem[numTurtle].xpos)*razmerKletki-30, y=(turtleItem[numTurtle].ypos-1)*razmerKletki+150, onComplete=TurttleWalkAnim() } )
							 --  turtle.x=(turtle.xpos)*razmerKletki-30
								-- turtle.y=(turtle.ypos-1)*razmerKletki+150
	end
	
								 gameField[turtleItem[numTurtle].xpos][turtleItem[numTurtle].ypos].typeKletki="pusto"
								turtleItem[numTurtle].ypos=turtleItem[numTurtle].ypos-1
								-- TurttleWalkAnim()
							return	 
					end
	
	
	
	
	
	
	
	
	vectorTurtle=vectorTurtle+1
end
	return
end


---- touch event для предметов
local function onTouch( event )
	
	local t = event.target

	-- Print info about the event. For actual production code, you should
	-- not call this function because it wastes CPU resources.
	--printTouch(event)

	local phase = event.phase
	if "began" == phase then
		-- Make target the top-most object
		local parent = t.parent
		parent:insert( t )
		display.getCurrentStage():setFocus( t )

		-- Spurious events can be sent to the target, e.g. the user presses 
		-- elsewhere on the screen and then moves the finger over the target.
		-- To prevent this, we add this flag. Only when it's true will "move"
		-- events be sent to the target.
		t.isFocus = true

		-- Store initial position
		t.x0 = event.x - t.x
		t.y0 = event.y - t.y
		
		t.xish=t.x
		t.yish=t.y
		t.xScale = 1.5
	t.yScale = 1.5
		
		
			elseif t.isFocus then
		if "moved" == phase then
			-- Make object move (we subtract t.x0,t.y0 so that moves are
			-- relative to initial grab point, rather than object "snapping").
			t.x = event.x - t.x0
			t.y = event.y - t.y0
		elseif "ended" == phase or "cancelled" == phase then
			
		
		
		
		t.xScale = 1
			t.yScale = 1
		
	
			
			if  (t.x-t.xish) > 50 and  math.abs(t.x-t.xish) > math.abs(t.y-t.yish)  and t.posex<xKletok and gameField[t.posex+1][t.posey].typeKletki=="pusto" then 
	
							gameField[t.posex+1][t.posey]=display.newImageRect(imageSheet,t.i,razmerSprites,razmerSprites)
							scene._globalSceneObj:insert(gameField[t.posex+1][t.posey])
							gameField[t.posex+1][t.posey].typeKletki=t.typeKletki
							gameField[t.posex+1][t.posey].i=t.i
  							gameField[t.posex+1][t.posey].x=(t.posex+1)*razmerKletki-30
  							gameField[t.posex+1][t.posey].y=t.posey*razmerKletki+150
  							gameField[t.posex+1][t.posey].posex=t.posex+1
	 						 gameField[t.posex+1][t.posey].posey=t.posey
							   gameField[t.posex+1][t.posey]:addEventListener( "touch", onTouch )
								t:removeSelf()
								t.typeKletki="pusto"
					end
		if  (t.x-t.xish) < -50  and  math.abs(t.x-t.xish) > math.abs(t.y-t.yish)  and t.posex>1 and gameField[t.posex-1][t.posey].typeKletki=="pusto" then 
	
							gameField[t.posex-1][t.posey]=display.newImageRect(imageSheet,t.i,razmerSprites,razmerSprites)
							scene._globalSceneObj:insert(gameField[t.posex-1][t.posey])
							gameField[t.posex-1][t.posey].typeKletki=t.typeKletki
							gameField[t.posex-1][t.posey].i=t.i
  							gameField[t.posex-1][t.posey].x=(t.posex-1)*razmerKletki-30
  							gameField[t.posex-1][t.posey].y=t.posey*razmerKletki+150
  							gameField[t.posex-1][t.posey].posex=t.posex-1
	 						 gameField[t.posex-1][t.posey].posey=t.posey
							   gameField[t.posex-1][t.posey]:addEventListener( "touch", onTouch )
								t:removeSelf()
								t.typeKletki="pusto"
					end
		
		
		
		
			
			if  (t.y-t.yish) > 50 and math.abs(t.y-t.yish) > math.abs(t.x-t.xish)   and  t.posey<yKletok  and gameField[t.posex][t.posey+1].typeKletki=="pusto" then 
	
							gameField[t.posex][t.posey+1]=display.newImageRect(imageSheet,t.i,razmerSprites,razmerSprites)
							scene._globalSceneObj:insert(gameField[t.posex][t.posey+1])
							gameField[t.posex][t.posey+1].typeKletki=t.typeKletki
							gameField[t.posex][t.posey+1].i=t.i
  							gameField[t.posex][t.posey+1].x=t.posex*razmerKletki-30
  							gameField[t.posex][t.posey+1].y=(t.posey+1)*razmerKletki+150
  							gameField[t.posex][t.posey+1].posex=t.posex
	 						 gameField[t.posex][t.posey+1].posey=t.posey+1
							   gameField[t.posex][t.posey+1]:addEventListener( "touch", onTouch )
								t:removeSelf()
								t.typeKletki="pusto"
					end
		if  (t.y-t.yish) < -50   and math.abs(t.y-t.yish) > math.abs(t.x-t.xish)  and t.posey>1 and gameField[t.posex][t.posey-1].typeKletki=="pusto" then 
	
							gameField[t.posex][t.posey-1]=display.newImageRect(imageSheet,t.i,razmerSprites,razmerSprites)
							scene._globalSceneObj:insert(gameField[t.posex][t.posey-1])
							gameField[t.posex][t.posey-1].typeKletki=t.typeKletki
							gameField[t.posex][t.posey-1].i=t.i
  							gameField[t.posex][t.posey-1].x=t.posex*razmerKletki-30
  							gameField[t.posex][t.posey-1].y=(t.posey-1)*razmerKletki+150
  							gameField[t.posex][t.posey-1].posex=t.posex
	 						 gameField[t.posex][t.posey-1].posey=t.posey-1
							   gameField[t.posex][t.posey-1]:addEventListener( "touch", onTouch )
								t:removeSelf()
								t.typeKletki="pusto"
					end
		
		
		
		
			t.x, t.y = t.xish,t.yish
				
			display.getCurrentStage():setFocus( nil )
			t.isFocus = false
		
			
			
		end
	end

	-- Important to return true. This tells the system that the event
	-- should not be propagated to listeners of any objects underneath.
	return true
end
    
    
 
local function  inputLeveltextListener( event )
     if ( event.phase == "began" ) then
        -- user begins editing defaultField
      elseif ( event.phase == "ended" or event.phase == "submitted" ) then
  

 

 native.setKeyboardFocus( nil )
        defaultField:removeSelf()
     rect:removeSelf()
   --  FieldGroup.isVisible=true
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

 --FieldGroup.isVisible=false

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

-- "scene:create()"
function scene:create( event )

 local sceneGroup = self.view
scene._globalSceneObj = sceneGroup
    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
   -- print(" event.params in create="..event.params.level)


---рисуем игровое поле с учётом  event.params.level

gameField= {}
foods=0
level=event.params.level 

ghostPlay=false
ghostItem={}
turtleItem={}


local loadsave = require("loadsave")
if  loadsave.loadTable(fileName, system.DocumentsDirectory) ~=nil then
mapTable = loadsave.loadTable(fileName, system.DocumentsDirectory)
else
composer.gotoScene( true, "chooselevelA", "slideLeft", 800  )
end

--loadsave.printTable(mapTable) 
--print("#mapTable = "..#mapTable)
--print ("mapTable[level][x][y]="..mapTable[2][3][4])
i=1
 for x=1,xKletok,1 do
 	gameField[x]={}
  	for y=1,yKletok,1 do

--local i=math.random(gameItems)
i=i+1



if mapTable[level][i]>=1 and mapTable[level][i]<=gameItems  then
  	
  	
  	gameField [x][y]=display.newImageRect(imageSheet,mapTable[level][i],razmerSprites,razmerSprites)
  	gameField [x][y].i=mapTable[level][i]
  	gameField [x][y].x=x*razmerKletki-30
  	gameField [x][y].y=y*razmerKletki+150
  	gameField [x][y].posex=x
	  gameField [x][y].posey=y
	  
  	 if mapTable[level][i]<stoneItem then 
  	 	gameField [x][y].typeKletki="item"
  	 	gameField [x][y]:addEventListener( "touch", onTouch )
  	  elseif mapTable[level][i]>stoneItem then 
  	  foods=foods+1
  	      gameField [x][y].typeKletki="food"
  	      gameField [x][y]:addEventListener( "touch", onTouch )  	  
  	  elseif  mapTable[level][i]==stoneItem then gameField [x][y].typeKletki="stone"
  	 end
sceneGroup:insert(  gameField [x][y] ) 

elseif mapTable[level][i]==ghostSheetItem then
ghostPlay=true


if numGhost~=nil then numGhost=#ghostItem+1 else numGhost=1 	end
ghostItem[numGhost]=   display.newSprite( ghostAnimmyImageSheet , ghostAnimsequenceData ) 
ghostItem[numGhost].xScale=1/2
ghostItem[numGhost].yScale=1/2  
ghostItem[numGhost].alpha=0.5
ghostItem[numGhost].x=x*razmerKletki-30
ghostItem[numGhost].y=y*razmerKletki+150
gameField [x][y]=display.newSprite( turtleWalkmyImageSheet , turtleWalksequenceData )
 gameField [x][y].i=mapTable[level][i]
  	gameField [x][y].x=x*razmerKletki-30
  	gameField [x][y].y=y*razmerKletki+150
  	gameField [x][y].posex=x
	  gameField [x][y].posey=y
 gameField [x][y]:removeSelf()  
gameField [x][y].typeKletki="ghost"
ghostItem[numGhost].xpos=x
ghostItem[numGhost].ypos=y
ghostItem[numGhost]:setSequence( "go" )
ghostItem[numGhost]:play()
sceneGroup:insert(ghostItem[numGhost]) 

elseif mapTable[level][i]==turtleSheetItem then
if numTurtle~=nil then numTurtle=#turtleItem+1 else numTurtle=1 end
	print("print turtle")
turtleItem[numTurtle]=   display.newSprite( turtleWalkmyImageSheet , turtleWalksequenceData ) 
turtleItem[numTurtle].xScale=1/3
turtleItem[numTurtle].yScale=1/3
turtleItem[numTurtle].x=x*razmerKletki-30
turtleItem[numTurtle].y=y*razmerKletki+150
gameField [x][y]=display.newSprite( turtleWalkmyImageSheet , turtleWalksequenceData )
 gameField [x][y].i=mapTable[level][i]
  	gameField [x][y].x=x*razmerKletki-30
  	gameField [x][y].y=y*razmerKletki+150
  	gameField [x][y].posex=x
	  gameField [x][y].posey=y
 gameField [x][y]:removeSelf()  
gameField [x][y].typeKletki="turtle"
turtleItem[numTurtle].xpos=x
turtleItem[numTurtle].ypos=y
sceneGroup:insert( turtleItem[numTurtle] ) 

elseif mapTable[level][i]==0 then
 gameField [x][y]=display.newSprite( turtleWalkmyImageSheet , turtleWalksequenceData )
 gameField [x][y].i=mapTable[level][i]
  	gameField [x][y].x=x*razmerKletki-30
  	gameField [x][y].y=y*razmerKletki+150
  	gameField [x][y].posex=x
	  gameField [x][y].posey=y
 gameField [x][y]:removeSelf()  
gameField [x][y].typeKletki="pusto"

end 

  	 
 end

------расставили предметы



end
 
  	
------нарисовали игровое поле    
closeButton=display.newImageRect("close.png",razmerSprites/2,razmerSprites/2)
closeButton.x=600
closeButton.y=100
closeButton:addEventListener( "tap", function () composer.gotoScene( "menu", {effect = 'slideRight', time = 500}) end) 
sceneGroup:insert( closeButton ) 
  	
inputButton=display.newImageRect("input.png",razmerSprites/2,razmerSprites/2)--display.newImage("disk.png")
inputButton.x=300
inputButton.y=100
inputButton:addEventListener( "tap", inputLevel) 
sceneGroup:insert( inputButton ) 
    
    
    
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
Runtime:removeEventListener("enterFrame", gameOverDetection)
    	 timer.cancel( turtleTimer ) 
    	 timer.cancel( ghostTimer )
       timer.cancel(vectorTimer ) 
       
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



function vectorRND()
vectorTurtle=math.random(8)
vectorghost=math.random(8)
end



local function handleButtonEvent( event )
 
    if ( "ended" == event.phase ) then
    	
    	composer.gotoScene( true, "chooselevelA", "slideLeft", 800  )
    	
     --   print( "Button was pressed and released" )
    end
end

function gameOverDetection(event)

    if foods <= 0  or gameOver then
    	Runtime:removeEventListener("enterFrame", gameOverDetection)
    	 timer.cancel( turtleTimer ) 
    	 timer.cancel( ghostTimer )
       timer.cancel(vectorTimer ) 
       
    
 
  if  gameOver then
  	local alert = native.showAlert( "Ops!", "Loose! Try again...", { "OK" }, function() composer.gotoScene( true, "chooselevelA", "slideLeft", 800  ) end)
  --	button1:setLabel( "Looose..." )
  else local alert = native.showAlert( "Good!", "You win! Go next...", { "OK" }, function() composer.gotoScene( true, "chooselevelA", "slideLeft", 800  ) end)
  end
  
--scene._globalSceneObj:insert(button1)	

      
    end
end


-- -------------------------------------------------------------------------------

-- Listener setup


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

	ghostTimer=timer.performWithDelay( 500, ghostAnim, 0 )


TurttleWalkAnim()

vectorTimer= timer.performWithDelay( 1500, vectorRND, 0 )
 Runtime:addEventListener("enterFrame",gameOverDetection)
-- -------------------------------------------------------------------------------

 

  
  



return scene
