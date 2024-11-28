extends Node2D

@onready var timer = $Timer

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("i"):
		timer.start()
		if is Player:
			pass
		 # Démarre le timer

func _on_timer_timeout():
	print("time out")

