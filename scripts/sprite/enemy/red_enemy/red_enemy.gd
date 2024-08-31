extends CharacterBody2D

const SPEED = 60

@onready var ray_left = $RayLeft
@onready var ray_right = $RayRight

var direction = 1

func _process(delta):
	if not ray_right.is_colliding():
		direction = -1
	if not ray_left.is_colliding():
		direction = 1
	
	position.x += direction * SPEED * delta

func _on_area_2d_body_entered(body):
	if body is Player:
		body.die()
