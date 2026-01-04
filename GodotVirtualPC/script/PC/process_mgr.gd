@tool
extends Control
var pc_info:PCInfo
func init_process_mgr(_info:PCInfo):
	pc_info = _info
	
func create_process(software_info:SoftwareInfo,open_argc:Array) -> ProgramProcess:
	var program_process = ProgramProcess.new()
	program_process.software_info = software_info
	program_process.process_script_node = software_info.software_script.new(open_argc)
	program_process.window_pos = Vector2i(0,0)
	program_process.process_id = program_process.get_instance_id()
	pc_info.process_ran.append(program_process)
	program_process.process_script_node.name = 'process_id_'+ str(program_process.process_id)
	return program_process

func flseh_process(program_process:ProgramProcess):
	add_child(program_process.process_script_node)

func remove_process(_process_id:int):
	for process in pc_info.process_ran:
		if process.process_id == _process_id:
			pc_info.process_ran.erase(process)
			break
	for node in get_children():
		if node.name == 'process_id_'+ str(_process_id):
			node.queue_free()
