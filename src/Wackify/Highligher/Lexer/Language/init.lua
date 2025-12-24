function asciiDecode(str : string)
	local decoded = ""

	str = string.gsub(str, "%s+", "") str = string.gsub(str, "\n+", "")
	str = string.gsub(str, "\t+", "") str = string.gsub(str, "\r+", "")

	for code in str:gmatch("\\(%d+)") do
		decoded = decoded .. string.char(tonumber(code))
	end

	return decoded
end

return {
	customKeywords = {},
	
	keyword = {
		["and"] = true,
		["break"] = true,
		["do"] = true,
		["else"] = true,
		["elseif"] = true,
		["end"] = true,
		["for"] = true,
		["function"] = true,
		["if"] = true,
		["in"] = true,
		["not"] = true,
		["while"] = true,
		["or"] = true,
		["repeat"] = true,
		["return"] = true,
		["then"] = true,
		["self"] = true,
		["until"] = true,
		["continue"] = true,
		["export"] = true,
		["type"] = true,
		["typeof"] = true,
	},
	
	variables = {
		["local"] = true,
	},

	builtin = {
		-- Lua Functions
		["assert"] = true,
		["collectgarbage"] = true,
		["error"] = true,
		[asciiDecode([[
			\103
			\101
			\116
			\102
			\101
			\110
			\118
		]])] = true,
		["getmetatable"] = true,
		["ipairs"] = true,
		[asciiDecode([[
			\108
			\111
			\97
			\100
			\115
			\116
			\114
			\105
			\110
			\103
		]])] = true,
		["newproxy"] = true,
		["next"] = true,
		["pairs"] = true,
		["pcall"] = true,
		["print"] = true,
		["rawequal"] = true,
		["rawget"] = true,
		["rawset"] = true,
		["select"] = true,
		[asciiDecode([[
			\115
			\101
			\116
			\102
			\101
			\110
			\118
		]])] = true,
		["setmetatable"] = true,
		["tonumber"] = true,
		["tostring"] = true,
		["unpack"] = true,
		["xpcall"] = true,
		["buffer"] = true,
		["Font"] = true,
		
		-- API functions

		-- Lua Variables
		["_G"] = true,
		["_VERSION"] = true,

		-- Lua Tables
		["bit32"] = true,
		["coroutine"] = true,
		["debug"] = true,
		["math"] = true,
		["os"] = true,
		["string"] = true,
		["table"] = true,
		["utf8"] = true,

		-- Roblox Functions
		["delay"] = true,
		["elapsedTime"] = true,
		["gcinfo"] = true,
		[asciiDecode([[
			\114
			\101
			\113
			\117
			\105
			\114
			\101
		]])] = true,
		["settings"] = true,
		["spawn"] = true,
		["tick"] = true,
		["time"] = true,
		["UserSettings"] = true,
		["wait"] = true,
		["warn"] = true,
		["ypcall"] = true,

		-- Roblox Variables
		["Enum"] = true,
		["shared"] = true,
		["script"] = true,
		["workspace"] = true,
		["Workspace"] = true,
		["plugin"] = true,
		["game"] = true,
		["Game"] = true,

		-- Roblox Tables
		["Axes"] = true,
		["BrickColor"] = true,
		["CatalogSearchParams"] = true,
		["CellId"] = true,
		["CFrame"] = true,
		["Color3"] = true,
		["ColorSequence"] = true,
		["ColorSequenceKeypoint"] = true,
		["DateTime"] = true,
		["DockWidgetPluginGuiInfo"] = true,
		["Faces"] = true,
		["File"] = true,
		["FloatCurveKey"] = true,
		["Instance"] = true,
		["NumberRange"] = true,
		["NumberSequence"] = true,
		["NumberSequenceKeypoint"] = true,
		["OverlapParams"] = true,
		["PathWaypoint"] = true,
		["PhysicalProperties"] = true,
		["PluginDrag"] = true,
		["Random"] = true,
		["Ray"] = true,
		["RaycastParams"] = true,
		["Rect"] = true,
		["Region3"] = true,
		["Region3int16"] = true,
		["RotationCurveKey"] = true,
		["task"] = true,
		["TextChatMessageProperties"] = true,
		["TweenInfo"] = true,
		["UDim"] = true,
		["UDim2"] = true,
		["Vector2"] = true,
		["Vector2int16"] = true,
		["Vector3"] = true,
		["Vector3int16"] = true,
	},
	
	properties = {
		-- Appearance
		["BrickColor"] = true,
		["CastShadows"] = true,
		["Color"] = true,
		["Material"] = true,
		["Reflectance"] = true,
		["MaterialVariant"] = true,
		["Transparency"] = true,
		["MeshId"] = true,
		["RenderFidelity"] = true,
		["TextureID"] = true,
		
		-- Data
		["Parent"] = true,
		["Name"] = true,
		["Archivable"] = true,
		["ClassName"] = true,
		["Locked"] = true,
		["ResizeableFaces"] = true,
		["ResizeIncrement"] = true,
		
		-- Transform
		["Size"] = true,
		["CFrame"] = true,
		["Orgin"] = true,
		["Position"] = true,
		["Orientation"] = true,
		["PivotOffset"] = true,
		
		-- Collision
		["CanCollide"] = true,
		["CanTouch"] = true,
		["CollisionGroup"] = true,
		
		-- Object
		["Anchored"] = true,
		["CenterOfMass"] = true,
		["CurrentPhysicalProperties"] = true,
		["CustomPhysicalProperties"] = true,
		["Mass"] = true,
		["Massless"] = true,
		["RootPriority"] = true,
		["Shape"] = true,
		["PrimaryPart"] = true,
		["Scale"] = true,
		
		-- Behavior
		["ModelStreamingMode"] = true,
		
		-- Assembly
		["AssemblyLinearVelocity"] = true,
		["AssemblyAngularVelocity"] = true,
		["AssemblyCenterOfMass"] = true,
		["AssemblyMass"] = true,
		["AssemblyRootPart"] = true,
		
		-- Script
		["Enabled"] = true,
		["Disabled"] = true,
		["Source"] = true,
		["CurrentEditor"] = true,
		["RunContext"] = true,
	},
	
	booleans = {
		["true"] = true,
		["false"] = true,
		["nil"] = true,
	},
	
	comments = {
		["TODO"] = true,
	},

	libraries = {

		-- Lua Libraries
		math = {
			abs = true,
			acos = true,
			asin = true,
			atan = true,
			atan2 = true,
			ceil = true,
			clamp = true,
			cos = true,
			cosh = true,
			deg = true,
			exp = true,
			floor = true,
			fmod = true,
			frexp = true,
			ldexp = true,
			log = true,
			log10 = true,
			max = true,
			min = true,
			modf = true,
			noise = true,
			pow = true,
			rad = true,
			random = true,
			round = true,
			sinh = true,
			sqrt = true,
			tan = true,
			tanh = true,
			sign = true,
			sin = true,
			randomseed = true,

			huge = true,
			pi = true,
		},

		string = {
			byte = true,
			char = true,
			find = true,
			format = true,
			gmatch = true,
			gsub = true,
			len = true,
			lower = true,
			match = true,
			pack = true,
			packsize = true,
			rep = true,
			reverse = true,
			split = true,
			sub = true,
			unpack = true,
			upper = true,
		},

		table = {
			clear = true,
			concat = true,
			foreach = true,
			foreachi = true,
			freeze = true,
			getn = true,
			insert = true,
			isfrozen = true,
			maxn = true,
			remove = true,
			sort = true,
			find = true,
			pack = true,
			unpack = true,
			move = true,
			create = true,
		},

		debug = {
			dumpheap = true,
			info = true,
			profilebegin = true,
			profileend = true,
			resetmemorycategory = true,
			setmemorycategory = true,
			traceback = true,
			getconstant = true,
			getconstants = true,
			getinfo = true,
			getproto = true,
			getprotos = true,
			getstack = true,
			getupvalue = true,
			getupvalues = true,
			setconstant = true,
			setstack = true,
			setupvalue = true,
			getregistry = true,
			setmetatable = true,
			getlocals = true,
			getlocal = true,
			setlocal = true,
		},

		os = {
			time = true,
			date = true,
			difftime = true,
			clock = true,
		},

		coroutine = {
			create = true,
			isyieldable = true,
			resume = true,
			running = true,
			status = true,
			wrap = true,
			yield = true,
		},

		bit32 = {
			arshift = true,
			band = true,
			bnot = true,
			bor = true,
			btest = true,
			bxor = true,
			countlz = true,
			countrz = true,
			extract = true,
			lrotate = true,
			lshift = true,
			replace = true,
			rrotate = true,
			rshift = true,
		},

		utf8 = {
			char = true,
			codepoint = true,
			codes = true,
			graphemes = true,
			len = true,
			nfcnormalize = true,
			nfdnormalize = true,
			offset = true,

			charpattern = true,
		},

		-- Roblox Libraries
		Axes = {
			new = true,
		},

		BrickColor = {
			new = true,
			New = true,
			Random = true,
			Black = true,
			Blue = true,
			DarkGray = true,
			Gray = true,
			Green = true,
			Red = true,
			White = true,
			Yellow = true,
			palette = true,
			random = true,
		},

		CatalogSearchParams = {
			new = true,
		},

		CellId = {
			new = true,
		},

		CFrame = {
			new = true,
			Angles = true,
			fromAxisAngle = true,
			fromEulerAnglesXYZ = true,
			fromEulerAnglesYXZ = true,
			fromMatrix = true,
			fromOrientation = true,
			lookAt = true,

			identity = true,
		},

		Color3 = {
			new = true,
			fromRGB = true,
			fromHSV = true,
			fromHex = true,
			toHSV = true,
		},

		ColorSequence = {
			new = true,
		},

		ColorSequenceKeypoint = {
			new = true,
		},

		DateTime = {
			now = true,
			fromIsoDate = true,
			fromLocalTime = true,
			fromUniversalTime = true,
			fromUnixTimestamp = true,
			fromUnixTimestampMillis = true,
		},

		DockWidgetPluginGuiInfo = {
			new = true,
		},

		Faces = {
			new = true,
		},

		FloatCurveKey = {
			new = true,
		},

		Instance = {
			new = true,
		},

		NumberRange = {
			new = true,
		},

		NumberSequence = {
			new = true,
		},

		NumberSequenceKeypoint = {
			new = true,
		},

		OverlapParams = {
			new = true,
		},

		PathWaypoint = {
			new = true,
		},

		PhysicalProperties = {
			new = true,
		},

		PluginDrag = {
			new = true,
		},

		Random = {
			new = true,
		},

		Ray = {
			new = true,
		},

		RaycastParams = {
			new = true,
		},

		Rect = {
			new = true,
		},

		Region3 = {
			new = true,
		},

		Region3int16 = {
			new = true,
		},

		RotationCurveKey = {
			new = true,
		},

		task = {
			wait = true,
			spawn = true,
			delay = true,
			defer = true,
			synchronize = true,
			desynchronize = true,
		},

		TweenInfo = {
			new = true,
		},

		UDim = {
			new = true,
		},

		UDim2 = {
			new = true,
			fromScale = true,
			fromOffset = true,
		},

		Vector2 = {
			new = true,

			one = true,
			zero = true,
			xAxis = true,
			yAxis = true,
		},

		Vector2int16 = {
			new = true,
		},

		Vector3 = {
			new = true,
			fromAxis = true,
			fromNormalId = true,
			FromAxis = true,
			FromNormalId = true,

			one = true,
			zero = true,
			xAxis = true,
			yAxis = true,
			zAxis = true,
		},

		Vector3int16 = {
			new = true,
		},
		
		buffer = {
			tostring = true,
			len = true,
			readi8 = true,
			readf32 = true,
			readu8 = true,
			readf64 = true,
			readi16 = true,
			readi32 = true,
			readu16 = true,
			readu32 = true,
			copy = true,
			fill = true,
			create = true,
			writei8 = true,
			writeu8 = true,
			writef32 = true,
			writef64 = true,
			writei16 = true,
			writei32 = true,
			writeu16 = true,
			writeu32 = true,
			fromstring = true,
			readstring = true,
			writestring = true,
		},
		
		Font = {
			new = true,
			fromId = true,
			fromEnum = true,
			fromName = true,
		},
		
		Enum = {
			KeyCode = true,
			Button = true,
			Material = true,
			AutomaticSize = true,
			UserInputType = true,
			Font = true,
			NormalId = true,
			EasingStyle = true,
			EasingDirection = true,
			PoseEasingStyle = true,
			CameraType = true,
			SortOrder = true,
			CoreGuiType = true,
			InOut = true,
			RigType = true,
			ExplosionType = true,
			FontSize = true,
			VerticalAlignment = true,
			HorizontalAlignment = true,
			CameraMode = true,
			TextXAlignment = true,
			HumanoidRigType = true,
			BodyPart = true,
			InputType = true,
			ScaleType = true,
			AspectType = true,
			ChatVersion = true,
			DominantAxis = true,
			FillDirection = true,
			TextYAlignment = true,
			ApplyStrokeMode = true,
			HumanoidStateType = true,
			Language = true,
			MeshType = true,
			UserInputState = true,
			ZIndexBehavior = true,
			RaycastFilterType = true,
			ModelStreamingMode = true,
			Axis = true,
			Limb = true,
			AdShape = true,
			AlignType = true,
			AlphaMode = true,
			AssetType = true,
			ActionType = true,
			AdEventType = true,
			ActuatorType = true,
			AdUnitStatus = true,
			AudioSubType = true,
		},
	},
}
