extends Node2D

const PlayerScene = preload("res://Player.tscn")

var bg = Color("#3363CD")

func _ready():
	VisualServer.set_default_clear_color(bg)
	

