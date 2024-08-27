extends Node2D

@onready var sc1 = $SC1
@onready var sc2 = $SC2
@onready var sc3 = $SC3
@onready var sc4 = $SC4

func _ready():
	pass

# Scene switcher 

func _physics_process(delta):
	if Input.is_action_just_pressed("skip"):
		sc1.hide()
		sc2.show()
		
	
		
	
