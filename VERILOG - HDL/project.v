
`timescale 1ns/10ps
module HA(a,b,sum,carry);

input a,b;
output sum,carry;

 xor(sum,a,b);
 and(carry,a,b);

endmodule

module FA(a,b,c,sum,carry);

input a,b,c;
output sum,carry;

assign sum = a^b^c;
assign carry = (a&b) |(b&c)| (c&a);

endmodule

module project(a0,a1,a2,a3,b0,b1,b2,b3,p0,p1,p2,p3,p4,p5,p6,c5);

input a0,a1,a2,a3,b0,b1,b2,b3;
output p0,p1,p2,p3,p4,p5,p6,c5;

and(p0,a0,b0);
and(x1,a0,b1);
and(x2,a1,b0);
and(x3,a0,b2);
and(x4,a2,b0);
and(x5,a1,b1);
and(x6,a1,b2);
and(x7,a0,b3);
and(x8,b0,a3);
and(x9,b1,a2);
and(x10,a2,b2);
and(x11,b1,a3);
and(x12,b3,a1);
and(x13,b3,a2);
and(x14,b2,a3);
and(x15,b3,a3);

// adders 

HA ha1 (x1,x2,p1,y1);
HA ha2 (x4,x5,y2,y3);
HA ha3 (x8,x9,y4,y5);
FA fa1 (x3,y1,y2,p2,z1);
FA fa2 (y3,y4,x6,z2,z3);
FA fa3 (y5,x10,x11,z4,z5);
FA fa4 (x13,x14,z5,z6,z7);
FA fa5 (z1,z2,x7,p3,v1);
FA fa6 (z3,z4,x12,v2,v3);
HA ha4 (v1,v2,p4,v5);
FA fa7 (z6,v3,v5,p5,v4);
FA fa8 (v4,z7,x15,p6,c5);

endmodule

