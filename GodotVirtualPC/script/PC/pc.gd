@tool
extends Control
signal pc_info_chenged
@onready var wallpaper = $WallPaper
@onready var software_mgr = $SoftwareMgr

@export_tool_button('flseh PC')var fleshpc_action = reflesh_ps


var _pc_info:PCInfo
@export var pc_info:PCInfo:
	set(value):
		_pc_info = value
		if _pc_info!=null and not _pc_info.changed.is_connected(call_pc_info_chenged):
			_pc_info.changed.connect(call_pc_info_chenged)
		call_pc_info_chenged()
	get:
		return _pc_info

@export_group('123')
var _desktop_size:Vector2i
@export var desktop_size:Vector2i:
	set(value):
		_desktop_size = value
		call_pc_info_chenged()
	get:
		return _desktop_size

var _desktop_grid_size:Vector2i
#123
@export var desktop_grid_size:Vector2i:
	set(value):
		_desktop_grid_size = value
		call_pc_info_chenged()
	get:
		return _desktop_grid_size
	
func _ready() -> void:
	pc_info_chenged.connect(reflesh_ps)
	pc_info_chenged.emit()
	
func call_pc_info_chenged():
	pc_info_chenged.emit()

func reflesh_ps():
	if pc_info!=null:
		wallpaper.texture = _pc_info.wallpaper
		software_mgr.flesh_desktop(pc_info,desktop_size,desktop_grid_size)


func open_program(_info:SoftwareInfo,open_argc:Array):
	$Window.open_window(_info,open_argc)


func _on_software_mgr_software_clicked(_info:SoftwareInfo) -> void:
	open_program(_info,[])


func _on_software_mgr_file_clicked(_info: FileInfo) -> void:
	open_program(_info.default_opener,[_info])
