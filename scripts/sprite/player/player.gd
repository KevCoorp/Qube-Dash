extends CharacterBody2D
class_name Player 

# Constantes
const SPEED = 150.0 # Vitesse
const JUMP_VELOCITY = -355 # Velocité du saut

# Export des variables
@onready var audio = $Jump
@onready var anim = $AnimatedSprite2D
@onready var player_sprite = $PlayerSprite

# Variable
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") 

func _ready():
	anim.hide() # Cacher l'animation ("die")
	player_sprite.show() # Afficher le joueur
	Global.playerBody = self

# Fonction liée au déplacement/méchanique
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		audio.play()

	# Déplacement du joueur 
	var direction = Input.get_axis("left","right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func die():
	player_sprite.hide() # Cacher le sprite
	anim.show() # Afficher l'animation
	$AnimatedSprite2D.play("die") # Jouer l'animation
	await $AnimatedSprite2D.animation_finished # Attendre que l'animation sois finit
	get_tree().reload_current_scene() # Recommencer la scène
	
	

