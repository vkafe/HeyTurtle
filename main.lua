-- Project: turtle
-- Description:
--
-- Version: 1.0
-- Managed with http://OutlawGameTools.com
--
-- Copyright 2014 . All Rights Reserved.
---- cpmgen main.lua
display.setStatusBar( display.HiddenStatusBar )

if "Win" == system.getInfo( "platformName" ) then
    require("win_fix")
end



 fileName="turtle.map"  --- map from constructor

razmerKletki=100
razmerSprites=razmerKletki
gameItems=33
stoneItem=24  --- камень, те что меньше - несъедобные, те что больше - съедобные

turtleSheetItem=34
ghostSheetItem=35


xKletok=6
yKletok=6


function color(r,g,b) 
	return (r/255), (g/255), (b/255)
 end	    


anchor = {
    TopLeft = function(t) t.anchorX, t.anchorY = 0, 0; end,
    TopCenter = function(t) t.anchorX, t.anchorY = .5, 0; end,
    TopRight = function(t) t.anchorX, t.anchorY = 1, 0; end,
    CenterLeft = function(t) t.anchorX, t.anchorY = 0, .5; end,
    Center = function(t) t.anchorX, t.anchorY = .5, .5; end,
    CenterRight = function(t) t.anchorX, t.anchorY = 1, .5; end,
    BottomLeft = function(t) t.anchorX, t.anchorY = 0, 1; end,
    BottomCenter = function(t) t.anchorX, t.anchorY = .5, 1; end,
    BottomRight = function(t) t.anchorX, t.anchorY = 1, 1; end,
}
local str = require('str')
widget = require( "widget" )

bgimage = display.newImageRect( "bg.png",display.actualContentWidth, display.actualContentHeight)
--anchor.TopLeft( bgimage)
bgimage.x = display.contentCenterX
bgimage.y =display.contentCenterY




 --local backgroundMusic = audio.loadStream("bgMusic.mp3") 
HiScore =0
song=1

barWalk=3; barAmm=10 --сколько черепаха теряет или приобретает энергии

--soundtrack = audio.loadStream("silence.wav")
soundtrack = audio.loadStream("track.mp3")
songPu = audio.loadSound("pu.wav") --черепаха ест 
songFit = audio.loadSound("fit.wav")  --черепаха идёт 
songCok = audio.loadSound("cok.wav") --черепаха мрёт

local filePath = system.pathForFile( "settings.txt", system.DocumentsDirectory )
-- io.open opens a file at filePath. returns nil if no file found
--
local file = io.open( filePath, "r" )
if file then
	-- read all contents of file into a string
 dataStr = file:read( "*a" )
	local datavars = str.split( dataStr, ",")
	HiScore = tonumber(datavars[1])
	song=tonumber(datavars[2])
	io.close( file )
else
	-- create file b/c it doesn't exist yet
	file = io.open( filePath, "w" )
	file:write( HiScore..","..song)
io.close( file )
end





local function Mute (event)
      if event.phase == "began" then
                --делаем что-нибудь во время фазы "began"
            --    audio.play(songCok)
               -- print(song)
              buttonMute.alpha=0.7
              if song==1 then
              song=0
              file = io.open( filePath, "w" )
	file:write( HiScore..","..song)
	io.close( file )
	songPu = audio.loadSound("pu.wav")
songFit = audio.loadSound("fit.wav")
audio.stop (  )
--textMute.text="SILENT"
           
               elseif song==0 then
              song=1
              file = io.open( filePath, "w" )
	file:write( HiScore..","..song)
	io.close( file )

                          
              file = io.open( filePath, "w" )
	file:write( HiScore..","..song)
	io.close( file )
	songPu = audio.loadSound("pu.wav")
songFit = audio.loadSound("fit.wav")
backgroundMusicChannel = audio.play(soundtrack, {loops = -1})
buttonMute.alpha=1
--textMute.text="SONG OFF"
              end
              
        elseif event.phase == "moved" then
                --делаем что-нибудь во время фазы "moved"
         --   buttonMute:setFillColor( color(15, 15, 15),0.7)
        elseif event.phase == "ended" then
                --делаем что-нибудь во время фазы "ended"
       --       buttonMute:setFillColor( color(15, 15, 15),0.7)
        end
end



buttonMute =display.newImageRect("mute.png",razmerSprites/2,razmerSprites/2)
buttonMute.x=500
buttonMute.y=100
buttonMute.alpha=0.7
if song==1 then    buttonMute.alpha=1 end
		--buttonMute:setFillColor( color(15, 15, 15),0.7)
	--	anchor.Center(buttonMute)
-- textMute = display.newText("MUTE",100 , 100,native.systemFontBold,27)
buttonMute:addEventListener("touch",  Mute)
buttonMute.isVisible=false
--anchor.Center(textMute)










-- Performance meter
--local performance = require('performance')
--performance:newPerformanceMeter()



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
-----взяли спрайты из заготовок




composer = require( "composer" )
composer.recycleOnSceneChange = true
--local scene = composer.newScene()
composer.recycleOnLowMemory = true
composer.purgeOnSceneChange = true
-- your code goes here...


ads = require "ads"
 
local banner = "ca-app-pub-7571093472122380/4134278034"

 
ads.init( "admob", banner )


ads.show( "banner", { x=display.screenOriginX, y=display.viewableContentHeight-40, appId=banner} )






composer.gotoScene("menu")