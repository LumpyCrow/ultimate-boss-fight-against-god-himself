extends CharacterBody2D

var explosion = load("res://explosion.tscn")
var bomb = load("res://bomb.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	$Sprite.rotation = $Sprite.rotation + 0.05
	position -= transform.y * SPEED * delta
	move_and_slide()


func _on_timer_timeout() -> void:
	
	var new_explosion = explosion.instantiate()
	add_sibling(new_explosion)
	new_explosion.position.y = position.y
	new_explosion.position.x = position.x
	
	var new_bomb = bomb.instantiate()
	add_sibling(new_bomb)
	new_bomb.position.y = $Spawner1.global_position.y
	new_bomb.position.x = $Spawner1.global_position.x
	new_bomb.rotation = $Spawner1.rotation
	
	var new_bomb2 = bomb.instantiate()
	add_sibling(new_bomb2)
	new_bomb2.position.y = $Spawner2.global_position.y
	new_bomb2.position.x = $Spawner2.global_position.x
	new_bomb2.rotation = $Spawner2.rotation
	
	var new_bomb3 = bomb.instantiate()
	add_sibling(new_bomb3)
	new_bomb3.position.y = $Spawner3.global_position.y
	new_bomb3.position.x = $Spawner3.global_position.x
	new_bomb3.rotation = $Spawner3.rotation
	
	var new_bomb4 = bomb.instantiate()
	add_sibling(new_bomb4)
	new_bomb4.position.y = $Spawner4.global_position.y
	new_bomb4.position.x = $Spawner4.global_position.x
	new_bomb4.rotation = $Spawner4.rotation
	
	var new_bomb5 = bomb.instantiate()
	add_sibling(new_bomb5)
	new_bomb5.position.y = $Spawner5.global_position.y
	new_bomb5.position.x = $Spawner5.global_position.x
	new_bomb5.rotation = $Spawner5.rotation
	
	var new_bomb6 = bomb.instantiate()
	add_sibling(new_bomb6)
	new_bomb6.position.y = $Spawner6.global_position.y
	new_bomb6.position.x = $Spawner6.global_position.x
	new_bomb6.rotation = $Spawner6.rotation
	
	var new_bomb7 = bomb.instantiate()
	add_sibling(new_bomb7)
	new_bomb7.position.y = $Spawner7.global_position.y
	new_bomb7.position.x = $Spawner7.global_position.x
	new_bomb7.rotation = $Spawner7.rotation
	
	var new_bomb8 = bomb.instantiate()
	add_sibling(new_bomb8)
	new_bomb8.position.y = $Spawner8.global_position.y
	new_bomb8.position.x = $Spawner8.global_position.x
	new_bomb8.rotation = $Spawner8.rotation
	
	queue_free()
