class_name Rocket extends Area2D
@export var damage := 20.0
@export var travel_distance := 600.0
@export var speed := 300.0
var _distance_traveled := 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * speed * delta
	_distance_traveled += speed * delta
	if _distance_traveled > travel_distance:
		_explode()
		
func _explode() -> void:
	queue_free()
	
