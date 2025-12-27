@tool
extends Control

@onready var window_page_base:PackedScene = load("res://GodotVirtualPC/Prefabs/software_windows.tscn")

func open_window(_info:SoftwareInfo,open_argc:Array):
	var window_page_node = window_page_base.instantiate()
	window_page_node.init_software_window(_info,open_argc)
	window_page_node.window_exit.connect(func(node):node.queue_free())
	add_child(window_page_node)
