extends Node2D

@export var weak_devil_scene: PackedScene
@export var regular_devil_scene: PackedScene
@export var strong_devil_scene: PackedScene

@onready var spawn_timer: Timer = $SpawnTimer
@onready var wave_timer: Timer = $WaveTimer

var wave_number = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpawnTimer.start()
	$WaveTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_spawn_timer_timeout() -> void:
	var new_mob
	
	if wave_number == 1:
		new_mob = weak_devil_scene.instantiate()
	elif wave_number == 2:
		new_mob = regular_devil_scene.instantiate()
	else:
		new_mob = strong_devil_scene.instantiate()
	
	add_child(new_mob)
	new_mob.global_position.x = randf_range(150, 1000)
	new_mob.global_position.y = randf_range(200, 550)
	
func spawn_mob() -> void:
	var mob_to_spawn: PackedScene
	


func _on_wave_timer_timeout() -> void:
	wave_number = wave_number + 1
	if wave_number == 4:
		$WaveTimer.stop()
