extends SoftwareScriptBase

var open_argv:Array
func _init(argv) -> void:
	open_argv = argv
	
func _ready() -> void:
	if len(open_argv) > 0 :
		call_window.emit(open_argv)
