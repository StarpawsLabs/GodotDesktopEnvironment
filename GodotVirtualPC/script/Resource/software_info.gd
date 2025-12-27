@tool
extends FileBase
class_name SoftwareInfo

@export var softwares_name:String:
	set(value):
		if displayed_file_name!=value:
			displayed_file_name = value
			emit_changed()
	get:
		return displayed_file_name

var _icon : Texture2D
@export var icon:Texture2D:
	set(value):
		if _icon!=value:
			_icon = value
			emit_changed()
	get:
		return _icon
var _software_window : PackedScene
@export var software_window:PackedScene:
	set(value):
		if _software_window!=value:
			_software_window = value
			emit_changed()
	get:
		return _software_window
