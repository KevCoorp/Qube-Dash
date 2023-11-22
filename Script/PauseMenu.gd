extends Control

var is_paused: bool = false

func set_is_paused(value):
	is_paused=value
	get_tree().paused=is_paused
	visible=is_paused
	
func _unhandled_input(event):	
	if event.is_action("ui_escape"):
		set_is_paused(!is_paused)


func _on_ResumeButton_pressed():
	set_is_paused(false)

func _on_ExitButton_pressed():
	get_tree().quit()
