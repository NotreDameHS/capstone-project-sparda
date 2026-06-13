extends Button
var cost = 100
var money = 0
var health = 100
var max_health = 100


func _on_buy_button_pressed():
	if money >= cost:
		money -= cost
		apply_hp()
		
func apply_hp():
	if health >= 0 and health < 100:
		health = max_health
	elif health == 100:
		print("You are already max hp")
	pass 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
