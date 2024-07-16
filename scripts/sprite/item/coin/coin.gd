extends Area2D

func collected():
	pass
	
func _on_body_entered(body):
	if body.is_in_group("Player"):
		collected()
		queue_free()
