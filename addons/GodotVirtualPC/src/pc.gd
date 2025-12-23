extends Control
var info :PCInfo

@export var software_prefab = load("res://addons/GodotVirtualPC/prefabs/software.tscn")
@export var software_window_prefab = load("res://addons/GodotVirtualPC/prefabs/window.tscn")

func add_info(_info:PCInfo):
	info = _info

func _ready() -> void:
	load_softwares()

func load_softwares() -> void:
	var softwares = info.softwares
	for i in range(len(softwares)):
		var software_node = software_prefab.instantiate()
		software_node.init_software(softwares[i])
		software_node.open_software.connect(open_program)
		$VFlowContainer/HFlowContainer.add_child(software_node)
		$VFlowContainer/HFlowContainer.get_line_count()

func open_program(info:SoftwareInfo):
	if not $TaskManager.programes.has(info.name):
		var software_window_node = software_window_prefab.instantiate()
		software_window_node.init_window(info)
		software_window_node.exit.connect(close_program)
		software_window_node.minimum.connect(minimum_program)
		$windows.add_child(software_window_node)
		software_window_node.name = info.name
		$TaskManager.programes.append(info.name)
	else:
		get_node('windows/'+info.name).show()
func close_program(windows:Control):
	windows.queue_free()
	$TaskManager.programes.erase(windows.name)
func minimum_program(windows:Control):
	windows.hide()
