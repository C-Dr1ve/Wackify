--[[/*
	██╗    ██╗ █████╗  ██████╗██╗  ██╗██╗███████╗██╗   ██╗
	██║    ██║██╔══██╗██╔════╝██║ ██╔╝██║██╔════╝╚██╗ ██╔╝
	██║ █╗ ██║███████║██║     █████╔╝ ██║█████╗   ╚████╔╝ 
	██║███╗██║██╔══██║██║     ██╔═██╗ ██║██╔══╝    ╚██╔╝  
	╚███╔███╔╝██║  ██║╚██████╗██║  ██╗██║██║        ██║   
	 ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   
	* Version: 2.0.0
	
	Note: Takes inspiration from Kodobokkusu, but this will defeat it one day.
	
	( Created by: C:\Drive )
	- @Z3_WM on ROBLOX
	- @humanoid.root.part on Discord
	
	( Credits to these people )
	- ._.l5: Creating the syntax highlighting module.
	- Saji: Being a fat fucking chud.
	
	( TODO )
	- Add more themes.
	- Fix some of the themes.
	
	Example code:
	local wackify = require("@self/Wackify")
	wackify:New({ Target = script.Parent.Wackify, Theme = "Light", StartingCode = 'print("Hello world!")' })
--*/]]
local textservice = game:GetService("TextService")
local module = {}
local config = require("@self/Config")
local highligher = require("@self/Highlighter")
local themes = require("@self/Themes")

