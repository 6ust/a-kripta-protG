extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var movement = Vector2()
var direction = 1
var velocity = 15

func set_direction(dir):
	direction = dir

func _physics_process(delta):
	movement.x = velocity * direction
	translate(movement)	

func _on_power_body_entered(body):
	if "zombieF" in body.name:
		body.die()
	elif "zombieM" in body.name:
		body.die()
