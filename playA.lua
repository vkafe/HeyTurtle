print ("play")
--print(" event.params in start="..event.params.level)

--composer.removeScene( “choce level”, false )
--composer.removeScene("chooselevel")
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------


function stop(  )
--Runtime:removeEventListener("enterFrame", gameOverDetection) end
    	if turtleTimer~=nil then     	 timer.cancel( turtleTimer ) end
    	if ghostTimer~=nil then timer.cancel( ghostTimer ) end
        if vectorTimer~=nil then  timer.cancel(vectorTimer ) end
    turtle:setSequence( "death" )
		turtle:play()
end





gameOver=false
function loose()	stop()	Runtime:removeEventListener("enterFrame", barSet)
	--print ("loo00000000000000oose")
	gameOver=true
	audio.play(songCok)	turtle:setSequence( "death" )
		turtle:play()
end

---код приведения


local ghostAnimsheetInfo = require("ghostAnim")
local ghostAnimmyImageSheet = graphics.newImageSheet( "ghostAnim.png", ghostAnimsheetInfo:getSheet() )

local ghostAnimsequenceData = {
  { name = "go", start = 1, count = 8,  time = 1000,  loopCount = 0,  loopDirection = "forward" }
 
}



vectorghost=1

vectorghost2=1

function ghostAnim(event)

if  ghostPlay==true  then


if vectorghost>8 then
	vectorghost=1
end



----------------------ghost вправо
if   (vectorghost==1 or vectorghost==7) and ghost.xpos<xKletok and (gameField[ghost.xpos+1][ghost.ypos].typeKletki=="pusto" or gameField[ghost.xpos+1][ghost.ypos].typeKletki== "turtle" ) then 
	
	if gameField[ghost.xpos+1][ghost.ypos].typeKletki=="turtle" then
		loose()
	end
	
												
							gameField[ghost.xpos+1][ghost.ypos].typeKletki="ghost"
 transition.to( ghost, { time=300,   alpha=0 } )
	transition.to( ghost, { time=200, delay =300, alpha=0.6,   x=(ghost.xpos+1)*razmerKletki-30, y=ghost.ypos*razmerKletki+150 } )						
 				
  						
								 gameField[ghost.xpos][ghost.ypos].typeKletki="pusto"
								 ghost.xpos=ghost.xpos+1
							return	 
					end

	


----------------------ghost влево

if  (vectorghost==5 or vectorghost==3) and ghost.xpos>1 and (gameField[ghost.xpos-1][ghost.ypos].typeKletki=="pusto" or gameField[ghost.xpos-1][ghost.ypos].typeKletki== "turtle" ) then 
	
	if gameField[ghost.xpos-1][ghost.ypos].typeKletki=="turtle" then
		loose()
	end
	
													
							gameField[ghost.xpos-1][ghost.ypos].typeKletki="ghost"
 transition.to( ghost, { time=300,   alpha=0 } )
	transition.to( ghost, { time=200, delay =300, alpha=0.6,   x=(ghost.xpos-1)*razmerKletki-30, y=ghost.ypos*razmerKletki+150 } )						
  	
  						
								 gameField[ghost.xpos][ghost.ypos].typeKletki="pusto"
								 ghost.xpos=ghost.xpos-1
							return	 
					end
	
	
	
		----------------------ghost вниз
if  (vectorghost==4 or vectorghost==8) and ghost.ypos<yKletok and (gameField[ghost.xpos][ghost.ypos+1].typeKletki=="pusto" or gameField[ghost.xpos][ghost.ypos+1].typeKletki== "turtle" ) then 
	
	if gameField[ghost.xpos][ghost.ypos+1].typeKletki=="turtle" then
		loose()
	end
	
													
							gameField[ghost.xpos][ghost.ypos+1].typeKletki="ghost"
 transition.to( ghost, { time=300,   alpha=0 } )
	transition.to( ghost, { time=200, delay =300, alpha=0.6,   x=(ghost.xpos)*razmerKletki-30, y=(ghost.ypos+1)*razmerKletki+150 } )						
  		
  						
								 gameField[ghost.xpos][ghost.ypos].typeKletki="pusto"
								 ghost.ypos=ghost.ypos+1
							return	 
					end
	
	
	
	----------------------ghost вверх
