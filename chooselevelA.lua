print ('choce level Az')
--composer.removeScene("play",false)
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------





loadedlevel =1
--загрузка пройденных уровней здесь
local filePath = system.pathForFile( "turtlea.hs", system.DocumentsDirectory )

-- io.open opens a file at filePath. returns nil if no file found
--
local file = io.open( filePath, "r" )
if file then
	-- read all contents of file into a string
	
 dataStr = file:read( "*a" )
	local datavars = str.split( dataStr, ",")
	
loadedlevel= tonumber(datavars[1])
--	song=tonumber(datavars[2])
	
io.close( file )

else
	
	-- create file b/c it doesn't exist yet
	file = io.open( filePath, "w" )
	file:write( loadedlevel)
	
--	file:write( HiScore..","..song)
	
io.close( file )

end


local currentButton

function tapButton() 
	composer.gotoScene( "playA", {effect = 'slideLeft', time = 500, params ={level=tonumber(buttonGroup[currentButton][2].text)}})
	 
end

function TransactCancel(event)
	--print("cancel trans")
for i=1,7,1 do
	buttonGroup[i].x=buttonGroup[i].targetX
	buttonGroup[i].y=buttonGroup[i].targetY
	buttonGroup[i].xScale=buttonGroup[i].targetXScale
	buttonGroup[i].yScale=buttonGroup[i].targetYScale
end
end




function caruselDo(vector)
--bgimage:removeEventListener("touch",TouchCarusel)


--k=4
print (vector)
if vector=="right" and tonumber(buttonGroup[currentButton][2].text)>1 then
	
	if (tonumber(buttonGroup[currentButton][2].text)<=16 and  tonumber(buttonGroup[currentButton][2].text)>=13)  then k=5 else k=4 end
	
buttonGroup[currentButton]:removeEventListener("tap",tapButton)	

		for i=1,7,1 do

			if i==7 then u=1  else u=i+1 end
				
					
					if tonumber(buttonGroup[i][2].text)<1 or buttonGroup[u].x-buttonGroup[i].x<0 then 
						buttonGroup[i].alpha=0;
						 buttonGroup[i][2].text=tonumber(buttonGroup[currentButton][2].text)-k--4
						-- print( buttonGroup[i][2].text)
						 if tonumber(buttonGroup[i][2].text)==13 then buttonGroup[i][2].text=tonumber(buttonGroup[i][2].text)-1 end
						-- 	print( buttonGroup[i][2].text)
	elseif tonumber(buttonGroup[i][2].text)>loadedlevel then  buttonGroup[i].alpha=0.5
	else
buttonGroup[i].alpha=1
end
				buttonGroup[i].targetX=buttonGroup[u].x
				buttonGroup[i].targetY=buttonGroup[u].y
				buttonGroup[i].targetXScale=buttonGroup[u].xScale
				buttonGroup[i].targetYScale=buttonGroup[u].yScale
				transition.to( buttonGroup[i], { time=400,  x=buttonGroup[u].x, y=buttonGroup[u].y,  xScale =buttonGroup[u].xScale, yScale =buttonGroup[u].yScale, onCancel=TransactCancel})

			end

			if currentButton-1<1 then currentButton=7 else currentButton=currentButton-1 end
buttonGroup[currentButton]:addEventListener( "tap", tapButton) 


		

elseif vector=="left"  and tonumber(buttonGroup[currentButton][2].text)<loadedlevel then

if (tonumber(buttonGroup[currentButton][2].text)>=10 and  tonumber(buttonGroup[currentButton][2].text)<=13)  then k=5 else k=4 end
	
buttonGroup[currentButton]:removeEventListener("tap",tapButton)	

		for i=7,1,-1 do

			if i==1 then u=7  else u=i-1 end
				
					if  buttonGroup[u].x-buttonGroup[i].x>600 then 
						buttonGroup[i].alpha=0; 
						buttonGroup[i][2].text=tonumber(buttonGroup[currentButton][2].text)+k --4
						 --print( buttonGroup[i][2].text)
						 if tonumber(buttonGroup[i][2].text)==13 then 
						 	buttonGroup[i][2].text=tonumber(buttonGroup[i][2].text)+1
						 	 end
						 	
	elseif tonumber(buttonGroup[i][2].text)>loadedlevel then  buttonGroup[i].alpha=0.5
	elseif tonumber(buttonGroup[i][2].text)<1 then buttonGroup[i].alpha=0 
	else
