extends Control

func _ready():
	$VBoxContainer/NewGame.grab_focus()

func _on_exit_pressed():
	get_tree().quit()

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://game/cutscenes/cti_1.tscn")

func _on_texture_button_pressed():
	OS.shell_open("https://kevcoorp.github.io")
	pass

# Paramètre
func _on_settings_pressed():
	var settings = load("res://scene/menu/settings.tscn").instance()
	get_tree().current_scene.add_child(settings)