if  (vectorghost==2 or vectorghost==6) and ghost.ypos>1 and (gameField[ghost.xpos][ghost.ypos-1].typeKletki=="pusto" or gameField[ghost.xpos][ghost.ypos-1].typeKletki== "turtle" ) then 
	
	if gameField[ghost.xpos][ghost.ypos-1].typeKletki=="turtle" then
		loose()
	end
	
						gameField[ghost.xpos][ghost.ypos-1].typeKletki="ghost"
 transition.to( ghost, { time=300,   alpha=0 } )
	transition.to( ghost, { time=200, delay =300, alpha=0.6,   x=(ghost.xpos)*razmerKletki-30, y=(ghost.ypos-1)*razmerKletki+150 } )						
  		
  						
								 gameField[ghost.xpos][ghost.ypos].typeKletki="pusto"
								 ghost.ypos=ghost.ypos-1
							return	 
					end
	

	
	
	
	vectorghost=vectorghost+1
	
end
	


if  ghost2Play==true  then


if vectorghost2>8 then
	vectorghost2=1
end



----------------------ghost2 вправо
if   (vectorghost2==1 or vectorghost2==7) and ghost2.xpos<xKletok and (gameField[ghost2.xpos+1][ghost2.ypos].typeKletki=="pusto" or gameField[ghost2.xpos+1][ghost2.ypos].typeKletki== "turtle" ) then 
	
	if gameField[ghost2.xpos+1][ghost2.ypos].typeKletki=="turtle" then
		loose()
	end
	
												
							gameField[ghost2.xpos+1][ghost2.ypos].typeKletki="ghost2"
 transition.to( ghost2, { time=300,   alpha=0 } )
	transition.to( ghost2, { time=200, delay =300, alpha=0.6,   x=(ghost2.xpos+1)*razmerKletki-30, y=ghost2.ypos*razmerKletki+150 } )						
 				
  						
								 gameField[ghost2.xpos][ghost2.ypos].typeKletki="pusto"
								 ghost2.xpos=ghost2.xpos+1
							return	 
					end

	


----------------------ghost2 влево

if  (vectorghost2==5 or vectorghost2==3) and ghost2.xpos>1 and (gameField[ghost2.xpos-1][ghost2.ypos].typeKletki=="pusto" or gameField[ghost2.xpos-1][ghost2.ypos].typeKletki== "turtle" ) then 
	
	if gameField[ghost2.xpos-1][ghost2.ypos].typeKletki=="turtle" then
		loose()
	end
	
													
							gameField[ghost2.xpos-1][ghost2.ypos].typeKletki="ghost2"
 transition.to( ghost2, { time=300,   alpha=0 } )
	transition.to( ghost2, { time=200, delay =300, alpha=0.6,   x=(ghost2.xpos-1)*razmerKletki-30, y=ghost2.ypos*razmerKletki+150 } )						
  	
  						
								 gameField[ghost2.xpos][ghost2.ypos].typeKletki="pusto"
								 ghost2.xpos=ghost2.xpos-1
							return	 
					end
	
	
	
		----------------------ghost2 вниз
if  (vectorghost2==4 or vectorghost2==8) and ghost2.ypos<yKletok and (gameField[ghost2.xpos][ghost2.ypos+1].typeKletki=="pusto" or gameField[ghost2.xpos][ghost2.ypos+1].typeKletki== "turtle" ) then 
	
	if gameField[ghost2.xpos][ghost2.ypos+1].typeKletki=="turtle" then
		loose()
	end
	
													
							gameField[ghost2.xpos][ghost2.ypos+1].typeKletki="ghost2"
 transition.to( ghost2, { time=300,   alpha=0 } )
	transition.to( ghost2, { time=200, delay =300, alpha=0.6,   x=(ghost2.xpos)*razmerKletki-30, y=(ghost2.ypos+1)*razmerKletki+150 } )						
  		
  						
								 gameField[ghost2.xpos][ghost2.ypos].typeKletki="pusto"
								 ghost2.ypos=ghost2.ypos+1
							return	 
					end
	
	
	
	----------------------ghost2 вверх
