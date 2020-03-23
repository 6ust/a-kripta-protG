extends StaticBody2D

# DECLARAÇÃO DE VARIAVEIS DO BOSS
var direction = "right"
var velocity = 600
var start
var end
var lifeEnemyBoss1 = randi()%14+8

func _ready():
	start = position.x
	end = start + velocity
	
# ALGORITMO DE MOVIMENTAÇÃO DO INIMIGO ZOMBIE
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
		
# VIDA DO BOSS 1 - BOSSS 1 MORTE ALEATORIA DE 8 A 14 HITS
func lifeEnemyBoss1(lifeBoss1):
	if lifeEnemyBoss1 >= 0:
		lifeEnemyBoss1 = lifeEnemyBoss1 - lifeBoss1
		return lifeEnemyBoss1

# ANIMAÇÃO DE MORTE DO INIMIGO BOSS
func die():
	get_node("AnimatedSprite").play("die")
	#IMPLEMENTAR PARADA DE MOVIMENTO QUANDO MORRER
	#IMPLEMENTAR TIMER PARA DESAPARENCIMENTO
	queue_free()		