buttonGroup[i].alpha=1
end
				buttonGroup[i].targetX=buttonGroup[u].x
				buttonGroup[i].targetY=buttonGroup[u].y
				buttonGroup[i].targetXScale=buttonGroup[u].xScale
				buttonGroup[i].targetYScale=buttonGroup[u].yScale
				--if  buttonGroup[u].x-buttonGroup[i].x>600 then 	buttonGroup[i][2].text='0' 	end
				--	print (tonumber(buttonGroup[i][2].text)) 
				transition.to( buttonGroup[i], { time=400,  x=buttonGroup[u].x, y=buttonGroup[u].y,  xScale =buttonGroup[u].xScale, yScale =buttonGroup[u].yScale, onCancel=TransactCancel})

			end
		--end
			if currentButton+1>7 then currentButton=1 else 
				currentButton=currentButton+1 
				end
buttonGroup[currentButton]:addEventListener( "tap", tapButton) 

end


end




function TouchCarusel(event)


local t = event.target

if event.y <400 then
	-- Print info about the event. For actual production code, you should
	-- not call this function because it wastes CPU resources.
	--printTouch(event)
transition.cancel()
	local phase = event.phase
	if "began" == phase then
		-- Make target the top-most object
		--local parent = t.parent
		--parent:insert( t )
		--display.getCurrentStage():setFocus( t )

		-- Spurious events can be sent to the target, e.g. the user presses 
		-- elsewhere on the screen and then moves the finger over the target.
		-- To prevent this, we add this flag. Only when it's true will "move"
		-- events be sent to the target.
	--	t.isFocus = true

		-- Store initial position
		t.x0 = event.x 
	--	t.y0 = event.y 
		
	--	t.xish=caruselGroup.x
--		t.yish=caruselGroup.y
	
		
		
		--	elseif t.isFocus then
		elseif "moved" == phase then
			-- Make object move (we subtract t.x0,t.y0 so that moves are
			-- relative to initial grab point, rather than object "snapping").
			--caruselGroup.x = event.x -t.x0
			--t.y = event.y - t.y0
		elseif "ended" == phase or "cancelled" == phase then
			transition.cancel()
		if t.x0~=nil then
		if   event.x-t.x0 >0 then caruselDo("right")
			elseif event.x-t.x0<0 then   caruselDo("left")
			--else
			--caruselGroup.x = t.xish
		end
		end		
		--	display.getCurrentStage():setFocus( nil )
		--	t.isFocus = false
		
			
			
		end
end
end




local function onClickDeleteAlert(e)  
    if e.action == "clicked" then  
        if e.index == 1 then  
        	tableView:deleteRow( event.target.index )
            -- Do something
        elseif e.index == 2 then  
         --   system.openURL( "http://devblogdk.blogspot.in/" )  
        end  
    end  
end  





local widget = require( "widget" )
-----------------------------------------------------------

-- Handle touches on the row
local function  tableViewListener( event )
    local phase = event.phase

 -- print( "Touched row:", event.target.index )
         --   print( "Touched x:", event.x )    
 --  print("phase=",phase)
 
 
 if event.target.index ==nil  then 
 	return;
 	else
 --  local phaseEt
   if phase=="began" then phaseEt=true end
  if phase=="moved" then phaseEt=false end  
  if phase=="ended" and phaseEt then 
   			
   function onClicDel(e)   
   	if e.action == "clicked" then   
   		 if e.index == 2 then 
   		 	local loadsave = require("loadsave");
   		 	 if  loadsave.loadTable(fileName, system.DocumentsDirectory) ~=nil then 
   		 	 	local mapTable = loadsave.loadTable(fileName, system.DocumentsDirectory);
   		 	 	 table.remove(mapTable,event.target.index);
   		 	 	  loadsave.saveTable(mapTable, fileName, system.DocumentsDirectory); 
   		 	 	  tableView:deleteRow( event.target.index ) 
   		 	 	  end  
   		 	 	  end
   		 	 	   end 			
   end
   
   			
   			if event.x>530  and event.target.index ~=nil then  
   				local loadsave = require("loadsave")
if  loadsave.loadTable(fileName, system.DocumentsDirectory) ~=nil then
local mapTable = loadsave.loadTable(fileName, system.DocumentsDirectory)
if mapTable[event.target.index]~=nil then
local alert = native.showAlert( "WARNING!", "Delete "..mapTable[event.target.index][1].."?", { "CANCEL","OK" },onClicDel) 
end
end
elseif  event.target.index~=nil then
--print (event.target.index)
local loadsave = require("loadsave")
if  loadsave.loadTable(fileName, system.DocumentsDirectory) ~=nil then
local mapTable = loadsave.loadTable(fileName, system.DocumentsDirectory)
if mapTable[event.target.index]~=nil then
composer.gotoScene( "playC", {effect = 'slideLeft', time = 500, params ={level=event.target.index}}) 
end
end
end
--print ("start level ",  event.target.index )
		--	end
   			
   			 end
    --if "press" == phase then
       
      --  row:deleteRow( row:getContentPosition() )
  end
