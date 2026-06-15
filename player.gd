class_name Player extends CharacterBody2D
var health := 100.0
var default_speed = 100.0
var current_speed = 100.0
var sprint_speed = 400.0
@onready var health_bar := $Health/ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.max_value = GameManager.max_health
	set_health(GameManager.max_health)


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
		
func take_damage(amount: float) -> void:
	health -= amount
	set_health(health)
	print("Vergil took damage!")
	
	if health <= 0:
		die()
		
func die() -> void:
	print("You have died....")
	queue_free()

func apply_health_upgrade():
	health_bar.max_value = GameManager.max_health
	set_health(GameManager.max_health)
		
		
