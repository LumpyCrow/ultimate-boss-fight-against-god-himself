extends CharacterBody2D


const SPEED = 50.0
var player = null
var player_chase = false

func _physics_process(delta: float) -> void:
	if player_chase:
		velocity += (player.position - position)/SPEED

	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		player_chase = true
