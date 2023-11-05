extends Area2D


func _on_Coin_body_entered(body):
	$AnimationPlayer.play("pick_up")
	body.add_coin()
	
func _onAnimationPlayer_animation_finished(anim_name):
	queue_free()
