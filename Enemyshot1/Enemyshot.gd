extends KinematicBody2D


var speed = 300
var enemy_motion = Vector2(-speed,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false) # Replace with function body.

func _physics_process(delta):
	if is_on_wall():
		enemy_motion.x = - enemy_motion.x 
	move_and_slide(enemy_motion)






