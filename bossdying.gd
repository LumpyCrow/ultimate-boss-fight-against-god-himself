extends Node2D

var explosion = load("res://massive_explosion.tscn")

func _ready() -> void:
	pass 
func _process(delta: float) -> void:
	pass

func _on_deathanimation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "death":
		var new_explosion = explosion.instantiate()
		add_sibling(new_explosion)
		new_explosion.position.y = position.y
		new_explosion.position.x = position.x
