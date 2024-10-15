extends CharacterBody2D


var speed = 750
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	position -= transform.y * speed * delta

	move_and_slide()


func _on_killzone_body_entered(body: Node2D) -> void:
	if body.is_in_group("danger") or body.is_in_group("world"):
		$Timer.start()


func _on_timer_timeout() -> void:
	queue_free()
