extends Button

var levelOne = "res://Levels/Levelone.tscn"

func _on_PlayButton_button_up():
	get_tree().change_scene(levelOne)
