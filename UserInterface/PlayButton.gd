extends Button

var levelOne = "res://Levels/Levelone.tscn"


func _ready():
	pass

func _on_PlayButton_pressed():
	 get_tree().change_scene(levelOne)
