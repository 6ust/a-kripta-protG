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

var gravity = 320
var moviment = Vector2(0,0)
var velocity = 200

func _physics_process(delta):	
	if moviment.y > gravity:
		moviment.y = gravity
		
	if Input.is_action_pressed("ui_right"):
		moviment.x = velocity
		get_node("AnimSprite").play("Running")
		get_node("AnimSprite").set_flip_h(false)
	elif Input.is_action_pressed("ui_left"):
		moviment.x = -velocity
		get_node("AnimSprite").play("Running")
		get_node("AnimSprite").set_flip_h(true)
	else: 
		moviment.x = 0
	
	if Input.is_action_just_pressed("ui_up"):
		moviment.y = -200
	
	moviment.y += gravity * delta
	moviment = move_and_slide(moviment, Vector2(0,-1))
