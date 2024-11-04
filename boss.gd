extends CharacterBody2D

var LittleLazer = load("res://mini_lazer.tscn")
var BigLazer = load("res://giant_laser.tscn")
var missle = load("res://follower.tscn")
var Clusterbomb = load("res://clusterbomb.tscn")
var explosion = load("res://explosion.tscn")
var death = load("res://bossdying.tscn")
@onready var player2 = get_parent().get_node("player")

var SPEED = 40.0
var SPEED2 = 100
var SPEEDLIMIT = 1000
var player = null
var player_chase = 0

var minilazerready = true
var giantLaserReady = false
var missleready = true
var clusterbombready = true
var armlazerReady = true
var armlauncherReady = true

var health = 10

func _physics_process(delta: float) -> void:
	
	print(player_chase)
	
	if health == 0:
		velocity.y = 0
	
	
	if health < 100:
		
		$Timers/minilazerCooldown.wait_time = 0.05
		$Timers/missleCooldown.wait_time = 0.5
		$Timers/bombCooldown.wait_time = 0.15
	
	if velocity.x > SPEEDLIMIT:
		velocity.x = velocity.x - 200
	if velocity.x < -SPEEDLIMIT:
		velocity.x = velocity.x + 200
		
	if velocity.y > SPEEDLIMIT:
		velocity.y = velocity.y - 200
	if velocity.y < -SPEEDLIMIT:
		velocity.y = velocity.y + 200
		
	
		
	if armlazerReady == true:
		$singleShot.play()
		var new_LittleArmLazer = LittleLazer.instantiate()
		add_sibling(new_LittleArmLazer)
		new_LittleArmLazer.position.y = $arms/toprightarm/Handpivot/Node2D.global_position.y
		new_LittleArmLazer.position.x = $arms/toprightarm/Handpivot/Node2D.global_position.x
		new_LittleArmLazer.rotation = $arms/toprightarm/Handpivot.rotation + 1.5708
		armlazerReady = false
		
		var new_LittleArmLazer2 = LittleLazer.instantiate()
		add_sibling(new_LittleArmLazer2)
		new_LittleArmLazer2.position.y = $arms/bottomleftarm/Handpivot/Node2D.global_position.y
		new_LittleArmLazer2.position.x = $arms/bottomleftarm/Handpivot/Node2D.global_position.x
		new_LittleArmLazer2.rotation = $arms/bottomleftarm/Handpivot.rotation + 1.5708
		armlazerReady = false
	
	if armlauncherReady == true:
		$bassdrop.play()
		var new_arm_missle = missle.instantiate()
		add_sibling(new_arm_missle)
		new_arm_missle.position.y = $arms/topleftarm/HandPivot/Node2D.global_position.y
		new_arm_missle.position.x = $arms/topleftarm/HandPivot/Node2D.global_position.x
		new_arm_missle.rotation = $arms/topleftarm/HandPivot.rotation
		armlauncherReady = false
		
	if health >= 20:
		$lazergunPivot.rotation = $lazergunPivot.rotation + 0.05
		$biglazerpivot.rotation = $biglazerpivot.rotation - 0.02
	if health < 20:
		$lazergunPivot.rotation = $lazergunPivot.rotation + 0.1
		$biglazerpivot.rotation = $biglazerpivot.rotation - 0.035
	
	
	$Bossbody.rotation = velocity.x *0.0009
	
	$MinigunBase/MinigunPivot.look_at(player2.position)
	$arms/topleftarm/HandPivot.look_at(player2.position)
	$arms/toprightarm/Handpivot.look_at(player2.position)
	$arms/bottomleftarm/Handpivot.look_at(player2.position)
	$arms/bottomrightarm/HandPivot.look_at(player2.position)
	
	if player_chase == 1:
		velocity += (player.position - position)/SPEED
		player2.camerashaking = false
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
		player2.camerashaking = true
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
		player2.camerashaking = false
		velocity += (player.position - position)/SPEED
	
	if player_chase == 6:
		position += (player.position - position)/40
		if missleready == true:
			$bassdrop.play()
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
	
	if player_chase == 7:
		velocity += (player.position - position)/SPEED
		
	if player_chase == 8:
		velocity += (player.position - position)/SPEED
		player2.camerashaking = true
		if clusterbombready == true:
			$bassdrop.play()
			var new_Clusterbomb =  Clusterbomb.instantiate()
			add_sibling(new_Clusterbomb)
			new_Clusterbomb.position.y = $biglazerpivot/Launcher.global_position.y
			new_Clusterbomb.position.x = $biglazerpivot/Launcher.global_position.x
			
			var new_Clusterbomb2 = Clusterbomb.instantiate()
			add_sibling(new_Clusterbomb2)
			new_Clusterbomb2.position.y = $biglazerpivot/Launcher2.global_position.y
			new_Clusterbomb2.position.x = $biglazerpivot/Launcher2.global_position.x
			new_Clusterbomb2.rotation = $lazergunPivot.rotation + 90
			
			var new_Clusterbomb3 = Clusterbomb.instantiate()
			add_sibling(new_Clusterbomb3)
			new_Clusterbomb3.position.y = $biglazerpivot/Launcher3.global_position.y
			new_Clusterbomb3.position.x = $biglazerpivot/Launcher3.global_position.x
			new_Clusterbomb3.rotation = $lazergunPivot.rotation + 180
			
			var new_Clusterbomb4 =  Clusterbomb.instantiate()
			add_sibling(new_Clusterbomb4)
			new_Clusterbomb4.position.y = $biglazerpivot/Launcher4.global_position.y
			new_Clusterbomb4.position.x = $biglazerpivot/Launcher4.global_position.x
			new_Clusterbomb4.rotation = $lazergunPivot.rotation + 270
			
			clusterbombready = false
			
	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		player_chase = 1
		$Timers/Followtimer.start()
		$detection_area.queue_free()
		
func _on_followtimer_timeout() -> void:
	if player_chase < 9:
		player_chase = player_chase + 1
	if player_chase == 9:
		player_chase = 1
	if player_chase == 3:
		$warmup.play()

func _on_minilazer_cooldown_timeout() -> void:
	minilazerready = true

func _on_warmup_finished() -> void:
	giantLaserReady = true
	
func _on_missle_cooldown_timeout() -> void:
	missleready = true

func _on_bomb_cooldown_timeout() -> void:
	clusterbombready = true

func _on_damagezone_body_entered(body: Node2D) -> void:
	if body.is_in_group("cannonball"):
		health = health - 1
		$damage.play()
		if health == 1:
			player_chase = -10000
			health = health - 1
			$damage.play()
			player2.MAXSPEED = 300
			
			var new_death = death.instantiate()
			add_sibling(new_death)
			new_death.position.y = $Bossbody.global_position.y
			new_death.position.x = $Bossbody.global_position.x
			position.y = 10000000000000
		
			
		if health == 326:
			$AnimationPlayer.play("topRightArmFallOff")
			$RodGearDown.play()
			
		if health == 251:
			$AnimationPlayer2.play("topLeftArmFallOff")
			$RodGearDown.play()
			
		if health == 176:
			$AnimationPlayer3.play("bottomRightArmFallOff")
			$RodGearDown.play()
		
		if health == 101:
			$AnimationPlayer4.play("bottomLeftArmFallOff")
			$RodGearDown.play()
			$deathroar.play()
			$Bossbody.texture = load("res://textures/angrybossbody.png")
		
func _on_armlazer_cooldown_timeout() -> void:
	armlazerReady = true

func _on_armlauncher_cooldown_timeout() -> void:
	armlauncherReady = true

	
