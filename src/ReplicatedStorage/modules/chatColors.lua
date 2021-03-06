-- mostly yoinked from the core chat

local colors = {}
local chatColors = {
	"#fd2943", -- red
	"#01a2ff", -- blue
	"#02b857", -- green
	"#6b327c", -- purple
	"#da8541", -- orange
	"#f5cd30", -- yellow
	"#ff7eb6", -- pink
	"#d7c59a", -- tan
}

local byte = string.byte
local sub = string.sub

-- color3 values
-- local c3 = Color3.fromRGB
-- local chatColors = {
-- 	c3(211, 84, 84),	-- red
-- 	c3(82, 172, 255),	-- blue
-- 	c3(73, 202, 95),	-- green
-- 	c3(188, 105, 235),	-- purple
-- 	c3(255, 134, 97),	-- orange
-- 	c3(253, 255, 80),	-- yellow
-- 	c3(255, 126, 182),	-- pink
-- 	c3(211, 183, 159)	-- tan
-- }

function colors.getColor(username)
	local value = 0
	for i = 1, #username do
		local cv = byte(sub(username, i, i))
		local ri = #username - i + 1

		if #username % 2 == 1 then
			ri = ri - 1
		end

		if ri % 4 >= 2 then
			cv = -cv
		end

		value = value + cv
	end

	return chatColors[(value % #chatColors) + 1]
end

return colors
