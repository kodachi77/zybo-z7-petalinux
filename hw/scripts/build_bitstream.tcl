set overlay_name "hw"
set design_name "system"

set root_path [file normalize [file dirname [info script]]/..]

source [file join ${root_path} project_info.tcl]

# open block design
open_project ${overlay_name}.xpr
open_bd_design ${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd

# add top wrapper, no xdc files
make_wrapper -files [get_files ${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd] -top
add_files -norecurse ${overlay_name}.gen/sources_1/bd/${design_name}/hdl/${design_name}_wrapper.vhd
set_property top ${design_name}_wrapper [current_fileset]
update_compile_order -fileset sources_1

# set platform properties
set_property platform.default_output_type "sd_card" [current_project]
set_property platform.design_intent.embedded "true" [current_project]
set_property platform.design_intent.server_managed "false" [current_project]
set_property platform.design_intent.external_host "false" [current_project]
set_property platform.design_intent.datacenter "false" [current_project]

# call implement
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# generate xsa
write_hw_platform -include_bit -force ../${overlay_name}.xsa
validate_hw_platform ../hw_handoff/${overlay_name}.xsa
