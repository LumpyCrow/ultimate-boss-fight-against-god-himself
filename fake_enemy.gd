extends CharacterBody2D

var explosion = load("res://explosion.tscn")
const SPEED = 100


func _physics_process(delta: float) -> void:
	position += transform.x * SPEED * delta
	rotation = rotation + 0.03

	move_and_slide()
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("cannonball"):
		var new_explosion = explosion.instantiate()
		add_sibling(new_explosion)
		new_explosion.position.y = position.y
		new_explosion.position.x = position.x
		queue_free()
