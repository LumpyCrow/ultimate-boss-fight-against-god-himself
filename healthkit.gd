extends CharacterBody2D

func _ready() -> void:
	pass 
func _physics_process(delta: float) -> void:
	rotation = rotation + 0.05
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		pass
