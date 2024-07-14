`timescale 1ns/10ps

module project_tb;

reg a0,a1,a2,a3,b0,b1,b2,b3;
wire p0,p1,p2,p3,p4,p5,p6,c5;

project UUT (a0,a1,a2,a3,b0,b1,b2,b3,p0,p1,p2,p3,p4,p5,p6,c5);

initial

    begin
        $dumpfile("project_tb.vcd");
        $dumpvars(0,project_tb);

        a0=0;
        a1=0;
        a2=0;
        a3=0;
        b0=0;
        b1=0;
        b2=0;
        b3=0;

    end

    
initial
    begin
        
       $monitor ("time=%0t a= %d%d%d%d b = %d%d%d%d, Output = %d%d%d%d%d%d%d%d", $time, a3,a2,a1,a0,b3,b2,b1,b0,c5,p6,p5,p4,p3,p2,p1,p0);  

        #5
        a0=1;
        a1=0;
        a2=0;
        a3=0;
        b0=0;
        b1=1;
        b2=0;
        b3=0;

        #5
        a0=1;
        a1=1;
        a2=1;
        a3=1;
        b0=0;
        b1=0;
        b2=1;
        b3=0;

        #5
        a0=1;
        a1=0;
        a2=1;
        a3=0;
        b0=1;
        b1=1;
        b2=0;
        b3=0;

        #5
        a0=0;
        a1=1;
        a2=0;
        a3=0;
        b0=1;
        b1=1;
        b2=0;
        b3=0;

        #5
        a0=1;
        a1=0;
        a2=0;
        a3=1;
        b0=1;
        b1=0;
        b2=0;
        b3=1;

        #5
        a0=1;
        a1=0;
        a2=1;
        a3=1;
        b0=1;
        b1=0;
        b2=0;
        b3=1;

        #5
        a0=1;
        a1=0;
        a2=1;
        a3=1;
        b0=0;
        b1=0;
        b2=0;
        b3=0;

        #5
        a0=1;
        a1=0;
        a2=0;
        a3=0;
        b0=1;
        b1=0;
        b2=0;
        b3=1;

        #5
        a0=1;
        a1=1;
        a2=1;
        a3=1;
        b0=1;
        b1=1;
        b2=1;
        b3=1;

        #5
        a0=1;
        a1=1;
        a2=0;
        a3=1;
        b0=1;
        b1=0;
        b2=1;
        b3=1;

        #5
        a0=0;
        a1=0;
        a2=0;
        a3=0;
        b0=0;
        b1=0;
        b2=0;
        b3=0;


    end


endmodule