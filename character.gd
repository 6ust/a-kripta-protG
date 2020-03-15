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

const LEAPSAMOUNT = 2
const POWER = preload("res://power.tscn")
var movement = Vector2()
var gravity = 750
var velocity = 300
var leap = LEAPSAMOUNT

func _physics_process(delta):
	#Gravity applied in character
	if movement.y > gravity:
		movement.y = gravity
	
	#Movement of the character
	if Input.is_action_pressed("ui_left"):
		movement.x = -velocity
		get_node("AnimatedSprite").play("running")
		get_node("AnimatedSprite").set_flip_h(true)
	elif Input.is_action_pressed("ui_right"):
		movement.x = velocity
		get_node("AnimatedSprite").play("running")
		get_node("AnimatedSprite").set_flip_h(false)
	#When stay Idle
	else:
		movement.x = 0
		get_node("AnimatedSprite").play("idling")
		
	#Jump action
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):	
			movement.y = -520
	movement.y += gravity * delta
	
	#Fire in anything
	if Input.is_action_just_pressed("space"):
		var power = POWER.instance()
		get_parent().add_child(power)
		power.position = $Position2D.global_position
		
		if $Position2D.position.x > 0:
			power.set_direction(1)
		else:
			power.set_direction(-1)
			
	if Input.is_action_just_pressed("ui_left"):
		if $Position2D.position.x > 0:
			$Position2D.position.x *= -1
	if Input.is_action_just_pressed("ui_right"):
		if $Position2D.position.x < 0:
			$Position2D.position.x *= -1
				
	move_and_slide(movement, Vector2(0,-1))


func _on_trampoline_body_entered(body):
	movement.y = -750


func _on_portalLevel2_body_entered(body):
	get_tree().change_scene("res://level2.tscn")

func _on_portalLevel3_body_entered(body):
	get_tree().change_scene("res://level3.tscn")

func _on_portalEnd_body_entered(body):
	get_tree().change_scene("res://game_over.tscn")
