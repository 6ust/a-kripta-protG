extends Control

# Atençao 
# Reajustar todos os CenterBox 
# Recria-los Um a Um
# pois os mesmo se encontram duplicados com Ctrl + D
# Cujo Atalho / Duplicata
# Utiliza referencia de escala do Pai.
# Logo se alterar o filho os a pais tambem mudam

func _ready():
	$the_end.play()


func _on_main_menu_pressed():
	get_tree().change_scene("res://main_menu.tscn")
