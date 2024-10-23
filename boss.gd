extends CharacterBody2D

var LittleLazer = load("res://mini_lazer.tscn")

const SPEED = 20.0
var player = null
var player_chase = false

func _physics_process(delta: float) -> void:
	$lazergunPivot.rotation = $lazergunPivot.rotation + 0.05
	if player_chase:
		velocity += (player.position - position)/SPEED

	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		player_chase = true
		
func _on_minilazer_cooldown_timeout() -> void:
	pass # Replace with function body.
