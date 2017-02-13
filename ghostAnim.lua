--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:25924a39d11a433e1e490317333ca828:7a0b108b738c7e263bbc50f0dd3ebaf9:a2fa9b006636e4b4023b4c0a06d8496b$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- ghost1
            x=2,
            y=2,
            width=188,
            height=194,

        },
        {
            -- ghost2
            x=192,
            y=2,
            width=188,
            height=194,

        },
        {
            -- ghost3
            x=382,
            y=2,
            width=188,
            height=194,

        },
        {
            -- ghost4
            x=572,
            y=2,
            width=188,
            height=194,

        },
        {
            -- ghost5
            x=762,
            y=2,
            width=188,
            height=194,

        },
        {
            -- ghost6
            x=952,
            y=2,
            width=188,
            height=194,

        },
        {
            -- ghost7
            x=1142,
            y=2,
            width=188,
            height=194,

        },
        {
            -- ghost8
            x=1332,
            y=2,
            width=188,
            height=194,

        },
    },
    
    sheetContentWidth = 1522,
    sheetContentHeight = 198
}

SheetInfo.frameIndex =
{

    ["ghost1"] = 1,
    ["ghost2"] = 2,
    ["ghost3"] = 3,
    ["ghost4"] = 4,
    ["ghost5"] = 5,
    ["ghost6"] = 6,
    ["ghost7"] = 7,
    ["ghost8"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
