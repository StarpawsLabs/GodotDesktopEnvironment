@tool
extends Control

@onready var software_prefab:PackedScene = load("res://GodotVirtualPC/Prefabs/software_icon.tscn")
var _icon_continer:Dictionary = {}
var max_grid_size = Vector2i(-1,-1)
var desktop_size = Vector2i(-1,-1)
signal software_clicked(info)
signal file_clicked(info)

func get_min_empty_grid()->Vector2i:
	var result = Vector2i(-1,-1)
	for i in range(max_grid_size.x):
		for j in range(max_grid_size.y):
			if not _icon_continer.has(Vector2i(i,j)):
				result = Vector2i(i,j)
				return result
	return result

func set_icon_continer(_desktop_item:FileBase):
	if _icon_continer.has(_desktop_item.icon_pos) or _desktop_item.icon_pos.x >= max_grid_size.x or _desktop_item.icon_pos.y >= max_grid_size.y:
		_desktop_item.icon_pos = get_min_empty_grid()
	_icon_continer.set(_desktop_item.icon_pos,_desktop_item)

func make_software_prefab(pos:Vector2i,software_info:FileBase):
	var software_node = software_prefab.instantiate()
	software_node.init_software_icon(software_info)
	if software_info is SoftwareInfo:
		software_node.clicked.connect(func(_software_info):software_clicked.emit(_software_info))
	if software_info is FileInfo:
		software_node.clicked.connect(func(_file_info):file_clicked.emit(_file_info))
	add_child(software_node)
	software_node.position = Vector2(pos.x*desktop_size.x*1.1,pos.y*desktop_size.y*1.1)



func flesh_desktop(info:PCInfo,_desktop_size:Vector2i,desktop_grid_size:Vector2i):
	_icon_continer.clear()
	desktop_size = _desktop_size
	max_grid_size=desktop_grid_size
	if info.desktop_items!=null:
		for desktop_item in info.desktop_items:
			if desktop_item!=null:
				set_icon_continer(desktop_item)
	
	for old_node in get_children():
		old_node.queue_free()
	
	for icon_item_pos in _icon_continer:
		make_software_prefab(icon_item_pos,_icon_continer[icon_item_pos])
