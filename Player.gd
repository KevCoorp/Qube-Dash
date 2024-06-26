extends KinematicBody2D
class_name Player

export(int) var JUMP_FORCE = -140 # Force du saut
export(int) var JUMP_RELEASE_FORCE = -70 
export(int) var MAX_SPEED = 50 # Vitesse max
export(int) var ACCELERATION = 10 # Accélératiojn
export(int) var FRICTION = 10 # Friction
export(int) var GRAVITY = 4  # Gravité
export(int) var ADDITIONAL_FALL_GRAVITY = 4 # Gravité additionnel 

# Variable
var is_dying = false
var velocity = Vector2.ZERO
var coins = 0
var buffered_jump = false

onready var jumpBufferTimer: = $JumpBufferTimer

# Mouvement du joueur

func _physics_process(delta):
	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input.x == 0:
		apply_friction()
	else: 
		apply_acceleration(input.x)
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up") or buffered_jump:
			velocity.y = JUMP_FORCE
			buffered_jump = false
		else:
			if Input.is_action_just_released("ui_up") and velocity.y < JUMP_RELEASE_FORCE:
				velocity.y = JUMP_RELEASE_FORCE
				
			if Input.is_action_just_pressed("ui_up"):
				buffered_jump = true 
				jumpBufferTimer.start()
		
			if velocity.y > 0:
				velocity.y += ADDITIONAL_FALL_GRAVITY
				
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.2)
				
	# DEBUG
	if Input.is_action_pressed("debug"):
		get_tree().change_scene("res://Level/Level2.tscn") 
		get_tree().change_scene("res://Level/Level3.tscn")
	
	


# Fonctions

func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://Level/Level1.tscn")

# Gravité 
func apply_gravity():
		velocity.y += GRAVITY
		velocity.y = min(velocity.y, 300)
	
# Friction
func apply_friction():
	velocity.x = move_toward(velocity.x, 0, FRICTION)

# Accélération
func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, MAX_SPEED * amount, ACCELERATION)
	
	
func _on_JumpBufferTimer_timeout():
	buffered_jump = false
	
	
func _add_coin():
	coins += 1
