### **SIMULATION RESULT**

<img width="1635" height="855" alt="Screenshot 2026-06-10 214110" src="https://github.com/user-attachments/assets/1056ff6d-bec9-4d1a-a547-a29f9b552e88" />

# Synchronous FIFO-Based Rate Matcher

A digital system designed in Verilog HDL to handle safe data transfer between a high-speed data source module and a slow-speed processing destination module using an intermediate synchronous FIFO buffer. This implementation was fully verified and simulated using AMD Xilinx Vivado Design Suite.

## System Architecture

The design consists of three primary hardware blocks coordinated under a structural top-level wrapper:

1. **`face_mod` (Fast Source Module):** Latches incoming 8-bit data (`s_in`) on every positive edge of the clock and immediately passes it forward while pulsing a write-enable signal.
2. **`fifo` (Intermediate Buffer Module):** An 8x8 bit synchronous FIFO queue that temporarily buffers bursts of high-speed data to prevent loss. It manages internal write/read pointers and maintains status tracking via `full` and `empty` hardware flags.
3. **`mach_out` (Slow Machine Destination Module):** An FSM-driven module representing a slow output peripheral. It restricts data intake to once every **three clock cycles**, safely popping elements from the FIFO using a synchronized read-enable handshake.


## Finite State Machine (FSM) Specification

The slow destination module (`mach_out`) regulates its lower processing throughput by evaluating system states across a 4-state cycle machine:

* **`STATE_0`**: Default base state. Increments the internal cycle counter and transitions automatically to State 1.
* **`STATE_1`**: Intermediate waiting state. Increments the cycle counter and transitions to State 2.
* **`STATE_2`**: Evaluates readiness. If the intermediate FIFO is not empty (`!fifo_empty`), it advances to the read state; otherwise, it loops back to State 0 to maintain sync.
* **`READ_ST`**: Asserts the structural `read_enb` high pulse to capture data sitting at the FIFO output bus, latching it straight into `d_out`.

---

## Behavioral Simulation Verification Results

The design was simulated using **Vivado Behavioral Simulator**, matching the functional goals perfectly:

1. **High-Speed Latching:** The incoming signal `s_in[7:0]` successfully updates on *every single clock edge* with data values (`a1`, `b2`, `c3`, `d4`, ...).
2. **Rate Matching Transformation:** The slow output signal `d_out[7:0]` updates its data state precisely **every 3 clock cycles** as defined by the FSM pipeline stage layout.
3. **Data Integrity Holding:** `d_out` accurately preserves and reflects the sequence of entries pushed into the intermediate memory layout (`a1` -> `b2` -> `c3`), confirming that data order is correctly maintained.
4. **FIFO Buffer Boundary:** The `empty` flag smoothly drops to low (`0`) once data loading clears execution startup. As the fast input producer continuously outpaces the 3-cycle slow consumer, the `full` flag correctly flags a high (`1`) state when the depth limit reaches 8 bytes, preventing buffer overwrites.

 <img width="1552" height="788" alt="image" src="https://github.com/user-attachments/assets/36c587e0-7b19-48e6-a819-76e4deaa01e0" />
 <img width="1546" height="838" alt="image" src="https://github.com/user-attachments/assets/9669145a-558f-4b6d-97c0-55be178c563d" />





