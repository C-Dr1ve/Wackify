local selector = { Selector = function(frame: Frame)
	local selectorbar: Frame = frame:FindFirstChild("LineSelector", true)
	local textbox: TextBox = frame:FindFirstChild("TextBox", true)
	
	if selectorbar == nil then return end
	if textbox == nil then return end
	
	local function update()
		if textbox:IsFocused() == false then
			selectorbar.Visible = false
			return
		end
		selectorbar.Visible = true
		local textvalue = textbox.Text or ""
		local cursorpos = textbox.CursorPosition
		if cursorpos < 1 then
			selectorbar.Position = UDim2.new(0, 0, 0, 0)
			return
		end
		local lines = {}
		local lastnewline = 0
		for i = 1, #textvalue do
			if string.sub(textvalue, i, i) == "\n" then
				table.insert(lines, string.sub(textvalue, lastnewline + 1, i - 1))
				lastnewline = i
			end
		end
		table.insert(lines, string.sub(textvalue, lastnewline + 1))
		local currentline = 1
		local charcount = 0
		for i, line in ipairs(lines) do
			if cursorpos <= charcount + #line + 1 then
				currentline = i
				break
			end
			charcount = charcount + #line + 1
		end
		selectorbar:TweenPosition(
			UDim2.new(0, selectorbar:FindFirstChild("Outline",true).Thickness, 0, (currentline - 1) * textbox.TextSize),
			"Out",
			"Sine",
			0.1,
			true
		)
	end
	
	textbox.Focused:Connect(function()
		update()
	end)
	textbox.FocusLost:Connect(function()
		selectorbar.Visible = false
	end)
	textbox:GetPropertyChangedSignal("Text"):Connect(function()
		update()
	end)
	textbox:GetPropertyChangedSignal("CursorPosition"):Connect(function()
		update()
	end)
	update()
end,}

return selector
