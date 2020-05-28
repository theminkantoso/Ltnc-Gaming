extends Button

export var Level_Path = ""


func _on_ChooseLevelButton_button_up():
	get_tree().change_scene(Level_Path)
