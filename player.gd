extends CharacterBody2D

var default_speed = 100.0
var current_speed = 100.0
var sprint_speed = 200.0
var health := 100.0
@onready var health_bar := $Health/ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_health(100)


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
		$AnimatedSprite2D.play("sprinting")
	else:
		current_speed = default_speed
		$AnimatedSprite2D.play("walking")
	
func set_health(new_health: int) -> void:
	health = new_health
	health_bar.value = health
		
		
		
