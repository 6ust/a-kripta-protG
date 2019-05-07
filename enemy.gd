extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var direction = "right"
var velocity = 600
var start
var end

func _ready():
	start = position.x
	end = start + velocity
	
func _process(delta):
	if position.x < end and direction == "right":
		get_node("AnimatedSprite").set_flip_h(false)
		position.x += 2
	else: 
		direction = "left"
	
	if position.x > start and direction == "left":
		get_node("AnimatedSprite").set_flip_h(true)
		position.x -= 2
	else:
		direction = "right"
		
func die():
	queue_free()
