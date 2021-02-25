extends KinematicBody2D

var speed = 0.1
var velocity = Vector2.ZERO
var enemies = []

func _physics_process(_delta):
	position += velocity
	velocity.y -= speed
	if position.y <= -550:
		queue_free()



func _on_Timer_timeout():
	for e in enemies:
		e.die(5)
	queue_free()


func _on_Area2D_body_entered(body):
	enemies.append(body)

func _on_Area2D_body_exited(body):
	for e in enemies:
		if body.name == e.name:
			enemies.erase(e)
