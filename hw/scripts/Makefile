design_name := system

all: project bitstream
	@echo
	@tput setaf 2 ; echo "Built $(design_name) successfully!"; tput sgr0;
	@echo

project:
	vivado -mode batch -source checkout.tcl -notrace

bitstream:
	vivado -mode batch -source build_bitstream.tcl

clean:
	rm -rf ../proj/hw.* *.jou *.log NA .Xil
