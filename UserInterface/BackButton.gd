extends Button



func _on_BackButton_button_up():
	#$"../../Menu2".visible = false
	#$"../../Menu".visible = true
	get_tree().change_scene("res://MenuScreen/MainScreen.tscn")
