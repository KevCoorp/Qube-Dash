extends Node2D

@onready var anim = $AnimatedSprite2D

func _ready():
	anim.play("idle")
	
func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		anim.play("capture")
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scene/game/world/level_overworld/level_1.tscn")


