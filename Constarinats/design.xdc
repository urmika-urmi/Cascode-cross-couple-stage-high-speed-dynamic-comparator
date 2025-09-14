## design.xdc
## Constraints for Cascode Cross-Coupled High-Speed Dynamic Comparator
## This file maps input/output ports to FPGA pins (for prototyping or documentation purposes).

# Clock input
set_property PACKAGE_PIN W5 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# Asynchronous reset input
set_property PACKAGE_PIN W6 [get_ports {rst_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst_n}]

# Positive input
set_property PACKAGE_PIN U5 [get_ports {vin_p}]
set_property IOSTANDARD LVCMOS33 [get_ports {vin_p}]

# Negative input
set_property PACKAGE_PIN U6 [get_ports {vin_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {vin_n}]

# Decision output
set_property PACKAGE_PIN V5 [get_ports {decision}]
set_property IOSTANDARD LVCMOS33 [get_ports {decision}]
