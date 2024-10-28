extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


func _on_button_mouse_entered() -> void:
	if true:
		$"button anim".queue("button retry")
	else:
		$"button anim".queue_free()


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://start_screen.tscn")


func _on_exit_button_down() -> void:
	get_tree().quit()
