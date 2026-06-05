extends Area2D
@export var health = 100.0
@export var max_health = 100.0
@onready	 var HP = $Control/HP  

func damage(amount: float) -> void:
		health -= amount
		if health <= 0:
			queue_free() 
		HP.value = health

func set_health(new_health: int) -> void:
	health = new_health
	HP.value = health


func take_damage(amount) -> void:
	health -= amount
	set_health(health)
	
	if health <= 0:
		die()
		
func die():
	queue_free()

# Called when  the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
