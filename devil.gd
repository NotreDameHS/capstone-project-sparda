class_name Devil extends Area2D

var health := 100.0
@onready var hp_bar := $Health/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_health(80)

func take_damage(amount) -> void:
	health -= amount
	set_health(health)
	
	if health <= 0:
		die()
		
func die():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_health(new_health: float) -> void:
	health = new_health
	hp_bar.value = health
	
