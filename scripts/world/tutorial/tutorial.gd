extends Node2D

# Variable
var bg = Color8(0, 125, 255) # Couleur du background

func _ready():
	RenderingServer.set_default_clear_color(bg) # Appliquer la couleur du background
	
