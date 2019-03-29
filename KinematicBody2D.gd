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
	
	
var gravidade = 320
var movimento = Vector2(0,0)


func _physics_process(delta):	
	if(movimento.y > gravidade):
		movimento.y = gravidade
		#movimento.x = 32
	if(Input.is_action_just_pressed("ui_up")): #Wrong
		movimento.y = -200;
		get_node("AnimSprite").play("Jumping")
		
	
	if(Input.is_action_pressed("ui_left")): 
		movimento.x = -200;
		get_node("AnimSprite").play("Running")
		get_node("AnimSprite").set_flip_h(true)
	elif(Input.is_action_pressed("ui_right")): 
		movimento.x = +200;
		get_node("AnimSprite").play("Running")
		get_node("AnimSprite").set_flip_h(false)
		
	elif(Input.is_action_pressed("ui_down")):
		movimento.x = +150;
		movimento.y = 0
		get_node("AnimSprite").play("Sliding")
		
	else:
		movimento.y += gravidade * delta
		movimento = Vector2(0, movimento.y)
		get_node("AnimSprite").play("Idling")
		
	move_and_slide(movimento, Vector2(0,-1))