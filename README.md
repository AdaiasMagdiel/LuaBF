# LuaBF - Brainfuck Interpreter in Lua

This project provides a simple yet functional Brainfuck interpreter written in Lua. It allows users to execute Brainfuck scripts either by providing a script file as an argument or by entering commands interactively.

## Getting Started

To get started with this interpreter, follow these steps:

- Clone or download the repository.

```bash
git clone https://github.com/AdaiasMagdiel/LuaBF.git
```

- Ensure you have Lua installed on your system.
- Run the `main.lua` script with a Brainfuck script as an argument or interactively. I provide some examples in `examples` folder.

### Running a Script

To run a Brainfuck script, use the following command:

```bash
lua main.lua [script]
```

Replace `[script]` with the path to your Brainfuck script.

### Interactive Mode

To enter interactive mode, simply run the `main.lua` script without any arguments. You will be prompted to enter Brainfuck commands one by one.

## Usage

The interpreter supports the full set of Brainfuck commands:

- `>` Increment the memory cell pointer.
- `<` Decrement the memory cell pointer.
- `+` Increment the value in the current memory cell.
- `-` Decrement the value in the current memory cell.
- `.` Output the ASCII character represented by the value in the current memory cell.
- `,` Read an ASCII character from the standard input and store its value in the current memory cell.
- `[` Jump forward to the corresponding `]` if the value in the current memory cell is zero.
- `]` Jump back to the corresponding `[` if the value in the current memory cell is non-zero.

## API Documentation

The `src/bf.lua` file exposes an API that allows for more advanced usage of the interpreter. Here's how to use it:

### Creating a New LuaBF Instance

```lua
local LuaBF = require("src.bf")
local luabf = LuaBF.new([[
  +++++++++++[>++++++>+++++++++>++++++++>++++>+++>+<<<<<<-]>+++
  +++.>++.+++++++..+++.>>.>-.<<-.<.+++.------.--------.>>>+.>-.
]])
```

This creates a new instance of the LuaBF interpreter with the given Brainfuck script.

### Parsing a Script

```lua
local output = luabf:parse()
print(output)
```

This parses the script and returns the output as a string.

### Running a Script

```lua
luabf:run()
```

This runs the script and outputs the result to the console.

## Testing

The project includes a testing suite located in `tests/main.lua`. This script runs the interpreter on all files in the `examples` folder and compares the output with expected results. To run the tests, execute the following command:

```bash
lua tests/main.lua
```

This will automatically run all tests and report any discrepancies between the actual and expected outputs.

## Contributing

Contributions are welcome Please feel free to submit pull requests or open issues for any bugs or feature requests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
