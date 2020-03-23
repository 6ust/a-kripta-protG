extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_AreaDie001_body_entered(body):
	if "Character" in body.name:
		get_tree().change_scene("res://game_over.tscn")

func _on_DieAreaZombie_body_entered(body):
	if "Character" in body.name:
		get_tree().change_scene("res://game_over.tscn")
	
func _on_die_collision_boss1_body_entered(body):
	if "Character" in body.name:
		get_tree().change_scene("res://game_over.tscn")
