extends Control 

var remaining_time = 5

func _on_Timer_timeout():
	remaining_time = Timer.time_left
	if remaining_time <= 0:
		print("game over")

	# Update the Label node with the remaining time
	Label.text = "Time left: " + str(remaining_time)
