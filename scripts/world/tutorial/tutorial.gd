extends Node2D

@onready var bgm = $AudioStreamPlayer

# Variable
var bg = Color8(0, 142, 255) # Couleur du background

func _ready():
	bgm.play()
	RenderingServer.set_default_clear_color(bg) # Appliquer la couleur du background
	
