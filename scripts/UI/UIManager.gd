extends CanvasLayer

func _ready():
	GameManager.gained_coin.connect(update_coin_display)

func update_coin_display():
	$CoinDisplay.text = str(GameManager.coins)
