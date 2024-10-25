extends CharacterBody2D

var explosion = load("res://explosion.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	position -= transform.y * SPEED * delta
	
	move_and_slide()


func _on_timer_timeout() -> void:
	var new_explosion = explosion.instantiate()
	add_sibling(new_explosion)
	new_explosion.position.y = position.y
	new_explosion.position.x = position.x
	
	queue_free()
