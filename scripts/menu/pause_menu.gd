extends CanvasLayer

var pause = false

func pause_unpaused():
	pause = !pause
	
	if pause:
		get_tree().paused = true
		show()
	else:
		get_tree().paused = false
		hide()

func _input(event):
	if Input.is_action_just_pressed("pause"):
		pause_unpaused()
	
