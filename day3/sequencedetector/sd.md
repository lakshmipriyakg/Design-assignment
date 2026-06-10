### **Simulation result**
<img width="1562" height="781" alt="Screenshot 2026-06-10 113830" src="https://github.com/user-attachments/assets/7c7c85c7-74ae-4f27-9bf2-6f2cc03ee6d0" />

## Overlapping 1110 Sequence Detector

This repository contains the Verilog implementation and testbench simulation for a **Finite State Machine (FSM)** based sequence detector designed to detect the binary sequence `1110`.

---

## State Diagram Logic

The FSM transitions through states as it samples the data input (`din`) on every rising edge of the clock (`clk`). 

* **IDLE / S0:** Waiting for the first `1`.
* **STATE_1 / S1:** First `1` detected. (Sequence so far: `1`)
* **STATE_11 / S2:** Second `1` detected. (Sequence so far: `11`)
* **STATE_111 / S3:** Third `1` detected. (Sequence so far: `111`)
* **DETECTION / S4:** A `0` is detected after three consecutive ones. Output `det` goes **HIGH** for one clock cycle. 

*Note: This design supports **overlapping**, meaning if the next bits are `110`, it will utilize the previous trailing bits to detect the sequence again without resetting completely to IDLE.*

---

## Simulation Waveform Analysis

The simulation waveform captures the behavior of the testbench inputs and detector outputs over time:

### Signals Overview
* **`clk_tb`**: The master system clock driving the sequential logic.
* **`rst_tb`**: Active-high reset signal used to initialize the FSM to the IDLE state.
* **`din_tb`**: The serial input data stream being monitored for the pattern.
* **`det_tb`**: The output flag which goes high (`1`) immediately when the sequence `1110` is successfully detected.

### Waveform Breakdown
1. **Reset Phase (0ns - 10ns):** `rst_tb` is held high to clear any random states and establish a clean baseline. The detector output `det_tb` remains low.
2. **Data Shifting:** As `rst_tb` drops low, serial data bits are fed into `din_tb` on successive clock cycles.
3. **Sequence Match:** Once the state machine tracks three consecutive high cycles on `din_tb` followed by a low cycle, the internal state transitions to the match state, pulling `det_tb` high to indicate a successful detection.
  
