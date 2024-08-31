extends Node2D

var bg = Color8(0, 142, 255) 

func _ready():
	RenderingServer.set_default_clear_color(bg)

