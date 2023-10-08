extends KinematicBody2D

var direction = Vector2.RIGHT
var velocity = Vector2.ZERO


# Mouvement
func _physics_process(delta):
	var found_wall = is_on_wall()
	if found_wall:
		direction += -1	
	
	velocity = direction * 25
	move_and_slide(velocity, Vector2.UP)
