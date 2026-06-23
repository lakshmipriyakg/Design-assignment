<img width="867" height="835" alt="Screenshot 2026-06-15 220801" src="https://github.com/user-attachments/assets/13c9af17-0dd8-41fd-b51d-665ca1f1e3c6" />
<img width="1246" height="141" alt="image" src="https://github.com/user-attachments/assets/02daeb3d-e61c-4c24-acf2-fe9427a12bb0" />
This repository contains a parameterizable Synchronous FIFO (First-In, First-Out) memory buffer implemented in Verilog, alongside a randomized testbench environment implemented in SystemVerilog.

The design features independent write and read pointers that dynamically generate empty and full boundary flags (leaving one buffer slot empty to safely distinguish between the two states). As shown in the simulation waveform, the FIFO handles an initial reset phase, successfully blocks invalid read attempts while empty, executes a randomized burst write of data values (such as 51 and e0), and subsequently pops them out in perfect First-In, First-Out sequence as the empty flag toggles responsively.
