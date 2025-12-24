local highligher = require(script.Parent:FindFirstChild("Highlighter"))
local tweenservice = game:GetService("TweenService")
local setup = { Run = function(frame: Frame)
	local distance = 0
	local txtsize = 15
	local barsize = 8
	local fadetime = 0.2
	local waittime = 2
	local actionid = 0
	local activetween = nil
	
	local linesbg = Instance.new("ScrollingFrame",frame)
	linesbg.BackgroundTransparency = 1
	linesbg.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
	linesbg.ScrollBarThickness = 0
	linesbg.BorderSizePixel = 0
	linesbg.Size = UDim2.new(0,34,1,0)
	linesbg.AutomaticSize = Enum.AutomaticSize.X
	linesbg.CanvasSize = UDim2.new(0,0,0,0)
	linesbg.AutomaticCanvasSize = Enum.AutomaticSize.Y
	linesbg.Name = "LinesBG"

	local linenums = Instance.new("TextLabel",linesbg)
	linenums.AutomaticSize = Enum.AutomaticSize.XY
	linenums.BackgroundTransparency = 1
	linenums.TextColor = BrickColor.new("Institutional white")
	linenums.Font = Enum.Font.Code
	linenums.TextSize = txtsize
	linenums.TextXAlignment = Enum.TextXAlignment.Center
	linenums.RichText = true
	linenums.Text = "<b>1</b>"
	linenums.Size = UDim2.new(1,0,0,0)
	linenums.Name = "LineNumbers"

	local editor = Instance.new("ScrollingFrame",frame)
	editor.BackgroundTransparency = 1
	editor.BorderSizePixel = 0
	editor.ScrollBarThickness = barsize
	editor.ScrollBarImageTransparency = 1
	editor.CanvasSize = UDim2.new(0,0,0,0)
	editor.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	editor.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	editor.Name = "Editor"

	local textbox = Instance.new("TextBox",editor)
	textbox.BackgroundTransparency = 1
	textbox.MultiLine = true
	textbox.ClearTextOnFocus = false
	textbox.TextSize = txtsize
	textbox.TextTransparency = 0.855
	textbox.Size = UDim2.new(20,0,20,0)
	textbox.AutomaticSize = Enum.AutomaticSize.Y
	textbox.TextXAlignment = Enum.TextXAlignment.Left
	textbox.TextYAlignment = Enum.TextYAlignment.Top
	textbox.Font = Enum.Font.Code
	textbox.Text = "print(\"Hello world!\")"
	textbox.Name = "TextBox"
	textbox.Position = UDim2.new(0,distance,0,0)
	textbox.ZIndex = 2

	--[[
	Don't need this code anymore since the new Highlighter module has a different method :3
	
	local highlighting = Instance.new("TextLabel",editor)
	highlighting.BackgroundTransparency = 1
	highlighting.TextXAlignment = Enum.TextXAlignment.Left
	highlighting.TextYAlignment = Enum.TextYAlignment.Top
	highlighting.TextSize = txtsize
	highlighting.TextColor3 = Color3.fromRGB(220, 220, 220)
	highlighting.Size = UDim2.new(1,0,0,0)
	highlighting.AutomaticSize = Enum.AutomaticSize.Y
	highlighting.Font = Enum.Font.Code
	highlighting.Position = UDim2.new(0,distance,0,0)
	highlighting.RichText = true
	highlighting.ZIndex = 1
	highlighting.Text = textbox.Text
	highlighting.ZIndex = 2
	highlighting.Name = "HighlightingLabel"
	]]--
	
	local lineselector = Instance.new("Frame",editor)
	lineselector.BackgroundTransparency = 0.95
	lineselector.BackgroundColor3 = Color3.new(1,1,1)
	lineselector.Position = UDim2.new(0,distance,0,0)
	lineselector.Size = UDim2.new(1,0,0,txtsize-1)
	lineselector.ZIndex = -1
	lineselector.BorderSizePixel = 0
	lineselector.Name = "LineSelector"
	local lineselector_outline = Instance.new("UIStroke",lineselector)
	lineselector_outline.Color = Color3.fromRGB(45,45,45)
	lineselector_outline.Thickness = 1
	lineselector_outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	lineselector_outline.Name = "Outline"
	
	local cursor = Instance.new("Frame",editor)
	cursor.Position = UDim2.new(0,distance,0,0)
	cursor.BackgroundColor3 = Color3.fromRGB(255,255,255)
	cursor.Size = UDim2.new(0,1,0,txtsize)
	cursor.Name = "Cursor"
	
	local reactorx = Instance.new("Frame",frame)
	reactorx.BackgroundTransparency = 1
	reactorx.Name = "ReactorX"
	local reactory = Instance.new("Frame",frame)
	reactory.BackgroundTransparency = 1
	reactory.Name = "ReactorY"
	
	local buildingtext = Instance.new("TextLabel",frame)
	buildingtext.ZIndex = 10
	buildingtext.BackgroundTransparency = 0.5
	buildingtext.BackgroundColor3 = Color3.fromRGB(0,0,0)
	buildingtext.TextColor3 = Color3.fromRGB(255,255,255)
	buildingtext.TextStrokeTransparency = 0
	buildingtext.Text = "Building Wackify..."
	buildingtext.TextSize = 18
	buildingtext.Size = UDim2.fromScale(1,1)
	buildingtext.BorderSizePixel = 0
	buildingtext.Name = "BuildingText"

	task.spawn(function()
		while task.wait() do
			editor.Position = UDim2.new(0,linesbg.AbsoluteSize.X,0,0)
			editor.Size = UDim2.new(1,-linesbg.AbsoluteSize.X,1,0)
			reactorx.Position = UDim2.new(0,linesbg.AbsoluteSize.X,1,-16)
			reactorx.Size = UDim2.new(1,-linesbg.AbsoluteSize.X,0,16)
			reactory.Position = UDim2.new(1,-16,0,0)
			reactory.Size = UDim2.new(0,16,1,0)
		end
	end)

	local function stoptween()
		if activetween then
			activetween:Cancel()
			activetween = nil
		end
	end
	local function showbar()
		actionid += 1
		stoptween()
		editor.ScrollBarImageTransparency = 0
	end
	local function sizebar()
		tweenservice:Create(
			editor,
			TweenInfo.new(fadetime),
			{ ScrollBarThickness = barsize+6 }
		):Play()
	end
	local function unsizebar()
		tweenservice:Create(
			editor,
			TweenInfo.new(fadetime),
			{ ScrollBarThickness = barsize }
		):Play()
	end
	local function hidebardelayed()
		actionid += 1
		local currentid = actionid
		task.delay(waittime,function()
			if currentid ~= actionid then
				return
			end
			stoptween()
			tweenservice:Create(
				editor,
				TweenInfo.new(fadetime,Enum.EasingStyle.Linear),
				{ScrollBarImageTransparency = 1}
			):Play()
		end)
	end

	reactorx.MouseEnter:Connect(function()
		sizebar()
		showbar()
	end)
	reactorx.MouseLeave:Connect(function()
		unsizebar()
		hidebardelayed()
	end)
	reactory.MouseEnter:Connect(function()
		sizebar()
		showbar()
	end)
	reactory.MouseLeave:Connect(function()
		unsizebar()
		hidebardelayed()
	end)
	editor:GetPropertyChangedSignal("CanvasSize"):Connect(function()
		showbar()
		hidebardelayed()
	end)
	editor:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		showbar()
		hidebardelayed()
	end)

	local function updatesyntax()
		highligher.Highlight(textbox,textbox.Text,true)
	end

	textbox:GetPropertyChangedSignal("Text"):Connect(updatesyntax)
	updatesyntax()
end, }

return setup
