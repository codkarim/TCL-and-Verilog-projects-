# Verilog RTL Design & TCL Scripting

## Repository Overview

This repository is organized into two main areas:

- **`verilog_projects`** — RTL designs and testbenches for CRC, LFSR, signed/unsigned ALU, Door controller, regfile, up_down_counter.
- **`TCL_projects`** — TCL labs and assignments covering language fundamentals, string and list manipulation, Loops, Flow control, arrays, procedures, I/O file handing, Regsub.

The projects are intended for learning and practicing RTL coding, simulation-based verification, and scripting techniques useful in digital design workflows.

---

## Verilog Projects

### 1. Signed 16-bit ALU — [ALU_Signed](./verilog/ALU_TOP_signed)

**Main features**
- Arithmetic operations through `ARITHMETIC_UNIT`.
- Bitwise logic operations through `LOGIC_UNIT`.
- Shift operations through `SHIFT_UNIT`.
- Comparison operations through `CMP_UNIT`.
- An opcode decoder that enables the appropriate functional unit.
- Clocked outputs and active-low asynchronous reset in the functional units.

---

### 2. Unsigned 16-bit ALU — [ALU_Unsigned](./verilog/ALU_unsinged)

**Supported operation groups**
- **Arithmetic:** addition, subtraction, multiplication, and division.
- **Logic:** AND, OR, NAND, NOR, XOR, and XNOR.
- **Comparison:** equal, greater-than, and less-than.
- **Shifts:** logical right shift and logical left shift.
- **Status flags:** separate flags identify arithmetic, logic, comparison, and shift operations; arithmetic addition/subtraction also use a carry-related flag.

---

### 3. CRC Serial Generator — [CRC](./verilog/CRC)

A serial CRC-style processing block that updates an 8-bit internal register from serial input data and then shifts the resulting register contents out serially.

**Main features**
- Serial input through `DATA`.
- `ACTIVE` control for processing incoming data.
- Parameterized initial seed (`SEED`) and tap configuration (`TAPS`).
- Active-low asynchronous reset.
- `CRC` serial output and `VALID` indication during serial output.
- A counter controls the output phase.

**Files**
- `CRC.v` — RTL implementation.
- `CRC_TB.v` — testbench with reusable tasks for initialization, reset, stimulus, and output checking.
- `DATA_h.txt`, `Expec_Out_h.txt` — input and expected-output data used by the testbench.
- `run.do`, `wave.do` — simulator run and waveform setup scripts.

---

### 4. Door Controller FSM — [Door Controller](./verilog/Door_controller)

A SystemVerilog finite-state machine that controls upward and downward door movement using activation and limit-switch inputs.

**Inputs**
- `activate` — requests movement.
- `UP_max` and `DN_max` — indicate the corresponding travel limits.
- `CLK` and active-low `RST` — sequential control.

**Outputs**
- `UP_M` — upward motor control.
- `DN_M` — downward motor control.

The FSM has three states: `IDLE`, `Mv_Up`, and `Mv_Dn`.

---

### 5. Linear Feedback Shift Register (LFSR) — [LFSR](./verilog/LFSR)`

An 8-bit LFSR-style sequential block that updates its internal shift register using feedback logic and configurable-by-source tap selection.

**Main features**
- 8-bit seed input.
- `enable` control for advancing the register.
- `out_enable` control for serial output.
- `out` serial data output and `valid` output indicator.
- Active-low asynchronous reset.
- Testbench tasks that apply seeds and compare generated serial output with expected data.

**Files**
- `LFSR.v` — RTL implementation.
- `LFSR_tb.v` — testbench and output-checking tasks.
- `Seeds_b.txt`, `Expec_Out_b.txt` — seed and expected-output vectors.
- `Lab_V_5.0.pdf` — associated Documentation brief.

---

### 6. Register File (8 x 16) — [regfile](./verilog/regester_file)

A register file with configurable address width, memory depth, and word width. The default configuration is 8 words × 16 bits.

**Main features**
- `WrEn` and `RdEn` select write or read activity.
- `address` selects the register.
- `WrData` carries write data and `RdData` provides registered read data.
- Active-low asynchronous reset clears the read-data register and the eight default memory entries.
- Read and write are accepted in mutually exclusive enable conditions.

---

### 7. Up/Down Counter — [counter](./verilog/up_down_counter)

A 5-bit counter supporting parallel load, increment, and decrement operations.

**Main features**
- `load` loads the value from `IN`.
- `Up` requests incrementing.
- `Down` requests decrementing and has priority over incrementing when both are asserted.
- `High` indicates the maximum 5-bit value (`31`).
- `Low` indicates zero.

---

## TCL Scripting Exercises

The `TCL/` directory contains labs and assignments that practice TCL fundamentals and apply them to HDL-related text files.

### Language fundamentals — [lab1](./TCL/Labs/lab1)
- Variables, command substitution.
- Use `expr` mathematical functions.
- String operations such as `string first`, `string range`, `string length`, `string toupper`, and `string match`.
- Simple string construction and domain-name extraction examples.

---

### Lists and iteration — [lab2.0](./TCL/Labs/lab2.0)`
- Creating lists.
- List length and indexed access with `llength` and `lindex`.
- Searching, inserting, appending, concatenating, slicing, and joining list elements.
- Iteration with `for` and `foreach`, including string case conversion.

---

### Arrays and procedures — [lab2.1](./TCL/Labs/lab2.1)
- Creating arrays to store subject marks.
- Writing a reusable `Avg` procedure.
- Iterating over array keys and calculating an average.

---

### Text-file processing and testbench signal generation — [lab2.2](./TCL/Labs/lab2.2)
- Reading an HDL interface description from `Interface.txt`.
- Using `regsub` to transform port names and declarations.
- Converting `input` declarations to testbench `reg` declarations and `output` declarations to `wire`.
- Writing the transformed declarations to `tb.txt`.

---

### Logical, bitwise, and mathematical operations — [Assignment_1](./TCL/Assignment_1.TCL)
- Logical AND/OR operations.
- Bitwise AND/OR/XOR operations.
- Mathematical functions such as absolute value and square root.

---

### String formatting — [Assignment_2.0](./TCL/Assignment_2.TCL/Ass2.0)
- Iterating through a list of city names.
- Extracting the first character, converting it to uppercase, and rebuilding each name with the remaining characters.

---

### Verilog interface generation — [Assignment_2.1](./TCL/Assignment_2.TCL/Ass2.1)
- Defining module, input, and output names in TCL lists.
- Storing port widths separately.
- Using loops and conditional checks to generate a Verilog module interface.
- Writing the generated interface to `interface.txt`.

---

### RTL file-list formatting — [Assignment_2.2](./TCL/Assignment_2.TCL/Ass2_2)
- Reading a text file containing RTL filenames.
- Using `regsub` to remove newline characters and adjust whitespace.
- Printing a compact file-list representation.

---

## Skills Practiced

- Verilog RTL coding and modular design.
- Parameterized hardware modules.
- Combinational and sequential logic.
- FSM design in SystemVerilog.
- Arithmetic, logic, comparison, and shift operations.
- Basic serial-data processing with CRC/LFSR-style designs.
- Testbench development and simulation-based checking.
- TCL variables, expressions, strings, lists, arrays, procedures, loops, and file I/O handling.
- Text transformation and generation of HDL-related declarations.

> **Note:** These projects were collected as practical learning exercises. Review each testbench and Documentation brief for the exact stimulus, assumptions, and expected behavior. Simulation results depend on the simulator and the files available in the project directory.

---
## Author

**karim mohamed Abomera**

Faculty of Engineering, Kafr El-Sheikh University 
---
