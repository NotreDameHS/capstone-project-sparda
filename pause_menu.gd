extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	GameManager.stats_changed.connect(update_shop_labels)
	update_shop_labels()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func update_shop_labels():
	$CenterContainer/VBoxContainer/HealthButton.text = "+20 Max HP (Cost: " + str(GameManager.health_upgrade_cost) + ")"
	$CenterContainer/VBoxContainer/DamageButton.text = "+10 Damage (Cost: " + str(GameManager.damage_upgrade_cost) + ")"
		
func pause_game():
	show()
	get_tree().paused = true
	
func _on_resume_button_pressed():
	hide()
	get_tree().paused = false
	


func _on_button_pressed() -> void:
	pause_game()


func _on_health_button_pressed() -> void:
	GameManager.buy_health_upgrade()
	



func _on_damage_button_pressed() -> void:
	GameManager.buy_damage_upgrade()
