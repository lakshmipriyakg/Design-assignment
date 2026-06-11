### ***SIMULATION RESULT***
<img width="1579" height="843" alt="Screenshot 2026-06-11 200053" src="https://github.com/user-attachments/assets/842b49c3-fb08-495b-8000-db453703a4d8" />


This repository contains a Verilog HDL implementation of a synchronous, single-port **Block Memory Generator** (RAM) along with a comprehensive testbench to verify its read and write functionalities using Xilinx Vivado.


## Design Specifications

The memory module is configured with the following characteristics:
* **Depth:** 8 memory locations (addressed via a 3-bit address bus).
* **Width:** 8 bits per location (1 byte data width).
* **Reset Type:** Active-low, asynchronous reset (`arstn`).
* **Control:** Synchronous write-enable (`wrenb`).

### Input/Output Ports

| Port Name | Direction | Width | Description |
| :--- | :---: | :---: | :--- |
| `clk` | Input | 1 bit | System clock signal |
| `arstn` | Input | 1 bit | Asynchronous active-low reset |
| `wrenb` | Input | 1 bit | Write enable (1 = Write mode, 0 = Read mode) |
| `wraddress`| Input | 3 bits| Address pointer for writing data |
| `rdaddress`| Input | 3 bits| Address pointer for reading data |
| `data_in` | Input | 8 bits| 8-bit input data to be written into memory |
| `data_out` | Output | 8 bits| 8-bit output data read from memory |

---

## Module Architecture

The core design implements sequential logic triggered on the rising edge of the clock (`posedge clk`) or the falling edge of the reset (`negedge arstn`). 

### Key Features:
1. **Asynchronous Reset:** When `arstn` drops to `0`, a `for` loop resets all 8 memory arrays to `8'b0` instantly, and the `data_out` port is cleared.
2. **Synchronous Write:** When `wrenb` is asserted high (`1`), data from `data_in` is written into the memory location indexed by `wraddress`.
3. **Synchronous Read:** When `wrenb` is low (`0`), data is fetched from the memory location indexed by `rdaddress` and assigned to `data_out`.

## Testbench Implementation

The testbench (`block_memory_generator_tb.v`) automates the verification process in distinct phases:

1. **Clock Generation:** A free-running clock with a period of 10 time units is generated using `always #5 clk_tb = ~clk_tb;`.
2. **Initialization & Reset:** Initial values are set, and an active-low reset is applied for `10ns` before releasing it to enable memory operations.
3. **Write Phase:** `wrenb_tb` is driven high. A sequence of unique hex values (`8'h11` through `8'h88`) is written into addresses `3'd0` to `3'd7` sequentially at regular intervals.
4. **Read Phase:** `wrenb_tb` is turned off (`0`). The addresses `3'd0` through `3'd7` are sequentially read back to ensure the stored data is correctly retained and outputted


### 1. Write Cycle Verification
* When `wrenb_tb = 1`, you can observe `wraddress_tb` incrementing from `0` to `7`.
* At each clock cycle, `data_in_tb` values (`11`, `22`, `33`, etc.) successfully register into the internal memory matrix.

### 2. Read Cycle Verification
* When `wrenb_tb` drops to `0`, the read address bus (`rdaddress_tb`) begins cycling from `0` up to `7`.
* On the subsequent clock edges, `data_out_tb` perfectly mirrors the previously written array elements (`11`, `22`, `33`, ..., `88`), confirming error-free memory readback execution.

---

