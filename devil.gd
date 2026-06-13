class_name Devil extends Area2D

@export var health := 100.0
@export var speed := 100.0
@export var damage_reduction := 1.00
@export var attack_damage := 10.0
@onready var hp_bar := $Health/ProgressBar
@export var attack_cooldown := 1.0


var target_player: CharacterBody2D = null
var attack_time := 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp_bar.max_value = health
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
	if attack_time > 0:
		attack_time -= delta
	
	if target_player != null:
		var distance := global_position.distance_to(target_player.global_position)
		
		
		if distance > 15.0:
			var direction: Vector2 = global_position.direction_to(target_player.global_position)
			global_position += direction * speed * delta
		else:
			if attack_time <= 0:
				attack()
				
func attack() -> void:
	if target_player.has_method("take_damage"):
		target_player.take_damage(attack_damage)
		attack_time = attack_cooldown
	
		


func set_health(new_health: float) -> void:
	health = new_health
	hp_bar.value = health
	


	
func _on_area_entered(area: Area2D) -> void:
	if area.owner is Player:
		print("Hello")
		target_player = area.owner
