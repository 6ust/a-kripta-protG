extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var life
var movement = Vector2()
var direction = 1
var velocity = 15
var currentLifeE1
var currentLifeBoss1

# SHURIKEN - CONFIGURAÇÃO DA DIREÇÃO DO PERSONAGEM
func set_direction(dir):
	direction = dir

# SHURIKEN - ANIMAÇÃO
func _physics_process(delta):
	movement.x = velocity * direction
	translate(movement)	

# SHURIKEN - IDENTIFICAÇÃO DE INIMIGO 
func _on_power_body_entered(body):
	if "zombieF" in body.name:
		currentLifeE1 = body.lifeEnemy(1)
		queue_free()	
		print(currentLifeE1)		
		if currentLifeE1 == 0:
			body.die()
		
	elif "zombieM" in body.name:
		currentLifeE1 = body.lifeEnemy(1)
		queue_free()	
		print(currentLifeE1)		
		if currentLifeE1 == 0:
			body.die()
	elif "boss1" in body.name:
		currentLifeBoss1 = body.lifeEnemyBoss1(1)
		queue_free()	
		print(currentLifeBoss1)		
		if currentLifeBoss1 == 0:
			body.die()
