local LuaBF = require("src.bf")


local function run(script)
    local luabf = LuaBF.new(script)
    luabf:run()
end

local function runFile(path)
    local file = io.open(path, "r")

    if file == nil then
        print("Error: file not found")
        os.exit(1)
    end

    local content = file:read("*a")
    file:close()

    run(content)
end

local function runPrompt()
    while true do
        io.write('> ')
        local input = io.read()

        if input == nil then
            break
        end

        run(input)
    end
end

local function main()
    if #arg > 1 then
        print("Usage: lua bf.lua [script]")
    elseif #arg == 1 then
        runFile(arg[1])
    else
        runPrompt()
    end
end

main()
