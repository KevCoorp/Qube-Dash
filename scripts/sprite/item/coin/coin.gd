extends Node2D

@onready var coins = $CoinsSFX

func _on_area_2d_body_entered(body):
	coins.play()
	GameManager.gain_coins(1)
	queue_free()
