extends Control

signal  window_exit(id)
signal  window_minimze
signal  window_hide
var _process_id:int
var software_window_node
func init_software_window(_window_prefab:PackedScene,__process_id:int):
	_process_id = __process_id
	software_window_node = _window_prefab.instantiate()
	$backword/SoftwarePage.add_child(software_window_node)

func _on_exit_pressed() -> void:
	window_exit.emit(_process_id)


func _on_minimize_pressed() -> void:
	window_minimze.emit()


func _on_hide_pressed() -> void:
	window_hide.emit()
