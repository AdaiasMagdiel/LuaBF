local LuaBF = {}

function LuaBF.new(source)
	local luabf = {
		source  = source,
		cells   = {},
		cell    = 1,
		pointer = 1,
	}

	luabf.parse = function(self)
		local startBracket = -1
		local endBracket = -1
		local output = ""

		while true do
			if self.pointer > #self.source then
				break
			end

			local c = string.sub(self.source, self.pointer, self.pointer)

			if c == '>' then
				self.cell = self.cell + 1

			elseif c == '<' then
				self.cell = self.cell - 1

			elseif c == '+' then
				self.cells[self.cell] = (self.cells[self.cell] or 0) + 1

				if self.cells[self.cell] > 255 then
					self.cells[self.cell] = 0
				end

			elseif c == '-' then
				self.cells[self.cell] = (self.cells[self.cell] or 256) - 1

				if self.cells[self.cell] < 0 then
					self.cells[self.cell] = 255
				end

			elseif c == '.' then
				output = output .. string.char(self.cells[self.cell])

			elseif c == ',' then
				local char = io.read()

				if char == nil then
					break
				end

				char = string.sub(char, 1, 1)
				self.cells[self.cell] = string.byte(char)

			elseif c == '[' then
				startBracket = self.pointer

				if self.cells[self.cell] == 0 then
					self.pointer = endBracket
				end

			elseif c == ']' then
				endBracket = self.pointer

				if self.cells[self.cell] > 0 then
					self.pointer = startBracket
				end
			end

			self.pointer = self.pointer + 1
		end

		return output
	end

	luabf.run = function(self)
		local output = self:parse()
		io.write(output)
	end

	return luabf
end

return LuaBF
