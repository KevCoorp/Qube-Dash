extends Area2D

func _on_NextLevel_body_entered(body):
	if body.is_in_group("Player"):
		print("test")	
	
