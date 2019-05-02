extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

var movement = Vector2()
var gravity = 150

func _physics_process(delta):
	if movement.y > gravity:
		movement.y = gravity
		
	movement.x = 150
	
	move_and_slide(movement, Vector2(0,-1))