extends CharacterBody2D
class_name Player 

const SPEED = 150.0
const JUMP_VELOCITY = -355

@onready var audio = $Jump
@onready var anim = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	anim.hide()

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
	await get_tree().create_timer(5).timeout
	anim.show("die")
	anim.play("die")
	print("2")
	queue_free()

	
