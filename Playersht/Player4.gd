extends KinematicBody2D

var bullet = preload("res://Bulletshot//Bullet.tscn")


export var speed = 150
var motion = Vector2()
export var gravity = 10
export var jump_power = -400
export var delay = 0.2
var jump_bounce = - 100
var shooting = false
var waited = 0
var sudden_decent = 400
#new
var shotspeed = 500

var angle = Vector2(shotspeed * 0.6, 0)
var shotlimit = 50
var coincount = 0
var coinlimit = 16
var dead = false
func _ready():
	set_process(true)
	#shoot()
	set_physics_process(true) # Replace with function body.
	
func _on_Enemy_detector_body_entered(body: KinematicBody2D) -> void:
	dead()
func dead() -> void:	
	get_tree().reload_current_scene()



func _on_Enemy_detector_area_entered(area: Area2D):
	coincount += 1
	check()
	
func _input(event):
	if event.is_action_pressed("fire"):
		shooting = true
	elif event.is_action_released("fire"):
		shooting = false
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed 
	elif Input.is_action_pressed("ui_right"):
		motion.x = speed 
	else:
		motion.x = 0
	if Input.is_action_pressed("ui_up"):
		motion.y =  jump_power
	elif Input.is_action_pressed("ui_down"):
		motion.y += sudden_decent
	if Input.is_action_pressed("angle_up"):
		angle.y -= shotspeed * (sqrt(3) / 4)
	elif Input.is_action_just_released("angle_up"):
		angle.y += 0
	if Input.is_action_pressed("angle_down"):
		angle.y += shotspeed * (sqrt(3) / 4)
	elif Input.is_action_just_released("angle_down"):
		angle.y += 0
	angle.y = clamp(angle.y, -sqrt(3)* shotspeed,0 )
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene("res://Respawn/Respawn2.tscn")
func _process(delta):
	if(shooting && waited > delay):
		rapid_fire()
		waited = 0
	elif(waited <= delay):
		waited += delta
		
	
func rapid_fire():
	shoot()

func _physics_process(delta):
	var countno = get_node("Camera2D/Label")
	countno.text = "Coin(s): " + str(coincount) + "   Shots remaining: " + str(shotlimit)
	motion.y += 10
	motion = move_and_slide(motion)
func check():
	if (coincount == coinlimit):
		get_tree().get_root().get_node("Leveltwo/Barrier").queue_free()
#func check():
	#var barrierInstance = barrier.instance()
	#if (coincount >= coinlimit):
		#barrierInstance.queue_free()


			
	
		
func shoot():
	if(shotlimit > 0):
		var bulletInstance = bullet.instance()
		bulletInstance.position = Vector2(position.x+ 60,position.y)
		bulletInstance.shoot(angle)
		get_tree().get_root().add_child(bulletInstance)
		shotlimit -= 1
	

	

