extends Node2D

var max_meteors = 3
var Meteor = load("res://Meteor/Meteor.tscn")

func _ready():
	randomize()

func _physics_process(_delta):
	if get_child_count() < max_meteors:
		if randf() < 0.005:
			var meteor = Meteor.instance()
			meteor.position.y = -100
			meteor.position.x = randi() % 512
			add_child(meteor)
