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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Stomp_body_entered(body: KinematicBody2D) -> void:
	get_node("CollisionPolygon2D").disabled = true
	queue_free()# Replace with function body.
