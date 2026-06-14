# 🚀 Summer Internship 2026 | TKM College of Engineering

Welcome to the official repository for the **Summer Internship 2026**, hosted by **TKM College of Engineering (TKMCE)**. This repository serves as a structured documentation hub and code registry for all Verilog HDL modules, functional testbenches, and hardware simulations engineered during the program.

---

## 👤 Student Profile

| Parameter | Details |
| :--- | :--- |
| **Name** | Lakshmipriya K G |
| **Department** | Electronics Engineering(VLSI Design and Technology) |
| **Institution** | Saintgits College of engineering |
| **Internship Venue** | TKM College of Engineering (TKMCE) |

---

## 📅 Timeline & Engineering Stack

### Internship Overview
* **Program Name:** Summer Internship 2026
* **Duration:** 15 Days Intensive
* **Commencement Date:** June 08, 2026

### Toolchain & Ecosystem
* **Hardware Description Language:** Verilog HDL
* **Synthesis & Simulation Suite:** Xilinx Vivado Design Suite
* **Version Control:** Git & GitHub

---

## 📂 Repository Architecture

Below is the directory roadmap outlining the architectural layout of the design modules, verification benches, and associated documentation.

```text
TKM_INTERNSHIP/
├── README.md
└── Day1/
    ├── Ripple_Carry_Adder/
    │   ├── Design/      # Verilog HDL Source Code (.v)
    │   ├── Testbench/   # Verification & Simulation Vectors
    │   └── rca.md       # Architectural & Timing Documentation
    └── BCD_Counter/
        ├── Design/      # Structural/Behavioral Verilog Logic
        ├── Testbench/   # Test Patterns & Waveform Verification
        └── bcd.md       # Module Specification & Logic Breakdown


```
## 🛠️ Log of Completed Experiments
### **Day 1: Arithmetic Circuits & Counter Elements**
 * **4-Bit Ripple Carry Adder (RCA)**
   * Implemented a structured multi-bit adder utilizing cascaded full-adder blocks.
   * Verified structural propagation delays and data-path synthesis.
   * 
 * **Binary Coded Decimal (BCD) Counter**
   * Engineered a synchronous decade counter sequencing through valid BCD states (0000 to 1001).
   * Integrated reset logic and terminal-count boundary checks.
   
### **Day2: Flipflops,shift registers,Encoder**
* **SR Flipflop**
   * Developed a basic latch-based storage element with set and reset functionalities.
   * Implemented characteristic equations to manage stable outputs and handle invalid state conditions.

* **Encoder4_2**
   * Designed a combinational priority logic circuit to compress four binary inputs into a two-bit coded output.
   * Modeled input-validity check signals to prevent ambiguous output states during idle operations.

* **D Flipflop**
   * Modeled an edge-triggered data storage element to safely capture inputs on the active clock transition.
   * Integrated synchronous control logic to prevent data race conditions during state transitions.

* **Universal shift register**
   * Engineered a multi-functional sequential circuit capable of bidirectional shifting and parallel load configurations.
   * Implemented multiplexer-based mode selection lines to dynamically switch operational behavior.

### **Day3: FIFO Usecase,Sequence detector**
* **FIFO Usecase**
  * Designed and verified an 8 \times 8 synchronous FIFO buffer in Verilog to manage data transfer rate-matching between a high-speed data source module and a slower processing destination module.
​  * Integrated status tracking flags (full and empty) alongside internal pointer controls to secure data integrity and buffer pipeline data bursts without loss over varying execution cycles.
* **Sequence detector**
   * Constructed a finite state machine (FSM) to continuously monitor serial data streams for a targeted bit pattern.
   * Evaluated overlapping or non-overlapping state sequence transitions to guarantee reliable pattern recognition.
  
### **Day4: Block memory generator**
   * Engineered a synchronous single-port RAM architecture featuring parameterized byte-wide data paths and independent address tracking.
   * Integrated an asynchronous active-low reset loop to safely initialize the internal memory matrix configurations.

### **Day5:FIFO interfacing,BCD interfacing**
* **FIFO Interfacing**
   *  Rectified status flag generation logic using a dynamic element counter to unlock 100% buffer capacity, resolving critical boundary alignment bugs between read/write pointer wraparounds.
* **BCD Interfacing**
   * Engineered and integrated binary-coded decimal communication logic to facilitate synchronized, multi-digit numeric data conversions and stable display-driver interactions.


## 🎯 Purpose & Repository Objectives
The core objective of this codebase is to preserve a highly organized, step-by-step log of RTL (Register-Transfer Level) designs and physical verification procedures executed throughout the 15-day internship cycle. Every laboratory task is benchmarked using functional simulations to guarantee design accuracy and timing performance.
```

```













