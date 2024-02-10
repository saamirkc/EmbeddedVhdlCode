# Makefile for compiling and simulating the decoder3x8 design

# Set the VHDL compiler
VHDL_COMPILER = ghdl

# Set the simulator
SIMULATOR = ghdl

# Set the testbench file
TB_FILE = decoder3x8_tb.vhdl

# Set the decoder file
DECODER_FILE = decoder3x8.vhdl

# Set the signals to be traced
WAVEFORM_FILE = waveform.ghw

# Set the simulation time
SIM_TIME = --stop-time=100ns

# Targets
all: compile simulate

compile:
	$(VHDL_COMPILER) -a $(DECODER_FILE) $(TB_FILE)
	$(VHDL_COMPILER) -e decoder3x8_tb

simulate:
	$(SIMULATOR) -r decoder3x8_tb $(SIM_TIME) --wave=$(WAVEFORM_FILE)

view:
	gtkwave $(WAVEFORM_FILE) &

clean:
	rm -f *.o work-obj93.cf *.ghw
