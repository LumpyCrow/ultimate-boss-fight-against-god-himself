extends CharacterBody2D


@onready var player = get_parent().get_node("player")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	position += transform.x * SPEED * delta
	look_at(player.position)
	move_and_slide()
