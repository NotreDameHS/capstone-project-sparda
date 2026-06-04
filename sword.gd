extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if Input.is_action_just_pressed("swing_sword"):
		$AnimatedSprite2D.play("attack")
