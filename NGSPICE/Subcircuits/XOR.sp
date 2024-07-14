
.SUBCKT XOR out a b vdd gnd 

.INCLUDE NAND.sub

x1 node1 a b vdd gnd NAND
x2 node2 a node1 vdd gnd NAND
x3 node3 b node1 vdd gnd NAND
x4 out node2 node3 vdd gnd NAND

.ends XOR