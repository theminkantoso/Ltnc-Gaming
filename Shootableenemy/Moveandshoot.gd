extends KinematicBody2D


var bullet = preload("res://Shootableenemy/Enemybullet.tscn")

var delay = 0.3
var waited = 0
var bullet_1 = Vector2(500,-300)
var bullet_2 = Vector2(-500,-300)
var speed = 300
var enemy_motion = Vector2(-speed,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process(true)


func _process(delta):
	if(waited > delay):
		rapid_fire()
		waited = 0
	elif(waited <= delay):
		waited += delta

func _physics_process(delta):
	if is_on_wall():
		enemy_motion.x = - enemy_motion.x 
	move_and_slide(enemy_motion)

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


