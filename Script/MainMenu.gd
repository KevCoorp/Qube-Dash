extends Control

onready var menu = $Menu
onready var settings = $Settings
onready var video = $Video
onready var audio = $Audio

func _process(delta):
	if Input.is_action_just_pressed("ui_escape"):
		toggle()

func toggle():
	visible = !visible	
	get_tree().paused = visible



func _on_Start_pressed():
	toggle()
	get_tree().change_scene("res://Level/Level1.tscn")


# Main menu settings 

func _on_Settings_pressed():
	show_and_hide(settings, menu)

func show_and_hide(first, second):
	first.show()
	second.hide()	

func _on_Exit_pressed():
	get_tree().quit()


# Settings menu 


func _on_BackSettings_pressed():
	show_and_hide(menu, settings)


# Audio settings
func _on_Audio_pressed():
	show_and_hide(audio, settings)
	
func _on_Master_value_changed(value):
	volume(0, value)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_Music_value_changed(value):
	volume(1, value)

func _on_SFX_value_changed(value):
	volume(2, value)
	
func _on_BackAudio_pressed():
	show_and_hide(settings, audio)

	
# Video settings

func _on_Video_pressed():
	show_and_hide(video, settings)
	
func _on_FullScreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed

func _on_Borderless_toggled(button_pressed):
	OS.window_borderless = button_pressed
	
func _on_VSync_toggled(button_pressed):
	OS.vsync_enabled = button_pressed
	
func _on_BackVideo_pressed():
	show_and_hide(settings, video)





