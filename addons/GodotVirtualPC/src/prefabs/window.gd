extends Control
signal exit(window)
signal minimum(window)

func init_window(info:SoftwareInfo) -> void:
	var softwarePage = info.software_window
	var softwarePageNode = softwarePage.instantiate()
	$systemPage/icon.texture = info.icon
	$systemPage/softwarePage.add_child(softwarePageNode)
	
func _on_exit_pressed() -> void:
	exit.emit(self)


func _on_minimize_pressed() -> void:
	minimum.emit(self)
