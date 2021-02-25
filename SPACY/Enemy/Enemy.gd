extends KinematicBody2D


var Enemy_Bullet = load("res://EnemyBullet/Enemy_Bullet.tscn")
var speed = 2
onready var Bullets = get_node("/root/Game/Bullets")
var ready_to_move = true

func _physics_process(_delta):
	pass

func _ready():
	randomize()

func die(s):
	Global.score += s
	queue_free()
	


func _on_Shoot_timeout():
	if randf() < 0.2 and position.y > 0:
		var enemy_bullet = Enemy_Bullet.instance()
		enemy_bullet.position = position
		Bullets.add_child(enemy_bullet)


func _on_Move_timeout():
	if randf() < 0.2 and ready_to_move:
		var new_position = Vector2(randi() % -512,randi() % 512)
		$Tween.interpolate_property(self, "position", position, new_position, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		ready_to_move = false
	


func _on_Tween_tween_all_completed():
	ready_to_move = true

	