if  (vectorghost2==2 or vectorghost2==6) and ghost2.ypos>1 and (gameField[ghost2.xpos][ghost2.ypos-1].typeKletki=="pusto" or gameField[ghost2.xpos][ghost2.ypos-1].typeKletki== "turtle" ) then 
	
	if gameField[ghost2.xpos][ghost2.ypos-1].typeKletki=="turtle" then
		loose()
	end
	
						gameField[ghost2.xpos][ghost2.ypos-1].typeKletki="ghost2"
 transition.to( ghost2, { time=300,   alpha=0 } )
	transition.to( ghost2, { time=200, delay =300, alpha=0.6,   x=(ghost2.xpos)*razmerKletki-30, y=(ghost2.ypos-1)*razmerKletki+150 } )						
  		
  						
								 gameField[ghost2.xpos][ghost2.ypos].typeKletki="pusto"
								 ghost2.ypos=ghost2.ypos-1
							return	 
					end
	

	
	
	
	vectorghost2=vectorghost2+1
	
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


--turtle:setSequence( "stay" )
--turtle:play()

audio.play(songFit)
 turtleTimer=timer.performWithDelay( 500, turtleEv, 0 )
end



vectorTurtle=1
function turtleEv()




if vectorTurtle>8 then
	vectorTurtle=1
end

local amm=true

----------------------turtle вправо
if   (vectorTurtle==1 or vectorTurtle==7) and turtle.xpos<xKletok and (gameField[turtle.xpos+1][turtle.ypos].typeKletki=="pusto" or gameField[turtle.xpos+1][turtle.ypos].typeKletki=="food") then 
	
	timer.cancel( turtleTimer ) 
							
							turtle.rotation= 90
							
							
	if gameField[turtle.xpos+1][turtle.ypos].typeKletki=="food" then
		gameField[turtle.xpos+1][turtle.ypos]:removeSelf()
		turtle:setSequence( "amm" )		turtle:play()		bar.width=bar.width+barAmm
		transition.to( turtle, { time=400,   x=(turtle.xpos+1)*razmerKletki-30, y=turtle.ypos*razmerKletki+150, onComplete=TurttleWalkAnim() } )
		amm=false
		audio.play(songPu)
		foods=foods-1
	end
	 gameField[turtle.xpos+1][turtle.ypos].typeKletki="turtle"
							if amm then
	 					 turtle:setSequence( "walk" )
													
							turtle:play()							bar.width=bar.width-barWalk
	 					 transition.to( turtle, { time=400,   x=(turtle.xpos+1)*razmerKletki-30, y=turtle.ypos*razmerKletki+150, onComplete=TurttleWalkAnim() } )
							 --  turtle.x=(turtle.xpos+1)*razmerKletki-30
								-- turtle.y=turtle.ypos*razmerKletki+150
							end
								 gameField[turtle.xpos][turtle.ypos].typeKletki="pusto"
								 
								turtle.xpos=turtle.xpos+1
								-- TurttleWalkAnim()
							return	 
					end

	


