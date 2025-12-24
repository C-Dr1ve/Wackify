local autosize = { Autosize = function(frame: Frame)
	local textservice = game:GetService("TextService")
	local editor = frame:FindFirstChild("Editor", true)
	local textbox = frame:FindFirstChild("TextBox", true)
	local function update()
		local textsize = textservice:GetTextSize(textbox.Text, textbox.TextSize, textbox.Font, Vector2.new(math.huge, math.huge))
		editor.CanvasSize = UDim2.new(0, textsize.X + 35, 0, textsize.Y)
	end
	textbox:GetPropertyChangedSignal("Text"):Connect(update)
	update()
end, }
return autosize
