
---код черепахи
vectorTurtle=1
function turtle(event)




if vectorTurtle>8 then
	vectorTurtle=1
end



----------------------turtle вправо
if   (vectorTurtle==1 or vectorTurtle==7) and turtlex<xKletok and (gameField[turtlex+1][turtley].typeKletki=="pusto" or gameField[turtlex+1][turtley].typeKletki=="food") then 
	
	if gameField[turtlex+1][turtley].typeKletki=="food" then
		gameField[turtlex+1][turtley]:removeSelf()
		foods=foods-1
	end
	
							gameField[turtlex+1][turtley]=display.newImageRect("turtle.png",razmerKletki,razmerKletki)
						
						scene._globalSceneObj:insert(gameField[turtlex+1][turtley])
							
						
						
							gameField[turtlex+1][turtley]:rotate( 90 )
							gameField[turtlex+1][turtley].typeKletki="turtle"
							
  							gameField[turtlex+1][turtley].x=(turtlex+1)*razmerKletki-30
  							gameField[turtlex+1][turtley].y=turtley*razmerKletki+150
  							gameField[turtlex+1][turtley].posex=turtlex+1
	 						 gameField[turtlex+1][turtley].posey=turtley
							   gameField[turtlex][turtley]:removeSelf()
								 gameField[turtlex][turtley].typeKletki="pusto"
								 turtlex=turtlex+1
							return	 
					end

	


----------------------turtle влево
if  (vectorTurtle==5 or vectorTurtle==3) and turtlex>1 and (gameField[turtlex-1][turtley].typeKletki=="pusto" or gameField[turtlex-1][turtley].typeKletki=="food") then 
	
	if gameField[turtlex-1][turtley].typeKletki=="food" then
		gameField[turtlex-1][turtley]:removeSelf()
		foods=foods-1
	end
	
							gameField[turtlex-1][turtley]=display.newImageRect("turtle.png",razmerKletki,razmerKletki)
						scene._globalSceneObj:insert(gameField[turtlex-1][turtley])	
							
							
							gameField[turtlex-1][turtley]:rotate( -90 )
							gameField[turtlex-1][turtley].typeKletki="turtle"
							
  							gameField[turtlex-1][turtley].x=(turtlex-1)*razmerKletki-30
  							gameField[turtlex-1][turtley].y=turtley*razmerKletki+150
  							gameField[turtlex-1][turtley].posex=turtlex-1
	 						 gameField[turtlex-1][turtley].posey=turtley
							   gameField[turtlex][turtley]:removeSelf()
								 gameField[turtlex][turtley].typeKletki="pusto"
								 turtlex=turtlex-1
							return	 
					end
	
	
	
		----------------------turtle вниз
if  (vectorTurtle==4 or vectorTurtle==8) and turtley<yKletok and (gameField[turtlex][turtley+1].typeKletki=="pusto" or gameField[turtlex][turtley+1].typeKletki=="food") then 
	
	if gameField[turtlex][turtley+1].typeKletki=="food" then
		gameField[turtlex][turtley+1]:removeSelf()
		foods=foods-1
	end
	
							gameField[turtlex][turtley+1]=display.newImageRect("turtle.png",razmerKletki,razmerKletki)
							scene._globalSceneObj:insert(gameField[turtlex][turtley+1])
												
							gameField[turtlex][turtley+1]:rotate( 180 )
							gameField[turtlex][turtley+1].typeKletki="turtle"
							
  							gameField[turtlex][turtley+1].x=turtlex*razmerKletki-30
  							gameField[turtlex][turtley+1].y=(turtley+1)*razmerKletki+150
  							gameField[turtlex][turtley+1].posex=turtlex
	 						 gameField[turtlex][turtley+1].posey=turtley+1
							   gameField[turtlex][turtley]:removeSelf()
								 gameField[turtlex][turtley].typeKletki="pusto"
								 turtley=turtley+1
							return	 
					end
	
	
	
	----------------------turtle вверх
if  (vectorTurtle==2 or vectorTurtle==6) and turtley>1 and (gameField[turtlex][turtley-1].typeKletki=="pusto" or gameField[turtlex][turtley-1].typeKletki=="food") then 
	
	if gameField[turtlex][turtley-1].typeKletki=="food" then
		gameField[turtlex][turtley-1]:removeSelf()
		foods=foods-1
	end
	
							gameField[turtlex][turtley-1]=display.newImageRect("turtle.png",razmerKletki,razmerKletki)
							scene._globalSceneObj:insert(gameField[turtlex][turtley-1])
						
							
							gameField[turtlex][turtley-1]:rotate( 0 )
							gameField[turtlex][turtley-1].typeKletki="turtle"
							
  							gameField[turtlex][turtley-1].x=turtlex*razmerKletki-30
  							gameField[turtlex][turtley-1].y=(turtley-1)*razmerKletki+150
  							gameField[turtlex][turtley-1].posex=turtlex
	 						 gameField[turtlex][turtley-1].posey=turtley-1
							   gameField[turtlex][turtley]:removeSelf()
								 gameField[turtlex][turtley].typeKletki="pusto"
								 turtley=turtley-1
							return	 
					end
	
	
	
	
	
	
	
	
	vectorTurtle=vectorTurtle+1
	return
end
