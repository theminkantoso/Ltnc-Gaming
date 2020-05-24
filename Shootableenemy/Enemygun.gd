extends KinematicBody2D

var bullet = preload("res://Shootableenemy/Enemybullet.tscn")

var delay = 0.3
var waited = 0
var bullet_1 = Vector2(500,-300)
var bullet_2 = Vector2(-500,-300)

# Called when the node enters the scene tree for the first time.
func _ready():
	
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
	var bullet1 = bullet.instance()
	var bullet2 = bullet.instance()
	bullet1.position = Vector2(position.x + 10,position.y - 60)
	bullet2.position = Vector2(position.x - 10,position.y - 60)
	bullet1.shoot(bullet_1)
	bullet2.shoot(bullet_2)
	get_tree().get_root().add_child(bullet1)
	get_tree().get_root().add_child(bullet2)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass







