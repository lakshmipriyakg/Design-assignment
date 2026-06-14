### **SIMULATION RESULT**
<img width="1883" height="428" alt="image" src="https://github.com/user-attachments/assets/65d83fb0-b461-42e5-a569-2e5750836cc3" />


## BCD Adder Operation

A Binary Coded Decimal (BCD) adder takes two 4-bit BCD digits (each representing a decimal value from 0 to 9) and a carry-in ($c_{in}$), producing a 4-bit BCD sum and a 1-bit carry-out ($c_{out}$). 

Because standard 4-bit binary addition can result in values up to 19 (e.g., $9 + 9 + 1$), a correction step is required whenever the binary sum exceeds the valid BCD limit of 9.

### Step-by-Step Execution Process


```
[ Input A ]     [ Input B ]
│               │
└───►[ RCA 1 ]◄─┴─── [ Carry In (cin) ]
│
[ Binary Sum ] ───► [ Detection Logic ]
│                    │
│             (Sum > 9 or Cout?)
│                    │
▼                    ▼
[ Input A ] ◄─────── [ Add +6 or +0 ]
│
└───►[ RCA 2 ]
│
[ BCD Sum ]


#### Step 1: Initial Binary Addition (`rca1`)
The two 4-bit BCD inputs (`A` and `B`) along with the input carry (`cin`) are fed into the first 4-bit Ripple Carry Adder (`rca1`). This module performs standard binary addition:

$$\text{Binary Sum} = A + B + c_{in}$$

#### Step 2: BCD Invalid Condition Detection
A standard 4-bit binary adder can output hexadecimal values from `4'hA` to `4'hF` (decimal 10 to 15), or generate an intermediate hardware carry-out. Because a valid BCD digit cannot exceed 9 (`4'b1001`), an adjustment is mandatory if either condition is met.

The circuit monitors the output of `rca1` using the following combinational boolean logic expression:

$$\text{cout} = \text{rcal\_cout} \lor (\text{rcal\_sum}[3] \land \text{rcal\_sum}[2]) \lor (\text{rcal\_sum}[3] \land \text{rcal\_sum}[1])$$

* `rcal_cout`: Triggers if the binary addition exceeds 15.
* `rcal_sum[3] & rcal_sum[2]`: Triggers for decimal values 12 and 13 (`4'b1100`, `4'b1101`).
* `rcal_sum[3] & rcal_sum[1]`: Triggers for decimal values 10 and 11 (`4'b1010`, `4'b1011`).

If this expression evaluates to `1`, the overall circuit carry-out (`cout`) is set to `1`.

#### Step 3: Correction Factor Generation
To skip the 6 invalid states of the hexadecimal system (`A` through `F`) and cycle back into proper decimal formatting, a value of decimal **6** (`4'b0110`) must be added to the temporary result.

* If **`cout == 1`**: The correction vector becomes `4'b0110` (decimal 6).
* If **`cout == 0`**: The correction vector stays `4'b0000` (decimal 0).

#### Step 4: Final BCD Adjust Adjustment (`rca2`)
The temporary binary sum (`rcal_sum`) and the generated correction factor are sent into a second 4-bit Ripple Carry Adder (`rca2`). 

* The output bits from this second adder represent the final, corrected **`Sum`** output.
* The hardware carry-out from this second block (`dummy_cout`) is safely discarded, as the true BCD carry-out was already determined in Step 2.
