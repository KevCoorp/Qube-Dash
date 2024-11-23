extends Area2D

func _on_area_entered(area: Area2D) -> void:
	$CoinsSFX.play()
	await $CoinsSFX.finished 
	queue_free()	

		

