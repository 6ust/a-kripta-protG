extends StaticBody2D

# DECLARAÇÃO DE VARIAVEIS DO INIMIGO ZOMBIE
var direction = "right"
var velocity = 400
var start
var end
var lifeEnemyZombie = randi()%14+8
var timer = Timer.new()

func _ready():
	start = position.x
	end = start + velocity

# ALGORITMO DE MOVIMENTAÇÃO DO INIMIGO ZOMBIE
func _physics_process(delta):
	
	# GRAVIDADE APLICADA AO INIMIGO
	if position.x < end and direction == "right":
		if lifeEnemyZombie > 0:
			position.x += 2
			$ZombieAS.play("walking")
			$ZombieAS.set_flip_h(false)
	else: 
		direction = "left"
	
	if position.x > start and direction == "left":
		if lifeEnemyZombie > 0:
			position.x -= 2
			$ZombieAS.play("walking")
			$ZombieAS.set_flip_h(true)
	else:
		direction = "right"
		
# VIDA DO INIMIGO 1 - ZOMBIE MORTE ALEATORIA DE 8 A 14 HITS
func lifeEnemy(lifeE1):
	if lifeEnemyZombie >= 0:
		lifeEnemyZombie = lifeEnemyZombie - lifeE1
		return lifeEnemyZombie
		

# ANIMAÇÃO DE MORTE DO INIMIGO ZOMBIE
func die():
	$ZombieAS.play("dying")
	
	#TIMER PARA DESAPARENCIMENTO
	timer.set_wait_time(2)
	timer.set_one_shot(true)
	self.add_child(timer)
	timer.start()
	yield(timer, "timeout")
	timer.queue_free()
	
	# REMOÇÃO DO INIMIGO EM CENA
	queue_free()
