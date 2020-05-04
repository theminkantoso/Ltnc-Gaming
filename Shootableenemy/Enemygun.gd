extends KinematicBody2D

var bullet = preload("res://Shootableenemy/Enemybullet.tscn")

var delay = 0.2
var waited = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true) # Replace with function body.
	set_process(true)
func _process(delta):
	if(waited > delay):
		rapid_fire()
		waited = 0
	elif(waited <= delay):
		waited += delta



func rapid_fire():
	shoot()

func shoot():
	var bulletInstance = bullet.instance()
	bulletInstance.position = Vector2(position.x,position.y - 70)
	bulletInstance.shoot()
	get_tree().get_root().add_child(bulletInstance)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
