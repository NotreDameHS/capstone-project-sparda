class_name Devil extends Area2D

@export var health := 100.0
@export var damage_reduction := 1.00
@onready var hp_bar := $Health/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_health(health)

func take_damage(amount) -> void:
	var true_damage = amount/damage_reduction
	health -= true_damage
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
	
