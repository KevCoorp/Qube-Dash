extends Node

signal gained_coins()

var coins : int

var player : Player

func gain_coins(coins_gained:int):
	coins += coins_gained
	emit_signal("gained_coins")
	print(coins)
