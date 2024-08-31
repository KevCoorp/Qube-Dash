extends CharacterBody2D
class_name Player 

const SPEED = 150.0
const JUMP_VELOCITY = -355

@onready var audio = $Jump
@onready var anim = $AnimatedSprite2D
@onready var player_sprite = $PlayerSprite

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	anim.hide()
	player_sprite.show()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		audio.play()

	var direction = Input.get_axis("left","right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func die():
	player_sprite.hide()
	anim.show()
	anim.play("die")

