extends CharacterBody2D

var explosion = load("res://explosion.tscn")
@onready var player2 = get_parent().get_node("player")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var healthkit = load("res://healthkit.tscn")
var healthkitchance = 1


func _physics_process(delta: float) -> void:
	position += transform.x * SPEED * delta
	$pathfinder.look_at(player2.position)
	if $pathfinder.rotation > 0:
		rotation = rotation + 0.02
	if $pathfinder.rotation < 0:
		rotation = rotation - 0.02
		
	if healthkitchance < 6:
		healthkitchance = healthkitchance + 1
	if healthkitchance >= 6:
		healthkitchance = 1
		
	print(healthkitchance)
	if not $Alarm.is_playing():
		$Alarm.play()
	move_and_slide()


func _on_timer_timeout() -> void:
	if healthkitchance == 5:
			var new_healthkit = healthkit.instantiate()
			add_sibling(new_healthkit)
			new_healthkit.position.y = position.y
			new_healthkit.position.x = position.x
	
	var new_explosion = explosion.instantiate()
	add_sibling(new_explosion)
	new_explosion.position.y = position.y
	new_explosion.position.x = position.x
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var new_explosion = explosion.instantiate()
		add_sibling(new_explosion)
		new_explosion.position.y = position.y
		new_explosion.position.x = position.x
		queue_free()
		
	if body.is_in_group("cannonball"):
		if healthkitchance == 5:
			var new_healthkit = healthkit.instantiate()
			add_sibling(new_healthkit)
			new_healthkit.position.y = position.y
			new_healthkit.position.x = position.x
		
		var new_explosion = explosion.instantiate()
		add_sibling(new_explosion)
		new_explosion.position.y = position.y
		new_explosion.position.x = position.x
		queue_free()
