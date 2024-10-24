extends CharacterBody2D


@onready var player = get_parent().get_node("player")
const SPEED = 400.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	position += transform.x * SPEED * delta
	$pathfinder.look_at(player.position)
	if $pathfinder.rotation > 0:
		rotation = rotation + 0.04
	if $pathfinder.rotation < 0:
		rotation = rotation - 0.04
	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()
