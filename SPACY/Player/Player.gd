extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 0.03
var Bullet1 = load("res://Bullet/Bullet1.tscn")
var Bullet2 = load("res://Bullet/Bullet2.tscn")
onready var Bullets = get_node("/root/Game/Bullets")

func _ready():
	pass 

func _physics_process(_delta):
	velocity += get_input()*speed
	position += velocity
	if position.x >= 512:
		velocity = Vector2.ZERO
		position.x = 512
	if position.x <= -500:
		velocity = Vector2.ZERO
		position.x = -500
	if position.y >= 0:
		velocity = Vector2.ZERO
		position.y = 0
	if position.y <= -550:
		velocity = Vector2.ZERO
		position.y = -550
	if Input.is_action_just_pressed("shoot"):
		var bullet1 = Bullet1.instance()
		bullet1.position = position
		Bullets.add_child(bullet1)
	if Input.is_action_just_pressed("bomb"):
		var bullet2 = Bullet2.instance()
		bullet2.position = position
		Bullets.add_child(bullet2)


func get_input():
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("left"):
		input_vector += Vector2(-1,0)
	if Input.is_action_pressed("right"):
		input_vector += Vector2(1,0)
	if Input.is_action_pressed("up"):
		input_vector += Vector2(0,-1)
	if Input.is_action_pressed("down"):
		input_vector += Vector2(0,1)
	return input_vector
	
func die(s):
	queue_free()
