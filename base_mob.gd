extends Area2D
@export var health = 100.0
@export var max_health = 100.0
@onready	 var HP = $Control/HP  

func damage(amount: float) -> void:
		health -= amount
		if health <= 0:
			queue_free() 
		HP.value = health

# Called when  the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
