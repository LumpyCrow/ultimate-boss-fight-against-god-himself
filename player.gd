extends CharacterBody2D

#touchscreen variables
var touchscreenleft = false
var touchscreenfly = false
var touchscreenright = false

var touchscreenrotateleft = false
var touchscreenshoot = false
var touchscreenrotateright = false

var SPEED = 30
var MAXSPEED = 300
const JUMP_VELOCITY = -30.0
var facingright = true
var camerashaking = false

var invincible = false
var health = 100
var death = preload("res://death.tscn")

var cannonball = preload("res://cannonball.tscn")
var fireable = true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
	if camerashaking == true:
		$Camerashaker.play("cameraShake")
	else:
		$Camerashaker.stop()

	if not is_on_floor() and velocity.y < 150:
		velocity += get_gravity() * delta
	else:
		if Input.is_action_pressed("Down"):
			if not is_on_floor() and velocity.y < MAXSPEED:
				velocity += get_gravity() * delta
		if not Input.is_action_pressed("Down"):
			if not is_on_floor() and velocity.y > 150:
				velocity -= get_gravity() * delta
	
		
		
	# Handle jump. (+animation)
	if Input.is_action_pressed("ui_accept") or touchscreenfly == true:
		if velocity.y > -MAXSPEED:
			velocity.y = velocity.y + JUMP_VELOCITY
		if invincible == false:
			$animator.visible = true
			$sprite.visible = false
		
	# smooth rotation of the cannon
	if Input.is_action_pressed("Rotateleft") or touchscreenrotateleft == true:
		$pivot.rotation = $pivot.rotation -0.05
	if Input.is_action_pressed("Rotateright") or touchscreenrotateright == true:
		$pivot.rotation = $pivot.rotation +0.05
	
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#var direction := Input.get_axis("Left", "Right")
	#if direction:
	#	if velocity.x < 300 and velocity.x > -300:
		#	velocity.x = velocity.x + direction * SPEED
	#else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_pressed("Left") and velocity.x > -MAXSPEED or touchscreenleft == true and velocity.x > -MAXSPEED:
		velocity.x = velocity.x - SPEED
	else:
		if velocity.x < 0:
			velocity.x = velocity.x + SPEED
	if Input.is_action_pressed("Right") and velocity.x < MAXSPEED or touchscreenright == true and velocity.x < MAXSPEED:
		velocity.x = velocity.x + SPEED
	else:
		if velocity.x > 0:
			velocity.x = velocity.x - SPEED
	
	
	#purely for controlling when each animation plays
	if Input.is_action_pressed("Left") and invincible == false or touchscreenleft == true and invincible == false:
		facingright = false
		$animator.visible = true
		$sprite.visible = false
		$sprite.texture = load("res://textures/duck/left.png")
		if is_on_floor() == false:
			$animator.play("Flyingleft")
		if is_on_floor() == true:
			$animator.play("Walkingleft")
			if not $walkingsound.is_playing():
				$walkingsound.play()
				
	#also purely for controlling when each animation plays
	if Input.is_action_pressed("Right") and invincible == false or touchscreenright == true and invincible == false:
		facingright = true
		$animator.visible = true
		$sprite.visible = false
		$sprite.texture = load("res://textures/duck/right.png")
		if is_on_floor() == false:
			$animator.play("Flyingright")
		if is_on_floor() == true:
			$animator.play("Walkingright")
			if not $walkingsound.is_playing():
				$walkingsound.play()
				
		#this is for animations for if the play isn't touching any of the controls (i think. i kinda forgot what this does)
	elif not Input.is_action_pressed("Left") or Input.is_action_pressed("Right") and invincible == false:
		if is_on_floor():
			$animator.visible = false
			$sprite.visible = true
			
	#more animation?!? skibidi toilet
	if facingright == false and is_on_floor() == false:
		$animator.play("Flyingleft")
	if facingright == true and is_on_floor() == false:
		$animator.play("Flyingright")
	if facingright == false and is_on_floor() == true:
		$animator.play("Walkingleft")
	if facingright == true and is_on_floor() == true:
		$animator.play("Walkingright")
		
	move_and_slide()
	
	#for the hud. it's self explanitory
	if health > 10:
		$HUD/Health.texture = load("res://textures/health/healthmore.png")
	if health == 10:
		$HUD/Health.texture = load("res://textures/health/health10.png")
	if health == 9:
		$HUD/Health.texture = load("res://textures/health/health9.png")
	if health == 8:
		$HUD/Health.texture = load("res://textures/health/health8.png")
	if health == 7:
		$HUD/Health.texture = load("res://textures/health/health7.png")
	if health == 6:
		$HUD/Health.texture = load("res://textures/health/health6.png")
	if health == 5:
		$HUD/Health.texture = load("res://textures/health/health5.png")
	if health == 4:
		$HUD/Health.texture = load("res://textures/health/health4.png")
	if health == 3:
		$HUD/Health.texture = load("res://textures/health/health3.png")
	if health == 2:
		$HUD/Health.texture = load("res://textures/health/health2.png")
	if health == 1:
		$HUD/Health.texture = load("res://textures/health/health1.png")
	if health == 0:
		$HUD/Health.texture = load("res://textures/health/health0.png")
	if health <= 0:
		get_tree().change_scene_to_file("res://death.tscn")
	
	
	if Input.is_action_just_pressed("Fire") and fireable == true or touchscreenshoot == true and fireable == true:
		fireable = false
		$cannoncooldown.start()
		$cannonsound.play()
		var new_cannon_ball = cannonball.instantiate()
		add_sibling(new_cannon_ball)
		new_cannon_ball.position.y = $pivot/cannon/firezone.global_position.y
		new_cannon_ball.position.x = $pivot/cannon/firezone.global_position.x
		new_cannon_ball.rotation = $pivot.rotation
		new_cannon_ball.velocity.y = -100
		
func _on_damagezone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Heals") and health < 10:
		health = health + 3
		$medkitsound.play()
		body.queue_free()
		
	if body.is_in_group("danger") and invincible == false:
		$AnimationPlayer.play("damage")
		velocity.y = -200
		$hitsound.play()
		$hitsound2.play()
		health = health - 1
		$invincibilitytime.start()
		$splitsecond.start()
		invincible = true
		if facingright == true:
			$animator.visible = false
			$sprite.visible = true
			$sprite.texture = load("res://textures/duck/damageright.png")
		if facingright == false:
			$animator.visible = false
			$sprite.visible = true
			$sprite.texture = load("res://textures/duck/damageleft.png")
	
func _on_invincibilitytime_timeout() -> void:
	$animator.visible = true
	$sprite.visible = false
	invincible = false
	if facingright == true:
		$sprite.texture = load("res://textures/duck/right.png")
	if facingright == false:
		$sprite.texture = load("res://textures/duck/left.png")

func _on_cannoncooldown_timeout() -> void:
	fireable = true

func _on_splitsecond_timeout() -> void:
	if health == 0:
		var new_death = death.instantiate()
		add_sibling(new_death)
		new_death.position.y = position.y
		new_death.position.x = position.x
		position.x = 10000
