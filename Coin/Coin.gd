extends Area2D

onready var anim_play: AnimationPlayer = get_node("AnimationPlayer")


# Called when the node enters the scene tree for the first time.
func _ready():
	anim_play.play("Bounce")


func _on_Coin_body_entered(body: KinematicBody2D) -> void:
	queue_free()




func _on_Coin_area_entered(area: Area2D) -> void:
	queue_free()
