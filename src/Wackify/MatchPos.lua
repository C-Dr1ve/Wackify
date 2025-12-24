local match = { Match = function(frame: Frame)
	local editor = frame:FindFirstChild("Editor", true)
	local lines = frame:FindFirstChild("LinesBG", true)
	if editor and lines then
		editor:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
			lines.CanvasPosition = editor.CanvasPosition
		end)
	end
end,}
return match
