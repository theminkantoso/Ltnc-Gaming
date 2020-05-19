extends Control


var paused = false #setget set_paused

func _ready():
	$"PauseOverlay".visible = false
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		paused = not paused
		$"PauseOverlay".visible = paused
		get_tree().paused = paused
		
