extends Area2D

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play()

func _on_body_entered(body):
	anim.play("capture")
