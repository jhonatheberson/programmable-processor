
# Neander Processor

Implementation of neander processor in vhdl.
 
 ## Requirements
 
 - Quartus II
 - Altera Cyclone II

## Neander Architecture

! [neander] (https://i.ibb.co/S5T92nv/neander.png)

## Components

The processor components are:

### UAL (Logical and Arithmetic Unit)

You can rename the current file by clicking the file name in the navigation bar or by clicking the "Rename" button in the file explorer.

### AC (Accumulator)

Operation: Accumulates the results of the operations performed in the UAL and sends the accumulated results to the RDM and the "x" of the UAL.

Variables:

Ip: Data obtained from the exit of the UAL.
Load: If enabled, enables parallel input. If it is disabled, it maintains the current value.
Qs: Accumulated amount <br>


### NZ Recorder

N (negative): sign of the result of an operation in the ALU
• if the result of the ALU is negative, N = 1
• Otherwise, N = 0

Z (zero): indicates result equal to zero
• If the result of the ALU is zero, Z = 1
• Otherwise, Z = 0

### PRAÇA **

Function:
Point to the memory location where the program is running or where the program will run.

LOAD = 1: loads parallel input
Increment = 1: sum 1

Note:
load = 1 and increment = 1
or load = 0 and increment = 0 will never happen

Variables:
jumpto: RDM parallel input
load: If activated, load jumpto.
increase: add 1
clk: clock
QS: output


### Mux

Function: Select an output between the RDM and PC memory addresses and send that address to the REM.

### REM Recorder

Function: It is the memory address register, it receives an address from the multiplexer and the output is the address of the memory cell that must be activated for reading or writing. Uses the component memory8 that stores the 8 bits required. If the load is enabled, the register stores the parallel input and when the load is deactivated REM retains the current value. The 8-bit output stores the memory address in the 4 least significant bits.

Variables:

Ip: Input address selected by the multiplexer. Home
Qs: Output address that uses the 4 least significant bits. Home
Load:
0- Maintains the current value. Home
1- Activates the parallel input. Home

### RDM Recorder

Operation :
The RDM recorder is responsible for recording the data. The RDM data inputs are from the memory output and from the accumulator output, which is a result of some UAL operation. A key (selCP) has been implemented to select which data to load. When the load is activated and selCP = 1 the data loaded is from the memory output (Imem) and when load = 1 and selCP = 1, then the RDM register loads the accumulator output. If the load is disabled (load = 0), RDM retains the value.

Variables:
Imem - out of memory <br>
Iac - accumulator output <br>
load - enabler <br>
selCP - select between Imem and Iac <br>
clk - clock <br>
Qs - output of 8 bits <br>

### INST (opcode) Recorder

Operation: Use the register code8. It receives the output of the RDM which are 8 bits where the four most significant bits represent the operation to be done. The opcode receives these 8 bits and sends the four most significant bits to the decoder.

Ip: Output from RDM. <br>
Qs: 4 most significant bits go to the decoder. <br>
Load: <br>
0 - Maintains the current value. Home
1- Activates the parallel input. Home



### Decoder

Operation:

It receives a 4-bit instruction code, from the opcode, and transforms into a 10-bit instruction code that is sent to the control unit.

Variables:

input_dec: Code of the instruction.
 saida_dec: Code of the decoded instruction. <br>


### Memory

** Memory cell: **

Operation:

The function of the memory cell is to store an 8-bit data. When enable is active and rw (read, write) = 1 writes a value in the cell (obs: while writing the output is 0). If the enable is active and rw = 0, the output will read the cell data. And if the enable is disabled, it maintains the value.

Variables:

E: value that will write <br>
in: Enable cell <br>
rw: 1 writes 0 reads data <br>
clk: clock <br>
S: output <br>

** Full memory: **

Operation :

It has as inputs a data and an address, if rw = 1 the input data will be written in the cell of the input address and if rw = 0 it reads the data in the same address.

obs:
for a cell to be enabled its enable must be enabled and rw = 1

Variables:

E: Given to be written.
reset
Ad: 4 bits address - REM output - cell address to be enabled
rw: 1 writes 0 reads data
clk
S: reading the data

### Control Unit

You can publish your file by opening the ** Publish ** sub-menu and by clicking ** Publish to **. For some locations, you can choose between the following formats:

- Markdown: publish the Markdown text on a website that can interpret it (** GitHub ** for instance),
- HTML: publish the file converted to HTML via a Handlebars template (on a blog for example).

## Getting Started

open the project with extension example.qpf, then compile the prject and board the FPGA.

### Installing

open Quartus II, then click on queue and "open project"

after compile the project by doing the following instructions:

`` `
click on the "processing" tab
`` `

after this

`` `
Start compilation
`` `

when you finish compiling, click on the "Assignments" toolbar

`` `
Pin Planner
`` `

Make your pinning the way you want

`` `
repeat Start compilation
`` `

and ship the processor in the FPGA by performing the following steps:

`` `
tools
`` `

and

`` `
Programmer
`` `

After selecting the type of FPGA

`` `
Start
`` `

## Deployment

to know how the processor and its features please read the following files in this repository:

```
00NEANDER.PNG
```
```
01Operacoes.PNG
```

## Built With

* [Quartus II](https://www.intel.com/content/www/us/en/programmable/downloads/software/quartus-ii-we/120.html) - development and deployment and debug


## Contributing

Please read [CONTRIBUTING.md](https://github.com/jhonatheberson/programmable-processor/blob/master/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/jhonatheberson/programmable-processor/tree/master). 

## Authors

* **Jhonat Heberson** - *Initial work* - [PurpleBooth](https://github.com/jhonatheberson/)

### Grupo

 - [Alessandro Cerioli](https://github.com/alecerioli)
 - [Felipe Lima](https://github.com/FelipeLM1)
 - [Jhonatan Heberson](https://github.com/jhonatheberson)
 - [Renato Lins]()
 - [Vinícios Menezes]()


See also the list of [contributors](https://github.com/jhonatheberson/programmable-processor/graphs/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/jhonatheberson/programmable-processor/blob/master/LICENSE) file for details



