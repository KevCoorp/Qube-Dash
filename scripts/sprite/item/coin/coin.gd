extends Area2D

@onready var animation_player = $AnimationPlayer

func _on_area_entered(area: Area2D) -> void:
	$CoinsSFX.play()
	animation_player.play("pick_up")
	await $CoinsSFX.finished 
	queue_free()	

		
