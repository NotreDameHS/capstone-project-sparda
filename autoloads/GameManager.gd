extends Node

signal money_changed(new_amount)
var money = 0
# Called when the node enters the scene tree for the first time.
func add_money(amount) -> void:
	money = money + amount
	money_changed.emit(money)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
