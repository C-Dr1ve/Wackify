local autocomp = { Autocomp = function(frame: Frame)
	local textbox = frame:FindFirstChild("TextBox",true)
	--<< PART 1 >>--
	local lasttext = textbox.Text
	local busy = false
	local brackets = {
		["\""] = "\"",
		["'"] = "'",
		["("] = ")",
		["["] = "]",
		["{"] = "}",
		["`"] = "`"
	}
	textbox:GetPropertyChangedSignal("Text"):Connect(function()
		if busy then
			lasttext = textbox.Text
			return
		end
		local currenttext = textbox.Text
		local cursorpos = textbox.CursorPosition
		if cursorpos == -1 then
			lasttext = currenttext
			return
		end
		if #currenttext == #lasttext + 1 then
			local typedchar = currenttext:sub(cursorpos - 1,cursorpos - 1)
			local closechar = brackets[typedchar]
			if closechar then
				busy = true
				textbox.Text = currenttext:sub(1,cursorpos - 1)..closechar..currenttext:sub(cursorpos)
				textbox.CursorPosition = cursorpos
				busy = false
			end
		end
		lasttext = textbox.Text
	end)
	--<< PART 2 >>--
	local language = require(script:FindFirstChild("Keywords"))
	local cursorframe = frame:FindFirstChild("Cursor",true)
	if game:GetService("UserInputService").KeyboardEnabled and not game:GetService("UserInputService").TouchEnabled then
		local box = Instance.new("Frame",frame:FindFirstChild("Editor",true))
		box.AutomaticSize = Enum.AutomaticSize.XY
		box.BackgroundColor3 = Color3.fromRGB(30,30,30)
		box.BorderSizePixel = 1
		box.BorderColor3 = Color3.fromRGB(45,45,45)
		box.Size = UDim2.new(0,0,0,0)
		box.Visible = false
		box.ZIndex = 50
		box.Name = "SuggestionBox"
		local layout = Instance.new("UIListLayout",box)
		layout.Name = "Layout"
		layout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		layout.VerticalAlignment = Enum.VerticalAlignment.Top
		local function createbox(txt)
			local newbox = Instance.new("Frame",box)
			newbox.BackgroundTransparency = 1
			newbox.BorderSizePixel = 0
			newbox.AutomaticSize = Enum.AutomaticSize.X
			newbox.Size = UDim2.fromOffset(0,25)
			newbox.Name = txt
			local icon = Instance.new("ImageLabel",newbox)
			icon.Image = "rbxassetid://9087232887"
			icon.BackgroundTransparency = 1
			icon.AnchorPoint = Vector2.new(0,0.5)
			icon.Position = UDim2.new(0,4,0.5,0)
			icon.Size = UDim2.fromOffset(16,16)
			icon.Name = "Icon"
			local label = Instance.new("TextLabel",newbox)
			label.Text = txt.."  "
			label.BackgroundTransparency = 1
			label.BorderSizePixel = 0
			label.Size = UDim2.fromScale(0,1)
			label.AutomaticSize = Enum.AutomaticSize.X
			label.Position = UDim2.fromOffset(22,0)
			label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
			label.TextColor3 = Color3.new(1,1,1)
			label.TextSize = 15
		end
		local function clearboxes()
			for _,child in ipairs(box:GetChildren()) do
				if child:IsA("Frame") then
					child:Destroy()
				end
			end
		end
		local function checktext(text,cursorpos)
			local instring = false
			local stringchar = nil
			local incomment = false
			local inlocalvar = false
			local index = 1
			local lastwordstart = 1
			while index <= cursorpos and index <= #text do
				local char = text:sub(index,index)
				if incomment then
					if char == "\n" then
						incomment = false
					end
				elseif instring then
					if char == stringchar then
						instring = false
						stringchar = nil
					elseif char == "\\" then
						index = index + 1
					end
				else
					if char == "\"" or char == "'" then
						instring = true
						stringchar = char
					elseif char == "-" and index < #text and text:sub(index + 1,index + 1) == "-" then
						incomment = true
						index = index + 1
					elseif char:match("%s") or char:match("[=,%(%)%{%}%[%];]") or index == #text then
						local word = text:sub(lastwordstart,index - 1):match("^%s*(%w+)%s*$")
						if word == "local" and not inlocalvar then
							inlocalvar = true
						elseif inlocalvar and (char == "=" or char == "in" or char:match("%s")) then
							inlocalvar = false
						end
						lastwordstart = index + 1
					end
				end
				index = index + 1
			end
			return instring or incomment or inlocalvar
		end
		local function update(curword,cursorpos)
			clearboxes()
			if curword == "" or checktext(textbox.Text,cursorpos) then
				box.Visible = false
				return
			end
			local matches = {}
			for _,word in ipairs(language) do
				if typeof(word) == "string" and word:sub(1,#curword):lower() == curword:lower() then
					table.insert(matches,word)
				end
			end
			if #matches == 0 then
				box.Visible = false
				return
			end
			for _,match in ipairs(matches) do
				if match:lower() == curword:lower() then
					box.Visible = false
					return
				end
			end
			for _,match in ipairs(matches) do
				createbox(match)
			end
			if cursorframe then
				box.Position = UDim2.new(0,cursorframe.Position.X.Offset,0,cursorframe.Position.Y.Offset + cursorframe.Size.Y.Offset + 4)
			end
			box.Visible = true
		end
		textbox:GetPropertyChangedSignal("Text"):Connect(function()
			local word = textbox.Text:match("(%w+)$") or ""
			update(word,textbox.CursorPosition)
		end)
		textbox:GetPropertyChangedSignal("CursorPosition"):Connect(function()
			local word = textbox.Text:match("(%w+)$") or ""
			update(word,textbox.CursorPosition)
		end)
	end
end, }
return autocomp
