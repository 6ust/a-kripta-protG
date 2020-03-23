extends Control

func _ready():
	$mainMenuSoundtrack.play()


func _on_new_game_pressed():
	get_tree().change_scene("res://level1.tscn")

func _on_exit_pressed():
	get_tree().quit()
