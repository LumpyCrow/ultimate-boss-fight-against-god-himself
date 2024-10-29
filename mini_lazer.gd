extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	position -= transform.y * SPEED * delta

	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()
