extends Control

func init_software_window_node(open_argc:Array):
	if open_argc != []:
		var _info:FileInfo = open_argc[0]
		$Label.text = _info.file_data
