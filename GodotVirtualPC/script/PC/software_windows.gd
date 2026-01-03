extends Control

signal  window_exit(id)
signal  window_minimze
signal  window_hide
var _process_process:ProgramProcess
func init_software_window(process:ProgramProcess,open_argc:Array):
	_process_process = process
	var software_window_node = _process_process.software_info.software_window.instantiate()
	software_window_node.init_software_window_node(open_argc)
	$backword/SoftwarePage.add_child(software_window_node)
func _on_exit_pressed() -> void:
	window_exit.emit(_process_process.process_id)


func _on_minimize_pressed() -> void:
	window_minimze.emit()


func _on_hide_pressed() -> void:
	window_hide.emit()
