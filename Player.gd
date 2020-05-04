extends KinematicBody2D
var speed = 50
var motion = Vector2(0,0)
var gravity = 500
var jump_power = -750

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	
func _process(delta):
	
	#elif Input.is_action_pressed("ui_down"):
		#motion.y += jump_power
	if Input.is_action_pressed("ui_right"):
		motion.x += speed
	elif Input.is_action_pressed("ui_left"):
		motion.x -= speed
	else:
		motion.x = 0
		motion.y = 0
	if Input.is_action_pressed("ui_up"):
		motion.y = jump_power #* delta
	motion.y += gravity 
	move_and_slide(motion)
	# Replace wi


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
