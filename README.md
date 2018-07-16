# HRY312 lab
Gradual implementation of a simple mips-like instruction set on VHDL using Xilinx. 

##### Final processor supports:
* Numerical and logical operations.
* Write and read memory operations.
* Pipelining.
* Locate and handle data and instruction hazards using stalls and forwards.
* ~~Simple and conditional branches~~. Supported up to 5th lab.


## Changes per lab
1.  Created ALU and register file.

2.  Created ALU, command recall, decode and memory stages.

3.  United previous stages in a multiple circle processor and created control using an FSM.

4.  Added complex commands.

5.  Modified the processor to a pipeline one.

6.  Added exceptions and caches.


### How to run
In 'code' folders, there are both the source .vhd and the generated files. Import project to run.

##### Problems
The project have been created with an old version of Xilinx. In case of incompatibility issues create a new project, add copy of source .vhd files and synthesize.