end

-- The "onRowRender" function may go here (see example under "Inserting Rows", above)
local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    local rowTitle = display.newText( row,row.params.mapName, 0, 0, native.systemFontBold, 40 )
    rowTitle:setFillColor( 0 )
   -- rowTitle:addEventListener ( "tap", tapRow )

    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.x = 0
    rowTitle.y = rowHeight * 0.5
    
    local rowImg=display.newImageRect("delete.png",30,30)
    rowImg.x=rowWidth-40
    rowImg.y = rowHeight * 0.5
    row:insert(rowImg)
   -- rowImg:addEventListener ( "tap",tapImg)
    
end




 buttonGroup={}
 --caruselGroup = display.newGroup()


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

local CaruselY=200
local caruselAlfa={0.5,0.8,1,1.5,1,0.8,0.5}
if  loadedlevel>13 then k=5 else k=4 end
for i=1,7,1 do
 buttonGroup[i]= display.newGroup()	
buttonStone=display.newImage("stone.png")
buttonGroup[i]:insert(buttonStone)
buttonText=display.newText("", 0, 0, native.systemFontBold, 50 )
local txt=loadedlevel+i-k--5--4
if txt>=13 then txt=txt+1 end
buttonText.text=txt
buttonGroup[i]:insert(buttonText)
x=156*i-300
buttonGroup[i].x=x
buttonGroup[i].y=CaruselY
if txt<1 then buttonGroup[i].alpha=0
	elseif txt>loadedlevel then  buttonGroup[i].alpha=0.5
	else
buttonGroup[i].alpha=1
end
buttonGroup[i].xScale=caruselAlfa[i]
buttonGroup[i].yScale=caruselAlfa[i]

--caruselGroup:insert(buttonGroup[i])
sceneGroup:insert( buttonGroup[i] ) 
end

--caruselGroup:addEventListener( "touch", TouchCarusel )

--buttonGroup[loadedlevel][2].text="Hi"
currentButton=4
buttonGroup[currentButton]:addEventListener( "tap", tapButton) 




display.newText(sceneGroup, "Constructor", display.contentCenterX, 440, native.systemFontBold, 40 )
--print("kfjgkfjgklfdo")
local rect=display.newRect( sceneGroup, 50,465,   display.viewableContentWidth-100, 150  )
anchor.TopLeft( rect)
--display.NewRect(sceneGroup, 50, 460,   display.actualContentWidth-100, display.actualContentHeight-550 )
levelCreatorButton=display.newText( sceneGroup,"+...", 90, 485, native.systemFontBold, 50 )
levelCreatorButton:setFillColor(  0)
--levelCreatorLabel=display.newText(  sceneGroup,"...", 80, 510, native.systemFontBold, 50 )
--levelCreatorLabel:setFillColor(  0)
 levelCreatorButton:addEventListener( "touch", function () composer.gotoScene( "playB", {effect = 'slideLeft', time = 500}) end) 
 --sceneGroup:insert(levelCreatorButton)
--sceneGroup:insert(levelCreatorLabel)

-------------------------------------------------загрузка созданных левелей если есть и отображение передать в playC и там построить


-- Create the widget
tableView = widget.newTableView
{
    left = 50,
    top = 510,
    height = display.viewableContentHeight-650,
    width = display.viewableContentWidth-100,
    -- hideBackground=true,
    onRowRender = onRowRender,
    onRowTouch = onRowTouch,
    listener = tableViewListener,
  --  hideBackground=true
   -- listener = scrollListener
}
sceneGroup:insert(tableView)

local loadsave = require("loadsave")
if  loadsave.loadTable(fileName, system.DocumentsDirectory) ~=nil then
local mapTable = loadsave.loadTable(fileName, system.DocumentsDirectory)
--local recLoop= #mapTable
--if  recLoop==nil then  recLoop=1 end

for i = 1,  #mapTable do
    -- Insert a row into the tableView
   -- print(mapTable[1][1])
    tableView:insertRow{rowHeight=50,  params = {mapName=mapTable[i][1]}}
end
end
------------------------------------------------------------------------------------------


bgimage:addEventListener( "touch",TouchCarusel )
	
	
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


bgimage:removeEventListener("touch",TouchCarusel)

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
