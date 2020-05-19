extends Button
var levelTwo = "res://Levels/Leveltwo.tscn"


func _on_LevelTwoButton_button_up():
	get_tree().change_scene(levelTwo)
