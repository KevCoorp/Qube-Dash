extends Node2D

@onready var anim = $AnimatedSprite2D

func _ready():
	$Area2D/AnimatedSprite2D.play("red")

func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		$Area2D/AnimatedSprite2D.play("capture")
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://game/demoscreen/demo_screen.tscn")