----------------------turtle влево

	if   (vectorTurtle==5 or vectorTurtle==3) and turtle.xpos>1 and (gameField[turtle.xpos-1][turtle.ypos].typeKletki=="pusto" or gameField[turtle.xpos-1][turtle.ypos].typeKletki=="food") then 
	 timer.cancel( turtleTimer ) 
						
							turtle.rotation= -90
						
							
	if gameField[turtle.xpos-1][turtle.ypos].typeKletki=="food" then
		gameField[turtle.xpos-1][turtle.ypos]:removeSelf()
		turtle:setSequence( "amm" )
		turtle:play()		bar.width=bar.width+barAmm
		 transition.to( turtle, { time=400,   x=(turtle.xpos-1)*razmerKletki-30, y=turtle.ypos*razmerKletki+150, onComplete=TurttleWalkAnim() } )
		amm=false
		audio.play(songPu)
		foods=foods-1
	end
		gameField[turtle.xpos-1][turtle.ypos].typeKletki="turtle"
	if amm then
							
	 					 turtle:setSequence( "walk" )
													
							turtle:play()							bar.width=bar.width-barWalk
	 						 transition.to( turtle, { time=400,   x=(turtle.xpos-1)*razmerKletki-30, y=turtle.ypos*razmerKletki+150, onComplete=TurttleWalkAnim() } )
							--   turtle.x=(turtle.xpos-1)*razmerKletki-30
								-- turtle.y=turtle.ypos*razmerKletki+150
	end
								 gameField[turtle.xpos][turtle.ypos].typeKletki="pusto"
								turtle.xpos=turtle.xpos-1
								-- TurttleWalkAnim()
							return	 
					end
	
		----------------------turtle вниз
	if   (vectorTurtle==4 or vectorTurtle==8) and turtle.ypos<yKletok and (gameField[turtle.xpos][turtle.ypos+1].typeKletki=="pusto" or gameField[turtle.xpos][turtle.ypos+1].typeKletki=="food") then 
	
	 timer.cancel( turtleTimer ) 
							
							turtle.rotation= 180
							
	
	if gameField[turtle.xpos][turtle.ypos+1].typeKletki=="food" then
		gameField[turtle.xpos][turtle.ypos+1]:removeSelf()
		turtle:setSequence( "amm" )
		turtle:play()		bar.width=bar.width+barAmm
		 transition.to( turtle, { time=400,   x=(turtle.xpos)*razmerKletki-30, y=(turtle.ypos+1)*razmerKletki+150, onComplete=TurttleWalkAnim() } )
amm=false
	audio.play(songPu)
		foods=foods-1
	end
	
	gameField[turtle.xpos][turtle.ypos+1].typeKletki="turtle"
if amm then
							
	 						 turtle:setSequence( "walk" )
													
							turtle:play()							bar.width=bar.width-barWalk
	 					 transition.to( turtle, { time=400,   x=(turtle.xpos)*razmerKletki-30, y=(turtle.ypos+1)*razmerKletki+150, onComplete=TurttleWalkAnim() } )
							--   turtle.x=(turtle.xpos)*razmerKletki-30
							--	 turtle.y=(turtle.ypos+1)*razmerKletki+150
end		 
								 gameField[turtle.xpos][turtle.ypos].typeKletki="pusto"
								turtle.ypos=turtle.ypos+1
							--	 TurttleWalkAnim()
							return	 
					end
	
	----------------------turtle вверх
	if   (vectorTurtle==2 or vectorTurtle==6) and turtle.ypos>1 and (gameField[turtle.xpos][turtle.ypos-1].typeKletki=="pusto" or gameField[turtle.xpos][turtle.ypos-1].typeKletki=="food") then 
	timer.cancel( turtleTimer ) 
						
							turtle.rotation= 0
							
							
	if gameField[turtle.xpos][turtle.ypos-1].typeKletki=="food" then
		gameField[turtle.xpos][turtle.ypos-1]:removeSelf()
		turtle:setSequence( "amm" )
		turtle:play()			bar.width=bar.width+barAmm
		 transition.to( turtle, { time=400,   x=(turtle.xpos)*razmerKletki-30, y=(turtle.ypos-1)*razmerKletki+150, onComplete=TurttleWalkAnim() } )	
