extends Area2D

@onready var audio = $CoinsSFX

func _on_area_entered(area: Area2D) -> void:
	queue_free()
