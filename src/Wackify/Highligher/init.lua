local Lexer = require(script.Lexer)

local TextService = game:GetService("TextService");

local TokenColors = table.create(8);
local TokenFormats = table.create(7)
local ActiveLabels = table.create(3)

local CurrentTextbox = nil

local function SanitizeRichText(s)
	return string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(s,
		"&", "&amp;"),
		"<", "&lt;"),
		">", "&gt;"),
		"\"", "&quot;"),
		"'", "&apos;"
	)
end

local function SanitizeTabs(s)
	return string.gsub(s, "\t", "    ")
end

local function SanitizeControl(s)
	return string.gsub(s, "[\0\1\2\3\4\5\6\7\8\11\12\13\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
end

local function highlight(textObject, src, underlineLinks)
	local linesFolder = nil
	src = SanitizeTabs(SanitizeControl(src or textObject.Text))
	
	textObject.RichText = false
	textObject.Text = src
	textObject.TextXAlignment = Enum.TextXAlignment.Left
	textObject.TextYAlignment = Enum.TextYAlignment.Top
	--textObject.BackgroundColor3 = TokenColors.background
	textObject.TextColor3 = TokenColors.background.Color
	textObject.TextTransparency = .855
	
	if textObject:FindFirstChild("SyntaxLines") then
		linesFolder = textObject:FindFirstChild("SyntaxLines")
	else
		linesFolder = Instance.new("Folder", textObject)
		linesFolder.Name = "SyntaxLines"
	end
	
	if textObject:IsA("TextBox") then
		CurrentTextbox = textObject
	end

	local textSize = textObject.TextSize

	local _, numLines = string.gsub(src, "\n", "")
	numLines += 1

	local size = TextService:GetTextSize("", textObject.TextSize, textObject.Font, Vector2.new());

	local lineLabels = ActiveLabels[textObject]
	if not lineLabels then
		-- No existing lineLabels, create all new
		lineLabels = table.create(numLines)
		for i = 1, numLines do
			local lineLabel = Instance.new("TextLabel")
			--local selectionHighlight = script.SelectionHighlighter:Clone()
			lineLabel.Name = "Line_" .. i
			lineLabel.RichText = true
			lineLabel.BackgroundTransparency = 1
			lineLabel.TextXAlignment = Enum.TextXAlignment.Left
			lineLabel.TextYAlignment = Enum.TextYAlignment.Top
			lineLabel.TextColor3 = TokenColors.iden.Color
			lineLabel.Font = textObject.Font
			lineLabel.TextSize = textSize
			lineLabel.ZIndex = textObject.ZIndex + 2
			lineLabel.AutomaticSize = Enum.AutomaticSize.X

			lineLabel.Size = UDim2.new(1, 0, 0, size.Y)
			lineLabel.Position = UDim2.fromOffset(0, size.Y * textObject.LineHeight * (i - 1))
			lineLabel.Text = ""

			lineLabel.Parent = linesFolder
			lineLabels[i] = lineLabel
			
			--selectionHighlight.Parent = lineLabel
			--selectionHighlight.Size = UDim2.new(0,0,1,0)
		end
	elseif #lineLabels < numLines then
		-- Existing labels, but missing some lines
		for i = #lineLabels + 1, numLines do
			local lineLabel = Instance.new("TextLabel")
			--local selectionHighlight = script.SelectionHighlighter:Clone()
			lineLabel.Name = "Line_" .. i
			lineLabel.RichText = true
			lineLabel.BackgroundTransparency = 1
			lineLabel.TextXAlignment = Enum.TextXAlignment.Left
			lineLabel.TextYAlignment = Enum.TextYAlignment.Top
			lineLabel.TextColor3 = TokenColors.iden.Color
			lineLabel.Font = textObject.Font
			lineLabel.TextSize = textSize
			lineLabel.BorderColor3 = Color3.fromRGB(53, 17, 255)
			lineLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			lineLabel.ZIndex = textObject.ZIndex + 2
			lineLabel.AutomaticSize = Enum.AutomaticSize.X

			lineLabel.Size = UDim2.new(1, 0, 0, size.Y)
			lineLabel.Position = UDim2.fromOffset(0, size.Y * textObject.LineHeight * (i - 1))
			lineLabel.Text = ""

			lineLabel.Parent = linesFolder
			lineLabels[i] = lineLabel
			--selectionHighlight.Parent = lineLabel
			--selectionHighlight.Size = UDim2.new(0,0,1,0)
		end
	elseif #lineLabels > numLines then
		-- Existing labels, with too many lines
		for i = #lineLabels, numLines, -1 do
			lineLabels[i].Text = ""
		end
	end

	local richText, index, lineNumber = {}, 0, 1
	for token, content in Lexer.scan(src) do
		local Color = TokenColors[token] or TokenColors.iden.Color

		local lines = string.split(SanitizeRichText(content), "\n")
		for l, line in ipairs(lines) do
			if l > 1 then
				-- Set line
				lineLabels[lineNumber].Text = table.concat(richText)
				-- Move to next line
				lineNumber += 1
				index = 0
				table.clear(richText)
			end

			index += 1
			if Color ~= TokenColors.iden.Color and string.find(line, "[%S%C]") then
				richText[index] = string.format(TokenFormats[token], line)
			else
				richText[index] = line
			end
		end
	end

	-- Set final line
	lineLabels[lineNumber].Text = table.concat(richText)

	ActiveLabels[textObject] = lineLabels

	local Cleanup
	Cleanup = textObject.AncestryChanged:Connect(function()
		if textObject.Parent then
			return
		end
		ActiveLabels[textObject] = nil
		Cleanup:Disconnect()
	end)

	return function()
		for _, label in ipairs(lineLabels) do
			label:Destroy()
		end
		table.clear(lineLabels)

		ActiveLabels[textObject] = nil
		Cleanup:Disconnect()
	end
end

-- ty synapse
--[[export type HighlighterColors = {
	background: Color3?,
	iden: Color3?,
	keyword: Color3?,
	builtin: Color3?,
	string: Color3?,
	number: Color3?,
	comment: Color3?,
	operator: Color3?
}]]

local function updateColors(colors)
	-- Setup color data
	TokenColors.background = (colors and colors.background) or {Color = Color3.fromRGB(255, 255, 255)}
	TokenColors.iden = (colors and colors.iden) or {Color = Color3.fromRGB(156, 220, 254)}
	TokenColors.keyword = (colors and colors.keyword) or {Color = Color3.fromRGB(255, 173, 250)}
	TokenColors.variable = (colors and colors.variable) or {Color = Color3.fromRGB(102, 186, 255)}
	TokenColors.builtin = (colors and colors.builtin) or {Color = Color3.fromRGB(255, 255, 197)}
	TokenColors.string = (colors and colors.string) or {Color = Color3.fromRGB(255, 179, 149)}
	TokenColors.number = (colors and colors.number) or {Color = Color3.fromRGB(224, 255, 208)}
	TokenColors.comment = (colors and colors.comment) or {Color = Color3.fromRGB(152, 216, 120)}
	TokenColors.operator = (colors and colors.operator) or {Color = Color3.fromRGB(255, 215, 0)}
	TokenColors.localmethod = (colors and colors.localmethod) or {Color = Color3.fromRGB(255, 255, 197)}
	TokenColors.properties = (colors and colors.properties) or {Color = Color3.fromRGB(88, 210, 255)}
	TokenColors.boolean = (colors and colors.boolean) or {Color = Color3.fromRGB(102, 186, 255)}
	TokenColors.localproperty = (colors and colors.localproperty) or {Color = Color3.fromRGB(99, 255, 221)}
	TokenColors.todo = (colors and colors.todo) or {Color = Color3.fromRGB(255, 201, 37), IsBold = true}
	TokenColors.link = (colors and colors.link) or {Color = Color3.fromRGB(51, 173, 255), IsUnderlined = true}
	TokenColors.custom = (colors and colors.custom) or {Color = Color3.fromRGB(144, 194, 255), IsBold = true}

	for key, value in pairs(TokenColors) do
		if not value.IsBold then
			TokenFormats[key] = '<font color="#'.. string.format("%.2x%.2x%.2x", value.Color.R * 255, value.Color.G * 255, value.Color.B * 255).. '">%s</font>'
		else
			TokenFormats[key] = '<b><font color="#'.. string.format("%.2x%.2x%.2x", value.Color.R * 255, value.Color.G * 255, value.Color.B * 255).. '">%s</font></b>'
		end
		if value.IsItalicized then
			TokenFormats[key] = string.format("<i>%s</i>", TokenFormats[key])
		end
		if value.IsUnderlined then
			TokenFormats[key] = string.format("<u>%s</u>", TokenFormats[key])
		end
	end

	-- Rehighlight existing labels using latest colors
	for label, lineLabels in pairs(ActiveLabels) do
		for _, lineLabel in ipairs(lineLabels) do
			lineLabel.TextColor3 = TokenColors.iden.Color
		end
		highlight(label)
	end
end

pcall(updateColors)
task.spawn(function()
	repeat task.wait() until CurrentTextbox
	local function Update()
		for label, lineLabels in pairs(ActiveLabels) do
			for i, lineLabel in ipairs(lineLabels) do
				local size = TextService:GetTextSize("", CurrentTextbox.TextSize, CurrentTextbox.Font, Vector2.new());
				lineLabel.TextColor3 = TokenColors.iden.Color
				lineLabel.TextSize = CurrentTextbox.TextSize
				lineLabel.Position = UDim2.fromOffset(0, size.Y * CurrentTextbox.LineHeight * (i - 1))
				lineLabel.Size = UDim2.new(1, 0, 0, size.Y)
			end
			highlight(label)
		end
	end
	CurrentTextbox:GetPropertyChangedSignal("TextSize"):Connect(function()
		Update()
	end)
	pcall(function()
		Update()
	end)
end)

return setmetatable({
	UpdateColors = updateColors,
	Highlight = highlight,
	TokenColors = TokenColors,
}, {
	__call = function(_, textObject, src)
		return highlight(textObject, src)
	end
})
