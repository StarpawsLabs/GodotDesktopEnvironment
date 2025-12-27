extends Resource
#the base of file
class_name FileBase

var displayed_file_name :String#file`s name ,need set
var _icon_pos : Vector2i
@export var icon_pos:Vector2i:
	set(value):
		if _icon_pos!=value:
			_icon_pos = value
			emit_changed()
	get:
		return _icon_pos
