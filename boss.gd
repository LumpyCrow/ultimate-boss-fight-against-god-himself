extends CharacterBody2D

var LittleLazer = load("res://mini_lazer.tscn")
var BigLazer = load("res://giant_laser.tscn")
var missle = load("res://follower.tscn")
@onready var player2 = get_parent().get_node("player")

const SPEED = 40.0
const SPEED2 = 100
var player = null
var player_chase = 0

var minilazerready = true
var giantLaserReady = false
var missleready = true

func _physics_process(delta: float) -> void:
	print(player_chase)
	$lazergunPivot.rotation = $lazergunPivot.rotation + 0.05
	$biglazerpivot.rotation = $biglazerpivot.rotation - 0.02
	$Bossbody.rotation = velocity.x *0.0005
	
	$arms/topleftarm/HandPivot.look_at(player2.position)
	$arms/toprightarm/Handpivot.look_at(player2.position)
	$arms/bottomleftarm/Handpivot.look_at(player2.position)
	$arms/bottomrightarm/HandPivot.look_at(player2.position)
	
	if player_chase == 1:
		velocity += (player.position - position)/SPEED
	if player_chase == 2:
		position += (player.position - position)/40
		if not $rapidfire.is_playing():
			$rapidfire.play()
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
	
	if player_chase == 3:
		velocity += (player.position - position)/SPEED
		
	if player_chase == 4:
		velocity.y = 0
		velocity.x = 0
		if giantLaserReady == true:
			$bassdrop.play()
			
			var new_BigLazer = BigLazer.instantiate()
			$biglazerpivot.add_child(new_BigLazer)
			new_BigLazer.position.y = $biglazerpivot/Launcher.position.y
			new_BigLazer.position.x = $biglazerpivot/Launcher.position.x
			giantLaserReady = false
			
			var new_BigLazer2 = BigLazer.instantiate()
			$biglazerpivot.add_child(new_BigLazer2)
			new_BigLazer2.position.y = $biglazerpivot/Launcher2.position.y
			new_BigLazer2.position.x = $biglazerpivot/Launcher2.position.x
			new_BigLazer2.rotation = 1.5708
			giantLaserReady = false
			
			var new_BigLazer3 = BigLazer.instantiate()
			$biglazerpivot.add_child(new_BigLazer3)
			new_BigLazer3.position.y = $biglazerpivot/Launcher3.position.y
			new_BigLazer3.position.x = $biglazerpivot/Launcher3.position.x
			new_BigLazer3.rotation = 3.14159
			
			giantLaserReady = false
			
			var new_BigLazer4 = BigLazer.instantiate()
			$biglazerpivot.add_child(new_BigLazer4)
			new_BigLazer4.position.y = $biglazerpivot/Launcher4.position.y
			new_BigLazer4.position.x = $biglazerpivot/Launcher4.position.x
			new_BigLazer4.rotation = 4.71239
			
			giantLaserReady = false
			
	if player_chase == 5:
		velocity += (player.position - position)/SPEED
	
	if player_chase >= 6:
		position += (player.position - position)/40
		if missleready == true:
			print("missle created!")
			var new_missle = missle.instantiate()
			add_sibling(new_missle)
			new_missle.position.y = $biglazerpivot/Launcher.global_position.y
			new_missle.position.x = $biglazerpivot/Launcher.global_position.x
			missleready = false
			
			var new_missle2 = missle.instantiate()
			add_sibling(new_missle2)
			new_missle2.position.y = $biglazerpivot/Launcher2.global_position.y
			new_missle2.position.x = $biglazerpivot/Launcher2.global_position.x
			new_missle2.rotation = $lazergunPivot.rotation + 90
			missleready = false
			
			var new_missle3 = missle.instantiate()
			add_sibling(new_missle3)
			new_missle3.position.y = $biglazerpivot/Launcher3.global_position.y
			new_missle3.position.x = $biglazerpivot/Launcher3.global_position.x
			new_missle3.rotation = $lazergunPivot.rotation + 180
			missleready = false
			
			var new_missle4 = missle.instantiate()
			add_sibling(new_missle4)
			new_missle4.position.y = $biglazerpivot/Launcher4.global_position.y
			new_missle4.position.x = $biglazerpivot/Launcher4.global_position.x
			new_missle4.rotation = $lazergunPivot.rotation + 270
			missleready = false
		
	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		player_chase = 1
		$Timers/Followtimer.start()
		$detection_area.queue_free()
		
func _on_followtimer_timeout() -> void:
	player_chase = player_chase + 1
	if player_chase == 3:
		$warmup.play()

func _on_minilazer_cooldown_timeout() -> void:
	minilazerready = true

func _on_warmup_finished() -> void:
	giantLaserReady = true
	
func _on_missle_cooldown_timeout() -> void:
	missleready = true
