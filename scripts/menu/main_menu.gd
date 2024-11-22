extends Control

@onready var options = $Options
@onready var graphics = $Graphics
@onready var audio = $Audio
@onready var main = $Main


func _ready():
	$Main/VBoxContainer/NewGame
	
func _process(delta):
	if Input.is_action_just_pressed("back"):
		toggle()
	
func _on_exit_pressed():
	get_tree().quit()

func _on_new_game_pressed():
	toggle()
	get_tree().change_scene_to_file("res://game/cutscenes/cti_1.tscn")

func _on_texture_button_pressed():
	OS.shell_open("https://kevcoorp.github.io")

# Paramètre
func toggle():
	visible = !visible
	get_tree().paused = visible

func show_and_hide(first, second):
	first.show()
	second.hide()

# Boutton set
func _on_graphics_pressed():
	show_and_hide(graphics, options)
	
func _on_back_from_audio_pressed():
	show_and_hide(options, audio)

func _on_back_from_video_pressed():
	show_and_hide(options, graphics)

func _on_settings_pressed():
	show_and_hide(options, main)

func _on_audio_pressed():
	show_and_hide(audio, options)
	
func _on_back_pressed():
	show_and_hide(main, options)
	
func _on_fullscreen_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if not toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_borderless_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	if not toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)

func _on_v_sync_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	if not toggled_on:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
func _on_master_slide_value_changed(value):
	volume(0, value)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_music_value_changed(value):
	volume(1, value)
	
func _on_sound_fx_value_changed(value):
	volume(2, value)
