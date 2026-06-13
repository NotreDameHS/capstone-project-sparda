extends Area2D

var speed := 300.0
@export var contact_damage := 10.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	pass
	

func _on_body_entered(body: Node2D) -> void:
	print("Hello")
	if body.has_method("take_damage"):
		body.take_damage(contact_damage)
