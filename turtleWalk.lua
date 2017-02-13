--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:1f0cef83b4983d95045b961bb61f116f:f4824bed5aab06db1976d5be074bdad2:8533d1f3f98fafbc1c760291cdcde2c5$
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
            -- turtle0
            x=2,
            y=2,
            width=200,
            height=260,

        },
        {
            -- turtle1
            x=2,
            y=264,
            width=200,
            height=260,

        },
        {
            -- turtle2
            x=2,
            y=526,
            width=200,
            height=260,

        },
        {
            -- turtle3
            x=2,
            y=788,
            width=200,
            height=282,

        },
        {
            -- turtle4
            x=2,
            y=1072,
            width=200,
            height=290,

        },
        {
            -- turtle5
            x=2,
            y=1364,
            width=200,
            height=321,

        },
        {
            -- turtle6
            x=2,
            y=1687,
            width=200,
            height=290,

        },           {
            -- turtle7
            x=2,
            y=1980,
            width=200,
            height=200,

        },
    },
    
    sheetContentWidth = 204,
    sheetContentHeight = 2179
}

SheetInfo.frameIndex =
{

    ["turtle0"] = 1,
    ["turtle1"] = 2,
    ["turtle2"] = 3,
    ["turtle3"] = 4,
    ["turtle4"] = 5,
    ["turtle5"] = 6,
    ["turtle6"] = 7,    ["turtle7"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
