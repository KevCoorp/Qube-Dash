extends Node2D

const PlayerScene = preload("res://Player.tscn")

var bg = Color("#3363CD")

onready var visibility_notifier := $VisibilityNotifier2D

func _ready() -> void:
	VisualServer.set_default_clear_color(bg)
	visibility_notifier.connect("screen_entered", self, "show")
	visibility_notifier.connect("screen_exited", self, "hide")
	visible = false

