@tool
extends Control
signal program_exit(id)
@onready var window_page_base:PackedScene = load("res://GodotVirtualPC/Prefabs/software_windows.tscn")


func open_window(_program_process:ProgramProcess,open_argc:Array):
	var window_page_node = window_page_base.instantiate()
	window_page_node.init_software_window(_program_process,open_argc)
	window_page_node.window_exit.connect(func(id):program_exit.emit(id))
	window_page_node.name = 'process_id_' + str(_program_process.process_id)
	add_child(window_page_node)


func close_window(id) -> void:
	var window_node = null

	for node in get_children():
		if node.name == 'process_id_' + str(id):
			window_node = node
			break

	if window_node != null:
		window_node.queue_free()
