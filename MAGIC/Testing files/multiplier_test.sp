.INCLUDE TSMC_180nm.txt
.INCLUDE multiplier.sub
****Parameters**********
.PARAM XX=1
.PARAM tr=10p
.PARAM pvdd= 1
.PARAM lamda = 90n

.temp 25

vdd node1 gnd dc = 1
vpower vdd 0 1

** circuit **

x1 p0 p1 p2 p3 p4 p5 p6 c5 a0 a1 a2 a3 b0 b1 b2 b3 vdd gnd multiplier

** cap out ** 
cout out 0 0.5f

* change input to piecewise to calculate delays.
Vina0 a0 0 1
Vina1 a1 0 1
Vina2 a2 0 1
Vina3 a3 0 1
Vinb0 b0 0 1
Vinb1 b1 0 1
Vinb2 b2 0 1
Vinb3 b3 0 0


.CONTROL

run
tran .1n 40n
*op

*leakage power measuring

* let leakage_power = -1*vdd#branch+(v(a0)*(-Vina0#branch))+(v(a1)*(-Vina1#branch))+(v(a2)*(-Vina2#branch)+(v(a3)*(-Vina3#branch))+v(b0)*(-Vinb0#branch))+(v(b1)*(-Vinb1#branch))+(v(b2)*(-Vinb2#branch)+(v(b3)*(-Vinb3#branch)))
* echo Leakage power = "$&leakage_power" >> power.txt
plot v(P0) v(P1)+2 v(P2)+4 v(P3)+6 v(P4)+8 v(P5)+10 v(P6)+12 v(c5)+14
plot  v(a0) v(a1)+2 v(a2)+4 v(a3)+6 v(b0)+8 v(b1)+10 v(b2)+12 v(b3)+14

set xbrushwidth 5


* delay measuring

* echo  "Delays with inputs and all outputs :" > project.txt
* meas tran delay_a0_p0
*     +trig v(a0) val=0.5 rise=1
*     +targ v(p0) val=0.5 rise=1
*     meas tran delay_p0_a0
*     +trig v(a0) val=0.5 fall=1
*     +targ v(p0) val=0.5 fall=1

*     let delay1 = (delay_a0_p0 + delay_p0_a0)/2

* echo delay with p0 = "$&delay1" >> project.txt

* meas tran delay_a0_p1
*     +trig v(a0) val=0.5 rise=1
*     +targ v(p1) val=0.5 rise=1
*     meas tran delay_p1_a0
*     +trig v(a0) val=0.5 fall=1
*     +targ v(p1) val=0.5 fall=1

*     let delay2 = (delay_a0_p1 + delay_p1_a0)/2

* echo delay with p1 = "$&delay2" >> project.txt

* meas tran delay_a3_p2
*     +trig v(a3) val=0.5 rise=1
*     +targ v(p2) val=0.5 rise=2
*     meas tran delay_p2_a3
*     +trig v(a3) val=0.5 fall=1
*     +targ v(p2) val=0.5 fall=2

*     let delay3 = (delay_a3_p2 + delay_p2_a3)/2

* echo delay with p = "$&delay3" >> project.txt

* meas tran delay_a0_p3
*     +trig v(a0) val=0.5 rise=1
*     +targ v(p3) val=0.5 rise=2
*     meas tran delay_p3_a0
*     +trig v(a0) val=0.5 fall=1
*     +targ v(p3) val=0.5 fall=2

*     let delay4 = (delay_a0_p3 + delay_p3_a0)/2

* echo delay with p3 = "$&delay4" >> project.txt


* meas tran delay_a3_p4
*     +trig v(a3) val=0.5 rise=1
*     +targ v(p4) val=0.5 rise=2
*     meas tran delay_p4_a3
*     +trig v(a3) val=0.5 fall=1
*     +targ v(p4) val=0.5 fall=2

*     let delay5 = (delay_a3_p4 + delay_p4_a3)/2

* echo delay with p4 = "$&delay5" >> project.txt

* meas tran delay_a3_p5
*     +trig v(a3) val=0.5 rise=1
*     +targ v(p5) val=0.5 rise=2
*     meas tran delay_p5_a3
*     +trig v(a3) val=0.5 fall=1
*     +targ v(p5) val=0.5 fall=2

*     let delay6 = (delay_a3_p5 + delay_p5_a3)/2

* echo delay with p5 = "$&delay6" >> project.txt

* meas tran delay_a0_p6
*     +trig v(a0) val=0.5 rise=1
*     +targ v(p6) val=0.5 rise=1
*     meas tran delay_p6_a0
*     +trig v(a0) val=0.5 fall=1
*     +targ v(p6) val=0.5 fall=1

*     let delay7 = (delay_a0_p6 + delay_p6_a0)/2

* echo delay with p6 = "$&delay7" >> project.txt

* meas tran delay_a3_c5
*     +trig v(a3) val=0.5 rise=1
*     +targ v(c5) val=0.5 rise=2
*     meas tran delay_c5_a3
*     +trig v(a3) val=0.5 fall=1
*     +targ v(c5) val=0.5 fall=2

*     let delay8 = (delay_a3_c5 + delay_c5_a3)/2

* echo delay with c5 = "$&delay8" >> project.txt
*quit
.endc
.end

