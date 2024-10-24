extends Node2D

func _ready() -> void:
	pass 
func _process(delta: float) -> void:
	pass

func _on_animated_sprite_2d_animation_looped() -> void:
	queue_free()
