extends StaticBody2D

# DECLARAÇÃO DE VARIAVEIS DO INIMIGO ZOMBIE
var direction = "right"
var velocity = 600
var start
var end
var lifeEnemyZombie = randi()%14+8

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
		
# VIDA DO INIMIGO 1 - ZOMBIE MORTE ALEATORIA DE 8 A 14 HITS
func lifeEnemy(lifeE1):
	if lifeEnemyZombie >= 0:
		lifeEnemyZombie = lifeEnemyZombie - lifeE1
		return lifeEnemyZombie

# ANIMAÇÃO DE MORTE DO INIMIGO ZOMBIE
func die():
	get_node("AnimatedSprite").play("dying")
	#IMPLEMENTAR PARADA DE MOVIMENTO QUANDO MORRER
	#IMPLEMENTAR TIMER PARA DESAPARENCIMENTO
	queue_free()		