amm=false
audio.play(songPu)
		foods=foods-1
	end
	gameField[turtle.xpos][turtle.ypos-1].typeKletki="turtle"
	if amm then
							
	 						 turtle:setSequence( "walk" )
													
							turtle:play()							bar.width=bar.width-barWalk
	 						 transition.to( turtle, { time=400,   x=(turtle.xpos)*razmerKletki-30, y=(turtle.ypos-1)*razmerKletki+150, onComplete=TurttleWalkAnim() } )
							 --  turtle.x=(turtle.xpos)*razmerKletki-30
								-- turtle.y=(turtle.ypos-1)*razmerKletki+150
	end
	
								 gameField[turtle.xpos][turtle.ypos].typeKletki="pusto"
								turtle.ypos=turtle.ypos-1
								-- TurttleWalkAnim()
							return	 
					end
	
	
	
	
	
	
	
	
	vectorTurtle=vectorTurtle+1
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
    
function rndChoice(n)
	
	if n==1 then return 4,6
		elseif n==2 then return 5,6
		elseif n==3 then return 6,6
	elseif n==4 then return 1,1
	elseif n==5 then return 1,2
	elseif n==6 then return 1,3
	end
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
print(level)
math.randomseed ( level )

 for x=1,xKletok,1 do
 	gameField[x]={}
  	for y=1,yKletok,1 do

local i=math.random(gameItems)

  	gameField [x][y]=display.newImageRect(imageSheet,i,razmerSprites,razmerSprites)
  	gameField [x][y].i=i
  	gameField [x][y].x=x*razmerKletki-30
  	gameField [x][y].y=y*razmerKletki+150
  	gameField [x][y].posex=x
	  gameField [x][y].posey=y
	  
  	 if i<stoneItem then 
  	 	gameField [x][y].typeKletki="item"
  	 	gameField [x][y]:addEventListener( "touch", onTouch )
  	  elseif  i>stoneItem then 
  	  foods=foods+1
  	      gameField [x][y].typeKletki="food"
  	      gameField [x][y]:addEventListener( "touch", onTouch )  	  
  	  elseif  i==stoneItem then gameField [x][y].typeKletki="stone"
  	 end
  
  	 sceneGroup:insert(  gameField [x][y] ) 
 end
 end
------расставили предметы

math.randomseed ( level +300)
local x=math.random (xKletok)
local y=math.random (yKletok)
if  gameField [x][y].typeKletki=="food" then 
	foods=foods-1 
	end
	
gameField [x][y]:removeSelf()   
gameField [x][y].typeKletki="pusto"
---- добавили пустая клетка

while gameField [x][y].typeKletki ==  "pusto" do
	
 x=math.random (xKletok)
 y=math.random (yKletok)
	  end
local posx=gameField [x][y].x
local posy=gameField [x][y].y
if  gameField [x][y].typeKletki=="food" then 
	foods=foods-1 
	end
gameField [x][y]:removeSelf()
turtle=   display.newSprite( turtleWalkmyImageSheet , turtleWalksequenceData ) 
turtle.xScale=1/3; turtle.yScale=1/3
turtle.x=posx
turtle.y=posy
gameField [x][y].typeKletki="turtle"
turtle.xpos=x
turtle.ypos=y
turtle:setSequence( "walk" )
--turtle:addEventListener( "sprite", TurttleWalkAnim )
sceneGroup:insert( turtle ) 

------ добавили черепаху

ghostPlay=false
ghost2Play=false
xTurtle=x
yTurtle=y

if level>5  and math.random (10)>3 then
	ghostPlay=true
	
	
while gameField [x][y].typeKletki ==  "pusto"  or gameField [x][y].typeKletki ==  "turtle"   do
	
 x=math.random (rndChoice(xTurtle))     --xKletok)
 y=math.random (rndChoice(yTurtle))
	  end
local posx=gameField [x][y].x
local posy=gameField [x][y].y
if  gameField [x][y].typeKletki=="food" then 
	foods=foods-1 
	end
gameField [x][y]:removeSelf()
ghost=   display.newSprite( ghostAnimmyImageSheet , ghostAnimsequenceData ) 
ghost.xScale=1/2
ghost.yScale=1/2  
ghost.alpha=0.5
ghost.x=posx
ghost.y=posy
gameField [x][y].typeKletki="ghost"
ghost.xpos=x
ghost.ypos=y
ghost:setSequence( "go" )
ghost:play()
sceneGroup:insert( ghost ) 
--- добавили привидение 

