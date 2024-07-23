extends Node

signal add_point(int)

var coins 

var score = 0

var player : Player

func gain_coins(coins_gained):
	coins += coins_gained
	emit_signal("gained_coins", coins_gained)

