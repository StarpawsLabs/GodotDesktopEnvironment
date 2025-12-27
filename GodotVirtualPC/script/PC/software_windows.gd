extends Control

signal  window_exit(node)
signal  window_minimze
signal  window_hide

func init_software_window(software_info:SoftwareInfo,open_argc:Array):
	var software_window_node = software_info.software_window.instantiate()
	software_window_node.init_software_window_node(open_argc)
	$backword/SoftwarePage.add_child(software_window_node)
func _on_exit_pressed() -> void:
	window_exit.emit(self)


func _on_minimize_pressed() -> void:
	window_minimze.emit()


func _on_hide_pressed() -> void:
	window_hide.emit()
