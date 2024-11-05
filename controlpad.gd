extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_left_button_down() -> void:
	#Input.action_press("Left")
	pass

func _on_right_button_down() -> void:
	Input.action_press("Right")


func _on_up_button_down() -> void:
	Input.action_press("")


func _on_left_pressed() -> void:
	Input.action_press("Left")
