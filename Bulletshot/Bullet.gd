extends KinematicBody2D

export var speed = 500
export var gravity = 10

#new edit

#ar velocity = Vector2(speed / 2 , 0)
var velocity = Vector2()

#func _ready():
	#set_process(true)
	#set_physics_process(true) 
	# Replace with function body.

func shoot(angle):
	velocity = angle
	set_physics_process(true)

func _physics_process(delta):
	
	velocity.y += gravity
	
	var collide = move_and_collide(velocity * delta)
	
	#move(velocity * delta) 
	if(collide):
		collide.get_collider().queue_free() #pha huy doi thu
		queue_free() #pha huy chinh vien dan
	
