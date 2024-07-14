.INCLUDE TSMC_180nm.txt
.INCLUDE AND.subs
.INCLUDE OR.spice
.INCLUDE XOR.sp
.INCLUDE HA.sub
.INCLUDE FA.sub
.INCLUDE NAND.sub

****Parameters**********
.PARAM XX=1
.PARAM tr=10p
.PARAM pvdd= 1
.PARAM lamda = 90n

.temp 25

vdd node1 gnd dc = 1
vpower vdd 0 1

** circuit **

x1 and_out a b node1 0 AND
x2 OR_out a b node1 0 OR
x3 XOR_out a b node1 0 XOR
x4 a b HA_sum HA_carry node1 0 HA
x5 a b c FA_sum FA_carry node1 0 FA
x6 NAND_out a b node1 0 NAND

** cap out ** 
cout out 0 0.5f

Vina a 0 pulse(0 1 0 10p 10p 5n 10n)
Vinb b 0 pulse(0 1 0 10p 10p 10n 20n)
Vinc c 0 pulse(0 1 0 10p 10p 20n 40n)

.CONTROL

run
tran .1n 80n


plot v(a) V(b)+2 v(and_out)+4 
plot v(a) V(b)+2 v(OR_out)+4 
plot v(a) V(b)+2 v(XOR_out)+4 
plot v(a) V(b)+2 v(HA_sum)+4 
plot v(a) V(b)+2 v(HA_carry)+4 
plot v(a) V(b)+2 v(FA_sum)+4 
plot v(a) V(b)+2 v(FA_carry)+4 
plot v(a) V(b)+2 v(nand_out)+4 

//plot v(a) V(b)+2 v(c)+4 v(sum1)+6 v(carry1)+8 v(sum2)+10 v(carry2)+12

.endc
.end

