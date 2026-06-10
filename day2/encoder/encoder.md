
<img width="1556" height="775" alt="Screenshot 2026-06-09 215625" src="https://github.com/user-attachments/assets/a99670aa-7e55-4f84-82d3-a4019d3fed73" />



TRUTH TABLE
<img width="474" height="247" alt="image" src="https://github.com/user-attachments/assets/02b9f544-9f00-4d4d-a4c5-1df65576fc82" />
An encoder 4:2 (commonly called a 4-to-2 binary encoder) is a combinational logic circuit that compresses information by converting four distinct binary inputs into a two-bit binary output code. It operates on the principle that only one of its four inputs (D_0, D_1, D_2, D_3) is active (set to 1) at any given time, with each input representing a specific decimal digit or condition. Based on which input line is activated, the encoder generates a unique 2-bit combination (Y_1, Y_0) at the output, effectively representing the active input's index in binary form (for example, activating D_3 results in an output of 11). Standard encoders assume strict "one-hot" signaling, meaning if multiple inputs are accidentally activated at once, the circuit will produce an erroneous or unpredictable output—a limitation that is typically solved by upgrading to a priority encoder.

