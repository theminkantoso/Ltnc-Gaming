extends KinematicBody2D
#var player = preload("res://Playersht/Player.tscn")
export var speed = 500
export var gravity = 10

#new edit


var velocity = Vector2()



func shoot(angle):
	velocity = angle
	set_physics_process(true)

func _physics_process(delta):
	
	velocity.y += gravity
	
	var collide = move_and_collide(velocity * delta)
	
	#move(velocity * delta) 
	if(collide):
		if collide.get_collider() is KinematicBody2D:
			collide.get_collider().queue_free() #pha huy doi thu
			queue_free() #pha huy chinh vien dan
		else:
			queue_free()

			