function module:New(args)
	local target: Frame = args.Target
	local theme = args.Theme
	if not target:IsA("Frame") then error("Target's class is not a frame!") end
	if typeof(theme) == "string" then
		if themes[theme] then
			theme = themes[theme]
		else
			error("\""..theme.."\" isn't a theme in the theme library! How about you create your own?")
		end
	end
	
	--// Stage 1: Setting up required elements \\--
	local linesbg = Instance.new("ScrollingFrame",target)
	linesbg.BackgroundTransparency = theme.LinesBackground.BackgroundTransparency
	linesbg.BackgroundColor3 = theme.LinesBackground.BackgroundColor3
	linesbg.ScrollBarThickness = 0
	linesbg.BorderSizePixel = theme.LinesBackground.BorderSizePixel
	linesbg.Size = UDim2.new(0,34,1,0)
	linesbg.AutomaticSize = Enum.AutomaticSize.X
	linesbg.CanvasSize = UDim2.new(0,0,0,0)
	linesbg.AutomaticCanvasSize = Enum.AutomaticSize.Y
	linesbg.Name = "LinesBG"
	local linenums = Instance.new("TextLabel",linesbg)
	linenums.AutomaticSize = Enum.AutomaticSize.XY
	linenums.BackgroundTransparency = theme.LineNumbers.BackgroundTransparency
	linenums.TextColor3 = theme.LineNumbers.TextColorHovered
	linenums.Font = theme.LineNumbers.Font
	linenums.TextSize = config.TextSize
	linenums.TextXAlignment = theme.LineNumbers.TextXAlignment
	linenums.RichText = true
	linenums.Text = "<b>1</b>"
	linenums.Size = UDim2.new(1,0,0,0)
	linenums.Name = "LineNumbers"
	local editor = Instance.new("ScrollingFrame",target)
	editor.BackgroundTransparency = theme.EditorFrame.BackgroundTransparency
	editor.BorderSizePixel = theme.EditorFrame.BorderSizePixel
	editor.ScrollBarThickness = config.BarSize
	editor.ScrollBarImageTransparency = 0
	editor.CanvasSize = UDim2.new(0,0,0,0)
	--editor.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	--editor.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	editor.Name = "Editor"
	local textbox = Instance.new("TextBox",editor)
	textbox.BackgroundTransparency = 1
	textbox.MultiLine = theme.TextBox.MultiLine
	textbox.ClearTextOnFocus = theme.TextBox.ClearTextOnFocus
	textbox.TextSize = config.TextSize
	textbox.TextTransparency = theme.TextBox.TextTransparency
	textbox.Size = UDim2.new(20,0,20,0)
	textbox.AutomaticSize = theme.TextBox.AutomaticSize
	textbox.TextXAlignment = theme.TextBox.TextXAlignment
	textbox.TextYAlignment = theme.TextBox.TextYAlignment
	textbox.Font = theme.TextBox.Font
	textbox.Text = args.StartingCode
	textbox.TextColor3 = Color3.fromRGB(255,255,255)
	textbox.Name = "TextBox"
	textbox.Position = UDim2.new(0,config.Distance,0,0)
	textbox.ZIndex = 2
	local lineselector = Instance.new("Frame",editor)
	lineselector.BackgroundTransparency = theme.LineSelector.BackgroundTransparency
	lineselector.BackgroundColor3 = theme.LineSelector.BackgroundColor3
	lineselector.Position = UDim2.new(0,config.Distance,0,0)
	lineselector.Size = UDim2.new(1,0,0,config.TextSize-1)
	lineselector.ZIndex = -1
	lineselector.BorderSizePixel = 0
	lineselector.Name = "LineSelector"
	local lineselector_outline = Instance.new("UIStroke",lineselector)
	lineselector_outline.Color = theme.LineSelector.Outline.Color
	lineselector_outline.Thickness = theme.LineSelector.Outline.Thickness
	lineselector_outline.ApplyStrokeMode = theme.LineSelector.Outline.ApplyStrokeMode
	lineselector_outline.Name = "Outline"
	local cursor = Instance.new("Frame",editor)
	cursor.Position = UDim2.new(0,config.Distance,0,0)
	cursor.BackgroundColor3 = theme.Cursor.BackgroundColor3
	cursor.Size = UDim2.new(0,1,0,config.TextSize)
	cursor.Name = "Cursor"
	cursor.ZIndex = 2
	
	task.spawn(function()
		while task.wait() do
			editor.Position = UDim2.new(0,linesbg.AbsoluteSize.X,0,0)
			editor.Size = UDim2.new(1,-linesbg.AbsoluteSize.X,1,0)
		end
	end)
	
	--// Stage 2: Syntax Highlighting \\--
	local function updatesyntax()
		pcall(function()
			highligher.Highlight(textbox,textbox.Text,true,theme)
		end)
	end
	updatesyntax()
	textbox:GetPropertyChangedSignal("Text"):Connect(updatesyntax)
	highligher.UpdateColors({
		background = { Color = theme.SyntaxColors.Background },
		iden = { Color = theme.SyntaxColors.Iden },
		keyword = { Color = theme.SyntaxColors.Keyword },
		variable = { Color = theme.SyntaxColors.Variable },
		builtin = { Color = theme.SyntaxColors.Builtin },
		string = { Color = theme.SyntaxColors.String },
		number = { Color = theme.SyntaxColors.Number },
		comment = { Color = theme.SyntaxColors.Comment },
		operator = { Color = theme.SyntaxColors.Operator },
		localmethod = { Color = theme.SyntaxColors.Localmethod },
		properties = { Color = theme.SyntaxColors.Properties },
		boolean = { Color = theme.SyntaxColors.Boolean },
		localproperty = { Color = theme.SyntaxColors.Localproperty },
		todo = { Color = theme.SyntaxColors.Todo, IsBold = false },
		link = { Color = theme.SyntaxColors.Link, IsUnderlined = true },
		custom = { Color = theme.SyntaxColors.Custom, IsBold = false },
	})
	
	--// Stage 3: Setting up the line numbers \\--
	linenums.RichText = true
	local function count(text)
		return select(2,text:gsub("\n","\n")) + 1
	end
	local function getline(text,cursor)
		if cursor <= 0 then
			return 1
		end
		return select(2,text:sub(1,cursor - 1):gsub("\n","\n")) + 1
	end
	local lastcount = count(textbox.Text)
	local function updatelines(curlines)
		local hovered = theme.LineNumbers.TextColorHovered
		local static = theme.LineNumbers.TextColorStatic
		local r1 = math.round(hovered.R * 255)
		local g1 = math.round(hovered.G * 255)
		local b1 = math.round(hovered.B * 255)
		local r2 = math.round(static.R * 255)
		local g2 = math.round(static.G * 255)
		local b2 = math.round(static.B * 255)
		task.spawn(function()
			local currentline = getline(textbox.Text,textbox.CursorPosition)
			local buffer = {}
			for int = 1,curlines do
				if int == currentline then
					buffer[int] = '<font color="rgb('..tostring(r1)..','..tostring(g1)..','..tostring(b1)..')">'..int..'</font>'
				else
					buffer[int] = '<font color="rgb('..tostring(r2)..','..tostring(g2)..','..tostring(b2)..')">'..int..'</font>'
				end
			end
			linenums.Text = table.concat(buffer,"\n")
		end)
	end
	updatelines(lastcount)
	textbox:GetPropertyChangedSignal("Text"):Connect(function()
		local curlines = count(textbox.Text)
		if curlines ~= lastcount then
			lastcount = curlines
		end
		updatelines(lastcount)
	end)
	textbox:GetPropertyChangedSignal("CursorPosition"):Connect(function()
		updatelines(lastcount)
	end)
	
	--// Stage 4: Automatic matching "linebg" and "editor" CanvasPositions \\--
	editor:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		linesbg.CanvasPosition = editor.CanvasPosition
	end)
	
	--// Stage 5: Automatic size-adjustments to textbox \\--
	local function updatesize()
		local textsize = textservice:GetTextSize(textbox.Text, textbox.TextSize, textbox.Font, Vector2.new(math.huge,math.huge))
		editor.CanvasSize = UDim2.fromOffset(textsize.X + 35,textsize.Y)
	end
	textbox:GetPropertyChangedSignal("Text"):Connect(updatesize)
	updatesize()
	
	--// Stage 6: Setting up the line selector \\--
	local function updateselector()
		if textbox:IsFocused() == false then
			lineselector.Visible = false
			return
		end
		lineselector.Visible = true
		local textvalue = textbox.Text or ""
		local cursorpos = textbox.CursorPosition
		if cursorpos < 1 then
			lineselector.Position = UDim2.new(0,0,0,0)
			return
		end
		local lines = {}
		local lastnewline = 0
		for int = 1,#textvalue do
			if string.sub(textvalue,int,int) == "\n" then
				table.insert(lines,string.sub(textvalue,lastnewline + 1,int - 1))
				lastnewline = int
			end
		end
		table.insert(lines,string.sub(textvalue,lastnewline + 1))
		local currentline = 1
		local charcount = 0
		for int,line in ipairs(lines) do
			if cursorpos <= charcount + #line + 1 then
				currentline = int
				break
			end
			charcount = charcount + #line + 1
		end
		lineselector:TweenPosition(
			UDim2.fromOffset(lineselector:FindFirstChild("Outline",true).Thickness,(currentline - 1)*textbox.TextSize),
			"Out",
			"Sine",
			0.1,
			true
		)
	end
	
	textbox.Focused:Connect(function()
		updateselector()
	end)
	textbox.FocusLost:Connect(function()
		lineselector.Visible = false
	end)
	textbox:GetPropertyChangedSignal("Text"):Connect(function()
		updateselector()
	end)
	textbox:GetPropertyChangedSignal("CursorPosition"):Connect(function()
		updateselector()
	end)
	updateselector()
	
	--// Stage 7: Setting up the custom cursor\\--
	local dist = 0
	local interval = config.CursorBlinkingSpeed
	local blinking = false
	local typing = false
	local idlewait = 0
	local lastinput = 0
	
	local function update()
		if textbox:IsFocused() == false then
			blinking = false
			typing = false
			return
		end
		local textvalue = textbox.Text or ""
		local cursorpos = textbox.CursorPosition
		if cursorpos < 1 then
			cursor.Position = UDim2.new(0, 0, 0, 0)
			return
		end
		local lines = {}
		local lastnewline = 0
		for index = 1, #textvalue do
			if string.sub(textvalue, index, index) == "\n" then
				table.insert(lines, string.sub(textvalue, lastnewline + 1, index - 1))
				lastnewline = index
			end
		end
		table.insert(lines, string.sub(textvalue, lastnewline + 1))
		local currentline = 1
		local charcount = 0
		for lineindex, line in ipairs(lines) do
			if cursorpos <= charcount + #line + 1 then
				currentline = lineindex
				break
			end
			charcount = charcount + #line + 1
		end
		local linepos = cursorpos - charcount - 1
		if linepos < 0 then linepos = 0 end
		local subtext = string.sub(lines[currentline], 1, linepos)
		local textsize = textservice:GetTextSize(subtext, textbox.TextSize, textbox.Font, Vector2.new(math.huge, math.huge))
		cursor:TweenPosition(
			UDim2.new(0, textsize.X + dist, 0, (currentline - 1) * textbox.TextSize),
			"Out",
			"Sine",
			0.1,
			true
		)
	end

	local function inputtick()
		lastinput = os.clock()
		typing = true
		blinking = false
		cursor.Visible = true
		task.delay(idlewait, function()
			if os.clock() - lastinput >= idlewait and textbox:IsFocused() == true then
				typing = false
				blinking = true
			end
		end)
	end

	task.spawn(function()
		while true do
			if blinking == true and typing == false then
				cursor.Visible = true
				task.wait(interval)
				cursor.Visible = false
				task.wait(interval)
			else
				task.wait(0.05)
			end
		end
	end)

	textbox.Focused:Connect(function()
		blinking = true
		update()
	end)
	textbox.FocusLost:Connect(function()
		blinking = false
		typing = false
		cursor.Visible = false
	end)
	textbox:GetPropertyChangedSignal("Text"):Connect(function()
		inputtick()
		update()
	end)
	textbox:GetPropertyChangedSignal("CursorPosition"):Connect(function()
		inputtick()
		update()
	end)
	update()
end

return module
