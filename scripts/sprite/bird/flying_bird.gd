extends CharacterBody2D

const SPEED = 30 # Vitesse 

@onready var ray_left = $RayLeft
@onready var ray_right = $RayRight

var direction = 1 

# Méthode de déplacement "basique"
func _process(delta):
	if not ray_right.is_colliding():
		direction = -1
	if not ray_left.is_colliding():
		direction = 1
	
	position.x += direction * SPEED * delta
