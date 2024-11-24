extends CharacterBody2D

const SPEED = 45 # Vitesse

@onready var ray_left = $RayLeft
@onready var ray_right = $RayRight


var direction = 1

# Déplacement de l'ennemie 
func _process(delta):
	if not ray_right.is_colliding():
		direction = -1
	if not ray_left.is_colliding():
		direction = 1
	
	position.x += direction * SPEED * delta

func _on_area_2d_body_entered(body):
	if body is Player: # Si le joueur => entre en contacte avec l'ennemie
		body.die() # Appel de la fonction "die" => "player.gd"
