extends PathFollow2D
var speed := 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if get_child_count() > 0:
		var boss = get_child_count(0)
		progress += speed * delta
	else:
		queue_free()
		
