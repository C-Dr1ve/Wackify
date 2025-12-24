local lines = { Lines = function(frame: Frame)
	local linesbg: ScrollingFrame = frame:WaitForChild("LinesBG", true)
	local linenums: TextLabel = linesbg:FindFirstChild("LineNumbers", true)
	local textbox: TextBox = frame:FindFirstChild("TextBox", true)
	linenums.RichText = true
	local function count(text)
		return select(2, text:gsub("\n", "\n")) + 1
	end
	local function getline(text, cursor)
		if cursor <= 0 then
			return 1
		end
		return select(2, text:sub(1, cursor - 1):gsub("\n", "\n")) + 1
	end
	local lastcount = count(textbox.Text)
	local function updatelines(curlines)
		local currentline = getline(textbox.Text, textbox.CursorPosition)
		local buffer = {}
		for i = 1, curlines do
			if i == currentline then
				buffer[i] = '<font color="rgb(255,255,255)">'..i..'</font>'
			else
				buffer[i] = '<font color="rgb(128,128,128)">'..i..'</font>'
			end
		end
		linenums.Text = table.concat(buffer, "\n")
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
end }
return lines
