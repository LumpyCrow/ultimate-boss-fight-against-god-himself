extends Node2D

var boss = load("res://boss.tscn")
var songplaying = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if songplaying == true:
		if not $AthTheSpeedOfLight.is_playing():
			$AthTheSpeedOfLight.play()

func _on_battlebegin_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimationPlayer.play("battleBegin")
		songplaying = true
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	var new_boss = boss.instantiate()
	add_child(new_boss)
	new_boss.position.y = $fakeBoss.position.y
	new_boss.position.x = $fakeBoss.position.x
	$fakeBoss.queue_free()
	$battlebegin.queue_free()
