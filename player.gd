extends Sprite2D

var default_speed = 100.0
var current_speed = 100.0
var sprint_speed = 200.0
var velocity = Vector2(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Vector2(0, 0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	if direction.length() > 1.0:
		direction = direction.normalized()
	
	velocity = direction * current_speed
	position += velocity * delta
	
	if Input.is_action_pressed("sprint"):
		current_speed = sprint_speed
	else:
		current_speed = default_speed
		
	
	if direction.x < 0:
		flip_h = true
	elif direction.x > 0:
		flip_h = false
		
		
		
