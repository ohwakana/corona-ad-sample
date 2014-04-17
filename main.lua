--
-- main.lua
--
display.setStatusBar( display.HiddenStatusBar ) 
display.setDefault( "background", 0, 0, 0 )

local sampleText = display.newText( "AD Sample", 0, 0, native.systemFont, 16 )
sampleText.x = display.contentWidth * 0.5
sampleText.y = display.contentHeight * 0.5

-- 広告表示
local function urlHandler(event)
    local url = event.url
    if( string.find( url, "http:" ) ~= nil or string.find( url, "mailto:" ) ~= nil ) then
        print("url: ".. url)
        system.openURL(url)
    end
    return true
end

local url = "ad.html"
local adoptions =
{
	hasBackground=false,
	autoCancel=false,
	baseUrl=system.ResourceDirectory,
	urlRequest=urlHandler
}

native.showWebPopup( 0, display.contentHeight - 50, display.contentWidth, 50, url, adoptions )
