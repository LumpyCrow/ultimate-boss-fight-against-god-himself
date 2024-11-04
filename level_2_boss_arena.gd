extends Node2D

var boss = load("res://boss.tscn")
var songplaying = false
var battling = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if not $smoothJazz.is_playing():
		$smoothJazz.play()
	
	if battling == true:
		$player/Bossbar/ProgressBar.value = $boss.health
	
	if songplaying == true:
		if not $AthTheSpeedOfLight.is_playing():
			$AthTheSpeedOfLight.play()
	if songplaying == false:
		if $AthTheSpeedOfLight.is_playing():
			$AthTheSpeedOfLight.stop()
	
	if battling == true:
		if $boss.health == 0:
			battling = false
			songplaying = false
			$StaticBody2D/CollisionShape2D3.disabled = true
			$decoration/Bars3.position.y = -1100

func _on_battlebegin_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimationPlayer.play("battleBegin")
		songplaying = true
		$player.camerashaking = true
		$StaticBody2D/bosstriangle.position.y = 1000000000000
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	var new_boss = boss.instantiate()
	add_child(new_boss)
	new_boss.position.y = $fakeBoss.position.y
	new_boss.position.x = $fakeBoss.position.x
	$fakeBoss.queue_free()
	$battlebegin.queue_free()
	battling = true
	$player.MAXSPEED = 700

func _on_roar_finished() -> void:
	$player.camerashaking = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$DuckWalksIntoBar.play("DuckWalksIntoBar")
	
func _on_duck_walks_into_bar_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://start_screen.tscn")
