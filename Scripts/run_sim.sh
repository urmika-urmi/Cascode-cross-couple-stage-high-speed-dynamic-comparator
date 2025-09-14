#!/bin/bash
# run_sim.sh
# Simulation script for the Cascode Cross-Coupled High-Speed Dynamic Comparator
# Uses Icarus Verilog (iverilog) and vvp for simulation

# Set paths
SRC_DIR="../src"
TB_DIR="../tb"
OUT_FILE="comparator_tb.out"
WAVE_FILE="comparator_tb.vcd"

# Run Icarus Verilog
echo "Compiling Verilog files..."
iverilog -o $OUT_FILE $SRC_DIR/comparator.v $TB_DIR/comparator_tb.v

# Check if compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

# Run the simulation
echo "Running simulation..."
vvp $OUT_FILE

# Check if simulation ran successfully
if [ $? -ne 0 ]; then
    echo "Simulation failed."
    exit 1
fi

# Show waveform file
if [ -f $WAVE_FILE ]; then
    echo "Simulation completed. Waveform saved to $WAVE_FILE"
else
    echo "Simulation completed. No waveform file generated."
fi
