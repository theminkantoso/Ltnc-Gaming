extends KinematicBody2D


var rand_generate = RandomNumberGenerator.new()
#new edit

var shotspeed = 700
var angle = Vector2(-600,-200)

#func _ready():
	#set_process(true)
	#set_physics_process(true) 
	# Replace with function body.

func shoot():
	set_physics_process(true)


	#if(angle.x == 0 && angle.y == 0):
		#set_angle()
	
func _physics_process(delta):
	var collide = move_and_collide(angle * delta)
	
	#move(velocity * delta) 
	if(collide):
		collide.get_collider().queue_free() #pha huy doi thu
		queue_free() #pha huy chinh vien dan
		

