extends Area2D



onready var animPlayer: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: KinematicBody2D) -> void:
	teleport()

# Called when the node enters the scene tree for the first time.
func teleport() -> void:
	animPlayer.play("Fadein")
	yield(animPlayer, "animation_finished") #sau khi hoan thanh animation hoan tat thi godot se chuyen canh
	get_tree().change_scene("res://Levels/Levelthree.tscn")
	
#	pass





