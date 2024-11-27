extends CharacterBody2D

const speed = 150
var dir: Vector2

var is_enemy_chase: bool

var player: CharacterBody2D

func _ready():
	is_enemy_chase = true
	
func _process(delta) -> void:
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


func _on_area_2d_body_entered(body):
	if body is Player: # Si le joueur => entre en contacte avec l'ennemie
		body.die() # Appel de la fonction "die" => "player.gd"
