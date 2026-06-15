extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.money_changed.connect(_on_money_changed)
	text = "Money: " + str(GameManager.money)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_money_changed(new_amount):
	text = "Money: " + str(new_amount)
