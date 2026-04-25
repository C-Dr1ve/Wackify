return {
	["Dark"] = {
		LinesBackground = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(38,38,38),
			BorderSizePixel = 0,
		},
		LineNumbers = {
			BackgroundTransparency = 1,
			TextColorHovered = Color3.fromRGB(255, 255, 255),
			TextColorStatic = Color3.fromRGB(128,128,128),
			Font = Enum.Font.Code,
			TextXAlignment = Enum.TextXAlignment.Center
		},
		EditorFrame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		},
		TextBox = {
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Font = Enum.Font.Code,
			MultiLine = true,
			ClearTextOnFocus = false,
			TextTransparency = 0.855
		},
		LineSelector = {
			BackgroundTransparency = 0.95,
			BackgroundColor3 = Color3.new(1,1,1),
			Outline = {
				Color = Color3.fromRGB(45,45,45),
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}
		},
		Cursor = {
			BackgroundColor3 = Color3.fromRGB(255,255,255)
		},
		SyntaxColors = {
			Background = Color3.fromRGB(36, 36, 36),
			Iden = Color3.fromRGB(204, 204, 204),
			Keyword = Color3.fromRGB(248, 109, 124),
			Variable = Color3.fromRGB(204, 204, 204),
			Builtin = Color3.fromRGB(132, 214, 247),
			String = Color3.fromRGB(173, 241, 149),
			Number = Color3.fromRGB(255, 198, 0),
			Comment = Color3.fromRGB(102, 102, 102),
			Operator = Color3.fromRGB(204, 204, 204),
			Localmethod = Color3.fromRGB(253, 251, 172),
			Properties = Color3.fromRGB(97, 161, 241),
			Boolean = Color3.fromRGB(255, 198, 0),
			Localproperty = Color3.fromRGB(97, 161, 241),
			Todo = Color3.fromRGB(141, 118, 0),
			Link = Color3.fromRGB(11, 90, 175),
			Custom = Color3.fromRGB(253, 251, 172)
		}
	},
	["Light"] = {
		LinesBackground = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(240, 240, 240),
			BorderSizePixel = 0
		},
		LineNumbers = {
			BackgroundTransparency = 1,
			TextColorHovered = Color3.fromRGB(30, 30, 30),
			TextColorStatic = Color3.fromRGB(160, 160, 160),
			Font = Enum.Font.Code,
			TextXAlignment = Enum.TextXAlignment.Center
		},
		EditorFrame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		},
		TextBox = {
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Font = Enum.Font.Code,
			MultiLine = true,
			ClearTextOnFocus = false,
			TextTransparency = 0
		},
		LineSelector = {
			BackgroundTransparency = 0.85,
			BackgroundColor3 = Color3.fromRGB(0, 120, 215),
			Outline = {
				Color = Color3.fromRGB(200, 200, 200),
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		Cursor = {
			BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		},
		SyntaxColors = {
			Background = Color3.fromRGB(250, 250, 250),
			Iden = Color3.fromRGB(30, 30, 30),
			Keyword = Color3.fromRGB(175, 0, 219),
			Variable = Color3.fromRGB(30, 30, 30),
			Builtin = Color3.fromRGB(0, 134, 179),
			String = Color3.fromRGB(3, 134, 55),
			Number = Color3.fromRGB(9, 136, 90),
			Comment = Color3.fromRGB(106, 153, 85),
			Operator = Color3.fromRGB(30, 30, 30),
			Localmethod = Color3.fromRGB(121, 94, 38),
			Properties = Color3.fromRGB(0, 112, 193),
			Boolean = Color3.fromRGB(0, 0, 255),
			Localproperty = Color3.fromRGB(0, 112, 193),
			Todo = Color3.fromRGB(156, 105, 0),
			Link = Color3.fromRGB(0, 70, 173),
			Custom = Color3.fromRGB(121, 94, 38)
		}
	},
	["Dracula"] = {
		LinesBackground = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(40, 42, 54),
			BorderSizePixel = 0
		},
		LineNumbers = {
			BackgroundTransparency = 1,
			TextColorHovered = Color3.fromRGB(248, 248, 242),
			TextColorStatic = Color3.fromRGB(98, 114, 164),
			Font = Enum.Font.Code,
			TextXAlignment = Enum.TextXAlignment.Center
		},
		EditorFrame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		},
		TextBox = {
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Font = Enum.Font.Code,
			MultiLine = true,
			ClearTextOnFocus = false,
			TextTransparency = 0
		},
		LineSelector = {
			BackgroundTransparency = 0.85,
			BackgroundColor3 = Color3.fromRGB(68, 71, 90),
			Outline = {
				Color = Color3.fromRGB(68, 71, 90),
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		Cursor = {
			BackgroundColor3 = Color3.fromRGB(248, 248, 242)
		},
		SyntaxColors = {
			Background = Color3.fromRGB(40, 42, 54),
			Iden = Color3.fromRGB(248, 248, 242),
			Keyword = Color3.fromRGB(255, 121, 198),
			Variable = Color3.fromRGB(248, 248, 242),
			Builtin = Color3.fromRGB(139, 233, 253),
			String = Color3.fromRGB(241, 250, 140),
			Number = Color3.fromRGB(189, 147, 249),
			Comment = Color3.fromRGB(98, 114, 164),
			Operator = Color3.fromRGB(255, 121, 198),
			Localmethod = Color3.fromRGB(80, 250, 123),
			Properties = Color3.fromRGB(139, 233, 253),
			Boolean = Color3.fromRGB(189, 147, 249),
			Localproperty = Color3.fromRGB(139, 233, 253),
			Todo = Color3.fromRGB(255, 184, 108),
			Link = Color3.fromRGB(139, 233, 253),
			Custom = Color3.fromRGB(80, 250, 123)
		}
	},
	["Catppuccin Latte"] = {
		LinesBackground = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(230, 233, 239),
			BorderSizePixel = 0
		},
		LineNumbers = {
			BackgroundTransparency = 1,
			TextColorHovered = Color3.fromRGB(76, 79, 105),
			TextColorStatic = Color3.fromRGB(172, 176, 190),
			Font = Enum.Font.Code,
			TextXAlignment = Enum.TextXAlignment.Center
		},
		EditorFrame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		},
		TextBox = {
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Font = Enum.Font.Code,
			MultiLine = true,
			ClearTextOnFocus = false,
			TextTransparency = 0
		},
		LineSelector = {
			BackgroundTransparency = 0.85,
			BackgroundColor3 = Color3.fromRGB(172, 176, 190),
			Outline = {
				Color = Color3.fromRGB(188, 192, 204),
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		Cursor = {
			BackgroundColor3 = Color3.fromRGB(76, 79, 105)
		},
		SyntaxColors = {
			Background = Color3.fromRGB(239, 241, 245),
			Iden = Color3.fromRGB(76, 79, 105),
			Keyword = Color3.fromRGB(136, 57, 239),
			Variable = Color3.fromRGB(76, 79, 105),
			Builtin = Color3.fromRGB(4, 165, 229),
			String = Color3.fromRGB(64, 160, 43),
			Number = Color3.fromRGB(254, 100, 11),
			Comment = Color3.fromRGB(156, 160, 176),
			Operator = Color3.fromRGB(114, 135, 253),
			Localmethod = Color3.fromRGB(30, 102, 245),
			Properties = Color3.fromRGB(23, 146, 153),
			Boolean = Color3.fromRGB(210, 15, 57),
			Localproperty = Color3.fromRGB(23, 146, 153),
			Todo = Color3.fromRGB(223, 142, 29),
			Link = Color3.fromRGB(30, 102, 245),
			Custom = Color3.fromRGB(64, 160, 43)
		}
	},
	["Catppuccin Frappe"] = {
		LinesBackground = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(41, 44, 60),
			BorderSizePixel = 0
		},
		LineNumbers = {
			BackgroundTransparency = 1,
			TextColorHovered = Color3.fromRGB(198, 208, 245),
			TextColorStatic = Color3.fromRGB(115, 121, 148),
			Font = Enum.Font.Code,
			TextXAlignment = Enum.TextXAlignment.Center
		},
		EditorFrame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		},
		TextBox = {
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Font = Enum.Font.Code,
			MultiLine = true,
			ClearTextOnFocus = false,
			TextTransparency = 0
		},
		LineSelector = {
			BackgroundTransparency = 0.9,
			BackgroundColor3 = Color3.new(1, 1, 1),
			Outline = {
				Color = Color3.fromRGB(51, 55, 70),
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		Cursor = {
			BackgroundColor3 = Color3.fromRGB(198, 208, 245)
		},
		SyntaxColors = {
			Background = Color3.fromRGB(48, 52, 70),
			Iden = Color3.fromRGB(198, 208, 245),
			Keyword = Color3.fromRGB(202, 158, 230),
			Variable = Color3.fromRGB(198, 208, 245),
			Builtin = Color3.fromRGB(153, 209, 219),
			String = Color3.fromRGB(166, 209, 137),
			Number = Color3.fromRGB(239, 159, 118),
			Comment = Color3.fromRGB(115, 121, 148),
			Operator = Color3.fromRGB(186, 187, 241),
			Localmethod = Color3.fromRGB(140, 170, 238),
			Properties = Color3.fromRGB(129, 200, 190),
			Boolean = Color3.fromRGB(231, 130, 132),
			Localproperty = Color3.fromRGB(129, 200, 190),
			Todo = Color3.fromRGB(229, 200, 144),
			Link = Color3.fromRGB(140, 170, 238),
			Custom = Color3.fromRGB(166, 209, 137)
		}
	},
	["Catppuccin Macchiato"] = {
		LinesBackground = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(30, 32, 48),
			BorderSizePixel = 0
		},
		LineNumbers = {
			BackgroundTransparency = 1,
			TextColorHovered = Color3.fromRGB(202, 211, 245),
			TextColorStatic = Color3.fromRGB(110, 115, 141),
			Font = Enum.Font.Code,
			TextXAlignment = Enum.TextXAlignment.Center
		},
		EditorFrame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		},
		TextBox = {
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Font = Enum.Font.Code,
			MultiLine = true,
			ClearTextOnFocus = false,
			TextTransparency = 0
		},
		LineSelector = {
			BackgroundTransparency = 0.9,
			BackgroundColor3 = Color3.new(1, 1, 1),
			Outline = {
				Color = Color3.fromRGB(36, 39, 58),
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		Cursor = {
			BackgroundColor3 = Color3.fromRGB(202, 211, 245)
		},
		SyntaxColors = {
			Background = Color3.fromRGB(36, 39, 58),
			Iden = Color3.fromRGB(202, 211, 245),
			Keyword = Color3.fromRGB(198, 160, 246),
			Variable = Color3.fromRGB(202, 211, 245),
			Builtin = Color3.fromRGB(145, 215, 227),
			String = Color3.fromRGB(166, 218, 149),
			Number = Color3.fromRGB(245, 169, 127),
			Comment = Color3.fromRGB(110, 115, 141),
			Operator = Color3.fromRGB(183, 189, 248),
			Localmethod = Color3.fromRGB(138, 173, 244),
			Properties = Color3.fromRGB(139, 213, 202),
			Boolean = Color3.fromRGB(237, 135, 150),
			Localproperty = Color3.fromRGB(139, 213, 202),
			Todo = Color3.fromRGB(238, 212, 159),
			Link = Color3.fromRGB(138, 173, 244),
			Custom = Color3.fromRGB(166, 218, 149)
		}
	},
	["Catppuccin Mocha"] = {
		LinesBackground = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(24, 24, 37),
			BorderSizePixel = 0
		},
		LineNumbers = {
			BackgroundTransparency = 1,
			TextColorHovered = Color3.fromRGB(205, 214, 244),
			TextColorStatic = Color3.fromRGB(108, 112, 134),
			Font = Enum.Font.Code,
			TextXAlignment = Enum.TextXAlignment.Center
		},
		EditorFrame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		},
		TextBox = {
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Font = Enum.Font.Code,
			MultiLine = true,
			ClearTextOnFocus = false,
			TextTransparency = 0
		},
		LineSelector = {
			BackgroundTransparency = 0.9,
			BackgroundColor3 = Color3.new(1, 1, 1),
			Outline = {
				Color = Color3.fromRGB(30, 30, 46),
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		Cursor = {
			BackgroundColor3 = Color3.fromRGB(205, 214, 244)
		},
		SyntaxColors = {
			Background = Color3.fromRGB(30, 30, 46),
			Iden = Color3.fromRGB(205, 214, 244),
			Keyword = Color3.fromRGB(203, 166, 247),
			Variable = Color3.fromRGB(205, 214, 244),
			Builtin = Color3.fromRGB(137, 220, 235),
			String = Color3.fromRGB(166, 227, 161),
			Number = Color3.fromRGB(250, 179, 135),
			Comment = Color3.fromRGB(108, 112, 134),
			Operator = Color3.fromRGB(180, 190, 254),
			Localmethod = Color3.fromRGB(137, 180, 250),
			Properties = Color3.fromRGB(148, 226, 213),
			Boolean = Color3.fromRGB(243, 139, 168),
			Localproperty = Color3.fromRGB(148, 226, 213),
			Todo = Color3.fromRGB(249, 226, 175),
			Link = Color3.fromRGB(137, 180, 250),
			Custom = Color3.fromRGB(166, 227, 161)
		}
	},
	["Terminal"] = {
		LinesBackground = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0
		},
		LineNumbers = {
			BackgroundTransparency = 1,
			TextColorHovered = Color3.fromRGB(0, 255, 0),
			TextColorStatic = Color3.fromRGB(0, 140, 0),
			Font = Enum.Font.Code,
			TextXAlignment = Enum.TextXAlignment.Center
		},
		EditorFrame = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		},
		TextBox = {
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Font = Enum.Font.Code,
			MultiLine = true,
			ClearTextOnFocus = false,
			TextTransparency = 0
		},
		LineSelector = {
			BackgroundTransparency = 0.9,
			BackgroundColor3 = Color3.fromRGB(0, 255, 0),
			Outline = {
				Color = Color3.fromRGB(0, 80, 0),
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		Cursor = {
			BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		},
		SyntaxColors = {
			Background = Color3.fromRGB(0, 0, 0),
			Iden = Color3.fromRGB(0, 255, 0),
			Keyword = Color3.fromRGB(0, 255, 128),
			Variable = Color3.fromRGB(0, 255, 0),
			Builtin = Color3.fromRGB(0, 220, 180),
			String = Color3.fromRGB(100, 255, 100),
			Number = Color3.fromRGB(180, 255, 0),
			Comment = Color3.fromRGB(0, 140, 0),
			Operator = Color3.fromRGB(0, 200, 0),
			Localmethod = Color3.fromRGB(50, 255, 150),
			Properties = Color3.fromRGB(0, 200, 150),
			Boolean = Color3.fromRGB(180, 255, 0),
			Localproperty = Color3.fromRGB(0, 200, 150),
			Todo = Color3.fromRGB(200, 255, 0),
			Link = Color3.fromRGB(0, 220, 180),
			Custom = Color3.fromRGB(50, 255, 150)
		}
	}
}
