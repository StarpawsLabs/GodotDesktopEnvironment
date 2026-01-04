@tool
extends Control
signal program_exit(id)
@onready var window_page_base:PackedScene = load("res://GodotVirtualPC/Prefabs/software_windows.tscn")


func open_window(_software_info:SoftwareInfo,_process_id:int):
	var window_page_node = window_page_base.instantiate()
	window_page_node.init_software_window(_software_info.software_window,_process_id)
	window_page_node.window_exit.connect(func(id):program_exit.emit(id))
	window_page_node.name = 'process_id_' + str(_process_id)
	return window_page_node

func flseh_window(window_page_node):
	add_child(window_page_node)

func close_window(id) -> void:
	var window_node = null

	for node in get_children():
		if node.name == 'process_id_' + str(id):
			window_node = node
			break

	if window_node != null:
		window_node.queue_free()
