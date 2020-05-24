extends KinematicBody2D


var rand_generate = RandomNumberGenerator.new()
#new edit

var shotspeed = 700
var angle = Vector2()
onready var timer  = get_node("Timer")
#func _ready():
	#set_process(true)
	#set_physics_process(true) 
	# Replace with function body.

func shoot(bullet):
	angle = bullet
	set_physics_process(true)
	

	#if(angle.x == 0 && angle.y == 0):
		#set_angle()
	
func _physics_process(delta):
	
	var collide = move_and_collide(angle * delta)
	
	#move(velocity * delta) 
	if(collide): #pha huy doi thu
		
		get_tree().reload_current_scene() #pha huy chinh vien dan
		
func _on_Timer_timeout():
	timer.stop()
	queue_free()
