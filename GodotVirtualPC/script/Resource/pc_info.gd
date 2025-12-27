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

var _desptop_items:Array[FileBase]
@export var desptop_items:Array[FileBase]:
	set(value):
		if _desptop_items!=value:
			_desptop_items = value
			emit_changed()
	get:
		return _desptop_items
		
		
		

		
		
