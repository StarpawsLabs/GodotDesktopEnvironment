@tool
extends Resource
class_name ProgramProcess

var _process_id:int
@export var process_id:int:
	set(value):
		if _process_id!=value:
			_process_id = value
			emit_changed()
	get:
		return _process_id

var _software_info : SoftwareInfo
@export var software_info:SoftwareInfo:
	set(value):
		if _software_info!=value:
			_software_info = value
			emit_changed()
	get:
		return _software_info

var _window_pos : Vector2i
@export var window_pos : Vector2i:
	set(value):
		if _window_pos!=value:
			_window_pos = value
			emit_changed()
	get:
		return _window_pos
