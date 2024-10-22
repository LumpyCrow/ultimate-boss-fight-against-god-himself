extends CharacterBody2D

var LittleLazer = load("res://mini_lazer.tscn")

const SPEED = 20.0
const SPEED2 = 100
var player = null
var player_chase = 0
var minilazerready = true

func _physics_process(delta: float) -> void:
	print(player_chase)
	$lazergunPivot.rotation = $lazergunPivot.rotation + 0.05
	
	if player_chase == 1:
		velocity += (player.position - position)/SPEED
	if player_chase == 2:
		position += (player.position - position)/40
		if minilazerready == true:
			var new_LittleLazer = LittleLazer.instantiate()
			add_sibling(new_LittleLazer)
			new_LittleLazer.position.y = $lazergunPivot/Minilazer.global_position.y
			new_LittleLazer.position.x = $lazergunPivot/Minilazer.global_position.x
			new_LittleLazer.rotation = $lazergunPivot.rotation
			new_LittleLazer.velocity.y = -100
			minilazerready = false
			
			var new_LittleLazer2 = LittleLazer.instantiate()
			add_sibling(new_LittleLazer2)
			new_LittleLazer2.position.y = $lazergunPivot/Minilazer2.global_position.y
			new_LittleLazer2.position.x = $lazergunPivot/Minilazer2.global_position.x
			new_LittleLazer2.rotation = $lazergunPivot.rotation + 45
			new_LittleLazer2.velocity.y = -100
			minilazerready = false
			
			var new_LittleLazer3 = LittleLazer.instantiate()
			add_sibling(new_LittleLazer3)
			new_LittleLazer3.position.y = $lazergunPivot/Minilazer3.global_position.y
			new_LittleLazer3.position.x = $lazergunPivot/Minilazer3.global_position.x
			new_LittleLazer3.rotation = $lazergunPivot.rotation + 90
			new_LittleLazer3.velocity.y = -100
			minilazerready = false
			
			var new_LittleLazer4 = LittleLazer.instantiate()
			add_sibling(new_LittleLazer4)
			new_LittleLazer4.position.y = $lazergunPivot/Minilazer4.global_position.y
			new_LittleLazer4.position.x = $lazergunPivot/Minilazer4.global_position.x
			new_LittleLazer4.rotation = $lazergunPivot.rotation + 135
			new_LittleLazer4.velocity.y = -100
			minilazerready = false
			
			var new_LittleLazer5 = LittleLazer.instantiate()
			add_sibling(new_LittleLazer5)
			new_LittleLazer5.position.y = $lazergunPivot/Minilazer5.global_position.y
			new_LittleLazer5.position.x = $lazergunPivot/Minilazer5.global_position.x
			new_LittleLazer5.rotation = $lazergunPivot.rotation + 180
			new_LittleLazer5.velocity.y = -100
			minilazerready = false
			
			var new_LittleLazer6 = LittleLazer.instantiate()
			add_sibling(new_LittleLazer6)
			new_LittleLazer6.position.y = $lazergunPivot/Minilazer6.global_position.y
			new_LittleLazer6.position.x = $lazergunPivot/Minilazer6.global_position.x
			new_LittleLazer6.rotation = $lazergunPivot.rotation + 225
			new_LittleLazer6.velocity.y = -100
			minilazerready = false
			
			var new_LittleLazer7 = LittleLazer.instantiate()
			add_sibling(new_LittleLazer7)
			new_LittleLazer7.position.y = $lazergunPivot/Minilazer7.global_position.y
			new_LittleLazer7.position.x = $lazergunPivot/Minilazer7.global_position.x
			new_LittleLazer7.rotation = $lazergunPivot.rotation + 270
			new_LittleLazer7.velocity.y = -100
			minilazerready = false
			
			var new_LittleLazer8 = LittleLazer.instantiate()
			add_sibling(new_LittleLazer8)
			new_LittleLazer8.position.y = $lazergunPivot/Minilazer8.global_position.y
			new_LittleLazer8.position.x = $lazergunPivot/Minilazer8.global_position.x
			new_LittleLazer8.rotation = $lazergunPivot.rotation + 315
			new_LittleLazer8.velocity.y = -100
			minilazerready = false
			

	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		player_chase = 1
		$Timers/Followtimer.start()
		$detection_area.queue_free()
		
func _on_followtimer_timeout() -> void:
	player_chase = 2

func _on_minilazer_cooldown_timeout() -> void:
	minilazerready = true
