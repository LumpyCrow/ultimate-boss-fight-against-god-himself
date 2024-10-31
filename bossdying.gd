extends Node2D

var explosion = load("res://massive_explosion.tscn")

func _ready() -> void:
	print("BOOM!")
func _process(delta: float) -> void:
	pass

func _on_deathanimation_animation_finished(anim_name: StringName) -> void:
	var new_explosion = explosion.instantiate()
	add_sibling(new_explosion)
	new_explosion.position.y = position.y - 300
	new_explosion.position.x = position.x + 300
	queue_free()
	print("BOOM!")
