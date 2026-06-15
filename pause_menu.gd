extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
func pause_game():
	show()
	get_tree().paused = true
	
func _on_resume_button_pressed():
	hide()
	get_tree().paused = false
	


func _on_button_pressed() -> void:
	pause_game()