end

if level>10   then
	ghost2Play=true
	
while gameField [x][y].typeKletki ==  "pusto"  or gameField [x][y].typeKletki ==  "turtle"   do
	
 x=math.random (rndChoice(xTurtle))     --xKletok)
 y=math.random (rndChoice(yTurtle))
	  end
local posx=gameField [x][y].x
local posy=gameField [x][y].y
if  gameField [x][y].typeKletki=="food" then 
	foods=foods-1 
	end
gameField [x][y]:removeSelf()
ghost2=   display.newSprite( ghostAnimmyImageSheet , ghostAnimsequenceData ) 
ghost2.xScale=1/2
 ghost2.yScale=1/2  
ghost2.alpha=0.5
ghost2.x=posx
ghost2.y=posy
gameField [x][y].typeKletki="ghost"
ghost2.xpos=x
ghost2.ypos=y
ghost2:setSequence( "go" )
ghost2:play()
sceneGroup:insert( ghost2 ) 

end
 

------нарисовали игровое поле    
closeButton=display.newImageRect("close.png",razmerSprites/2,razmerSprites/2)
closeButton.x=600
closeButton.y=100
closeButton:addEventListener( "tap", function () composer.gotoScene( "menu", {effect = 'slideRight', time = 500}) end) 
sceneGroup:insert( closeButton ) 
    

      
   -----bar
    bar=display.newRect(30,80,320,39)
   -- bar:setFillColor(0)
     sceneGroup:insert( bar )    
  anchor.TopLeft( bar)

     
local barImg=display.newImage("bar.png")
 barImg.x=200
barImg.y=100   
 sceneGroup:insert( barImg )    
   ----end bar 
    
    
end

function barSet()
if bar.width>320 then bar.width=320 end
if bar.width<10 then loose() end
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
function barSet()
if bar.width>320 then bar.width=320 end
if bar.width<10 then loose() end
end

-- "scene:hide()"
function scene:hide( event )
Runtime:removeEventListener("enterFrame", gameOverDetection)Runtime:removeEventListener("enterFrame", barSet)
    	 timer.cancel( turtleTimer ) 
    	 timer.cancel( ghostTimer )
       timer.cancel(vectorTimer ) 
    --  print("hide") 
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
    --	 timer.cancel( ghostTimer )
       timer.cancel(vectorTimer ) 
       
       
    	
    --[[  	
        -- Create the widget
local button1 = widget.newButton
{
    label = "button",
    onEvent = handleButtonEvent,
    emboss = false,
    --properties for a rounded rectangle button...
    shape="roundedRect",
    width = 400,
    height = 200,
    cornerRadius = 2,
    fillColor = { default={ 1, 0, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
    strokeColor = { default={ 1, 0.4, 0, 1 }, over={ 0.8, 0.8, 1, 1 } },
    strokeWidth = 4,
    fontSize=36
}

-- Center the button
button1.x = display.contentCenterX
button1.y = display.contentCenterY
    ]]
--button1:setLabel( "Good!" )
-- Change the button's label text
 if foods <= 0  and level>=loadedlevel then
loadedlevel =loadedlevel +1
if loadedlevel==13 then loadedlevel=loadedlevel+1 end
    	local filePath = system.pathForFile( "turtlea.hs", system.DocumentsDirectory )
	file = io.open( filePath, "w" )
	file:write( loadedlevel)
--	file:write( HiScore..","..song)
	io.close( file )
	
--button1:setLabel( "Good!" )
 end

  if  gameOver then  	
	--	print("deadt")
		turtle:setSequence( "death" )
		turtle:play()
	
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
Runtime:addEventListener("enterFrame",barSet)
vectorTimer= timer.performWithDelay( 1500, vectorRND, 0 )
 Runtime:addEventListener("enterFrame",gameOverDetection)
-- -------------------------------------------------------------------------------

 

  
  



return scene
