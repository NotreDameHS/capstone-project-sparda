extends Area2D

var speed := 300.0


func _process(delta: float) -> void:
	if get_parent() is PathFollow2D:
		if get_parent().progress_ratio >= 1.0:
			queue_free()
