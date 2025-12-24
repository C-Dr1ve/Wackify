local cursor = { Cursor = function(frame: Frame)
	local textbox: TextBox = frame:FindFirstChild("TextBox", true)
	local cursorframe: Frame = frame:FindFirstChild("Cursor", true)
	local dist = 0
	local interval = 0.4
	local blinking = false
	local typing = false
	local idlewait = 0
	local lastinput = 0
	if textbox == nil then return end
	if cursorframe == nil then return end
	local textservice = game:GetService("TextService")

	local function update()
		if textbox:IsFocused() == false then
			blinking = false
			typing = false
			return
		end
		local textvalue = textbox.Text or ""
		local cursorpos = textbox.CursorPosition
		if cursorpos < 1 then
			cursorframe.Position = UDim2.new(0, 0, 0, 0)
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
		cursorframe:TweenPosition(
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
		cursorframe.Visible = true
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
				cursorframe.Visible = true
				task.wait(interval)
				cursorframe.Visible = false
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
		cursorframe.Visible = false
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
end }
return cursor
