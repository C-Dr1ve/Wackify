-- //===========================\\ --
-- || WACKY EDITOR, BY C:\DRIVE || --
-- \\===========================// --
--	\\  Thanks to Kodobokkusu  //  --
--   \\    for the syntax     //   --
--    \\    highlighting!    //    --
--     =======================     --
--           12/20/2025            --

local basesetup = require(script:FindFirstChild("BaseSetup"))
local lines = require(script:FindFirstChild("Lines"))
local cursor = require(script:FindFirstChild("Cursor"))
local selector = require(script:FindFirstChild("LineSelector"))
local autosize = require(script:FindFirstChild("AutoSizer"))
local matchpos = require(script:FindFirstChild("MatchPos"))
local autocomp = require(script:FindFirstChild("Autocomplete"))

local wack = { Wackify = function(frame: Frame)
	basesetup.Run(frame)
	task.wait(1/60)
	lines.Lines(frame)
	cursor.Cursor(frame)
	selector.Selector(frame)
	autosize.Autosize(frame)
	matchpos.Match(frame)
	autocomp.Autocomp(frame)
	frame:FindFirstChild("BuildingText",true):Destroy()
end,}

return wack
