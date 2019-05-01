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
var gravity = 300
var velocity = 300

func _physics_process(delta):
	if movement.y > gravity:
		movement.y = gravity
	
	if Input.is_action_pressed("ui_left"):
		movement.x = -velocity
		get_node("AnimatedSprite").play("running")
		get_node("AnimatedSprite").set_flip_h(true)
	elif Input.is_action_pressed("ui_right"):
		movement.x = velocity
		get_node("AnimatedSprite").play("running")
		get_node("AnimatedSprite").set_flip_h(false)
	else:
		movement.x = 0
		get_node("AnimatedSprite").play("idling")
		
	if is_on_floor() and Input.is_action_just_pressed("space"):
		movement.y = -320
	
	movement.y += gravity * delta
	
	move_and_slide(movement, Vector2(0,-1))
