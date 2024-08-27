extends Node2D

@onready var sc1 = $SC1
@onready var sc2 = $SC2
@onready var sc3 = $SC3
@onready var sc4 = $SC4

var current_scene = 1

func _ready():
	# Initial state: Show only sc1
	sc1.show()
	sc2.hide()
	sc3.hide()
	sc4.hide()

func _physics_process(delta):
	if Input.is_action_just_pressed("skip"):
		update_scene()

func update_scene():
	# Hide all scenes initially
	sc1.hide()
	sc2.hide()
	sc3.hide()
	sc4.hide()

	# Determine which scene to show based on current_scene
	match current_scene:
		1:
			sc1.show()
		2:
			sc2.show()
		3:
			sc3.show()
		4:
			sc4.show()
		5:
			get_tree().change_scene_to_file("res://scene/game/tutorial/tutorial.tscn")

	# Cycle to the next scene
	current_scene += 1
	if current_scene > 5:
		current_scene = 1
