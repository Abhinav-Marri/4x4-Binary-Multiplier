# 4x4-Binary-Multiplier
Built a binary 4x4 multiplier to estimate leakage current and propagation delays using various tools such as Ngspice, Magic layout tool and Verilog.

Refer to the doc `Report.pdf` for an in depth analysis of the obtained results.

## File Structure : 

```bash
|   Report.pdf
|
+---MAGIC
|   +---Multiplier
|   |       multiplier.ext
|   |       multiplier.mag
|   |       multiplier.spice
|   |
|   +---Results
|   |       Delays.txt
|   |       Leakage_power.txt
|   |
|   +---Subcircuits
|   |       22nm_MGK.pm
|   |       AND_magic.ext
|   |       AND_magic.mag
|   |       AND_magic.spice
|   |       FA_magic.ext
|   |       FA_magic.mag
|   |       FA_magic.spice
|   |       HA_magic.ext
|   |       HA_magic.mag
|   |       HA_magic.spice
|   |       NAND_magic.ext
|   |       NAND_magic.mag
|   |       NAND_magic.spice
|   |       NOR_magic.ext
|   |       NOR_magic.mag
|   |       NOR_magic.spice
|   |       NOT_magic.ext
|   |       NOT_magic.mag
|   |       NOT_magic.spice
|   |       OR_magic.ext
|   |       OR_magic.mag
|   |       OR_magic.spice
|   |       TSMC_180nm.txt
|   |       XOR_magic.ext
|   |       XOR_magic.mag
|   |       XOR_magic.spice
|   |
|   \---Testing files
|           multiplier_test.sp
|           script.py
|           subckt_test.sp
|
+---NGSPICE
|   +---Multiplier
|   |       multiplier.sub
|   |
|   +---Results
|   |       Delays.txt
|   |       Leakage_power.txt
|   |
|   +---Subcircuits
|   |       22nm_MGK.pm
|   |       AND.subs
|   |       FA.sub
|   |       HA.sub
|   |       NAND.sub
|   |       OR.spice
|   |       TSMC_180nm.txt
|   |       XOR.sp
|   |
|   \---Testing files
|           multiplier_test.sp
|           script.py
|           subckt_test.sp
|
\---VERILOG - HDL
        input_a.JPG
        input_b.JPG
        project.v
        project_final_verilog_output.JPG
        project_tb.v
```
