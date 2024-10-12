extends CharacterBody2D

const speed = 45
var dir: Vector2

var is_enemy_chase: bool

var player: CharacterBody2D

func _ready():
	is_enemy_chase = true
	
func _process(delta):
	move(delta)
	
func move(delta):
	if is_enemy_chase:
		player = Global.playerBody
		velocity = position.direction_to(player.position) * speed 
		dir.x = abs(velocity.x) / velocity.x
	if !is_enemy_chase:
		velocity += dir * speed * delta
	move_and_slide()

func _on_timer_timeout():
	$Timer.wait_time = choose([0.5, 0.8])
	if !is_enemy_chase:
		dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
		
func handle_animation():
	var animated_sprite = $AnimatedSprite2D
	animated_sprite.play("floating")
	if dir.x == -1:
		animated_sprite.flip_h = true
	elif dir.x == 1:
		animated_sprite.flip_v = false	
	
func choose(array):
	array.shuffle()
	return array.front()
