extends Area2D

@onready var pick_sound = $CoinsSFX

func _on_area_entered(area: Area2D) -> void:
	pick_sound.play()
	queue_free()
