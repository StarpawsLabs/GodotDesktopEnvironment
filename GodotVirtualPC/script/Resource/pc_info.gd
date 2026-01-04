@tool
extends Resource
class_name PCInfo

var _wallpaper:Texture2D
@export var wallpaper:Texture2D:
	set(value):
		if _wallpaper!=value:
			_wallpaper = value
			emit_changed()
	get:
		return _wallpaper

var _desktop_items:Array[FileBase]
@export var desktop_items:Array[FileBase]:
	set(value):
		if _desktop_items!=value:
			_desktop_items = value
			emit_changed()
	get:
		return _desktop_items
		
var _process_ran:Array[ProgramProcess]
@export var process_ran:Array[ProgramProcess]:
	set(value):
		if _process_ran!=value:
			_process_ran = value
			emit_changed()
	get:
		return _process_ran
		

		
		
