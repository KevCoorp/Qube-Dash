extends Area2D


func _on_Coin_body_entered(body):
	$AnimationPlayer.play("pick_up")
	queue_free()
