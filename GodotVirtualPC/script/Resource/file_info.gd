@tool
extends FileBase
class_name FileInfo
@export var file_name:String:
	set(value):
		if displayed_file_name!=value:
			displayed_file_name = value
			emit_changed()
	get:
		return displayed_file_name

var _file_data:String
@export_multiline var file_data:String:
	set(value):
		if _file_data!=value:
			_file_data = value
			emit_changed()
	get:
		return _file_data

var _default_opener:SoftwareInfo
@export var default_opener:SoftwareInfo:
	set(value):
		if _default_opener!=value:
			_default_opener = value
			emit_changed()
	get:
		return _default_opener
		
var _icon : Texture2D
@export var icon:Texture2D:
	set(value):
		if _icon!=value:
			_icon = value
			emit_changed()
	get:
		return _icon
