@tool
extends Control
signal clicked(info)

var info:FileBase
func init_software_icon(_info:FileBase):
	info = _info
	$name.text = _info.displayed_file_name
	$icon.texture_normal = _info.icon

func _on_icon_pressed() -> void:
	clicked.emit(info)
