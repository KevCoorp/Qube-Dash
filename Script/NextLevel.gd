extends Area2D

onready var animatedSprite = $AnimatedSprite

export (String, FILE, "*.tscn") var target_level_path = ""

func _on_NextLevel_body_entered(body):
	if not body is Player: return
	if target_level_path.empty(): return
	get_tree().change_scene(target_level_path)
	animatedSprite.play("Check")


