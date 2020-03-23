extends Control

func _ready():
	$game_over.play()

func _on_main_menu_pressed():
	get_tree().change_scene("res://main_menu.tscn")
