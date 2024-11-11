extends Area2D

var buttondown = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("object"):
		buttondown = true
		$sound.play()
		$ButtonUnpressed.texture = load("res://textures/buttonPressed.png")
	if body.is_in_group("player"):
		buttondown = true
		$sound.play()
		$ButtonUnpressed.texture = load("res://textures/buttonPressed.png")
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("object"):
		buttondown = false
		$ButtonUnpressed.texture = load("res://textures/buttonUnpressed.png")
	if body.is_in_group("player"):
		buttondown = false
		$ButtonUnpressed.texture = load("res://textures/buttonUnpressed.png")
