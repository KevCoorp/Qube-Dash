extends Area2D

onready var animatedSprite = $AnimatedSprite

var time_in_seconds = 1

export (String, FILE, "*.tscn") var target_level_path = ""

func _on_NextLevel_body_entered(body):
	if not body is Player: return
	if target_level_path.empty(): return
	animatedSprite.play("Check")
	yield(get_tree().create_timer(time_in_seconds), "timeout")
	get_tree().change_scene(target_level_path)





	



